<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<%
    String type = (String) request.getParameter("type");
    String where = "";
    String order = "";
    if(type == null || type.equals("1"))
    {
        where = "where type = 1 ";
        order = " order by company";
    }else{
        where = "where type = 2 ";
        order = " order by contragent";
    }
    CountryBean[] country = CountryManager.getInstance().loadByWhere("order by name");
%>

<link rel="stylesheet" type="text/css" href="css/grid-filter.css">
<script type="text/javascript">

    $(document).ready(function () {
        console.log("started tagents");
        loadDefaults();

    });

    function loadDefaults() {
        tagentsGrid.url += "?query=<%=where+order%>";
        console.log(tagentsGrid.url);
        initializeGrid(tagentsGrid);
        tagentsGrid.url = 'content/getcontrlist.jsp';
        $('.date').datepicker(<%=pickerformat1%>);
        $('.dropdown').selectpicker();
        $(".btn-group").css("width", "100%", "!important");
        $("#grid-table label").each(function () {
            $(this).css("float", "right", "!important");
            $(this).css("line-height", "27px", "!important");
        });
        $("#grid-table input").height($("#grid-table .btn-group").height() - 6, "!important");
        $("#filter-form input[type='text']").css("width", "100%", "!important");
        $(".date input[type='text']").css("position", "relative");
        $("#roomBean").next().css("padding-left", "0");
        $("#roomType").next().css("padding-right", "0");
        $("#res1").css("margin", "0px 10px 10px 10px");
    }

    function doFilter(bool) {

        var contQuery = " AND ";
        var fitlerEquals = " = ";
        var filterQuery = "";

        if(bool){
            resetFilterPanel();
            var uri = "content/getcontrlist.jsp?query=<%=where+order%>";
            reloadGrid(tagentsGrid.id, uri);
            return;
        }
        var contr = $("#flname");
        var country = $("#countryBean");
        var phone = $("#phone");
        var city = $("#city");
        var company = $("#company");

        if (!isNullOrEmpty(company.val())) {
            filterQuery += " company LIKE '%" + company.val() + "%'" + contQuery;
        }
        if (!isNullOrEmpty(contr.val())) {
            filterQuery += " Contragent LIKE '%" + contr.val() + "%'" + contQuery;
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
            var url = "content/getcontrlist.jsp?query=" + encodeURIComponent("<%=where%> AND " + retVal + "<%=order%>");
            reloadGrid(tagentsGrid.id, url);
        }
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
        $('#countryBean').val(0);
        $('#countryBean').change();
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
                        <button type="button" class="btn btn-default" id="addAgent"
                                style="border: 0; font-weight: bold; float: right; margin: 3px 5px 0 0;">
                            ტურისტული აგენტის დამატება
                        </button>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div style="width: 100%;float: left;">

                    <% if(type.equals("2")){ %>

                    <div class="col-md-2">
                        <label>სახელი:</label>
                    </div>
                    <div class="col-md-3">
                        <input type="text" style="width: 100% !important;" id="flname">
                    </div>
                    <div class="col-md-2">
                        <label>კომპანია:</label>
                    </div>
                    <div class="col-md-3">
                        <input type="text" style="width: 100% !important;" id="company">
                    </div>

                    <% }else{ %>

                    <div class="col-md-2">
                        <label>კომპანია:</label>
                    </div>
                    <div class="col-md-3">
                        <input type="text" style="width: 100% !important;" id="company">
                    </div>

                    <div class="col-md-2">
                        <label>სახელი:</label>
                    </div>
                    <div class="col-md-3">
                        <input type="text" style="width: 100% !important;" id="flname">
                    </div>

                    <% } %>
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
                        <button type="button" class="btn btn-danger" id="filterGuests" style="width: 100%;"
                                onclick="doFilter();">
                            ძებნა
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
                        <button type="button" class="btn btn-default" id="showAllGuests" style="width: 100%;"
                                onclick="doFilter(true);">
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
                <table id='list_tagens' class="table-striped table-hover" align='center'></table>
            </td>
        </tr>
    </table>
</form>
<div align="center" id="grid-footer" style="background: transparent; width: 100%;height: 33px;line-height: 33px; margin:0 auto;">
    <div style="background-color: red; margin:10px 0 10px 0;">HELLO THIS IS THE FOOTER</div>
</div>
