<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
String[] params = request.getParameter("param").split(",");
ReservationroomBean rroom = ReservationroomManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("reservationroomid")));
ReservationBean reserv = ReservationManager.getInstance().loadByPrimaryKey(rroom.getReservationid());
RoomBean room = RoomManager.getInstance().loadByPrimaryKey(rroom.getRoomid());
JSONObject obj = new JSONObject();
for(int i=0;i<params.length;i++){
    if(params[i].equalsIgnoreCase("name"))  obj.element(params[i], room.getName());
    if(params[i].equalsIgnoreCase("nickname"))  obj.element(params[i], room.getCode());
    if(params[i].equalsIgnoreCase("roomtype")){
        RoomtypeBean roomtype = RoomtypeManager.getInstance().loadByPrimaryKey(room.getRoomtypeid());
        obj.element(params[i], roomtype.getCode());
    }
}
obj.element("reservationid", reserv.getReservationid().toString());
%>
<%=obj.toString()%>
