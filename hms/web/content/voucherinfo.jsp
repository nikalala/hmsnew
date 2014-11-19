<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>
<link rel="stylesheet" type="text/css" href="css/grid-filter.css">
<script type="text/javascript">
    $(document).ready(function () {
        $("#contrbean").next().css("min-width", "170px");
        var today = new Date();
        $("#dateFrom").datepicker("setDate", today);
        $("#dateFrom").prop('disabled',true);
        $("#arrival_dateFrom").prop('disabled',true);

    });

</script>
<div class="panel-heading" style="height: 34px;">
    <h3 class="panel-title">
        <div style="float: left; margin: 5px 0 0 10px;">ქვითრის ინფორმაცია</div>
    </h3>
</div>
<div class="panel-body" style="height:110px;">
    <table width="100%" class="table table-borderless" style="text-align: right;">
        <tbody>
        <tr>
            <td><b><span style="color: #598904">ქვითრის ნომერი</span></b></td>
            <td><input type="text" id="voucherTxtField"/></td>
            <td><label>შექმნილია:</label></td>
            <td><input type="text" id="userTxtField" disabled="disabled"/></td>
        </tr>
        <tr>
            <td><b><span style="color: #598904">ქვითრის თარიღი</span></b></td>
            <td style="position: relative;">
                <div class="input-append date" id="dateFrom">
                    <input type="text" class="span2 " id="arrival_dateFrom" disabled="disabled"
                           style="">
                    <span class="add-on"
                          style="position:absolute !important; right : 4px  !important;background : none  !important;border: none !important;top: 1px;">
                        <i class="glyphicon glyphicon-calendar"></i></span>
                </div>
            </td>
            <td>2 124 755</td>
        </tr>
        <tr>
            <td><b><span style="color: #598904">ტიპი</span></b></td>
            <td><input type="radio" id="cache" checked="checked"></td>
            <td>ნაღდი</td>
            <td>2 124 755</td>
        </tr>
        <tr>
            <td colspan="4">
                ვაჟა ფშაველას 55
            </td>
        </tr>
        </tbody>
    </table>
</div>
