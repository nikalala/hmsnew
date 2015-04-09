<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
  
    String pfile = "content/form/"+request.getParameter("file")+".jsp?id="+request.getParameter("id");
    CurrencyBean[] curs = CurrencyManager.getInstance().loadByWhere("order by basic");
    
    
%>
<script>
    
    function printFolioCurr(){
        var cid = $("input[type='radio'][name='currencyprint']:checked").val();
        window.open("<%=pfile%>&currencyid="+cid);
    }
    $("#smallmodalfooter").html("");
    var r1 = $('<button type="button" class="btn btn-default" data-dismiss="modal">დახურვა</button>');
    $("#smallmodalfooter").append(r1);
    r1 = $("<button type=\"button\" class=\"btn btn-primary\" onclick=\"printFolioCurr()\">ბეჭდვა</button>");
    $("#smallmodalfooter").append(r1);
</script>
<table width="100%" class="table table-borderless">
    <tbody>
        <%
        for(int i=0;i<curs.length;i++){
            String sel = "";
            if(curs[i].getBasic().booleanValue())
                sel = "checked";
            %>
        <tr>
            <td><b><%=curs[i].getName()%></b></td>
            <td><b><%=curs[i].getCode()%></b></td>
            <td>
                <input type="radio" name="currencyprint" id="cname_<%=curs[i].getCurrencyid()%>" value="<%=curs[i].getCurrencyid()%>" <%=sel%>/>
            </td>
        </tr>
            <%
        }
        %>
        
    </tbody>
</table>