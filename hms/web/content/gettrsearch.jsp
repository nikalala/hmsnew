<%@ page import="org.apache.xmlbeans.impl.xb.ltgfmt.Code" %><?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/xml;charset=utf-8" %>
<%@include file="../includes/initxml.jsp" %>

<%
    request.setCharacterEncoding("UTF-8");
    VsReservationlistBean[] ReservationBeanList = null;
    String bc = "";
    String room = "";
    String fLoad = (String) request.getParameter("firstload");

    if (fLoad != null) {
        fLoad = "firstload";
    }
    SimpleDateFormat resListDate = new SimpleDateFormat(arrdepdateformats[dff]);
    if (!CodeHelpers.isNullOrEmpty(fLoad)) {
        ReservationBeanList = CodeHelpers.buildReservationSearchString(request);
    } else {
        String where = (String) request.getParameter("query");
        String limit = (String) request.getParameter("limit");
        if (where == null || where.equals("0")) {
            where = "";
        } else {
            String strToSplit = request.getQueryString().substring(0, request.getQueryString().indexOf('&'));
            where = URLDecoder.decode(strToSplit, "UTF-8");
            where = where.replace("query=", "");
        }
        if (limit == null) {
            limit = "";
        }
        String sidx = request.getParameter("sidx");
        if (sidx == null) sidx = "";
        String sord = request.getParameter("sord");
        if (sord == null) sord = "";
        String order = " order by " + sidx + " " + sord;
        int total = VReservationlistManager.getInstance().countWhere(where);
        ReservationBeanList = VsReservationlistManager.getInstance().loadByWhere(where + " " + order + limit);
    }
%>

<rows>
        <%--    <page><%=ipg%></page>
            <total><%=total_pages%></total>
            <records><%=count%></records>--%>
    <%
        if (ReservationBeanList != null) {
            for (int i = 0; i < ReservationBeanList.length; i++) { %>
    <%
        int st = ReservationBeanList[i].getStatus();
        if (ReservationBeanList[i].getRoomcode() != null) {
            room = ReservationBeanList[i].getRoomcode() + " - ";
        } else {
            room = "";
        }
    %>
    <row id='<%=ReservationBeanList[i].getReservationid()%>'>
        <cell><![CDATA[<%=ReservationBeanList[i].getGuest()%>]]></cell>
        <cell><![CDATA[<%=resListDate.format(ReservationBeanList[i].getArraivaldate())%>]]></cell>
        <cell><![CDATA[<%=resListDate.format(ReservationBeanList[i].getDeparturedate())%>]]></cell>
        <cell><![CDATA[<%=room%> <%=ReservationBeanList[i].getRoomtypecode()%> ]]></cell>
        <cell><![CDATA[<%=ReservationBeanList[i].getFolionumber()%> ]]></cell>
        <cell><![CDATA[<%=ReservationBeanList[i].getReservationid()%>]]></cell>
        <cell><![CDATA[<%=ReservationBeanList[i].getFolionumber()%>]]></cell>
        <cell><![CDATA[<%=ReservationBeanList[i].getCompanyname()%>]]></cell>
        <cell><![CDATA[<%=reservationstatus[ReservationBeanList[i].getStatus()]%>]]></cell>
        <cell><![CDATA[<%=df3.format(ReservationBeanList[i].getRegdate())%>]]></cell>
        <cell><![CDATA[
        <i onclick="addTab('content/EditTransaction.jsp?reservationroomid=<%=ReservationBeanList[i].getReservationroomid()%>','<span class=\'glyphicon glyphicon-saved\'></span>&nbsp;&nbsp;<%=ReservationBeanList[i].getReservationroomid()%> - DXR','TAB_EditTransaction_<%=ReservationBeanList[i].getReservationroomid()%>');" style="font-size: 15px;  margin-left:10px;" class="fa fa-pencil"></i>
                ]]></cell>
    </row>
    <% }
    } %>
</rows>
