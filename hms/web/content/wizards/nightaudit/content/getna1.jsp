<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/xml;charset=utf-8" %>
<%@include file="../../../../includes/initxml.jsp" %>
<%
    String sql = "where reservationid in (select reservationid from reservation where arraivaldate::date = to_date('" + df.format(dclosedate) + "','DD/MM/YYYY') and status = 0)";

    int ipg = 1;
    int ilmt = 10;
    String pg = request.getParameter("page");
    if (pg != null) ipg = Integer.parseInt(pg);
    String lmt = request.getParameter("rows");
    if (lmt != null) ilmt = Integer.parseInt(lmt);
    String sidx = request.getParameter("sidx");
    if (sidx == null) sidx = "";
    String sord = request.getParameter("sord");
    if (sord == null) sord = "";
    int count = ReservationroomManager.getInstance().countWhere(sql);
    int total_pages = 0;
    if (count > 0) total_pages = (int) (count / ilmt);
    if (total_pages * ilmt < count) total_pages++;
    if (ipg > total_pages) ipg = total_pages;
    int start = ilmt * ipg - ilmt;
    if (start < 0) start = 0;
    String limit = "limit " + ilmt + " offset " + start;
    String order = "order by " + sidx + " " + sord;
    System.out.println(sql + " " + order);
    ReservationroomBean[] reservs = ReservationroomManager.getInstance().loadByWhere(sql + " " + order);
%>
<rows>
    <page><%=ipg%></page>
    <total><%=total_pages%></total>
    <records><%=count%></records>
    <%
        double am = 0;
        for (int i = 0; i < reservs.length; i++) {

            ReservationBean rb = ReservationManager.getInstance().loadByPrimaryKey(reservs[i].getReservationid());
            if (rb.getAdvancepaymentamount() != null) {

                double balance = getBalance(reservs[i].getReservationroomid());
                System.out.println("BALANCE > " + balance);

                double releaseTerm = (getTotalWithExtra(reservs[i].getReservationroomid()) * rb.getAdvancepaymentamount() / 100);
                System.out.println("RELEASE MONEY > " + releaseTerm);

                Date releaseDate = rb.getAdvancepaymentdate();
                System.out.println("RELEASE DATE > " + releaseDate);

                if (
                        (releaseDate != null &&
                                balance >= releaseTerm &&
                                releaseDate.getTime() == lclosedate) || releaseDate == null
                        ) {

                    ReservationBean res = ReservationManager.getInstance().loadByPrimaryKey(reservs[i].getReservationid());
                    GuestBean guest = GuestManager.getInstance().loadByPrimaryKey(reservs[i].getGuestid());
                    SalutationBean salutation = SalutationManager.getInstance().loadByPrimaryKey(guest.getSalutationid());
                    int istatus = 0;
                    String roomname = "";
                    if (reservs[i].getRoomid() != null) {
                        RoomBean room = RoomManager.getInstance().loadByPrimaryKey(reservs[i].getRoomid());
                        istatus = getRoomStatus(null, room.getRoomid().intValue());
                        roomname = room.getName() + " ";
                    }
                    System.out.println("Roomtypeid > " + reservs[i]);
                    RoomtypeBean roomtype = RoomtypeManager.getInstance().loadByPrimaryKey(reservs[i].getRoomtypeid());
                    System.out.println("RoomType > " + roomtype);
                    if (roomtype != null) roomname += " - " + roomtype.getCode();
                    String guestname = salutation.getName() + " ";
                    guestname += guest.getFname() + " " + guest.getLname();
                    RatetypeBean rttype = RatetypeManager.getInstance().loadByPrimaryKey(reservs[i].getRatetypeid());
                    ReservationtypeBean rtp = ReservationtypeManager.getInstance().loadByPrimaryKey(res.getReservationtypeid());
                    String bsname = "";
                    if (res.getBsourceid() != null) {
                        BsourceBean bs = BsourceManager.getInstance().loadByPrimaryKey(res.getBsourceid());
                        bsname = bs.getName();
                    }
                    double total = getSum("select sum(amount) from folioitem where particular not in (1,2) and folioid in (select folioid from folio where reservationroomid = " + reservs[i].getReservationroomid() + ")");
                    double deposit = getSum("select sum(amount) from payment where folioid in (select folioid from folio where reservationroomid = " + reservs[i].getReservationroomid() + ")");
                    String actions = "";
                    actions += "<a href=\"javascript:newmWindow1('void','რეზერვაციის წაშლა','rid=" + reservs[i].getReservationroomid() + "')\" title=\"VOID\" class=\"btn btn-xs btn-default\"><i class=\"fa fa-remove\"></i></a>";
                    actions += "<a href=\"javascript:newmWindow1('cancel','რეზერვაციის გაუქმება','rid=" + reservs[i].getReservationroomid() + "')\" title=\"CANCEL\" class=\"btn btn-xs btn-default\"><i class=\"fa fa-minus\"></i></a>";
                    actions += "<a href=\"javascript:newmWindow1('noshow','არ გამოცხადებული რეზერვაცია','rid=" + reservs[i].getReservationroomid() + "')\" title=\"NOSHOW\" class=\"btn btn-xs btn-default\"><i class=\"fa fa-plane\"></i></a>";
            /*reservs[i].setRoomid(null);*/
                    if (reservs[i].getRoomid() == null)
                        actions += "<a href=\"javascript:newmWindow1('assignroom','ოთახის მინიჭება','rid=" + reservs[i].getReservationroomid() + "')\" title=\"ASSIGN ROOM\" class=\"btn btn-xs btn-default\"><i class=\"fa fa-bell\"></i></a>";
                    else {
                        String params = "&resid=" + reservs[i].getReservationid();
                        actions += "<a href=\"javascript:modalWindow('checkin','CheckIn','rid=" + reservs[i].getRoomid() + params + "',reloadGrid,'list_pendingreservations');\" title=\"CHECKIN\" class=\"btn btn-xs btn-default\"><i class=\"fa fa-check\"></i></a>";
                    }
    %>
    <row id='<%=reservs[i].getReservationroomid()%>'>
        <cell><![CDATA[<%=reservs[i].getReservationroomid()%>]]></cell>
        <cell><![CDATA[<%=guestname%>]]></cell>
        <cell><![CDATA[<%=roomname%>]]></cell>
        <cell><![CDATA[<%=rttype.getCode()%>]]></cell>
        <cell><![CDATA[<%=rtp.getName()%>]]></cell>
        <cell><![CDATA[<%=bsname%>]]></cell>
        <cell><![CDATA[<%=dt.format(res.getDeparturedate())%>]]></cell>
        <cell><![CDATA[<%=maincurrency.getCode()%> <%=dc.format(total)%>]]></cell>
        <cell><![CDATA[<%=maincurrency.getCode()%> <%=dc.format(deposit)%>]]></cell>
        <cell><![CDATA[<%=actions%>]]></cell>
    </row>
    <%
                }
            }
        }
    %>
</rows>

