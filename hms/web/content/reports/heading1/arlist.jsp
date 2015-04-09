<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../../../includes/init.jsp" %>

<% RoomtypeBean[] roomTypes = RoomtypeManager.getInstance().loadByWhere("ORDER BY ord"); %>
<% ReservationtypeBean[] reservTypes = ReservationtypeManager.getInstance().loadByWhere(""); %>
<% PersonnelBean[] PersonellBeans = PersonnelManager.getInstance().loadByWhere(""); %>
<% RatetypeBean[] RatetypeBeans = RatetypeManager.getInstance().loadByWhere(""); %>
<% MarketBean[] MarketBeans = MarketManager.getInstance().loadByWhere(""); %>
<% ContragentBean[] ContragentBeans = ContragentManager.getInstance().loadByWhere("where type = 2 and deleted = false"); %>
<% ContragentBean[] CompanyBeans = ContragentManager.getInstance().loadByWhere("where type = 1 and deleted = false"); %>
<% ContragentBean[] bSources = ContragentManager.getInstance().loadByWhere("where deleted = false and bsource = true"); %>


<link rel="stylesheet" type="text/css" href="css/grid-filter.css">

<script type="text/javascript">

    var lastroomtypeId = 0;
    $(document).ready(function () {
        $('#reserv_dateTo').datepicker(<%=pickerFormatForDatePickers%>);
        $('#reserv_dateFrom').datepicker(<%=pickerFormatForDatePickers%>);
        loadDefaults();
        $("#ratefrom, #rateto").ForceNumericOnly();
    });

    function doFilter(){

        var data = $("#filter-form").serialize();

        loader.show();
        $.post("content/reports/getreport.jsp?reportid=1",function(data){
            $("#grid-table").html(data);
            loader.hide();
        });
    }

    function doFilter1(reload) {

        if (reload) {
            resetDates();
        }

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
            filterQuery += "to_date('" + dtFrom.val() + "', '<%=dateformats2[dff]%>') <= arraivaldate::date AND arraivaldate::date <= to_date('" + dtTo.val() + "','<%=dateformats2[dff]%>')" + contQuery;
        }

        if (!isNullOrEmpty(reserv_dateFrom.val()) && !isNullOrEmpty(reserv_dateTo.val())) {
            filterQuery += "to_date('" + reserv_dateFrom.val() + "', '<%=dateformats2[dff]%>') <= arraivaldate::date AND arraivaldate::date <= to_date('" + reserv_dateTo.val() + "','<%=dateformats2[dff]%>')" + contQuery;
        }

        if (!isNullOrEmpty(reservNum.val())) {
            filterQuery += " vouchernum LIKE '%" + reservNum.val() + "%'" + contQuery;
        }

        if (!isNullOrEmpty(roomBean.val()) && roomBean.val() != 0) {
            filterQuery += " roomid " + fitlerEquals + roomBean.val() + contQuery;
        }

        if (!isNullOrEmpty(roomType.val()) && roomType.val() != 0) {
            filterQuery += " roomtypeid " + fitlerEquals + roomType.val() + contQuery;
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

        var retVal = "";

        if (!isNullOrEmpty(checkNum.val())) {
            retVal = " reservationroomid " + fitlerEquals + checkNum.val();
        } else {
            retVal = filterQuery.substring(0, filterQuery.trim().lastIndexOf("AND"));
        }

        var url = "content/getarrivallist.jsp?where=where " + retVal;
        console.log(url);
        if (!reload) {
        }
        return url;


    }

    function resetFilterPanel() {
        $("#filter-form :input").each(function () {
            console.log($(this).attr('id'))
            if ($(this).attr('id') !== "reserv_dateFrom" && $(this).attr('id') !== "reserv_dateTo") {
                $(this).val('');
            }
        });
        //clean dropdowns
        $('#filter-form .dropdown option').removeAttr('selected');
        $("#filter-form .dropdown").change();
        reInitialize();
    }

    function reInitialize() {
        $('#reservStatus').val(0);
        $('#reservStatus').change();
        resetDates();
    }


    $("#reserv_dateFrom").on('change', function () {
        var value = $(this).val();
        $("#reserv_dateTo").val(value);
    });

    $("#todaycheckedinlist").change(function () {
        if (this.checked) {
            var url = "content/arrivallist.jsp.jsp?where=where roomstatus = -1 and arraivaldate::date = to_date('<%=df.format(dclosedate)%>','DD/MM/YYYY')";
            resetDates();
            $('#reserv_dateFrom, #reserv_dateTo').prop("disabled", true);
            $('#grid-table .date .glyphicon-calendar').css("display", "none");
        } else {
            $('#reserv_dateFrom, #reserv_dateTo').prop("disabled", false);
            $('#grid-table .date .glyphicon-calendar').css("display", "block");
            resetFilterPanel();
        }
    });

    function resetDates() {
        var today = new Date(<%=lclosedate%>);
        $("#reserv_dateTo").datepicker("setDate", today);
        $("#reserv_dateFrom").datepicker("setDate", today);
    }

    reInitialize();

    function loadDefaults() {
        $('#grid-table .dropdown').selectpicker();
        $("#grid-table .btn-group").css("width", "100%", "!important").css("padding-left", "0px").css("padding-right", "0px");
        $("#grid-table label").each(function () {
            $(this).css("float", "left", "!important");
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
    <table id="grid-table" style="margin: 10px;">
        <tr>
            <td style="width: 150px;">
                <label>თარიღი:</label>
            </td>
            <td>
                <div class="input-append date">
                    <input type="text" class="span2 " name="reserv_dateFrom" id="reserv_dateFrom" placeholder=" თარიღიდან">
                    <span class="add-on"
                          style="position:absolute !important; right : 4px  !important;background : none  !important;border: none !important;top: 1px;">
                        <i class="glyphicon glyphicon-calendar"></i></span>
                </div>
            </td>
            <td>
                <div class="input-append date">
                    <input type="text" class="span2" name="reserv_dateTo" id="reserv_dateTo" placeholder=" თარიღამდე">
                    <span class="add-on"
                          style="position:absolute !important; right : 4px  !important;background : none  !important;border: none !important;top: 1px;">
                        <i class="glyphicon glyphicon-calendar"></i></span>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <label>რეზერვაციის ტიპი:</label>
            </td>
            <td colspan="2">
                <select class="dropdown"  name="reservType" id="reservType">
                    <option value="0">-აირჩიეთ-</option>
                    <% for (int i = 0; i <= reservTypes.length - 1; i++) { %>
                    <option value="<%=reservTypes[i].getReservationtypeid()%>"><%=reservTypes[i].getName()%>
                    </option>
                    <% } %>
                </select>
            </td>
        </tr>
        <tr>
            <td>
                <label>მომხმარებელი:</label>
            </td>
            <td colspan="2">
                <select class="dropdown" name="PersonellBeans" id="PersonellBeans">
                    <option value="0">-აირჩიეთ-</option>
                    <% for (int i = 0; i <= PersonellBeans.length - 1; i++) { %>
                    <option value="<%=PersonellBeans[i].getPersonnelid()%>"><%=PersonellBeans[i].getLoginid()%>
                    </option>
                    <% } %>
                </select>
            </td>
        </tr>
        <tr>
            <td>
                <label>ოთახის ტიპი:</label>
            </td>
            <td colspan="2">
                <select class="dropdown col-md-2" name="roomType" id="roomType">
                    <option value="0">-აირჩიეთ-</option>
                    <% for (int i = 0; i < roomTypes.length; i++) { %>
                    <option value="<%=roomTypes[i].getRoomtypeid()%>"><%=roomTypes[i].getName()%>
                    </option>
                    <% } %>
                </select>
            </td>
        </tr>
        <tr>
            <td>
                <label>ტარიფის ტიპი:</label>
            </td>
            <td colspan="2">
                <select class="dropdown col-md-2" name="RatetypeBeans" id="RatetypeBeans">
                    <option value="0">-აირჩიეთ-</option>
                    <% for (int i = 0; i < RatetypeBeans.length; i++) { %>
                    <option value="<%=RatetypeBeans[i].getRatetypeid()%>"><%=RatetypeBeans[i].getName()%>
                    </option>
                    <% } %>
                </select>
            </td>
        </tr>
        <tr>
            <td>
                <label>ტარიფი:</label>
            </td>
            <td>
                <input type="text" id="ratefrom" name="ratefrom"/> დან
            </td>
            <td>
                <input type="text" id="rateto"  name="rateto"/> მდე
            </td>
        </tr>
        <tr>
            <td>
                <label>სეგმენტი:</label>
            </td>
            <td colspan="2">
                <select class="dropdown col-md-2" name="MarketBeans" id="MarketBeans">
                    <option value="0">-აირჩიეთ-</option>
                    <% for (int i = 0; i < MarketBeans.length; i++) { %>
                    <option value="<%=MarketBeans[i].getMarketid()%>"><%=MarketBeans[i].getName()%>
                    </option>
                    <% } %>
                </select>
            </td>
        </tr>
        <tr>
            <td>
                <label>ტურისტული აგენტი:</label>
            </td>
            <td colspan="2">
                <select class="dropdown" name="ContragentBeans" id="ContragentBeans">
                    <option value="0">-აირჩიეთ-</option>
                    <% for (int i = 0; i <= ContragentBeans.length - 1; i++) { %>
                    <option value="<%=ContragentBeans[i].getContragentid()%>"><%=ContragentBeans[i].getName()%>
                    </option>
                    <% } %>
                </select>
            </td>
        </tr>
        <tr>
            <td>
                <label>კომპანია:</label>
            </td>
            <td colspan="2">
                <select class="dropdown" name="CompanyBeans" id="CompanyBeans">
                    <option value="0">-აირჩიეთ-</option>
                    <% for (int i = 0; i <= CompanyBeans.length - 1; i++) { %>
                    <option value="<%=CompanyBeans[i].getContragentid()%>"><%=CompanyBeans[i].getName()%>
                    </option>
                    <% } %>
                </select>
            </td>
        </tr>
        <tr>
            <td>
                <label>ბიზნეს წყარო:</label>
            </td>
            <td colspan="2">
                <select class="dropdown" name="bSources" id="bSources">
                    <option value="0">-აირჩიეთ-</option>
                    <% for (int i = 0; i <= bSources.length - 1; i++) { %>
                    <option value="<%=bSources[i].getContragentid()%>"><%=bSources[i].getName()%>
                    </option>
                    <% } %>
                </select>
            </td>
        </tr>
    </table>
    <div style="width: 100%;float: right; background-color: rgb(231, 231, 231);padding-right: 20px;height: 35px;">
        <button type="button" class="btn btn-default" style="margin-top: 5px; float: right; " id="showAllGuests"
                onclick="resetFilterPanel()">
            Reset
        </button>
        <button type="button" class="btn btn-danger" style="margin-top: 5px; margin-right: 7px; float: right;"
                id="search_reserve_filer"
                onclick="doFilter()"
                style="width: 69px;">ძებნა
        </button>
    </div>
</form>