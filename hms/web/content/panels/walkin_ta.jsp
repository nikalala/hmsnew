<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%
String type = request.getParameter("type");
ContragentBean[] tas = ContragentManager.getInstance().loadByWhere("where type = 2 order by name");
MarketBean[] markets = MarketManager.getInstance().loadByWhere("order by name");
BsourceBean[] bsources = BsourceManager.getInstance().loadByWhere("order by name");
%>
<script>
    
    function WalkinChVals(){
        var cpl = $("#wlakin_other_commissionplan").val();
        if(cpl >= 0){
            $("#wlakin_other_value").attr("readonly",false);
            $("#wlakin_other_voucher").attr("readonly",false);
            if(cpl == 0)
                $("#wlakin_other_currency").html("%");
            else
                $("#wlakin_other_currency").html("<%=maincurrency.getCode()%>");
        } else {
            $("#wlakin_other_value").val("");
            $("#wlakin_other_voucher").val("");
            $("#wlakin_other_value").attr("readonly",true);
            $("#wlakin_other_voucher").attr("readonly",true);
            $("#wlakin_other_currency").html();
        }
    }
    
    $(document).ready(function(){
        
        $("#wlakin_other_taid").change(function(){
            $.post(
                "content/ajax/getCommissionPlanByTa.jsp",
                { taid: $(this).val() },
                function(data){
                    $("#wlakin_other_commissionplan").val(data.cplan);
                    $("#wlakin_other_value").val(data.val);
                    if($("#wlakin_other_taid").val() == "0")
                        $("#wlakin_other_commissionplan").attr("readonly",true);
                    WalkinChVals();
                },
                "json"
            );
        });
        
        $("#wlakin_other_commissionplan").change(function(){
            WalkinChVals();
        });
    });
</script>
<table class="table table-borderless">
    <tr>
        <td class="tbllabel" style="width: 65px;">აგენტი</td>
        <td>
            <form class="form-inline" role="form">
            <div class="form-group">
                <div class="input-group-xs">
                    <select class="form-control dropdown" name="wlakin_other_taid" id="wlakin_other_taid" style="width: 180px;">
                        <option value="0">--აირჩიეთ--</option>
                        <%
                        for(int i=0;i<tas.length;i++){
                        %>
                        <option value="<%=tas[i].getContragentid()%>"><%=tas[i].getName()%></option>
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
        <td class="tbllabel" style="width: 65px;">საკომისიო</td>
        <td>
            <form class="form-inline" role="form">
            <div class="form-group">
                <div class="input-group-xs">
                    <select class="form-control dropdown" readonly name="wlakin_other_commissionplan" id="wlakin_other_commissionplan" style="width: 180px;">
                        <option value="-1">--აირჩიეთ--</option>
                        <%
                        for(int i=0;i<commissionplan.length;i++){
                        %>
                        <option value="<%=i%>"><%=commissionplan[i]%></option>
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
        <td class="tbllabel" style="width: 65px;">ოდენობა</td>
        <td>
            <form class="form-inline" role="form">
            <div class="form-group">
                <div class="input-group-xs">
                    <input class="form-control" type="text" readonly="" id="wlakin_other_value" style="width: 150px;">
                    <b style="font-size: 12px;" id="wlakin_other_currency"></b>
                </div>
            </div>
            </form>
        </td>
    </tr>
    <tr>
        <td class="tbllabel" style="width: 65px;">ქვითარი</td>
        <td>
            <form class="form-inline" role="form">
            <div class="form-group">
                <div class="input-group-xs">
                    <input class="form-control" type="text" readonly="" id="wlakin_other_voucher" style="width: 180px;">
                </div>
            </div>
            </form>
        </td>
    </tr>
</table>