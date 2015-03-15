<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/xml;charset=utf-8" %>
<%@include file="../includes/initxml.jsp" %>

<%

    request.setCharacterEncoding("UTF-8");
    VsReservationlistBean[] ReservationBeanList = null;
    String bc = "";
    String room = "";
    String fLoad = request.getParameter("firstload");

    if (fLoad != null) {
        fLoad = "firstload";
    }

    SimpleDateFormat resListDate = new SimpleDateFormat(arrdepdateformats[dff]);
    if (!CodeHelpers.isNullOrEmpty(fLoad)) {
        ReservationBeanList = CodeHelpers.buildReservationSearchString(request);
    } else {

        String where = " where 2 = 2 ";
        //4,1,2,3
        String Reservation = request.getParameter("Reservation");
        String InHouse = request.getParameter("InHouse");
        String CheckedOut = request.getParameter("CheckedOut");
        String Void = request.getParameter("Void");
        String cancel = request.getParameter("cancel");
        String NoShow = request.getParameter("NoShow");

        String guestname = request.getParameter("guestname");
        String folionum = request.getParameter("folionum");
        String invoicenum = request.getParameter("invoicenum");
        String mobilenum = request.getParameter("mobilenum");
        String resnum = request.getParameter("resnum");
        String vouchernum = request.getParameter("vouchernum");
        String roomBean = request.getParameter("roomBean");
        String roomType = request.getParameter("roomType");
        String arrival_dateFrom = request.getParameter("arrival_dateFrom");
        String arrival_dateTo = request.getParameter("arrival_dateTo");

        if(!CodeHelpers.isNullOrEmpty(guestname)){
            where += " AND guest LIKE N'%" + guestname + "%'";
        }
        if(!CodeHelpers.isNullOrEmpty(folionum)){
            where += " AND folionumber = " + folionum;
        }
        if(!CodeHelpers.isNullOrEmpty(resnum)){
            where += " AND reservationid = " + resnum;
        }
        if(!CodeHelpers.isNullOrEmpty(invoicenum)){
            where += " AND folionumber = " + invoicenum;
        }
        if(!CodeHelpers.isNullOrEmpty(mobilenum)){
            where += " AND mobile LIKE N'%" + mobilenum + "%' OR  phone LIKE N'%" + mobilenum + "%'";
        }
        if(!CodeHelpers.isNullOrEmpty(vouchernum)){
            where += " AND companyname LIKE N'%" + vouchernum + "%'";
        }

        String filterByRoom = " AND (" + roomBean + " = 0 OR roomid = " + roomBean + ")";
        if (!roomType.equals("0") && roomBean.equals("0")) {
            filterByRoom = " AND roomid IN (SELECT roomid FROM room where roomtypeid = " + roomType + ")";
        }

        where += filterByRoom;

        if(!CodeHelpers.isNullOrEmpty(arrival_dateFrom) && !CodeHelpers.isNullOrEmpty(arrival_dateTo)){
            where += " AND to_date('"+arrival_dateFrom+"', 'DD.MM.YYYY') <= arraivaldate::date AND arraivaldate::date <= to_date('"+arrival_dateTo+"','DD.MM.YYYY')";
        }

        String status = "";

        if (!CodeHelpers.isNullOrEmpty(Reservation) && Reservation.equals("on")) {
            status += "0,";
        }
        if (!CodeHelpers.isNullOrEmpty(InHouse) && InHouse.equals("on")) {
            status += "-1,";
        }
        if (!CodeHelpers.isNullOrEmpty(CheckedOut) && CheckedOut.equals("on")) {
            status += "4,";
        }
        if (!CodeHelpers.isNullOrEmpty(Void) && Void.equals("on")) {
            status += "1,";
        }
        if (!CodeHelpers.isNullOrEmpty(cancel) && cancel.equals("on")) {
            status += "2,";
        }
        if (!CodeHelpers.isNullOrEmpty(NoShow) && NoShow.equals("on")) {
            status += "3,";
        }

        if(!CodeHelpers.isNullOrEmpty(status)){
            status = CodeHelpers.substringUpToLastOccurance(status,',');
            where += " AND status in(" + status + ")";
        }



        String limit = request.getParameter("limit");

        if (limit == null) {
            limit = "";
        }
        String sidx = request.getParameter("sidx");
        if (sidx == null) sidx = "";
        String sord = request.getParameter("sord");
        if (sord == null) sord = "";
        String order = sord != "" && sidx != "" ? " order by " + sidx + " " + sord : "";
        System.out.println(where + " " + order + limit);
        int total = VsReservationlistManager.getInstance().countWhere(where);
        ReservationBeanList = VsReservationlistManager.getInstance().loadByWhere(where + " " + order + limit);

    }
%>

<rows>
        <%--    <page><%=ipg%></page>
            <total><%=total_pages%></total>
            <records><%=count%></records>--%>
    <%
        if (ReservationBeanList != null) {
            for (int i = 0; i < ReservationBeanList.length; i++) { 
                int st = ReservationBeanList[i].getStatus();
                if (ReservationBeanList[i].getRoomcode() != null) {
                    room = ReservationBeanList[i].getRoomcode() + " - ";
                } else {
                    room = "";
                }
                String statusname = "";
                if(ReservationBeanList[i].getStatus().intValue() >= 0)   statusname = reservationstatus[ReservationBeanList[i].getStatus().intValue()];
                else    statusname = roomstatus[(int)getSum("select getroomstatus1("+ReservationBeanList[i].getReservationroomid()+",'"+dflong.format(dclosedate)+"')")];
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
        <cell><![CDATA[<%=statusname%>]]></cell>
        <cell><![CDATA[<%=df3.format(ReservationBeanList[i].getRegdate())%>]]></cell>
        <cell><![CDATA[
        <i onclick="addTab('content/EditTransaction.jsp?reservationroomid=<%=ReservationBeanList[i].getReservationroomid()%>','<span class=\'glyphicon glyphicon-saved\'></span>&nbsp;&nbsp;<%=ReservationBeanList[i].getReservationroomid()%> - DXR','TAB_EditTransaction_<%=ReservationBeanList[i].getReservationroomid()%>');" style="font-size: 15px;  margin-left:10px;" class="fa fa-pencil"></i>
                ]]></cell>
    </row>
    <% }
    } %>
</rows>
