<%@ page import="javax.mail.internet.MimeUtility" %><?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/xml;charset=utf-8" %>
<%@include file="../includes/initxml.jsp" %>

<%
    String rType = (String) request.getParameter("rt");
    String rId = (String) request.getParameter("ri");

    if (rType == null && rId != null) {
        RoomTypeBean[] rtList = RoomTypeManager.getInstance().loadByWhere("where roomtypeid = " + rType); %>
        <option value="">-ოთახის #-</option>
        <% for (int i = 0; i < rtList.length; i++) { %>
            <option value="<%=rtList[i].getRoomid()%>" roomtypeid="<%=rtList[i].getRoomtypeid()%>"><%=rtList[i].getName()%>
        </option>
        <% } %>
    <% }else if (rType != null && rId == null) {
        RoomBean[] guestList = RoomManager.getInstance().loadByWhere("where roomtypeid = " + rId); %>
        <%=guestList[0].getRoomtypeid()%>
    <% } %>
