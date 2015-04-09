<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
ReservationroomBean rroom = ReservationroomManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("reservationroomid")));
double[] prices = getRoomrateForStay(rroom.getReservationroomid().longValue());
double paid = getSum("select sum(amount*ratedate("+maincurrency.getCurrencyid()+",currencyid,paydate)) from payment where folioid in (select folioid from folio where reservationroomid = "+rroom.getReservationroomid()+")");

%>
<table width="100%" class="table table-bordered">
    <thead>
        <tr>
            <th colspan="2" style="color: #639014;"><b>ჯამი</b></th>
        </tr>
    
    </thead>
    <tbody style="background-color: #F5F5F5;">
        <tr>
            <td style="border-right: none;"><b>ოთახის გადასახადი</b></td>
            <td style="border-left: none;" align="right">
                <%=dc.format(prices[1])%>
            </td>
        </tr>
        <tr>
            <td style="border-right: none;"><b>ფასდაკლება</b></td>
            <td style="border-left: none;" align="right">
                <%=dc.format(prices[3])%>
            </td>
        </tr>
        <tr>
            <td style="border-right: none;"><b>გადასახადი</b></td>
            <td style="border-left: none;" align="right">
                <%=dc.format(prices[2])%>
            </td>
        </tr>
        <tr>
            <td style="border-right: none;"><b>დამატებითი სერვისები</b></td>
            <td style="border-left: none;" align="right">
                <%=dc.format(0.00)%>
            </td>
        </tr>
        <tr>
            <td style="border-right: none;"><b>გადახდილი თანხა</b></td>
            <td style="border-left: none;" align="right">
                <%=dc.format(paid)%>
            </td>
        </tr>
        <tr>
            <td style="border-right: none;"><b>დამრგვალება</b></td>
            <td style="border-left: none;" align="right">
                <%=dc.format(prices[4])%>
            </td>
        </tr>
        <tr>
            <td style="border-right: none; color: red; font-size: 14px;"><b>სულ</b></td>
            <td style="border-left: none; color: red; font-size: 14px;" align="right">
                <%=dc.format(prices[0])%>
            </td>
        </tr>
    </tbody>
</table>

