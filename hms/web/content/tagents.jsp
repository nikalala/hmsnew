<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<%
    String type = (String) request.getParameter("type");
    String where = "";
    String order = "";
    String _page = "";
    if (type == null || type.equals("1")) {
        where = "where type = 1 ";
        order = " order by company";
        _page = "content/savetcompany.jsp";
    }
    if (type == null || type.equals("2")) {
        where = "where type = 2 ";
        order = " order by contragent";
        _page = "content/savetagent.jsp";
    }
    CountryBean[] country = CountryManager.getInstance().loadByWhere("order by name");
%>

<link rel="stylesheet" type="text/css" href="css/grid-filter.css">
<script type="text/javascript">

    $(document).ready(function () {
        loadDefaults();
        drawFooter();
        secondFooter();
    });

    function secondFooter() {
        var height = $(".gridfooter").css("height");
        var width = $(".gridfooter").css("width");
        $(".ui-jqgrid-bdiv").height($(".ui-jqgrid-bdiv").height() - 100);
        var html =
                '<div class="gridfooter footer2" style="border-bottom: 0; "><div>' +
                '<span style="margin: 15px 10px 0 10px; float: left;">მონიშნულის: </span>' +
                '<button type="button" class="btn btn-default" id="btnDropSelected" onclick="deleteSelectedGuest()" style="font-weight: bold; float: left; margin: 9px 10px 0 0;">' +
                'წაშლა <i class="fa fa-trash"></i></button>' +
                '<button type="button" class="btn btn-default" id="btnJoinSelected" onclick="joinSelected()" style="font-weight: bold; float: left; margin: 9px 10px 0 0;">' +
                'გაერთიანება <i class="fa fa-life-bouy"></i></button>' +
                '</div></div>' +
                '</div></div>';
        $(".footer2").remove();
        $(html).insertBefore(".gridfooter");
        $(".footer2").css("bottom", height);
        $(".footer2").css("width", width, "!important");
    }

    function joinSelected() {
        var ids = getSelectedRowIds(tagentsGrid.id);
        if (isNullOrEmpty(ids) || ids.indexOf(",") == -1) {
            BootstrapDialog.alert("თუ გრუსთ მონიშნულის კონსოლიდაცია უნდა აირჩიოთ მინიმუმ 2 ჩანაწერი");
            return;
        }
        newsWindow1("conscontrlist", "მონიშნულის კონსოლიდაცია", "query=" + ids);
    }

    function deleteSelectedGuest(id) {

        var ids = "";
        if (isNullOrEmpty(id)) {
            ids = getSelectedRowIds(tagentsGrid.id);
        } else {
            ids = id;
        }


        if (!isNullOrEmpty(ids)) {
            BootstrapDialog.confirm("ნამდვილად გსურთ ჩანაწერის წაშლა", function (result) {
                if (!isNullOrEmpty(result)) {
                    if (result == true) {
                        var update = "?query=UPDATE contragent set deleted = true where contragentid in (" + ids + ")";
                        $.post("content/execute.jsp" + update, {}, function (data) {
                            doFilter(true);
                        });
                    }
                }
            });
        }
    }

    function saveTAgent() {
        var str = $.fn.serializeObject($("#tagents_add #tagentsfrm"));
        var errorExist = false;
        $("#tcommissionplan").next().removeClass("error");
        $("#tvalue").removeClass("error");
        $("#tcterm, #tclimit").removeClass("error");
        for (var key in str) {
            if (key != "taddress" && key != "tcity" && key != "tcommissionplan" &&
                    key != "tphone" && key != "tmobile" && key != "tfax" && key != "zip" && key != "tclimit" &&
                    key != "tcterm" && key != "topenbal" && key != "tvalue") {
                if (isNullOrEmpty(str[key])) {
                    if (key == "tcountryid") {
                        $("#" + key).next().addClass("error");
                    } else {

                        <% if(type.equals("1")) { %>
                        var typeCompany = true;
                        <% } if(type.equals("2")){ %>
                        var typeCompany = false;
                        <% } %>

                        if (key == "email") {
                            if ($("#tcreateuser").prop("checked") && typeCompany) {
                                $("#email").addClass("error");
                            } else {
                                $("#email").removeClass("error");
                            }
                        } else {
                            $("#" + key).addClass("error");
                        }
                    }
                    console.log(key)
                    errorExist = true;
                } else {
                    if (key == "tcountryid" || key == "tcommissionplan") {
                        $("#" + key).next().removeClass("error");
                    } else {
                        $("#" + key).removeClass("error");
                    }
                    if (key == "tcontrname") {
                        var contr = str[key].split(' ');
                        if (contr.length != 2) {
                            errorExist = true;
                            $("#" + key).addClass("error");
                            BootstrapDialog.alert("სწორად შეიყვანეთ სახელი და გვარი. მაგ(დავით ბერძენიშვილი)");
                        }
                    }
                    if (key == "temail") {
                        if (!isValidEmailAddress(str[key])) {
                            errorExist = true;
                            $("#" + key).addClass("error");
                            BootstrapDialog.alert("სწორად შეიყვანეთ ელ-ფოსტა.მაგ(tourist@selfin.ge)");
                        }
                    }
                }
            }
        }
        if (!isNullOrEmpty($("#tvalue").val())) {
            if (isNullOrEmpty($("#tcommissionplan").val())) {
                $("#tcommissionplan").next().addClass("error");
                errorExist = true;
            } else {
                $("#tcommissionplan").next().removeClass("error");
            }
        }
        if (!isNullOrEmpty($("#tcommissionplan").val())) {
            if (isNullOrEmpty($("#tvalue").val())) {
                $("#tvalue").addClass("error");
                errorExist = true;
            } else {
                $("#tvalue").removeClass("error");
            }
        }

        if (!isNullOrEmpty($("#tcterm").val())) {
            if (isNullOrEmpty($("#tclimit").val())) {
                $("#tclimit").addClass("error");
                errorExist = true;
            } else {
                $("#tclimit").removeClass("error");
            }
        }
        if (!isNullOrEmpty($("#tclimit").val())) {
            if (isNullOrEmpty($("#tcterm").val())) {
                $("#tcterm").addClass("error");
                errorExist = true;
            } else {
                $("#tcterm").removeClass("error");
            }
        }

        if (errorExist) {
            return;
        }
        $.ajax({
            type: 'get', // it's easier to read GET request parameters
            url: '<%=_page%>',
            data: {
                tagent: encodeURIComponent(JSON.stringify(str))
            },
            contentType: 'application/json',
            dataType: 'json',
            success: function (data) {
                if (data.status == "ok") {
                    BootstrapDialog.alert("ოპერაცია შესრულდა წარმატებით");
                    cancelSaveContr();
                    doFilter(true);
                }
            },
            error: function (data) {
                BootstrapDialog.alert("დაფიქსირდა შეცდომა. შეამოწმეთ ყველა ველი და შეცდომის განმეორების შემთხვევაში დაუკავშირდით ადმინისტრატორს");
            }
        });
    }

    function addContr(id) {
        loader.show();
        if (isNullOrEmpty(id)) {
            $("#addtagenttxt").html("ტურისტული აგენტის დამატება");
        } else {
            $("#addtagenttxt").html("ტურისტული აგენტის რედაქტირება");
        }
        $(".filter-form1").hide();
        $("#grid-footer").hide();
        $(".filter-form2").slideToggle();
        var url = "content/addtagents.jsp";
        if (!isNullOrEmpty(id)) {
            url += "?tid=" + id;
        }
        $("#tagents_add").load(url, function () {
            loader.hide();
        }).fadeIn('normal');
    }
    function addCompany(id) {
        loader.show();
        if (isNullOrEmpty(id)) {
            $("#addtagenttxt").html("კომპანიის დამატება");
        } else {
            $("#addtagenttxt").html("კომპანიის რედაქტირება");
        }
        $(".filter-form1").hide();
        $("#grid-footer").hide();
        $(".filter-form2").slideToggle();
        var url = "content/addtcompany.jsp";
        if (!isNullOrEmpty(id)) {
            url += "?tid=" + id;
        }
        $("#tagents_add").load(url, function () {
            loader.hide();
        }).fadeIn('normal');
    }
    function cancelSaveContr() {
        $(".filter-form1").slideToggle();
        $(".filter-form2").hide();
        $("#grid-footer").show();
        $("#tagents_add").html("");
        showHideFooter();
    }
    function loadDefaults() {
        tagentsGrid.url += "?query=<%=where+order%>";
        initializeGrid(tagentsGrid);
        tagentsGrid.url = 'content/getcontrlist.jsp';
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

        var retVal = filterQuery.substring(0, filterQuery.trim().lastIndexOf("AND"));
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
<form name="filter-form" id="filter-form" class="filter-form1">
    <table id="grid-table" class="first-table">
        <tr>
            <td>
                <div id="status_bar" class="first-status-bar" align='center'>
                    <div style="width: 100%; float: left;">
                        <span style="float: left; margin: 11px 0 0 10px; font-family: BGMtavr;">ძიების კრიტერიუმები</span>
                        <button type="button" class="btn btn-default" id="btnExport"
                                style="border: 0; font-weight: bold; float: right; margin: 3px 5px 0 0;">
                            ექსპორტი
                        </button>
                        <button type="button" class="btn btn-default" id="addAgent"
                                onclick="<%if(type.equals("1")){%>  addCompany(); <%}else{%> addContr() <%}%>"
                                style="border: 0; font-weight: bold; float: right; margin: 3px 5px 0 0;">
                            <%
                                String headerVal = "";
                                if (type.equals("1")) {
                                    headerVal = "კომპანიის დამატება";
                            %>
                            <%=headerVal%>
                            <%
                                }
                                if (type.equals("2")) {
                                    headerVal = "ტურისტული აგენტის დამატება";
                            %>
                            <%=headerVal%>
                            <%
                                }
                            %>
                        </button>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div style="width: 100%;float: left;">

                    <% if (type.equals("2")) { %>

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

                    <% } else { %>

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
<form name="filter-form" id="filter-form" class="filter-form2" style="display: none; background-color: #fff;">
    <table id="grid-table" class="first-table">
        <tr>
            <td>
                <div id="status_bar" class="first-status-bar" align='center'>
                    <div style="width: 100%; float: left;">
                        <span style="float: left; margin: 7px 0 0 10px;" id="addtagenttxt"><%=headerVal%></span>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td id="tagents_add">

            </td>
        </tr>
        <tr>
            <td>
                <div id="status_bar" class="first-status-bar" align='center'>
                    <div style="width: 100%; float: right;">
                        <button type="button" class="btn btn-default" id="cancelSave" onclick="cancelSaveContr()"
                                style="border: 0; font-weight: bold; float: right; margin: 3px 5px 0 0;">
                            დახურვა
                        </button>
                        <button type="button" class="btn btn-danger" id="saveAgent" onclick="saveTAgent()"
                                style="font-weight: bold; float: right; margin: 3px 5px 0 0;">
                            შენახვა
                        </button>
                    </div>
                </div>
            </td>
        </tr>
    </table>
</form>