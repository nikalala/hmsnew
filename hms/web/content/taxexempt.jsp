<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
TaxBean[] taxes = TaxManager.getInstance().loadByWhere("order by name");
%>
<script>
    
    function addReason(){
        $.post(
                "content/ajax/updreason.jsp",
                {
                    act: "add",
                    category: $("#wlakin_reasoncategory").val(),
                    reasonid: $("#wlakin_reasonid").val(),
                    name: $("#wlakin_reason").val()
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
    
    $(document).ready(function(){
        
        
    });
    
</script>
<table class="table table-borderless">
    <tr>
        <td>
            <form class="form-inline" role="form">
            <div class="form-group">
                <div class="input-group-xs">
            <%
            for(int i=0;i<taxes.length;i++){
            %>
                <label class="checkbox-inline" style="height: 23px !important;">
                    <input type="checkbox" name="notaxreason" id="notaxreason<%=i%>" value="<%=i%>" checked> 
                    <span class="tbllabel"><%=taxes[i].getName()%></span>
                </label>
            <%}%>
                </div>
            </div>
            </form>
        </td>
    </tr>
</table>

