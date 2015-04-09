<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%
Vector v = (Vector)session.getAttribute("WALKIN_REMARKS");
if(v == null)   v = new Vector();
long rid = 0;
if(request.getParameter("rid") != null)
    rid = Long.parseLong(request.getParameter("rid"));
if(rid > 0){
    v = new Vector();
    ReasonBean[] res = ReasonManager.getInstance().loadByWhere("where reasonid in (select reasonid from reservationreason where reservationid = "+rid+")");
    for(int i=0;i<res.length;i++){
        v.addElement((ReasonBean)res[i]);
    }
}


if(v.size()>0){
%>
<table class="scrollwk table table-condensed table-hover table-striped" width="100%">
<thead>
    <tr>
        <th nowrap align="left" style="width: 300px; padding-left: 0px;">&nbsp;&nbsp;ტიპი</th>
        <th nowrap align="left" style="width: 450px; padding-left: 1px;">&nbsp;&nbsp;დასახელება</th>
        <th nowrap align="right" style="width: 200px; padding-left: 30px;">&nbsp;&nbsp;მოქმედება</th>
    </tr>
</thead>
<tbody id="walkin_extracharges_body">
<%
for(int i=0;i<v.size();i++){
    ReasonBean res = (ReasonBean)v.elementAt(i);
    
%>
<tr id="" style="font-weight: normal !important;">
    <td style="width: 300px;">
        <%=reasoncategory[res.getReasoncategory().intValue()]%>
    </td>
    <td style="width: 450px;">
        <%=res.getName()%>
    </td>
    <td style="width: 200px; text-align: center;">
        <form class="form-inline" role="form">
        <div class="input-addon glyphicon glyphicon-remove" style="color: red; cursor: pointer;" onclick="delReason(<%=i%>)"></div>
        </form>
    </td>
</tr>
<%}%>
</tbody>
</table>
<%
}
%>
