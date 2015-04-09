<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/xml;charset=utf-8" %>
<%@include file="../includes/initxml.jsp" %>
<%
HousekeepingstatusBean[] sts = HousekeepingstatusManager.getInstance().loadByWhere("where active = true and deleted = false order by name");
  RoomhstBean[] hsts = RoomhstManager.getInstance().loadByWhere("where regdate::date = to_date('"+df.format(dclosedate)+"','DD/MM/YYYY')");  
%>
<rows>
<%
int tvacant = 0;
int toccupied = 0;
int ttotal = 0;
for(int i=0;i<sts.length;i++){

int vacant = (int)getSum("select count(roomid) from roomhst where regdate::date = to_date('"+df.format(dclosedate)+"','DD/MM/YYYY') and housekeepingstatusid = "+sts[i].getHousekeepingstatusid()+" and getroomstatus(roomid,'"+df.format(dclosedate)+"') in (0,5,7,8,9)");
int occupied = (int)getSum("select count(roomid) from roomhst where regdate::date = to_date('"+df.format(dclosedate)+"','DD/MM/YYYY') and housekeepingstatusid = "+sts[i].getHousekeepingstatusid()+" and getroomstatus(roomid,'"+df.format(dclosedate)+"') in (1,2,3,4,6)");
int total = vacant + occupied;
tvacant += vacant;
toccupied += occupied;
ttotal += total;
%>
    <row id="<%=sts[i].getHousekeepingstatusid()%>">
        <cell><%=sts[i].getName()%></cell>
        <cell><%=vacant%></cell>
        <cell><%=occupied%></cell>
        <cell><%=total%></cell>
    </row>
<%}%>
    <userdata name="vacant"><%=tvacant%></userdata>
    <userdata name="occupied"><%=toccupied%></userdata>
    <userdata name="total"><%=ttotal%></userdata>
</rows>