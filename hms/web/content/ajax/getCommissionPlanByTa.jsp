<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%
String cplan = "-1";
String val = "";
long id = Long.parseLong(request.getParameter("taid"));
ContragentBean cb = ContragentManager.getInstance().loadByPrimaryKey(id);
JSONObject json = new JSONObject();
if(id > 0 && cb != null && cb.getCommissionplan() != null)
    cplan = cb.getCommissionplan().toString();
if(id > 0 && cb != null && cb.getVal() != null)
    val = dc.format(cb.getVal().doubleValue());
json.put("cplan", cplan);
json.put("val", val);
%>
<%=json.toString()%>