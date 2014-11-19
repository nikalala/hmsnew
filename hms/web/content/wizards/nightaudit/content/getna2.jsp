<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/xml;charset=utf-8"%>
<%@include file="../../../../includes/initxml.jsp"%>
<%
String sql = "where reservationid in ("
        + "select reservationid from reservation where advancepaymentdate::date = to_date('"+df.format(dclosedate)+"','DD/MM/YYYY')"
        + ") ";
    
int ipg = 1;
int ilmt = 10;
String pg = request.getParameter("page");
if(pg != null)  ipg = Integer.parseInt(pg);
String lmt = request.getParameter("rows");
if(lmt != null) ilmt = Integer.parseInt(lmt);
String sidx = request.getParameter("sidx");
if(sidx == null)    sidx = "";
String sord = request.getParameter("sord");
if(sord == null)    sord = "";
int count = ReservationroomManager.getInstance().countWhere(sql);
int total_pages = 0;
if(count > 0)    total_pages = (int)(count/ilmt);
if(total_pages*ilmt < count)    total_pages++;
if(ipg > total_pages) ipg=total_pages;
int start = ilmt*ipg - ilmt;
if(start < 0)   start = 0;
String limit = "limit "+ilmt+" offset "+start;
String order = "order by "+sidx+" "+sord;
System.out.println(sql+" "+order);
ReservationroomBean[] reservs = ReservationroomManager.getInstance().loadByWhere(sql+" "+order);
%>
<rows>
	<page><%=ipg%></page>
	<total><%=total_pages%></total>
	<records><%=count%></records>
	<%
        double am = 0;
	for(int i=0;i<reservs.length;i++){
            ReservationBean res = ReservationManager.getInstance().loadByPrimaryKey(reservs[i].getReservationid());
            GuestBean guest = GuestManager.getInstance().loadByPrimaryKey(reservs[i].getGuestid());
            SalutationBean salutation = SalutationManager.getInstance().loadByPrimaryKey(guest.getSalutationid());
            int istatus = 0;
            String roomname = "";
            if(reservs[i].getRoomid() != null){
                RoomBean room = RoomManager.getInstance().loadByPrimaryKey(reservs[i].getRoomid());
                istatus = getRoomStatus(null,room.getRoomid().intValue());
                roomname = room.getName()+" ";
            }
            RoomtypeBean roomtype = RoomtypeManager.getInstance().loadByPrimaryKey(reservs[i].getRoomtypeid());
            if(roomtype != null)    roomname += roomtype.getName();
            String guestname = salutation.getName()+" ";
            guestname += guest.getFname() + " " + guest.getLname();
            RatetypeBean rttype = RatetypeManager.getInstance().loadByPrimaryKey(reservs[i].getRatetypeid());
            ReservationtypeBean rtp = ReservationtypeManager.getInstance().loadByPrimaryKey(res.getReservationtypeid());
            String bsname = "";
            if(res.getBsourceid() != null){
                BsourceBean bs = BsourceManager.getInstance().loadByPrimaryKey(res.getBsourceid());
                bsname = bs.getName();
            }
            double total = getSum("select sum(amount) from folioitem where folioid in (select folioid from folio where reservationroomid = "+reservs[i].getReservationroomid()+")");
            double deposit = getSum("select sum(amount) from payment where folioid in (select folioid from folio where reservationroomid = "+reservs[i].getReservationroomid()+")");
            String actions = "<a href=\"#\" class=\"btn btn-xs btn-default\"><i class=\"fa fa-remove\"></i></a>";
            
            %>
                <row id='<%=reservs[i].getReservationroomid()%>'>
                    <cell><![CDATA[<%=reservs[i].getReservationroomid()%>]]></cell>
                    <cell><![CDATA[<%=guestname%>]]></cell>
                    <cell><![CDATA[<%=roomname%>]]></cell>
                    <cell><![CDATA[<%=rttype.getCode()%>]]></cell>
                    <cell><![CDATA[<%=rtp.getName()%>]]></cell>
                    <cell><![CDATA[<%=dt.format(res.getAdvancepaymentdate())%>]]></cell>
                    <cell><![CDATA[<%=bsname%>]]></cell>
                    <cell><![CDATA[<%=dt.format(res.getDeparturedate())%>]]></cell>
                    <cell><![CDATA[<%=maincurrency.getCode()%> <%=dc.format(total)%>]]></cell>
                    <cell><![CDATA[<%=maincurrency.getCode()%> <%=dc.format(deposit)%>]]></cell>
                    <cell><![CDATA[<%=actions%>]]></cell>
                </row>
            <%
            }
	%>
</rows>