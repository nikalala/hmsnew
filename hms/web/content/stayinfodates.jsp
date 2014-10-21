<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
ReservationroomBean rroom = ReservationroomManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("reservationroomid")));
ReservationBean reserv = ReservationManager.getInstance().loadByPrimaryKey(rroom.getReservationid());
Calendar c1 = Calendar.getInstance();
Calendar c2 = Calendar.getInstance();
c1.setTime(reserv.getArraivaldate());
c2.setTime(reserv.getDeparturedate());
RatetypeBean rtp = RatetypeManager.getInstance().loadByPrimaryKey(rroom.getRatetypeid());
%>
<div class="panel-heading">
    <h3 class="panel-title">
        დარჩენის ინფორმაცია
        <div class="btn-group pull-right">
            <a href="javascript:newsWindow1('editarrivalinfo','დროის რედაქტირება','reservationroomid=<%=rroom.getReservationroomid()%>');" class="glyphicon glyphicon-pencil iconblack" style="text-decoration: none;" data-toggle="tooltip" title="ჩამოსვლა/წასვლის დროების რედაქტირება"></a>
        </div>
    </h3>
</div>
<div class="panel-body" style="height:110px;">
    <table width="100%" class="table table-borderless">
        <tbody>
            <tr>
                <td><b>ჩამოსვლა</b></td>
                <td><%=dt.format(reserv.getArraivaldate())%></td>
                <td><%=dtime.format(reserv.getArraivaldate())%></td>
            </tr>
            <tr>
                <td><b>წასვლა</b></td>
                <td><%=dt.format(reserv.getDeparturedate())%></td>
                <td><%=dtime.format(reserv.getDeparturedate())%></td>
            </tr>
            <tr>
                <td><b>ღამე(ებ)ი</b></td>
                <td><%=DayDiff(c1,c2)%></td>
                <td></td>
            </tr>
            <tr>
                <td><b>ტარიფი</b></td>
                <td><%=rtp.getName()%></td>
                <td></td>
            </tr>
            <tr>
                <td><b>Pax</b></td>
                <td><%=rroom.getAdult()%> / <%=rroom.getChild()%></td>
                <td>(უ / ბ)</td>
            </tr>
        </tbody>
    </table>
</div>