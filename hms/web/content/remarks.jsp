<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
long rid = 0;
if(request.getParameter("rid") != null)
    rid = Long.parseLong(request.getParameter("rid"));
if(request.getParameter("reservationid") != null)
    rid = Long.parseLong(request.getParameter("reservationid"));

String script = request.getParameter("script");
%>
<script>
    
    function resetReason(){
        $("#wlakin_reasoncategory").val(-1);
        $("#wlakin_reasonid").val(0);
        $("#wlakin_reason").val("");
    }
    
    function addReason(){
        $.post(
                "content/ajax/updreason.jsp",
                {
                    act: "add",
                    category: $("#wlakin_reasoncategory").val(),
                    reasonid: $("#wlakin_reasonid").val(),
                    name: $("#wlakin_reason").val(),
                    rid: <%=rid%>
                },
                function(data){
                    if(data.result == 0) BootstrapDialog.alert(data.error);
                    else {
                        resetReason();
                        getReasonList();
                    }
                },
                "json"
            );
    }
    
    function delReason(i){
        $.post(
                "content/ajax/updreason.jsp",
                {
                    act: "del",
                    num: i,
                    rid: <%=rid%>
                },
                function(data){
                    if(data.result == 0) BootstrapDialog.alert(data.error);
                    else {
                        getReasonList();
                    }
                },
                "json"
            );
    }
    
    function getReasonList(){
        $.post(
            "content/ajax/getReasons.jsp",
            {
                rid: <%=rid%>
            },
            function(data){
                $("#walkin_reasons").html(data);
                <%=(script != null) ? script+";":""%>
            },
            "html"
        );
    }
    
    $(document).ready(function(){
        
        $("#mediummodalsave").remove();
        $("#reason_rst").hide();
        $("#reason_edt").hide();
        
        $("#wlakin_reasoncategory").change(function(){
            $.post(
                "content/ajax/getReasonByCategory.jsp",
                {
                    category: $("#wlakin_reasoncategory").val()
                },
                function(data){
                    $("#wlakin_reasonid").html(data);
                },
                "html"
            );
        });
        
        getReasonList();
    });
    
</script>
<table class="table table-borderless">
    <tr>
        <td class="tbllabel" style=""><b>ტიპი</b></td>
        <td>
            <form class="form-inline" role="form">
            <div class="form-group">
                <div class="input-group-xs">
                    <select class="form-control dropdown" name="wlakin_reasoncategory" id="wlakin_reasoncategory" style="">
                        <option value="-1">--აირჩიეთ--</option>
                        <%
                        for(int i=0;i<reasoncategory_walkin.length;i++){
                        %>
                        <option value="<%=reasoncategory_walkin[i]%>"><%=reasoncategory[reasoncategory_walkin[i]]%></option>
                        <%
                        }
                        %>
                    </select>
                </div>
            </div>
            </form>
        </td>
        <td class="tbllabel" style=""><b>შენიშვნა</b></td>
        <td>
            <form class="form-inline" role="form">
            <div class="form-group">
                <div class="input-group-xs">
                    <select class="form-control dropdown" name="wlakin_reasonid" id="wlakin_reasonid" style="">
                        <option value="0">--აირჩიეთ--</option>
                    </select>
                </div>
            </div>
            </form>
        </td>
    </tr>
    <tr>
        <td class="tbllabel" style="" colspan="4">
            <b>აღწერა</b>
            <form class="form-inline" role="form">
            <div class="form-group">
                <div class="input-group-xs">
                    <textarea style="width: 100%" cols="150" rows="3" class="" name="wlakin_reason" id="wlakin_reason" style=""></textarea>
                </div>
            </div>
            </form>
        </td>
    </tr>
    <tr style="background-color: silver;">
        <td class="tbllabel" style="" colspan="4" align="right">
            <button type="button" class="btn btn-danger" id='reason_add' onclick="addReason()">დამატება</button>
        </td>
    </tr>
    <tr>
        <td class="tbllabel" id="walkin_reasons" style="" colspan="4" align="right">
        </td>
    </tr>
</table>

