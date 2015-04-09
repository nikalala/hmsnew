<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../../../includes/init.jsp" %>

    <%
        request.setCharacterEncoding("UTF-8");
        String reserv_dateFrom = request.getParameter("reserv_dateFrom");
        String reserv_dateTo = request.getParameter("reserv_dateTo");
        String reservType = request.getParameter("reservType");
        String PersonellBeans = request.getParameter("PersonellBeans");
        String roomType = request.getParameter("roomType");
        String RatetypeBeans = request.getParameter("RatetypeBeans");
        String ratefrom = request.getParameter("ratefrom");
        String rateto = request.getParameter("rateto");
        String MarketBeans = request.getParameter("MarketBeans");
        String ContragentBeans = request.getParameter("ContragentBeans");
        String CompanyBeans = request.getParameter("CompanyBeans");
        String bSources = request.getParameter("bSources");
        //STATUS = -1


        String where = "where to_date('"+reserv_dateFrom+"', 'DD.MM.YYYY') >= arraivaldate::date AND arraivaldate::date <= to_date('"+reserv_dateTo+"','DD.MM.YYYY') AND status = -1 ";
        if(!reservType.equals("0")){
            where += " AND reservationtypeid = " + reservType;
        }
        if(!PersonellBeans.equals("0")){
            where += " AND regbyid = " + PersonellBeans;
        }
        if(!roomType.equals("0")){
            where += " AND roomtypeid = " + roomType;
        }
        if(!RatetypeBeans.equals("0")){

        }
        if(!MarketBeans.equals("0")){

        }
        if(!ContragentBeans.equals("0")){

        }
        if(!CompanyBeans.equals("0")){

        }
        if(!bSources.equals("0")){

        }
        if(!CodeHelpers.isNullOrEmpty(ratefrom) && !ratefrom.equals("0")){

        }
        if(!CodeHelpers.isNullOrEmpty(rateto) && !ratefrom.equals("0")){

        }
        VArrivallistBean[] list = VArrivallistManager.getInstance().loadByWhere(where);

        System.out.println(where);

    %>

<link rel="stylesheet" type="text/css" href="css/reports.css">

<table style="width: 210mm;">
    <thead>
    <tr>
        <td style="border-bottom: 1px solid #000;"><b style="font-size: 20px;">Laerton Tbilisi</b><b
                style="float: right; font-size: 22px;">Arrival list</b></td>
    </tr>
    <tr>
        <td style="border-bottom: 1px solid #000;">
            <b style="font-size: 13px;">Date From: </b> <span><%=reserv_dateFrom%> </span>
            <b style="font-size: 13px;">to: </b> <span><%=reserv_dateTo%></span>
            <b style="font-size: 13px;">Order By: Room </b>
        </td>
    </tr>
    </thead>
</table>
<table style="width: 210mm;">

    <tr>
            <td style="border-bottom: 1px solid #000; width: 99px;"><b>Res. No</b></td>
            <td style="border-bottom: 1px solid #000;"><b>Guest</b></td>
            <td style="border-bottom: 1px solid #000;"><b>Room</b></td>
            <td style="border-bottom: 1px solid #000; width: 61px;"><b>Rate(GEWL)</b></td>
            <td style="border-bottom: 1px solid #000; width: 55px;"><b>Arrival</b></td>
            <td style="border-bottom: 1px solid #000; width: 55px;"><b>Departure</b></td>
            <td style="border-bottom: 1px solid #000; width: 30px;"><b>Pax</b></td>
            <td style="border-bottom: 1px solid #000; width: 56px;"><b>Res. Type</b></td>
            <td style="border-bottom: 1px solid #000;"><b>Company</b></td>
            <td style="border-bottom: 1px solid #000;"><b>User</b></td>
        </tr>

    <% for( VArrivallistBean item : list ){ %>

        <tr>
            <td><%=item.getReservationid()%></td>
            <td><%=item.getGuest()%></td>
            <td><%=item.getRoomcode()%> - <%=item.getRoomtypecode()%></td>
            <td>406.00</td>
            <td><%=dflong.format(item.getArraivaldate())%></td>
            <td><%=dflong.format(item.getDeparturedate())%></td>
            <td><%=item.getAdult()%>/<%=item.getChild()%></td>
            <td><%=item.getReservtype()%></td>
            <td><%=CodeHelpers.ifIsNullOrEmptyReturnEmptryString(item.getCompanyname())%></td>
            <td>Admin</td>
        </tr>

    <% } %>

    <tr>
        <td style="border-bottom: 1px solid #000; border-top: 1px solid #000;"><b>Total Reservation</b></td>
        <td style="border-bottom: 1px solid #000; border-top: 1px solid #000;">#(21)</td>
        <td></td>
        <td style="border-bottom: 1px solid #000; border-top: 1px solid #000;"><b>2,250.00</b></td>
        <td></td>
        <td></td>
        <td style="border-bottom: 1px solid #000; border-top: 1px solid #000;"><b>42/42</b></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
</table>