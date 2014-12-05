<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/xml;charset=utf-8"%>
<%@include file="../includes/initxml.jsp"%>
<%
ReservationroomBean rroom = ReservationroomManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("reservationroomid")));
ReservationBean reserv = ReservationManager.getInstance().loadByPrimaryKey(rroom.getReservationid());
String roomname = "";
if(rroom.getRoomid() != null){
    RoomBean room = RoomManager.getInstance().loadByPrimaryKey(rroom.getRoomid());
    roomname = room.getName();
}
RoomtypeBean roomtype = RoomtypeManager.getInstance().loadByPrimaryKey(rroom.getRoomtypeid());
RatetypeBean rtp = RatetypeManager.getInstance().loadByPrimaryKey(rroom.getRatetypeid());
Calendar calstart = Calendar.getInstance();
Calendar calend = Calendar.getInstance();
calend.add(Calendar.DATE,1);
calstart.setTime(reserv.getArraivaldate());
calend.setTime(reserv.getDeparturedate());


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
int count = DayDiff(calstart,calend);
int total_pages = 0;
if(count > 0)    total_pages = (int)(count/ilmt);
if(total_pages*ilmt < count)    total_pages++;
if(ipg > total_pages) ipg=total_pages;
int start = ilmt*ipg - ilmt;
if(start < 0)   start = 0;
String limit = "limit "+ilmt+" offset "+start;
String order = "order by "+sidx+" "+sord;

int n = 0;


double troomrate = 0;
double ttax = 0;
double tdiscount = 0;
double tfix = 0;
double tneto = 0;
%>
<rows>
	<page><%=ipg%></page>
	<total><%=total_pages%></total>
	<records><%=count%></records>
<%
for(int i=0;calstart.before(calend);i++){
    tariff trf = new tariff();
    trf.init(rroom.getReservationroomid().longValue(),i);
    double roomrate = trf.tariff_rate;
    double discount = trf.tariff_discount;
    double fix = trf.tariff_fix;
    double tax = trf.tariff_tax;
    double neto = trf.tariff_neto;
    troomrate += roomrate;
    ttax += tax;
    tfix += fix;
    tneto += neto;
    int incl = (trf.incl) ? 1:0;
    String acts = "<span onclick=\"roomchAction(1,"+i+")\" style=\"cursor: pointer;\" class=\"glyphicon glyphicon-usd\" data-toggle=\"tooltip\" title=\"ტარიფის ოპერაცია\"></span>";
    acts += "<span onclick=\"roomchAction(2,"+i+")\" style=\"padding-left: 5px; cursor: pointer;\" class=\"glyphicon glyphicon-record\" data-toggle=\"tooltip\" title=\"ტარიფის ტიპის ოპერაცია\"></span>";
    acts += "<span onclick=\"roomchAction(3,"+i+")\" style=\"padding-left: 5px; cursor: pointer;\" class=\"glyphicon glyphicon-user\" data-toggle=\"tooltip\" title=\"უფრ./ბავშ. ოპერაცია\"></span>";
%>
    <row id='roomch<%=i%>'>
        <cell><![CDATA[<%=dt.format(calstart.getTime())%>]]></cell>
        <cell><![CDATA[<%=roomtype.getCode()%>-<%=roomname%>]]></cell>
        <cell><![CDATA[<%=rtp.getName()%>]]></cell>
        <cell><![CDATA[<%=rroom.getAdult()%> / <%=rroom.getChild()%>]]></cell>
        <cell><![CDATA[<%=dc.format(roomrate)%>]]></cell>
        <cell><![CDATA[<%=dc.format(discount)%>]]></cell>
        <cell><![CDATA[<%=dc.format(tax)%>]]></cell>
        <cell><![CDATA[<%=dc.format(fix)%>]]></cell>
        <cell><![CDATA[<%=dc.format(neto)%>]]></cell>
        <cell><![CDATA[<%=user.getFname()%> <%=user.getLname()%>]]></cell>
        <cell><![CDATA[<%=acts%>]]></cell>
        <cell><![CDATA[<%=incl%>]]></cell>
    </row>
<%

    calstart.add(Calendar.DATE, 1);
}
%>
        <userdata name="price"><%=dc.format(troomrate)%></userdata>
        <userdata name="tax"><%=dc.format(ttax)%></userdata>
        <userdata name="discount"><%=dc.format(tdiscount)%></userdata>
        <userdata name="fix"><%=dc.format(tfix)%></userdata>
        <userdata name="neto"><%=dc.format(tneto)%></userdata>
</rows>


