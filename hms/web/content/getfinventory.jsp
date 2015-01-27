<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/xml;charset=utf-8" %>
<%@include file="../includes/initxml.jsp" %>

<rows>

    <row id="0">
        <cell><![CDATA[<b style="color:#000;">ოთახის ტიპი</b>]]></cell>
        <cell><![CDATA[<b style="color:#000;">08-29</b>]]></cell>
        <cell><![CDATA[<b style="color:#000;">08-30</b>]]></cell>
        <cell><![CDATA[<b style="color:#000;">08-29</b>]]></cell>
    </row>

    <%
        request.setCharacterEncoding("UTF-8");
        String reqdt = (String) request.getParameter("dt");
        if (!CodeHelpers.isNullOrEmpty(reqdt)) {
            String[][] items = getRoomStatuses(dt.parse(reqdt), 3);
            for (int i = 0; i < items.length; i++) {%>
    <row id="<%=i%>">

        <% for (int j = 0; j < items[i].length; j++) {
        %>

        <cell><%=items[i][j]%></cell>

        <%
            } %>
    </row>
    <% }
    }
    %>

    <userdata name="dt1">150</userdata>
    <userdata name="dt2">321</userdata>
    <userdata name="dt3">123</userdata>
</rows>