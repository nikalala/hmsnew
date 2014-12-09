<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
String[] params = request.getParameter("param").split(",");
ReservationroomBean rroom = ReservationroomManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("reservationroomid")));
ReservationBean reserv = ReservationManager.getInstance().loadByPrimaryKey(rroom.getReservationid());
RoomBean room = null;
if(rroom.getRoomid() != null)
    room = RoomManager.getInstance().loadByPrimaryKey(rroom.getRoomid());
JSONObject obj = new JSONObject();
for(int i=0;i<params.length;i++){
    if(params[i].equalsIgnoreCase("name"))  {
        if(room != null)
            obj.element(params[i], room.getName());
        else
            obj.element(params[i], "N/A");
    }
    if(params[i].equalsIgnoreCase("nickname"))  {
        if(room != null)
            obj.element(params[i], room.getCode());
        else
            obj.element(params[i], "N/A");
    }
    if(params[i].equalsIgnoreCase("roomtype")){
        RoomtypeBean roomtype = RoomtypeManager.getInstance().loadByPrimaryKey(rroom.getRoomtypeid());
        obj.element(params[i], roomtype.getCode());
    }
}
obj.element("reservationid", reserv.getReservationid().toString());
%>
<%=obj.toString()%>
