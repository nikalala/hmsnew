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

    function loadDefaults() {
        AddDays(7);
        resGrid.url = doFilter(true);
        initializeGrid(resGrid);
        $('#grid-table .date').datepicker(<%=pickerFormatForDatePickers%>);
        $('#grid-table .dropdown').selectpicker();
        $("#grid-table .btn-group").css("width", "100%", "!important");
        $("#grid-table label").each(function () {
            $(this).css("float", "right", "!important");
            $(this).css("line-height", "27px", "!important");
        });
        $("#grid-table input").height($("#grid-table .btn-group").height() - 6, "!important");
        $("#filter-form input[type='text']").css("width", "100%", "!important");
        $("#grid-table .date input[type='text']").css("position", "relative");
        $("#roomBean").next().css("padding-left", "0");
        $("#roomType").next().css("padding-right", "0");
    }

    function AddDays(arg) {
        var today = new Date(<%=lclosedate%>);
        $("#dateFrom").datepicker("setDate", today);
        var tomorrow = new Date(<%=lclosedate%>);
        tomorrow.setDate(today.getDate() + arg);
        $("#dateTo").datepicker("setDate", tomorrow);
    }

    function doFilter(donotreload) {

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
            filterQuery += "to_date('" + dtFrom.val() + "', '<%=dateformats2[6]%>') <= arraivaldate::date AND arraivaldate::date <= to_date('" + dtTo.val() + "','<%=dateformats2[6]%>')" + contQuery;
        }

        if (!isNullOrEmpty(reserv_dateFrom.val()) && !isNullOrEmpty(reserv_dateTo.val())) {
            filterQuery += "to_date('" + reserv_dateFrom.val() + "', '<%=dateformats2[dff]%>') <= regdate AND regdate <= to_date('" + reserv_dateTo.val() + "','<%=dateformats2[dff]%>')" + contQuery;
        }

        if (!isNullOrEmpty(reservNum.val())) {
            filterQuery += " vouchernum LIKE '%" + reservNum.val() + "%'" + contQuery;
        }

        if (!isNullOrEmpty(roomBean.val()) && roomBean.val() != 0) {
            filterQuery += " roomid " + fitlerEquals + roomBean.val() + contQuery;
        }

        if (!isNullOrEmpty(roomType.val()) && roomType.val() != 0) {
            filterQuery += " roomtypeid " + fitlerEquals +  roomType.val() + contQuery;
        }

        if (!isNullOrEmpty(txtSource.val())) {
            filterQuery += " bsourcename LIKE '%" + txtSource.val() + "%'" + contQuery;
        }

        if (!isNullOrEmpty(reservType.val()) && reservType.val() != 0) {
            filterQuery += " reservationtypeid " + fitlerEquals + reservType.val() + contQuery;
        }

        if (!isNullOrEmpty(reservStatus.val())) {
            if (reservStatus.val() == 4) {
                filterQuery += " status IN(0,1,2,3) " + contQuery;
            } else {
                filterQuery += " status " + fitlerEquals + reservStatus.val() + contQuery;
            }
        }
        if(!showMrooms.is(':checked') && donotreload)
        {
            filterQuery += "  1=1 "; //
        }else if(showMrooms.is(':checked') && !donotreload) {
            filterQuery += " roomid is null ";
        }else{
            filterQuery += " 1=1 ";
        }

        var retVal = filterQuery;

        if (!isNullOrEmpty(checkNum.val())) {
            retVal = " reservationroomid " + fitlerEquals + checkNum.val();
        }

        var url = "content/getreservationlist.jsp?query=" + encodeURIComponent("where " + retVal);
        if(!donotreload){
            //console.log("Starting filtering with > " + url);
            reloadGrid(resGrid.id, url);
        }
        return url;
    }

    function resetFilterPanel() {
        $("#filter-form :input").each(function () {
            $(this).val('');
        });
        //clean dropdowns
        $('#filter-form .dropdown option').removeAttr('selected');
        $("#filter-form .dropdown").change();
        $("#showMrooms").attr('checked', false);
        $("#showIncomplOrders").attr('checked', false);
        reInitialize();
        doFilter(false);
    }

    function reInitialize() {
        $('#reservStatus').val(0);
        $('#reservStatus').change();
        $('#reserv_dateFrom').val('');
        $('#reserv_dateTo').val('');
    }
    reInitialize();


