<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
String msg = "";
ReservationroomBean rroom = ReservationroomManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("rid")));
Manager.getInstance().beginTransaction();
try{
    
    double bal = getBalance(rroom.getReservationroomid());
    if(bal > 0)
        throw new Exception("გაასწორეთ ბალანსი");
    
    RoomBean room = RoomManager.getInstance().loadByPrimaryKey(rroom.getRoomid());
    RoomstBean rst = RoomstManager.getInstance().createRoomstBean();
    rst.setSt(4);
    rst.setRoomid(rroom.getRoomid());
    rst.setStatusdate(lclosedate);
    rst.setRegbyid(user.getPersonnelid());
    rst = RoomstManager.getInstance().save(rst);
    
    ReservationBean res = ReservationManager.getInstance().loadByPrimaryKey(rroom.getReservationid());
    res.setStatus(-1);
    res = ReservationManager.getInstance().save(res);
    
    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1}";
}catch(Exception e){Manager.getInstance().endTransaction(false);e.printStackTrace();msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}"; e.printStackTrace();}
%>
<%=msg%>
