<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<%
    VipstatusBean[] vips = VipstatusManager.getInstance().loadByWhere("");
    CountryBean[] country = CountryManager.getInstance().loadByWhere("order by name asc");
%>

<link rel="stylesheet" type="text/css" href="css/grid-filter.css">
<style>
    .ui-jqgrid tr.jqgrow td {
        /*height: 40px !important;*/
    }

    .ui-jqgrid {
        position: inherit !important;
    }
</style>
<script type="text/javascript">

    function getListOfContacts(where) {
        var uri = "content/getguestlistdb.jsp?query=" + encodeURIComponent("where " + where);
        if(isNullOrEmpty(where))
        {
            uri = "content/getguestlistdb.jsp?query=0";
        }
        console.log(uri);
        jQuery("#list_guestdblist").jqGrid().setGridParam({
            url: uri
        }).trigger("reloadGrid");
    }

    $(document).ready(function () {
        //$('.combobox').btComboBox();
        initializeGrid(guestGrid);
        $('.dropdown').selectpicker();
        $(".btn-group").css("width", "100%", "!important");
        $("#status_bar label").each(function () {
            $(this).css("float", "right", "!important");
        });
        $("#status_bar input").height($("#status_bar .btn-group").height() - 6, "!important");
        $("#status_bar label").each(function () {
            $(this).css("line-height", "27px", "!important");
        });
        $("#filterGuests").width($("#showAllGuests").width());
        $(".sec-status-bar").width($(".first-status-bar").width());
        $(".ui-jqgrid").width("100%");
        $(".ui-jqgrid-bdiv").width("100%");
        $(".ui-jqgrid-view").width("100%");
        $(".ui-state-default").width("100%");
        $("#list_guestdblist").width("100%");
        $(".ui-jqgrid-htable").width("100%");
        $("#jqgh_list_guestdblist_cb").css("text-align","left").css("margin-left","21px").css("height","32px");



    });



    function doFilter(bool) {

        var contQuery = " AND ";
        var fitlerEquals = " = ";
        var filterQuery = "";

        if(bool)
        {
            getListOfContacts("");
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
            getListOfContacts(retVal);
        }
    }

</script>

<div id="status_bar" class="first-status-bar" align='center'
     style="height: 100%;float: left;padding: 10px; margin: 10px;">
    <form name="filter-form" id="filter-form">
    <div id="header_object"
         style="width: 100%;float: left;margin: 10px 0 10px 0;border-bottom: solid 1px #E0E0E0;  height: 13px;">
        <div style="float: left; margin-top: -10px;"><span>ძიების კრიტერიუმები</span></div>
        <div style="float: right; margin-top: -17px;">
            <button type="button" class="btn btn-default" id="btnExport" style="border: 0; font-weight: bold;">
                ექსპორტი
            </button>
            <button type="button" class="btn btn-default" id="addGuest" style="border: 0; font-weight: bold;">
                სტუმრის დამატება
            </button>
        </div>
    </div>
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
            <button type="button" class="btn btn-danger" id="filterGuests" onclick="doFilter(false);">
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
            <button type="button" class="btn btn-default" id="showAllGuests" onclick="doFilter(true);">
                მაჩვენე ყველა
            </button>
        </div>
    </div>
    </form>
</div>
<div id="status_bar" align='center' class="sec-status-bar"
     style="height: 100%;float: left;padding: 10px; margin: 10px; background: transparent;">
    <table id='list_guestdblist' class="table-striped table-hover" width='100%' align='center'
           style="float: left;"></table>
</div>