</script>
<form name="filter-form" id="filter-form">
<table id="grid-table" class="first-table">
    <tr>
        <td>
            <div id="status_bar" class="first-status-bar" align='center'>
                <div style="width: 100%; float: left;">
                    <span style="float: left; margin: 7px 0 0 10px;">ძიების კრიტერიუმები</span>
                    <button type="button" class="btn btn-default" id="btnExport"
                            style="border: 0; font-weight: bold; float: right; margin: 3px 5px 0 0;">
                        ექსპორტი
                    </button>
                </div>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <div style="width: 100%;float: left;">
                <div class="col-md-3">
                    <input type="text" id="checkNumb" placeholder=" რეზერვაციის #"/>
                </div>
                <div class="col-md-1">
                    &nbsp;
                </div>
                <div class="col-md-4">
                    <input type="text" id="firstlast" placeholder=" სახელი გვარი"/>
                </div>
                <div class="col-md-2">
                    <label>ჩამოსვლა:</label>
                </div>
                <div class="col-md-2">
                    <div class="input-append date" id="dateFrom">
                        <input type="text" class="span2 " id="arrival_dateFrom" placeholder=" თარიღიდან"
                               style="">
                    <span class="add-on"
                          style="position:absolute !important; right : 4px  !important;background : none  !important;border: none !important;top: 1px;">
                        <i class="glyphicon glyphicon-calendar"></i></span>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="input-append date" id="dateTo">
                        <input type="text" class="span2 " id="arrival_dateTo" placeholder=" თარიღამდე">
                    <span class="add-on"
                          style="position:absolute !important; right : 4px  !important;background : none  !important;border: none !important;top: 1px;">
                        <i class="glyphicon glyphicon-calendar"></i></span>
                    </div>
                </div>
                <div class="col-md-2">
                    <button type="button" class="btn btn-danger" style="width: 100%;" id="search_reserve_filer" onclick="doFilter()"
                            style="width: 69px;">ძებნა
                    </button>
                </div>
            </div>
            <div style="width: 100%;float: left;">
                <div class="col-md-3">
                    <input class="col-md-2" type="text" id="reservNumb" placeholder=" ქვითრის #"/>
                </div>
                <div class="col-md-1">
                    <label>ოთახი</label>
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
                    <select class="dropdown col-md-2" id="roomType">
                        <option value="0">-ოთახის ტიპი-</option>
                        <% for (int i = 0; i < roomTypes.length; i++) { %>
                        <option value="<%=roomTypes[i].getRoomtypeid()%>"><%=roomTypes[i].getName()%>
                        </option>
                        <% } %>
                    </select>
                </div>
                <div class="col-md-2">
                    <label>რეზერვაცია:</label>
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
                    <button type="button" class="btn btn-default" style="width: 100%;" id="cancel_reserve_filer"
                            onclick="resetFilterPanel()" data-dismiss="modal">გაუქმება
                    </button>
                </div>
            </div>
            <div style="width: 100%;float: left;">
                <div class="col-md-3">
                    <input type="text" placeholder=" გაუქმების #" id="cancelNumb"/>
                </div>
                <div class="col-md-1">
                    <label>წყარო</label>
                </div>
                <div class="col-md-4">
                    <input type="text" id="txtSource"/>
                </div>
                <div class="col-md-2">
                    <label>ტიპი</label>
                </div>
                <div class="col-md-2">
                    <select class="dropdown" id="reservStatus" name="rStatus">
                        <% for (int i = 0; i <= reservationstatus.length - 1; i++) { %>
                        <option value="<%=i%>"><%=reservationstatus[i]%>
                        </option>
                        <% } %>
                        <option value="4">ყველა</option>
                    </select>
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
                    <button type="button" class="btn btn-danger" style="width: 100%;" id="create_group_reserve_filer"
                            style="white-space: normal !important;">ჯგუფის შექმნა
                    </button>
                </div>
            </div>
            <div style="width: 100%;float: left; height: 18px; line-height: 24px;">
                <div style="float: left;">
                    <input type="checkbox" name="showMrooms" id="showMrooms"
                           style="color: #818181;font-weight: normal; margin-left: 5px;"/>
                </div>
                <div style="float: left;">
                    &nbsp;აჩვენე მიუკუთვნილებელი ნომერი
                </div>
                <div style="float: left;">
                    <input type="checkbox" name="showIncomplOrders" id="showIncomplOrders"
                           style="color: #818181;font-weight: normal; margin-left: 15px;"/>
                </div>
                <div style="float: left;">
                    &nbsp;აჩვენე ჩავარდნილი/დაუსრულებელი ვებ ჯავშნები
                </div>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <div id="status_bar" align='center' class="middle-status-bar">
                <div class="reserv_status">
                    <div class="status-box" style="background-color: red;"></div>
                    წაშლილი
                </div>
                <div class="reserv_status">
                    <div class="status-box" style="background-color: rgb(236, 13, 174);"></div>
                    არ გამოცხადებული
                </div>
                <div class="reserv_status">
                    <div class="status-box" style="background-color: rgb(24, 57, 190);"></div>
                    გაუქმებული
                </div>
                <div class="reserv_status">
                    <div class="status-box" style="background-color: rgb(77, 190, 24);"></div>
                    აქტიური
                </div>
            </div>
        </td>
    </tr>
    </table>
    <table id="grid-table">
        <tr>
            <td>
                <table id='list_reservs' class="table-striped table-hover" align='center'></table>
            </td>
        </tr>
    </table>
</form>
<%--
<div align="center" id="grid-footer" style="background: transparent; width: 100%;height: 33px;line-height: 33px; margin:0 auto;">
    <div style="background-color: red; margin:10px 0 10px 0;">HELLO THIS IS THE FOOTER</div>
</div>--%>
