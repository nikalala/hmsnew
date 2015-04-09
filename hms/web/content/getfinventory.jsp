<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/xml;charset=utf-8" %>
<%@include file="../includes/initxml.jsp" %>

<rows>

    <%
        request.setCharacterEncoding("UTF-8");
        String reqdt = (String) request.getParameter("dt");
        Date fnextDate = CodeHelpers.getNextDay(dt.parse(reqdt));
        Date snextDate = CodeHelpers.getNextDay(fnextDate);

        String fdt = CodeHelpers.substringUpToLastOccurance(reqdt, '.');
        String f1 = CodeHelpers.substringUpToLastOccurance(dt.format(fnextDate), '.');
        String f2 = CodeHelpers.substringUpToLastOccurance(dt.format(snextDate), '.');

        int fp1 = 0 , fp2 = 0, fp3 = 0;

    %>
    <row id="0">
        <cell><![CDATA[<b style="color:#000;">ოთახის ტიპი</b>]]></cell>
        <cell><![CDATA[<b style="color:#000;"><%=fdt%></b>]]></cell>
        <cell><![CDATA[<b style="color:#000;"><%=f1%></b>]]></cell>
        <cell><![CDATA[<b style="color:#000;"><%=f2%></b>]]></cell>
    </row>
    <%
        if (!CodeHelpers.isNullOrEmpty(reqdt)) {
            String[][] items = getRoomStatuses(dt.parse(reqdt), 3);
            for (int i = 0; i < items.length; i++) {
    %>
    <row id="<%=i%>">

        <% for (int j = 0; j < items[i].length; j++) { %>

            <% if(j == 1) { fp1 += Integer.parseInt(items[i][j]);} %>
            <% if(j == 2) { fp2 += Integer.parseInt(items[i][j]);} %>
            <% if(j == 3) { fp3 += Integer.parseInt(items[i][j]);} %>
            <cell><%=items[i][j]%></cell>

        <% } %>
    </row>
    <% }} %>

    <userdata name="dt1"><%=fp1%></userdata>
    <userdata name="dt2"><%=fp2%></userdata>
    <userdata name="dt3"><%=fp3%></userdata>
</rows>