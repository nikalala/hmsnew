<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/xml;charset=utf-8" %>
<%@include file="../includes/initxml.jsp" %>

<%
    request.setCharacterEncoding("UTF-8");
    String update = URLDecoder.decode(request.getQueryString(), "UTF-8");
    update = update.replace("query=", "");
    System.out.println(update);
    Connection con = Manager.getInstance().getConnection();
    int retVal = con.createStatement().executeUpdate(update);
    Manager.getInstance().releaseConnection(con);
%>


<rows>
    <cell><%=retVal%></cell>
</rows>
