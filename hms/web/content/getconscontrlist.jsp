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
        where = " where contragentid in(" + where + ")";
    }

    System.out.println(where);

    VContragentlistBean[] contrList = VContragentlistManager.getInstance().loadByWhere(where);
    Manager.getInstance().getConnection().prepareStatement("");

%>

<rows>
    <%
        for (int i = 0; i < contrList.length; i++) { %>
    <row id='<%=contrList[i].getContragentid()%>'>
        <cell>
            <![CDATA[ <input type="radio" name="consguest" class="consguest" /> ]]>
        </cell>
        <cell><![CDATA[<%=contrList[i].getCompany()%>]]></cell>
        <cell><![CDATA[<%=contrList[i].getContragent()%>]]></cell>
        <cell><![CDATA[<%=contrList[i].getCity()%>]]></cell>
        <cell><![CDATA[<%=contrList[i].getCountry()%>]]></cell>
        <cell><![CDATA[<%=contrList[i].getPhone()%> ]]></cell>
        <cell><![CDATA[<%=contrList[i].getEmail()%> ]]></cell>
    </row>
    <% } %>
</rows>