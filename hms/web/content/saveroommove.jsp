<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
String msg = "";
Manager.getInstance().beginTransaction();
try{
    long id = 0;
    ReservationBean reserv = ReservationManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("reservationid")));
    long newroomid = Long.parseLong(request.getParameter("roomid"));
    long oldroomid = reserv.getRoomid().longValue();
System.out.println("newroomid = "+newroomid);
System.out.println("oldroomid = "+oldroomid);
    reserv.setRoomid(newroomid);
    reserv = ReservationManager.getInstance().save(reserv);
    
    int oldstatus = (int)getSum("select getroomstatus("+oldroomid+",'"+dtlongs.format(new Date())+"')");
    
    RmstatusBean rms = RmstatusManager.getInstance().createRmstatusBean();
    rms.setRoomid(oldroomid);
    rms.setStatustypeid(1);
    rms = RmstatusManager.getInstance().save(rms);
    
    rms = RmstatusManager.getInstance().createRmstatusBean();
    rms.setRoomid(newroomid);
    rms.setStatustypeid(oldstatus);
    rms.setStatustypeid(5);
    rms = RmstatusManager.getInstance().save(rms);
    
    //if(id == 0) throw new Exception("შეცდომა");
    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1,\"id\":"+rms.getStatustypeid()+"}";
}catch(Exception e){
    e.printStackTrace();
    Manager.getInstance().endTransaction(false);
    msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}";
}
    
%>
<%=msg%>
