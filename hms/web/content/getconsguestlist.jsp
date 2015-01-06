<%@ page import="javax.mail.internet.MimeUtility" %><?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/xml;charset=utf-8" %>
<%@include file="../includes/initxml.jsp" %>

<%
    request.setCharacterEncoding("UTF-8");
    String where = (String) request.getParameter("query");
    if (where == null || where.equals("0")) {
        where = "";
    } else {
        String strToSplit = request.getQueryString().substring(0, request.getQueryString().indexOf('&'));
        where = URLDecoder.decode(strToSplit, "UTF-8");
        where = where.replace("query=", "");
        where = " where guestid in(" + where + ")";
    }

    System.out.println(where);

    VGuestdblistBean[] guestList = VGuestdblistManager.getInstance().loadByWhere(where);
    Manager.getInstance().getConnection().prepareStatement("");

%>

<rows>
<%
    for (int i = 0; i < guestList.length; i++) { %>
<row id='<%=guestList[i].getGuestid()%>'>
<cell>
    <![CDATA[ <input type="radio" name="consguest" id="consguest" /> ]]>
</cell>
<cell><![CDATA[<%=guestList[i].getGuest()%>]]></cell>
<cell><![CDATA[<%=guestList[i].getCity()%>]]></cell>
<cell><![CDATA[<%=guestList[i].getCountry()%>]]></cell>
<cell><![CDATA[<%=guestList[i].getPhone()%>]]></cell>
<cell><![CDATA[<%=guestList[i].getEmail()%> ]]></cell>
</row>
<% } %>
</rows>