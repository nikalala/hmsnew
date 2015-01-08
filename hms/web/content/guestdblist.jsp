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
        drawTwoDimFooterForGuestDbList();

    });

    $(document).on('click','#addGuest',function(){
        addGuest();
    });

    function drawTwoDimFooterForGuestDbList() {
        $(".ui-jqgrid-bdiv").height($(".ui-jqgrid-bdiv").height() - 100);
        var html =
                '<div class="panel-footer" style="height: 50px !important; display:table; width: 100%; padding-bottom: 1px; background-color: #FFF;">' +
                '<div>' +
                '<span style="margin: 15px 10px 0 10px; float: left;">მონიშნულის: </span>' +
                '<button type="button" class="btn btn-default" id="btnDropSelected" onclick="deleteSelectedGuest()" style="font-weight: bold; float: left; margin: 9px 10px 0 0;">' +
                'წაშლა <i class="fa fa-trash"></i></button>' +
                '<button type="button" class="btn btn-default" id="btnJoinSelected" onclick="joinSelected()" style="font-weight: bold; float: left; margin: 9px 10px 0 0;">' +
                'გაერთიანება <i class="fa fa-life-bouy"></i></button>' +
                '</div></div>' +
                '<div class="panel-footer" style="height: 50px !important; display:table; width: 100%; padding-bottom: 1px; background-color: #FFF;">' +
                '<div>' +
                '<span style="margin: 15px 10px 0 10px; float: left;">ჩანაწერების რაოდენობა გვერდზე</span>' +
                '<select id="limitselectbox" style="float: left; margin: 15px 10px 0 10px;">' +
                '<option value="5">5</option>' +
                '<option value="15">15</option>' +
                '<option value="25">25</option>' +
                '<option value="50">50</option>' +
                '</select>' +
                '<button type="button" class="btn btn-default" id="btnNext" style="font-weight: bold; float: right; margin: 9px 10px 0 0;">' +
                'შემდეგი</button>' +
                '<button type="button" class="btn btn-danger" id="btnPrev" style="font-weight: bold; float: right; margin: 9px 10px 0 0;">' +
                'წინა</button>' +
                '</div></div>';
        $(".ui-jqgrid-view").find(".panel-footer").remove();
        $(".ui-jqgrid-view").append(html);
    }

    function joinSelected(){
        var ids = getSelectedRowIds(guestGrid.id);
        if (isNullOrEmpty(ids) || ids.indexOf(",") ==-1) {
            BootstrapDialog.alert("თუ გრუსთ სტუმრის კონსოლიდაცია უნდა აირჩიოთ მინიმუმ 2 სტუმარი");
            return;
        }
        newsWindow1("consguestlist", "სტუმრის კონსოლიდაცია", "query="+ids);
    }

    function deleteSelectedGuest(id) {

        var ids = "";
        if (isNullOrEmpty(id)) {
            ids = getSelectedRowIds(guestGrid.id);
        }else{
            ids = id;
        }


        if (!isNullOrEmpty(ids)) {
            BootstrapDialog.confirm("ნამდვილად გსურთ ჩანაწერის წაშლა", function (result) {
                if (!isNullOrEmpty(result)) {
                    if (result == true) {
                        var update = "?query=UPDATE guest set deleted = true where guestid in (" + ids + ")";
                        $.post("content/execute.jsp" + update, {}, function (data) {
                            doFilter(true);
                        });
                    }
                }
            });
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

        if (bool) {
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

        var retVal = filterQuery.substring(0, filterQuery.trim().lastIndexOf("AND"));
        if (!isNullOrEmpty(retVal)) {
            var url = "content/getguestlistdb.jsp?query=" + encodeURIComponent("where " + retVal);
            reloadGrid(guestGrid.id, url);
        }
    }

    function addGuest(id){
        loader.show();

        $(".filter-form1").hide();
        $("#grid-footer").hide();
        $(".filter-form2").show();
        var url = "content/addguest.jsp";
        if (!isNullOrEmpty(id)) {
            url += "?tid=" + id;
        }
        $("#guest_add").load(url, function () {
            loader.hide();
        }).fadeIn('normal');
    }

    function cancelSaveGuest() {
        $(".filter-form1").show();
        $(".filter-form2").hide();
        $("#grid-footer").show();
        $("#tagents_add").html("");
    }

</script>

<form name="filter-form" id="filter-form" class="filter-form1">
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
                        <button type="button" class="btn btn-danger" style="width: 100%;" id="filterGuests"
                                onclick="doFilter(false);">
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
                        <button type="button" class="btn btn-default" style="width: 100%;" id="showAllGuests"
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
                <table id='list_guestdblist' class="table-striped table-hover" align='center'></table>
            </td>
        </tr>
    </table>
</form>
<form name="filter-form" id="filter-form" class="filter-form2" style="display: none; background-color: #fff;">
    <table id="grid-table" class="first-table">
        <tr>
            <td id="guest_add">

            </td>
        </tr>
        <tr>
            <td style="border-bottom: solid 1px #c4c4c4 !important; -webkit-box-shadow: 0 0 0 0; box-shadow: 0 0 0 0">
                <div id="status_bar" class="first-status-bar" align='center' style="-webkit-box-shadow: 0 0 0 0; box-shadow: 0 0 0 0">
                    <div style="width: 100%; float: right;">
                        <button type="button" class="btn btn-default" id="cancelSave" onclick="cancelSaveGuest()"
                                style="border: 0; font-weight: bold; float: right; margin: 3px 5px 0 0;">
                            დახურვა
                        </button>
                        <button type="button" class="btn btn-danger" id="saveAgent" onclick="addGuest()"
                                style="font-weight: bold; float: right; margin: 3px 5px 0 0;">
                            შენახვა
                        </button>
                    </div>
                </div>
            </td>
        </tr>
    </table>
</form>