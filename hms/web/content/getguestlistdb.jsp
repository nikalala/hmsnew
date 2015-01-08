<%@ page import="javax.mail.internet.MimeUtility" %><?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/xml;charset=utf-8" %>
<%@include file="../includes/initxml.jsp" %>

<%
    request.setCharacterEncoding("UTF-8");
    String vipstatus = "";
    String where = (String) request.getParameter("query");
    if (where == null || where.equals("0")) {
        where = " where deleted = false ";
    } else {
        String strToSplit = request.getQueryString().substring(0, request.getQueryString().indexOf('&'));
        where = URLDecoder.decode(strToSplit, "UTF-8");
        where = where.replace("query=", "");
    }
    VGuestdblistBean[] guestList = VGuestdblistManager.getInstance().loadByWhere(where);
    Manager.getInstance().getConnection().prepareStatement("");
%>

<rows>
        <%--<page><%=ipg%></page>--%>
        <%--<total><%=total_pages%></total>--%>
        <%--<records><%=count%></records>--%>
    <%
        for (int i = 0; i < guestList.length; i++) {
            vipstatus = guestList[i].getVipstatus() == null ? "" : guestList[i].getVipstatus();
    %>
    <row id='<%=guestList[i].getGuestid()%>'>
        <cell><![CDATA[<%=guestList[i].getGuest()%>]]></cell>
        <cell><![CDATA[<%=guestList[i].getCity()%>]]></cell>
        <cell><![CDATA[<%=guestList[i].getCountry()%>]]></cell>
        <cell><![CDATA[<%=guestList[i].getMobile()%>]]></cell>
        <cell><![CDATA[<%=guestList[i].getPhone()%>]]></cell>
        <cell><![CDATA[<%=guestList[i].getEmail()%> ]]></cell>
        <cell><![CDATA[<%=vipstatus%>]]></cell>
        <cell>
            <![CDATA[<a href="#" class="btn btn-xs btn-default"><i class="fa fa-pencil"></i></a>
                       <a href="#" onclick="deleteSelectedGuest(<%=guestList[i].getGuestid()%>)" class="btn btn-xs btn-default"><i class="fa fa-trash"></i></a>
                       <a href="#" class="btn btn-xs btn-default"><i class="fa fa-list"></i></a>
                       ]]>
        </cell>
            <%--<cell><![CDATA[]]></cell>--%>
            <%--<cell><![CDATA[]]></cell>--%>
    </row>
    <% } %>
</rows>