<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<% RoomBean[] roomBeans = RoomManager.getInstance().loadByWhere("ORDER BY ord"); %>
<% RoomtypeBean[] roomTypes = RoomtypeManager.getInstance().loadByWhere("ORDER BY ord"); %>
<% ReservationtypeBean[] reservTypes = ReservationtypeManager.getInstance().loadByWhere(""); %>
<link rel="stylesheet" type="text/css" href="css/grid-filter.css">

<script type="text/javascript">

    var lastroomtypeId = 0;
    $(document).ready(function () {
        loadDefaults();
    });

    $("#roomType").on('change', function () {
        var element = $("option:selected", this);
        var id = $(this).val();
        var selected = "";
        if (id > 0) {
            var html = "<option value='0'>-ოთახის #-</option>";
            <% for (int i = 0; i < roomBeans.length; i++) {%>
            var value = "<%=roomBeans[i].getRoomtypeid()%>";
            var roomid = "<%=roomBeans[i].getRoomid()%>";
            if (roomid == lastroomtypeId) {
                selected = 'selected="selected"';
            } else {
                selected = '';
            }
            if (id == value) {
                html +=
                        "<option value='<%=roomBeans[i].getRoomid()%>' roomtypeid='<%=roomBeans[i].getRoomtypeid()%>' " + selected + "><%=roomBeans[i].getName()%>";
                html += "</option>";
            }
            <% } %>
        } else {
            var html = "<option value='0'>-ოთახის #-</option>";
            <% for (int i = 0; i < roomBeans.length; i++) {%>
            html += "<option value='<%=roomBeans[i].getRoomid()%>' roomtypeid='<%=roomBeans[i].getRoomtypeid()%>'><%=roomBeans[i].getName()%>";
            html += "</option>";
            <% }%>
        }
        selected = ""
        lastroomtypeId = 0;
        //console.log(html);
        $("#roomBean").html(html);
        $('#roomBean').selectpicker("refresh");
        $('#roomBean').next().css("width", "100%").css("padding-left", "0px");
        /**/
        /*$('#roomBean').change();*/
    });

    $("#roomBean").on('change', function () {
        var element = $("option:selected", this);
        var id = element.attr("roomtypeid");
        if (id > 0) {
            $("#roomType").val(id);
            lastroomtypeId = element.val();
            $('#roomType').change();
        } else {
            var html = "<option value='0' selected='selected'>-ოთახის ტიპი-</option>";
            <% for (int i = 0; i < roomTypes.length; i++) { %>
            html += "<option value='<%=roomTypes[i].getRoomtypeid()%>'><%=roomTypes[i].getName()%></option>";
            <% } %>
            $("#roomType").html(html);
            $('#roomType').selectpicker("refresh");
            $('#roomType').next().css("width", "100%").css("padding-left", "0px");

            var rooms = "<option value='0'>-ოთახის #-</option>";
            <% for (int i = 0; i < roomBeans.length; i++) {%>
            rooms += "<option value='<%=roomBeans[i].getRoomid()%>' roomtypeid='<%=roomBeans[i].getRoomtypeid()%>'><%=roomBeans[i].getName()%>";
            rooms += "</option>";
            <% }%>

            $("#roomBean").html(rooms);
            $('#roomBean').selectpicker("refresh");
            $('#roomBean').next().css("width", "100%").css("padding-left", "0px");
        }
    });

    function doFilter() {

        var filterQuery = "";
        var contQuery = " AND ";
        var fitlerEquals = " = ";

        var checkNum = $("#checkNumb");
        var name = $("#firstlast");
        var dtFrom = $("#arrival_dateFrom");
        var dtTo = $("#arrival_dateTo");
        var reservNum = $("#reservNumb");
        var roomBean = $("#roomBean");
        var roomType = $("#roomType");
        var reserv_dateFrom = $("#reserv_dateFrom");
        var reserv_dateTo = $("#reserv_dateTo");
        var cancelNumb = $("#cancelNumb");
        var txtSource = $("#txtSource");
        var reservStatus = $("#reservStatus");
        var reservType = $("#reservType");
        var showMrooms = $("#showMrooms");
        var showIncomplOrders = $("#showIncomplOrders");

        if (!isNullOrEmpty(name.val())) {
            filterQuery += " guest LIKE '%" + name.val() + "%'" + contQuery;
        }

        if (!isNullOrEmpty(dtFrom.val()) && !isNullOrEmpty(dtTo.val())) {
            filterQuery += "to_date('" + dtFrom.val() + "', '<%=dateformats2[dff]%>') <= arraivaldate AND arraivaldate <= to_date('" + dtTo.val() + "','<%=dateformats2[dff]%>')" + contQuery;
        }

        if (!isNullOrEmpty(reserv_dateFrom.val()) && !isNullOrEmpty(reserv_dateTo.val())) {
            filterQuery += "to_date('" + reserv_dateFrom.val() + "', '<%=dateformats2[dff]%>') <= regdate AND regdate <= to_date('" + reserv_dateTo.val() + "','<%=dateformats2[dff]%>')" + contQuery;
        }

        if (!isNullOrEmpty(reservNum.val())) {
            filterQuery += " vouchernum LIKE '%" + reservNum.val() + "%'" + contQuery;
        }

        if (!isNullOrEmpty(roomBean.val())) {
            filterQuery += " roomid " + fitlerEquals + roomBean.val() + contQuery;
        }

        if (!isNullOrEmpty(roomType.val())) {
            filterQuery += " roomtypecode " + fitlerEquals + "'" + roomType.val() + "'" + contQuery;
        }

        if (!isNullOrEmpty(txtSource.val())) {
            filterQuery += " bsourcename LIKE '%" + txtSource.val() + "%'" + contQuery;
        }

        if (!isNullOrEmpty(reservType.val())) {
            filterQuery += " reservationtypeid " + fitlerEquals + reservType.val() + contQuery;
        }

        if (!isNullOrEmpty(reservStatus.val())) {
            if (reservStatus.val() == 4) {
                filterQuery += " status IN(0,1,2,3) " + contQuery;
            } else {
                filterQuery += " status " + fitlerEquals + reservStatus.val() + contQuery;
            }
        }

        filterQuery += (showMrooms.is(':checked') ? " reservationroomid is null" : "reservationroomid is not null ") + contQuery;

        var retVal = "";

        if (!isNullOrEmpty(checkNum.val())) {
            retVal = " reservationroomid " + fitlerEquals + checkNum.val();
        } else {
            retVal = filterQuery.substring(0, filterQuery.trim().lastIndexOf("AND"));
        }

        var url = "content/getreservationlist.jsp?where=where " + retVal;
        reloadGrid(resGrid.id, url);
    }

    function resetFilterPanel() {
        $("#filter-form :input").each(function () {
            $(this).val('');
        });
        //clean dropdowns
        $('#filter-form .dropdown option').removeAttr('selected');
        $("#filter-form .dropdown").change();
        reInitialize();
    }

    function reInitialize() {
        $('#reservStatus').val(0);
        $('#reservStatus').change();
        $('#reserv_dateFrom').val('');
        $('#reserv_dateTo').val('');
    }

    reInitialize();

    function loadDefaults() {
        initializeGrid(arrivalGrid);
        $('#grid-table .date').datepicker(<%=pickerformat1%>);
        $('#grid-table .dropdown').selectpicker();
        $("#grid-table .btn-group").css("width", "100%", "!important");
        $("#grid-table label").each(function () {
            $(this).css("float", "right", "!important");
            $(this).css("line-height", "27px", "!important");
        });
        $("#grid-table input").height($("#grid-table .btn-group").height() - 6, "!important");
        $("#filter-form input[type='text']").css("width", "100%", "!important");
        $("#grid-table .date input[type='text']").css("position", "relative");
        $("#grid-table #roomBean").next().css("padding-left", "0");
        $("#grid-table #roomType").next().css("padding-right", "0");
    }

