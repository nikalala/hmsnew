<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%
int category = Integer.parseInt(request.getParameter("category"));
ReasonBean[] reasons = ReasonManager.getInstance().loadByWhere("where active = true and deleted = false reasoncategory = "+category+" order by name");
%>
<option value="0">--აირჩიეთ--</option>
<%
for(int i=0;i<reasons.length;i++){
%>
<option value="<%=reasons[i].getReasonid()%>"><%=reasons[i].getName()%></option>
<%
}
%>