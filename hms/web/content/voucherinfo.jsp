<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>
<link rel="stylesheet" type="text/css" href="css/grid-filter.css">
<script type="text/javascript">
    $(document).ready(function () {
        $("#contrbean").next().css("min-width", "170px");
        var today = new Date(<%=lclosedate%>);
        $("#dateFrom").datepicker("setDate", today);

    });

</script>
<style>
    .bootstrap-select {
        width: 100% !important;
    }
</style>
<div class="panel-heading" style="height: 26px;">
    <h3 class="panel-title">
        <div class="span-header" style="margin: 0;">ქვითრის ინფორმაცია</div>
    </h3>
</div>
<div class="panel-body" id="voucher-panel-body" style="height:110px;">
    <table width="100%" class="table table-borderless" style="text-align: right;">
        <tbody>
        <tr>
            <td style="text-align: left; width: 124px; padding: 0;"><b><span>საბუთის ნომერი</span></b></td>
            <td style="width: 136px; padding: 0;"><input type="text" id="voucherTxtField"/></td>
            <td style="padding: 0; padding-left: 15px; width: 150px;"><label class="pull-left">შექმნილია:</label></td>
            <td style="padding: 0;"><input type="text" id="userTxtField" value="<%=user.getLoginid()%>" disabled="disabled"/></td>
        </tr>
        <tr>
            <td style="text-align: left; padding: 0;"><b><span>ქვითრის თარიღი</span></b></td>
            <td style="position: relative; padding: 0;">
                <div class="input-append date" id="dateFrom">
                    <input type="text" class="span2 " id="arrival_dateFrom" disabled="disabled"
                           style="">
                    <span class="add-on"
                          style="position:absolute !important; right : 4px  !important;background : none  !important;border: none !important;top: 1px;">
                        <i class="glyphicon glyphicon-calendar"></i></span>
                </div>
            </td>
            <td style="padding: 0; padding-left: 15px;">
                <label class="pull-left">გადახდის მეთოდი</label>
            </td>
            <td style="padding: 0;">
                <select class="dropdown" name="paymentmethod">
                    <option value="">--აირჩიეთ--</option>
                    <%
                        PaymentmethodBean[] paymentmethodBean = PaymentmethodManager.getInstance().loadByWhere("where paymentmode = 0");
                        for (PaymentmethodBean item : paymentmethodBean) {
                    %>
                    <option value="<%=item.getPaymentmethodid()%>"><%=item.getName()%>
                    </option>
                    <%
                        }
                    %>
                </select>
            </td>
        </tr>
        <tr>
            <td style="text-align: left; padding: 0;"><b><span>გადახდის ტიპი</span></b></td>
            <td style="padding: 0;">
                <input class="pull-left" checked=""  name="optradio" type="radio" style="padding-left: 5px; padding-right: 5px; margin-top: -1px;"><span class="pull-left" style="padding-left: 5px; padding-right: 5px;">ნაღდი</span>
            </td>
            <td style="padding: 0;"></td>
            <td style="padding: 0;"></td>
        </tr>
        </tbody>
    </table>
</div>
