<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<%
    VipstatusBean[] vips = VipstatusManager.getInstance().loadByWhere("");
    CountryBean[] country = CountryManager.getInstance().loadByWhere("order by name asc");
%>

<link rel="stylesheet" type="text/css" href="css/grid-filter.css">

<script type="text/javascript">

    $(document).ready(function () {

        loadDefaults();

    });

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
        $('#vipBean').val(0);
        $('#vipBean').change();
        $('#countryBean').val(0);
        $('#countryBean').change();

    }

    function loadDefaults() {
        initializeGrid(guestGrid);
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

    function doFilter(bool) {

        var contQuery = " AND ";
        var fitlerEquals = " = ";
        var filterQuery = "";

        if(bool)
        {
            resetFilterPanel();
            var uri = "content/getguestlistdb.jsp?query=0";
            reloadGrid(guestGrid.id, uri);
            return;
        }
        var vip = $("#vipBean");
        var guest = $("#guest");
        var country = $("#countryBean");
        var phone = $("#phone");
        var city = $("#city");

        if (!isNullOrEmpty(vip.val())) {
            filterQuery += " vipstatusid " + fitlerEquals + vip.val() + contQuery;
        }
        if (!isNullOrEmpty(guest.val())) {
            filterQuery += " guest LIKE '%" + guest.val() + "%'" + contQuery;
        }
        if (!isNullOrEmpty(city.val())) {
            filterQuery += " city LIKE '%" + city.val() + "%'" + contQuery;
        }
        if (!isNullOrEmpty(country.val())) {
            filterQuery += " countryid " + fitlerEquals + country.val() + contQuery;
        }
        if (!isNullOrEmpty(phone.val())) {
            filterQuery += " mobile LIKE '%" + phone.val() + "%' OR phone LIKE '%" + phone.val() + "%'" + contQuery;
        }

        var retVal = filterQuery.substring(0,filterQuery.trim().lastIndexOf("AND"));
        if (!isNullOrEmpty(retVal)) {
            var url = "content/getguestlistdb.jsp?query=" + encodeURIComponent("where " + retVal);
            reloadGrid(guestGrid.id, url);
        }
    }

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
                        <button type="button" class="btn btn-default" id="addGuest"
                                style="border: 0; font-weight: bold; float: right; margin: 3px 5px 0 0;">
                            სტუმრის დამატება
                        </button>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div style="width: 100%;float: left;">
                    <div class="col-md-2">
                        <label>ვიპ სტატუსი:</label>
                    </div>
                    <div class="col-md-3">
                        <select class="dropdown combobox" style="width: 100%; margin: 4px;" id="vipBean">
                            <option value=""></option>
                            <% for (int i = 0; i < vips.length; i++) { %>
                            <option value="<%=vips[i].getVipstatusid()%>"><%=vips[i].getName()%>
                            </option>
                            <% } %>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <label>სტუმრის სახელი:</label>
                    </div>
                    <div class="col-md-3">
                        <input type="text" style="width: 100% !important;" id="guest">
                    </div>
                    <div class="col-md-1">
                        <label>ქვეყანა:</label>
                    </div>
                    <div class="col-md-3">
                        <select class="dropdown combobox" style="width: 100%; margin: 4px;" id="countryBean">
                            <option value="">-აირჩიეთ-</option>
                            <% for (int i = 0; i < country.length; i++) { %>
                            <option value="<%=country[i].getCountryid()%>"><%=country[i].getName()%>
                            </option>
                            <% } %>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <button type="button" class="btn btn-danger" style="width: 100%;" id="filterGuests" onclick="doFilter(false);">
                            ძიება
                        </button>
                    </div>
                </div>
                <div style="width: 100%;float: left; margin-top: 10px;">
                    <div class="col-md-2">
                        <label>ქალაქი:</label>
                    </div>
                    <div class="col-md-3">
                        <input type="text" style="width: 100% !important;" id="city">
                    </div>

                    <div class="col-md-2">
                        <label>ტელეფონი:</label>
                    </div>
                    <div class="col-md-3">
                        <input type="text" style="width: 100% !important;" id="phone">
                    </div>

                    <div class="col-md-1">
                    </div>
                    <div class="col-md-3">
                    </div>

                    <div class="col-md-2">
                        <button type="button" class="btn btn-default" style="width: 100%;" id="showAllGuests" onclick="doFilter(true);">
                            მაჩვენე ყველა
                        </button>
                    </div>
                </div>
            </td>
        </tr>
    </table>
    <table id="grid-table">
        <tr>
            <td>
                <table id='list_guestdblist' class="table-striped table-hover" align='center'></table>
            </td>
        </tr>
    </table>
</form>
<div align="center" id="grid-footer" style="background: transparent; width: 100%;height: 33px;line-height: 33px; margin:0 auto;">
    <div style="background-color: red; margin:10px 0 10px 0;">HELLO THIS IS THE FOOTER</div>
</div>

