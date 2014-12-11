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
    });

    function saveTAgent() {
        var str = $.fn.serializeObject($("#tagents_add #tagentsfrm"));
        var errorExist = false;
        for (var key in str) {
            if (key != "taddress" && key != "tcity" && key != "tphone" && key != "tmobile" && key != "tfax" && key != "tclimit" && key != "tcterm" && key != "topenbal" && key != "tvalue") {
                if (isNullOrEmpty(str[key])) {
                    if (key == "tcountryid") {
                        $("#" + key).next().addClass("error");
                    } else {
                        $("#" + key).addClass("error");
                    }
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

                    <%
                        if(type.equals("1"))
                        {
                    %>
                    var t = "კომპანიის";
                    <%
                        }
                        if(type.equals("2"))
                        {
                    %>
                    var t = "ტურისტული აგენტის";
                    <%
                        }
                    %>
                    BootstrapDialog.alert(t + " დამატება წარმატებით დასრულდა");
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
                                if (type.equals("1")) {
                            %>
                            კომპანიის დამატება
                            <%
                                }
                                if (type.equals("2")) {
                            %>
                            ტურისტული აგენტის დამატება
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
                        <span style="float: left; margin: 7px 0 0 10px;">ტურისტული აგენტის დამატება</span>
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