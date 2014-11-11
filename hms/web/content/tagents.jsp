<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<%
    CountryBean[] country = CountryManager.getInstance().loadByWhere("order by name asc");
%>

<link rel="stylesheet" type="text/css" href="css/grid-filter.css">
<script type="text/javascript">

    $(document).ready(function () {
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
        $("#centerTabContent").css("position","relative").css("margin-left","10px").css("margin-right","10px");
    });

</script>
<table style="width: 100%; display: none;">
    <tr>
        <td>
            <div id="status_bar" class="first-status-bar" align='center'
                 style="height: 100%;float: left;padding: 10px; margin: 10px;">
                <form name="filter-form" id="filter-form">
                    <div id="header_object"
                         style="width: 100%;float: left;margin: 10px 0 10px 0;border-bottom: solid 1px #E0E0E0;  height: 13px;">
                        <div style="float: left; margin-top: -10px;"><span>ძიების კრიტერიუმები</span></div>
                        <div style="float: right; margin-top: -17px;">
                            <button type="button" class="btn btn-default" id="btnExport"
                                    style="border: 0; font-weight: bold;">
                                ექსპორტი
                            </button>
                            <button type="button" class="btn btn-default" id="addAgent"
                                    style="border: 0; font-weight: bold;">
                                ტურისტული აგენტის დამატება
                            </button>
                        </div>
                    </div>
                    <div style="width: 100%;float: left;">
                        <div class="col-md-2">
                            <label>სახელი გვარი:</label>
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
                            <button type="button" class="btn btn-default" id="showAllGuests" onclick="doFilter(true);">
                                მაჩვენე ყველა
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <div id="status_bar" align='center' style="background: red;">
                <span style="color:#FFF;">aaaaaaaaaaa</span>
            </div>
        </td>
    </tr>
</table>
<div align="center" style="background: red;position: absolute;bottom: 3px;width: 100%;height: 33px;line-height: 33px;">
    <span style="color:#FFF;">HELLO THIS IS THE FOOTER</span>
</div>