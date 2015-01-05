<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
String msg = "";
Manager.getInstance().beginTransaction();
try{
    long id = 0;
    ReservationroomBean reserv = ReservationroomManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("rrid")));
    int newroomid = Integer.parseInt(request.getParameter("rid"));
    int oldroomid = reserv.getRoomid().intValue();
System.out.println("renewRoomPricech = "+request.getParameter("renewRoomPricech"));
//System.out.println("oldroomid = "+oldroomid);
    reserv.setRoomid(newroomid);
    reserv = ReservationroomManager.getInstance().save(reserv);
    
    int oldstatus = (int)getSum("select getroomstatus("+oldroomid+",'"+dtlongs.format(new Date())+"')");
    
    int status = getRoomStatus(rclosedate, oldroomid);
    
    RoomstBean rms = RoomstManager.getInstance().createRoomstBean();
    rms.setRoomid(oldroomid);
    rms.setSt(8);
    rms.setStatusdate(lclosedate);
    rms.setRegbyid(user.getPersonnelid());
    rms = RoomstManager.getInstance().save(rms);
    
    rms = RoomstManager.getInstance().createRoomstBean();
    rms.setRoomid(newroomid);
    rms.setSt(oldstatus);
    rms.setSt(status);
    rms.setStatusdate(lclosedate);
    rms.setRegbyid(user.getPersonnelid());
    rms = RoomstManager.getInstance().save(rms);
    
    //if(id == 0) throw new Exception("შეცდომა");
    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1,\"id\":"+rms.getSt()+"}";
}catch(Exception e){
    e.printStackTrace();
    Manager.getInstance().endTransaction(false);
    msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}";
}
    
%>
<%=msg%>
