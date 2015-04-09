<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<option>-- აირჩიეთ --</option>
<%
int roomtypeid = Integer.parseInt(request.getParameter("roomtypeid"));
int oldroomid = Integer.parseInt(request.getParameter("oldroomid"));
String statustypes = request.getParameter("statustypes");
System.out.println("select * from room where roomid != "+oldroomid+" and roomtypeid = "+roomtypeid+" and getroomstatus(roomid,'"+dtlongs.format(new Date())+"') in ("+statustypes+")");
RoomBean[] rooms = RoomManager.getInstance().loadByWhere("where roomid != "+oldroomid+" and roomtypeid = "+roomtypeid+" and getroomstatus(roomid,'"+dtlongs.format(new Date())+"') in ("+statustypes+")");
for(int i=0;i<rooms.length;i++){
    String rname = rooms[i].getNickname();
    if(rname == null)   rname = rooms[i].getName();
    if(rname == null || rname.trim().length() == 0) rname = "ნომრის გარეშე";
%>
<option value="<%=rooms[i].getRoomid()%>"><%=rname%></option>
<%
}
%>
