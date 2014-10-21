<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%
String cplan = "-1";
String val = "";
ContragentBean cb = ContragentManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("taid")));
JSONObject json = new JSONObject();
if(cb != null && cb.getCommissionplan() != null)
    cplan = cb.getCommissionplan().toString();
if(cb != null && cb.getVal() != null)
    val = dc.format(cb.getVal().doubleValue());
json.put("cplan", cplan);
json.put("val", val);
%>
<%=json.toString()%>