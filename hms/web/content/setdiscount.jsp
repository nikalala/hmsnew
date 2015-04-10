<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>
<%
ReservationroomBean reserv = ReservationroomManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("rid")));
ReservationBean res = ReservationManager.getInstance().loadByPrimaryKey(reserv.getReservationid());
DiscountBean[] discounts = DiscountManager.getInstance().loadByWhere("where roomrate = true and active = true and deleted = false order by name");

ContragentBean[] tas = ContragentManager.getInstance().loadByWhere("where type = 2 order by name");
MarketBean[] markets = MarketManager.getInstance().loadByWhere("order by name");
BsourceBean[] bsources = BsourceManager.getInstance().loadByWhere("order by name");


%>
<script>
    
    function getDiscountList(){
        $.post(
            "content/ajax/getDiscountList.jsp",
            {
                rid: <%=reserv.getReservationroomid()%>
            },
            function(data){
                getDiscountSelect(<%=reserv.getReservationroomid()%>);
                $("#setdiscount_list").html(data);
            },
            "html"
        );
    }
    
    function delDiscount1(id){
        $.post(
            "content/ajax/savediscount.jsp",
            {
                act: "del1",
                rid: <%=reserv.getReservationroomid()%>,
                id: id
            },
            function(data){
                if(data.result == 0) BootstrapDialog.alert(data.error);
                else {
                    getDiscountList();
                    $("#roomtable1").trigger("reloadGrid");
                }
            },
            "json"
        );
    }
    
    function delDiscount(id){
        $.post(
            "content/ajax/savediscount.jsp",
            {
                act: "del",
                rid: <%=reserv.getReservationroomid()%>,
                id: id
            },
            function(data){
                if(data.result == 0) BootstrapDialog.alert(data.error);
                else {
                    getDiscountList();
                    $("#roomtable1").trigger("reloadGrid");
                }
            },
            "json"
        );
    }
    
    function saveDiscount(){
        $.post(
            "content/ajax/savediscount.jsp",
            {
                act: "add",
                rid: <%=reserv.getReservationroomid()%>,
                discountid: $("#setdiscount_discount_discountid").val(),
                discountplan: $("#setdiscount_discount_discountplan").val(),
                opendates: $('#setdiscount_opendates').is(':checked'),
                auditeddates: $('#setdiscount_auditeddates').is(':checked'),
                nights: $("#setdiscount_discount_nights").val(),
                amount: $("#setdiscount_discount_amount").val()
            },
            function(data){
                if(data.result == 0) BootstrapDialog.alert(data.error);
                else {
                    getDiscountList();
                    $("#roomtable1").trigger("reloadGrid");
                }
            },
            "json"
        );
    }
    
    function getDiscountSelect(id){
        $.post("content/getdiscountselect.jsp",{ rid: id }, function(data){ $("#setdiscount_discount_discountid").html(data); });
    }
    
    $(document).ready(function(){
        
        $("#mediummodalsave").remove();
        
        $("#setdiscount_discount_nights_div").hide();
        $("#setdiscount_discount_amount_div").hide();
        
        $("#setdiscount_discount_discountid").change(function(){
            $.post(
                "content/ajax/getDiscountById.jsp",
                { discountid: $(this).val() },
                function(data){
                    if(data.error == "NO DATA"){
                        $("#setdiscount_discount_amount_div").hide();
                        $("#setdiscount_discount_nights_div").hide();
                    } else {
                        $("#setdiscount_discount_amount_div").show();
                        if(data.open == "false"){
                            $("#setdiscount_discount_amount").attr("readonly",true);
                        } else {
                            $("#setdiscount_discount_amount").attr("readonly",false);
                        }
                        if(data.val)
                            $("#setdiscount_discount_amount").val(data.val);
                        else
                            $("#setdiscount_discount_amount").val("");
                        var suffix = "%";
                        if(data.perctype == "false")    suffix = "<%=maincurrency.getCode()%>";
                        $("#setdiscount_discount_currency").html(suffix);
                    }
                    
                },
                "json"
            );
            
        });
        
        $("#setdiscount_discount_discountplan").change(function(){
        
            if($(this).val() == 0)
                $("#setdiscount_discount_nights_div").show();
            else
                $("#setdiscount_discount_nights_div").hide();
        });
        
        getDiscountList();
        
    });

</script>
<table class="table table-borderless">
    <tr>
        <td>
            <table width="100%">
                <tr>
                    <td class="tbllabel" style="width: 65px;">ტიპი</td>
                    <td>
                        <form class="form-inline" role="form">
                        <div class="form-group">
                            <div class="input-group-xs" id="setdiscount_discountselect">
                                <select class="form-control dropdown" name="setdiscount_discount_discountid" id="setdiscount_discount_discountid" style="width: 180px;">
                                    
                                </select>
                            </div>
                        </div>
                        </form>
                    </td>
                    <td class="tbllabel" style="width: 65px;">წესი</td>
                    <td>
                        <form class="form-inline" role="form">
                        <div class="form-group">
                            <div class="input-group-xs">
                                <select class="form-control dropdown" name="setdiscount_discount_discountplan" id="setdiscount_discount_discountplan" style="width: 180px;">
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
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <table width="100%">
                <tr>
                    <td class="" style="" align="left" colspan="2">
                        <b>მოქმედებს თარიღებზე:</b>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="checkbox" name="setdiscount_opendates" id="setdiscount_opendates" value="1" onclick="" checked/>
                        მომდევნო
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="checkbox" name="setdiscount_auditeddates" id="setdiscount_auditeddates" value="1" onclick="" checked/>
                        წარსული
                    </td>
                    <td style="" align="center">
                        <table width="100%">
                            <tr id="setdiscount_discount_nights_div">
                                <td class="tbllabel">ღამე(ებ)ი</td>
                                <td colspan="2">
                                    <form class="form-inline" role="form">
                                    <div class="form-group">
                                        <div class="input-group-xs">
                                            <input class="form-control" type="text" id="setdiscount_discount_nights" style="width: 50px;">
                                        </div>
                                    </div>
                                    </form>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td style="" align="center">
                        <table width="100%">
                            <tr id="setdiscount_discount_amount_div">
                                <td class="tbllabel">ოდენობა</td>
                                <td colspan="2">
                                    <form class="form-inline" role="form">
                                    <div class="form-group">
                                        <div class="input-group-xs">
                                            <input class="form-control" type="text" id="setdiscount_discount_amount" style="width: 50px;">
                                            <b style="font-size: 12px;" id="setdiscount_discount_currency"></b>
                                        </div>
                                    </div>
                                    </form>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr style="background-color: silver;">
        <td class="tbllabel" style="" align="right">
            <button type="button" class="btn btn-danger" id='setdiscount_save' onclick="saveDiscount()">შენახვა</button>
        </td>
    </tr>
    <tr>
        <td class="tbllabel" id="setdiscount_list" style="" align="left">
        </td>
    </tr>
</table>