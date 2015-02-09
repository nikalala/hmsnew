<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
String msg = "";
String rid = request.getParameter("rid");
if(rid == null)
    rid = request.getParameter("reservationid");
ReservationroomBean rroom = ReservationroomManager.getInstance().loadByPrimaryKey(new Long(rid));
Manager.getInstance().beginTransaction();
try{
    
    double bal = getBalance(rroom.getReservationroomid());
    if(bal > 0)
        throw new Exception("გაასწორეთ ბალანსი");
/*    
    RoomBean room = RoomManager.getInstance().loadByPrimaryKey(rroom.getRoomid());
    RoomstBean rst = RoomstManager.getInstance().createRoomstBean();
    rst.setSt(4);
    rst.setRoomid(rroom.getRoomid());
    rst.setStatusdate(lclosedate);
    rst.setRegbyid(user.getPersonnelid());
    rst = RoomstManager.getInstance().save(rst);
*/    
    ReservationBean res = ReservationManager.getInstance().loadByPrimaryKey(rroom.getReservationid());
    res.setStatus(4);
    res = ReservationManager.getInstance().save(res);
    
    Manager.getInstance().endTransaction(true);
    msg = "ოპერაცია შესრულდა წარმატებით";
}catch(Exception e){Manager.getInstance().endTransaction(false);e.printStackTrace();msg = e.getMessage(); e.printStackTrace();}
%>
<%=msg%>
