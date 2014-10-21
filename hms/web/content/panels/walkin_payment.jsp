<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%
String type = request.getParameter("type");

PaymentmethodBean[] paymentmethods = PaymentmethodManager.getInstance().loadByWhere("order by name");

%>
<script>
    
    $(document).ready(function(){
        
    });
</script>
<table class="table table-borderless">
    <tr>
        <td class="tbllabel" style="width: 65px;">ტიპი</td>
        <td>
            <form class="form-inline" role="form">
            <div class="form-group">
                <div class="input-group-xs">
                    <select class="form-control dropdown" name="wlakin_payment_paymentmethod" id="wlakin_payment_paymentmethod" style="width: 180px;">
                        <option value="0">--აირჩიეთ--</option>
                        <%
                        for(int i=0;i<paymentmethods.length;i++){
                        %>
                        <option value="<%=paymentmethods[i].getPaymentmethodid()%>"><%=paymentmethods[i].getName()%></option>
                        <%
                        }
                        %>
                    </select>
                </div>
            </div>
            </form>
        </td>
    </tr>
    <tr>
        <td class="tbllabel" style="width: 65px;">თანხა</td>
        <td>
            <form class="form-inline" role="form">
            <div class="form-group">
                <div class="input-group-xs">
                    <select class="form-control dropdown" name="wlakin_payment_currencyid" id="wlakin_payment_currencyid" style="width: 70px;">
                        <option value="-1">--აირჩიეთ--</option>
                        <%
                        for(int i=0;i<currencies.length;i++){
                            String sel = "";
                            if(currencies[i].getBasic().booleanValue())
                                sel = "selected";
                        %>
                        <option value="<%=currencies[i].getCurrencyid()%>" <%=sel%>><%=currencies[i].getCode()%></option>
                        <%
                        }
                        %>
                    </select>
                    <input class="form-control" type="text" id="wlakin_payment_amount" style="width: 108px;">
                </div>
            </div>
            </form>
        </td>
    </tr>
    <tr id="wlakin_discount_nights_div">
        <td class="tbllabel" style="width: 65px;">ქვითარი</td>
        <td>
            <form class="form-inline" role="form">
            <div class="form-group">
                <div class="input-group-xs">
                    <input class="form-control" type="text" id="wlakin_payment_vaoucher" style="width: 180px;">
                </div>
            </div>
            </form>
        </td>
    </tr>
</table>