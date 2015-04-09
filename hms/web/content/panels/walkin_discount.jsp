<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%
String type = request.getParameter("type");

DiscountBean[] discounts = DiscountManager.getInstance().loadByWhere("where roomrate = true and extracharge = false order by name");

ContragentBean[] tas = ContragentManager.getInstance().loadByWhere("where type = 2 order by name");
MarketBean[] markets = MarketManager.getInstance().loadByWhere("order by name");
BsourceBean[] bsources = BsourceManager.getInstance().loadByWhere("order by name");
%>
<script>
    
    $(document).ready(function(){
        $("#wlakin_discount_nights_div").hide();
        $("#wlakin_discount_amount_div").hide();
        
        $("#wlakin_discount_discountid").change(function(){
            $.post(
                "content/ajax/getDiscountById.jsp",
                { discountid: $(this).val() },
                function(data){
                    if(data.error == "NO DATA"){
                        $("#wlakin_discount_amount_div").hide();
                    } else {
                        $("#wlakin_discount_amount_div").show();
                        if(data.open == "false"){
                            $("#wlakin_discount_amount").attr("readonly",true);
                        } else {
                            $("#wlakin_discount_amount").attr("readonly",false);
                        }
                        if(data.val)
                            $("#wlakin_discount_amount").val(data.val);
                        else
                            $("#wlakin_discount_amount").val("");
                        var suffix = "%";
                        if(data.perctype == "false")    suffix = "<%=maincurrency.getCode()%>";
                        $("#wlakin_discount_currency").html(suffix);
                    }
                    
                },
                "json"
            );
            
        });
        
        $("#wlakin_discount_discountplan").change(function(){
        
            if($(this).val() == 0)
                $("#wlakin_discount_nights_div").show();
            else
                $("#wlakin_discount_nights_div").hide();
        });
    });
</script>
<table class="table table-borderless">
    <tr>
        <td class="tbllabel" style="width: 65px;">ტიპი</td>
        <td>
            <form class="form-inline" role="form">
            <div class="form-group">
                <div class="input-group-xs">
                    <select class="form-control dropdown" name="wlakin_discount_discountid" id="wlakin_discount_discountid" style="width: 180px;">
                        <option value="0">--აირჩიეთ--</option>
                        <%
                        for(int i=0;i<discounts.length;i++){
                        %>
                        <option value="<%=discounts[i].getDiscountid()%>"><%=discounts[i].getName()%></option>
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
        <td class="tbllabel" style="width: 65px;">წესი</td>
        <td>
            <form class="form-inline" role="form">
            <div class="form-group">
                <div class="input-group-xs">
                    <select class="form-control dropdown" name="wlakin_discount_discountplan" id="wlakin_discount_discountplan" style="width: 180px;">
                        <option value="-1">--აირჩიეთ--</option>
                        <%
                        for(int i=0;i<discountplan.length;i++){
                        %>
                        <option value="<%=i%>"><%=discountplan[i]%></option>
                        <%
                        }
                        %>
                    </select>
                </div>
            </div>
            </form>
        </td>
    </tr>
    <tr id="wlakin_discount_nights_div">
        <td class="tbllabel" style="width: 65px;">ღამე(ებ)ი</td>
        <td>
            <form class="form-inline" role="form">
            <div class="form-group">
                <div class="input-group-xs">
                    <input class="form-control" type="text" id="wlakin_discount_nights" style="width: 150px;">
                </div>
            </div>
            </form>
        </td>
    </tr>
    <tr id="wlakin_discount_amount_div">
        <td class="tbllabel" style="width: 65px;">ოდენობა</td>
        <td>
            <form class="form-inline" role="form">
            <div class="form-group">
                <div class="input-group-xs">
                    <input class="form-control" type="text" id="wlakin_discount_amount" style="width: 150px;">
                    <b style="font-size: 12px;" id="wlakin_discount_currency"></b>
                </div>
            </div>
            </form>
        </td>
    </tr>
</table>