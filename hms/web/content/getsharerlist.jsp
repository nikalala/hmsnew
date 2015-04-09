<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/xml;charset=utf-8"%>
<%@include file="../includes/initxml.jsp"%>
<%
ReservationroomBean rroom = ReservationroomManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("reservationroomid")));
GuestBean[] sharers = GuestManager.getInstance().loadByWhere("where guestid = "+rroom.getGuestid()+" or guestid in (select guestid from sharer where reservationroomid = "+rroom.getReservationroomid()+") order by (case when guestid = "+rroom.getGuestid()+" then 0 else 1 end), guestid asc");


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
int count = sharers.length;
int total_pages = 0;
if(count > 0)    total_pages = (int)(count/ilmt);
if(total_pages*ilmt < count)    total_pages++;
if(ipg > total_pages) ipg=total_pages;
int start = ilmt*ipg - ilmt;
if(start < 0)   start = 0;
String limit = "limit "+ilmt+" offset "+start;
String order = "order by "+sidx+" "+sord;

%>
<rows>
	<page><%=ipg%></page>
	<total><%=total_pages%></total>
	<records><%=count%></records>
	<%
	for(int i=0;i<sharers.length;i++){
            GuestBean gs = GuestManager.getInstance().loadByPrimaryKey(sharers[i].getGuestid());
            String gname = "";
            SalutationBean salutation = SalutationManager.getInstance().loadByPrimaryKey(gs.getSalutationid());
            gname += salutation.getName()+" ";
            gname += gs.getFname() + " " + gs.getLname();
            String gendername = "?";
            if(gs.getGender() != null){
                gendername = gender[gs.getGender().intValue()];
            }
            String actions = "";
            actions += "<span onclick=\"editSharer("+rroom.getReservationroomid()+","+sharers[i].getGuestid()+")\" style=\"cursor: pointer;\" class=\"glyphicon glyphicon-pencil\" data-toggle=\"tooltip\" title=\"რედაქტირება\"></span>&nbsp;";
            actions += "<span onclick=\"\" style=\"cursor: pointer;\" class=\"glyphicon glyphicon-arrow-down\" data-toggle=\"tooltip\" title=\"მოყვანა\"></span>&nbsp;";
            actions += "<span onclick=\"\" style=\"cursor: pointer;\" class=\"glyphicon glyphicon-arrow-up\" data-toggle=\"tooltip\" title=\"წაყვანა\"></span>&nbsp;";
            actions += "<span onclick=\"\" style=\"cursor: pointer;\" class=\"glyphicon glyphicon-user\" data-toggle=\"tooltip\" title=\"შავ სიაში დამატება\"></span>&nbsp;";
            actions += "<span onclick=\"printRegCard("+rroom.getReservationroomid()+","+sharers[i].getGuestid()+")\" style=\"cursor: pointer;\" class=\"glyphicon glyphicon-list-alt\" data-toggle=\"tooltip\" title=\"სტუმრის სარეგისტრაციო ბარათი\"></span>";
            if(sharers[i].getGuestid().longValue() != rroom.getGuestid().longValue())
                actions += "&nbsp;<span onclick=\"delSharer("+rroom.getReservationroomid()+","+sharers[i].getGuestid()+")\" style=\"cursor: pointer;\" class=\"glyphicon glyphicon-trash\" data-toggle=\"tooltip\" title=\"სტუმრის წაშლა\"></span>";
            %>
                <row id='<%=sharers[i].getGuestid()%>'>
                    <cell><![CDATA[<%=gname%>]]></cell>
                    <cell><![CDATA[<%=gendername%>]]></cell>
                    <cell><![CDATA[<%=actions%>]]></cell>
                </row>
            <%
            }
	%>
        
</rows>
