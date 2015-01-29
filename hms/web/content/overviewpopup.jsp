<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/xml;charset=utf-8" %>
<%@include file="../includes/initxml.jsp" %>

<rows>

    <%
        request.setCharacterEncoding("UTF-8");
        String reqdt = (String) request.getParameter("dt");

        String[] alldts = new String[14];
        int[] allfooteritems = new int[15];
        alldts[0] = CodeHelpers.substringUpToLastOccurance(reqdt, '.');
        String prevDate = reqdt;
        for (int d = 1; d < 14; d++) {
            Date fnextDate = CodeHelpers.getNextDay(dt.parse(prevDate));
            alldts[d] = CodeHelpers.substringUpToLastOccurance(dt.format(fnextDate), '.');
            prevDate = df3.format(fnextDate);
        }
        %>
        <row id="0">
           <cell><![CDATA[<b style="color:#000;">ოთახის ტიპი</b>]]></cell>
        <%
        for(int i = 0; i < alldts.length; i++){%>
           <cell><![CDATA[<b style="color:#000;"><%=alldts[i]%></b>]]></cell>
        <% } %>
        </row>
    <%
        if (!CodeHelpers.isNullOrEmpty(reqdt)) {
            String[][] items = getRoomStatuses(dt.parse(reqdt), 14);
            for (int i = 0; i < items.length; i++) {
    %>
    <row id="<%=i%>">

        <% for (int j = 0; j < items[i].length; j++) {
        if (j > 0) {
            allfooteritems[j] += Integer.parseInt(items[i][j]);
        } %>
        <cell><%=items[i][j]%></cell>
        <% } %>
    </row>
    <% } } %>

    <% for (int i = 1; i < allfooteritems.length; i++) { %>
        <userdata name="dt<%=i%>"><%=allfooteritems[i]%></userdata>
    <% } %>

</rows>