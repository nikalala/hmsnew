<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
ReservationreasonBean[] rbs = ReservationreasonManager.getInstance().loadByReservationid(new Long(request.getParameter("rid")));
System.out.println("rbs.length = "+rbs.length);
if(rbs.length>0){
%>
<table class="scrollwk table table-condensed table-hover table-striped" width="100%">
<thead>
    <tr>
        <th nowrap align="left" style="width: 50px; padding-left: 0px;">&nbsp;&nbsp;ტიპი</th>
        <th nowrap align="left" style="width: 100px; padding-left: 1px;">&nbsp;&nbsp;დასახელება</th>
    </tr>
</thead>
<tbody id="">
<%
for(int i=0;i<rbs.length;i++){
    ReasonBean res = ReasonManager.getInstance().loadByPrimaryKey(rbs[i].getReasonid());
    
%>
<tr id="" style="font-weight: normal !important;">
    <td style="width: 50px;">
        <%=reasoncategory[res.getReasoncategory().intValue()]%>
    </td>
    <td style="width: 100px;">
        <%=res.getName()%>
    </td>
</tr>
<%}%>
</tbody>
</table>
<%
}
%>