</script>

<form name="filter-form" id="filter-form">
    <table id="grid-table" class="first-table">
        <tr>
            <td>
                <div id="status_bar" class="first-status-bar" align='center'>
                    <div style="width: 100%; float: left;">
                        <span style="float: left; margin: 7px 0 0 10px;">ძიების კრიტერიუმები</span>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div style="width: 100%;float: left;">
                    <div class="col-md-2">
                        <label>ოთახი:</label>
                    </div>
                    <div class="col-md-2">
                        <select class="dropdown col-md-2" id="roomBean">
                            <option value="0">-ოთახის #-</option>
                            <% for (int i = 0; i < roomBeans.length; i++) { %>
                            <option value="<%=roomBeans[i].getRoomid()%>"
                                    roomtypeid="<%=roomBeans[i].getRoomtypeid()%>"><%=roomBeans[i].getName()%>
                            </option>
                            <% } %>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <label>ჯგუფის კოდი:</label>
                    </div>
                    <div class="col-md-2">
                        <input type="text" id="groupcode"/>
                    </div>
                    <div class="col-md-2">
                        <label>თარიღი:</label>
                    </div>
                    <div class="col-md-2">
                        <div class="input-append date">
                            <input type="text" class="span2 " id="reserv_dateFrom" placeholder=" თარიღიდან">
                    <span class="add-on"
                          style="position:absolute !important; right : 4px  !important;background : none  !important;border: none !important;top: 1px;">
                        <i class="glyphicon glyphicon-calendar"></i></span>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="input-append date">
                            <input type="text" class="span2" id="reserv_dateTo" placeholder=" თარიღამდე">
                    <span class="add-on"
                          style="position:absolute !important; right : 4px  !important;background : none  !important;border: none !important;top: 1px;">
                        <i class="glyphicon glyphicon-calendar"></i></span>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <button type="button" class="btn btn-danger" style="width: 100%;" id="search_reserve_filer"
                                onclick="doFilter()"
                                style="width: 69px;">ძებნა
                        </button>
                    </div>
                </div>
                <div style="width: 100%; float:left;">
                    <div class="col-md-2">
                        <label>ოთახის ტიპი:</label>
                    </div>
                    <div class="col-md-2">
                        <select class="dropdown col-md-2" id="roomType">
                            <option value="0">-ოთახის ტიპი-</option>
                            <% for (int i = 0; i < roomTypes.length; i++) { %>
                            <option value="<%=roomTypes[i].getRoomtypeid()%>"><%=roomTypes[i].getName()%>
                            </option>
                            <% } %>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <label>რეზერვაციის ტიპი:</label>
                    </div>
                    <div class="col-md-2">
                        <select class="dropdown" id="reservType">
                            <option value="">-რეზერვაციის ტიპი-</option>
                            <% for (int i = 0; i <= reservTypes.length - 1; i++) { %>
                            <option value="<%=reservTypes[i].getReservationtypeid()%>"><%=reservTypes[i].getName()%>
                            </option>
                            <% } %>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <label>კონტაქტი:</label>
                    </div>
                    <div class="col-md-2">
                        <select class="dropdown" id="contrTypes">
                            <option value="">-ტიპი-</option>
                            <% for (int i = 0; i <= contragenttype.length - 1; i++) { %>
                            <option value="<%=i%>"><%=contragenttype[i]%>
                            </option>
                            <% } %>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <select class="dropdown" id="filteredContrs">
                            <option value="">-აირჩიეთ-</option>
                            <% for (int i = 0; i <= contragenttype.length - 1; i++) { %>
                            <option value="<%=i%>"><%=contragenttype[i]%>
                            </option>
                            <% } %>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <button type="button" class="btn btn-default" style="width: 100%;" id="showAllGuests" onclick="doFilter(true);">
                            მაჩვენე ყველა
                        </button>
                    </div>
                </div>
                <div style="width: 100%; float:left;">
                    <div style="float: left;">
                        <input type="checkbox" id="todaycheckedinlist" style="color: #818181;font-weight: normal; margin-left: 15px;">
                    </div>
                    <div style="float: left;margin-top: 6px;">
                        &nbsp;დღეს მიღებული სტუმრები
                    </div>
                </div>
            </td>
        </tr>
    </table>
    <table id="grid-table">
        <tr>
            <td>
                <table id='list_arrival' class="table-striped table-hover" align='center'></table>
            </td>
        </tr>
    </table>
</form>