<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
int id = Integer.parseInt(request.getParameter("id"));
String content = request.getParameter("content");
TemplatesBean tmpl = TemplatesManager.getInstance().loadByPrimaryKey(id);
tmpl.setContent(content.getBytes("UTF-8"));
tmpl = TemplatesManager.getInstance().save(tmpl);
%>
