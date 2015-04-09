<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/xml;charset=utf-8"%>
<%@include file="../includes/initxml.jsp" %>
<%
int days = Integer.parseInt(request.getParameter("days"));
String startdate = request.getParameter("calstart");
String where = "where active = true and deleted = false";

Calendar cal = Calendar.getInstance();
cal.setTime(dt.parse(startdate));

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
//if(isidx == 0) isidx = 1;


int count = RoomtypeManager.getInstance().countWhere(where);
int total_pages = 0;
if(count > 0)    total_pages = (int)(count/ilmt);
if(total_pages*ilmt < count)    total_pages++;
if(ipg > total_pages) ipg=total_pages;
int start = ilmt*ipg - ilmt;
if(start < 0)   start = 0;
String limit = "limit "+ilmt+" offset "+start;

String order = " order by ord, roomtypeid";

RoomtypeBean[] roomtypes = RoomtypeManager.getInstance().loadByWhere(where+order);
%>
<rows>
    <page><%=ipg%></page>
    <total><%=total_pages%></total>
    <records><%=count%></records>
    <%
        for(int i=0;i<roomtypes.length;i++)
            {
            
            %>
            <row id='<%=roomtypes[i].getRoomtypeid()%>'>
                <cell>0</cell>
                <cell><![CDATA[<%=roomtypes[i].getName()%>]]></cell>
                <%
                for(int k=0;k<days;k++){%><cell><![CDATA[ ]]></cell><%}
            %>
            </row>
            <%
                RoomBean[] rooms = RoomManager.getInstance().loadByWhere("where active = true and deleted = false and roomtypeid = "+roomtypes[i].getRoomtypeid()+" order by ord");
                for(int j=0;j<rooms.length;j++){
                    
                %>
                <row id='<%=roomtypes[i].getRoomtypeid()%>_<%=rooms[j].getRoomid()%>'>
                    <cell>1</cell>
                    <cell><![CDATA[<%=rooms[j].getName()%>]]></cell>
                    <%
                    long rid = 0;
                    for(int k=0;k<days;k++){
                        String sql0 = "where roomid = "+rooms[j].getRoomid()+" and reservationid in ("
                            + "select reservationid from reservation where arraivaldate <= to_date('"+df.format(cal.getTime())+"','DD/MM/YYYY') and departuredate >= to_date('"+df.format(cal.getTime())+"','DD/MM/YYYY')"
                            + ")";
                        ReservationroomBean[] rs = ReservationroomManager.getInstance().loadByWhere(sql0);
                        String val = "";
                        if(rs.length > 0){
                            val = "x";
                            int istatus = getRoomStatus(cal.getTime(),rooms[j].getRoomid().intValue());
                            if(rid != rs[0].getReservationroomid().longValue()){
                                GuestBean guest = GuestManager.getInstance().loadByPrimaryKey(rs[0].getGuestid());
                                rid = rs[0].getReservationroomid().longValue();
                                val = guest.getFname()+" "+guest.getLname();
                            }
                            StcolorBean[] stcolor = StcolorManager.getInstance().loadByWhere("where active = true and deleted = false and roomstatus = "+istatus);
                            if(stcolor.length > 0)
                                val = stcolor[0].getColor() + "SEP" + val;
                        }
                        %><cell><![CDATA[<%=val%>]]></cell><%
                        cal.add(Calendar.DATE, 1);
                    }
                    %>
                </row>
                <%
                }
            }
    %>
    <userdata name="roomid"><b>თავისუფალი ოთახები</b></userdata>
</rows>
