<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet" %>
<%
String pid = request.getParameter("pid");
String mid = request.getParameter("mid");
String st = request.getParameter("st");

PlevelManager.getInstance().deleteByWhere("where personelltypeid = "+pid+" and menuid = "+mid);
PlevelBean pl = PlevelManager.getInstance().createPlevelBean();
pl.setMenuid(new Integer(mid));
pl.setPersonelltypeid(new Integer(pid));
if(st.equalsIgnoreCase("true")) {pl.setRead(true); pl.setWrite(true);}
else                            {pl.setRead(false); pl.setWrite(false);}
pl = PlevelManager.getInstance().save(pl);
%>
