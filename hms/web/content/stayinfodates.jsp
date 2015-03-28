<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
String rid  = request.getParameter("reservationroomid");
ReservationroomBean rroom = null;
ReservationBean reserv = null;
RatetypeBean rtp = null;
Calendar c1 = Calendar.getInstance();
Calendar c2 = Calendar.getInstance();
if(!rid.equals("null")){
    rroom = ReservationroomManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("reservationroomid")));
    reserv = ReservationManager.getInstance().loadByPrimaryKey(rroom.getReservationid());
    rtp = RatetypeManager.getInstance().loadByPrimaryKey(rroom.getRatetypeid());
    c1.setTime(reserv.getArraivaldate());
    c2.setTime(reserv.getDeparturedate());
}

int days = DayDiff(c1,c2)+1;
%>
<div class="panel-heading">
    <h3 class="panel-title">
        დარჩენის ინფორმაცია
        <%if(rroom != null){%>
        <div class="btn-group pull-right">
            <a href="javascript:newsWindow1('editarrivalinfo','დროის რედაქტირება','reservationroomid=<%=rroom.getReservationroomid()%>');" class="glyphicon glyphicon-pencil iconblack" style="text-decoration: none;" data-toggle="tooltip" title="ჩამოსვლა/წასვლის დროების რედაქტირება"></a>
        </div>
        <%}%>
    </h3>
</div>
<div class="panel-body" style="height:110px;">
    <table width="100%" class="table table-borderless">
        <tbody>
            <tr>
                <td><b>ჩამოსვლა</b></td>
                <td><%=(reserv == null) ? "":dt.format(reserv.getArraivaldate())%></td>
                <td><%=(reserv == null) ? "":dtime.format(reserv.getArraivaldate())%></td>
            </tr>
            <tr>
                <td><b>წასვლა</b></td>
                <td><%=(reserv == null) ? "":dt.format(reserv.getDeparturedate())%></td>
                <td><%=(reserv == null) ? "":dtime.format(reserv.getDeparturedate())%></td>
            </tr>
            <tr>
                <td><b>ღამე(ებ)ი</b></td>
                <td><%=days%></td>
                <td></td>
            </tr>
            <tr>
                <td><b>ტარიფი</b></td>
                <td><%=(rtp == null) ? "":rtp.getName()%></td>
                <td></td>
            </tr>
            <tr>
                <td><b>Pax</b></td>
                <td><%=(rroom == null) ? "":rroom.getAdult()%> / <%=(rroom == null) ? "":rroom.getChild()%></td>
                <td>(უ / ბ)</td>
            </tr>
        </tbody>
    </table>
</div>