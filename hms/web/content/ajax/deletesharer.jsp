<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%
JSONObject js = new JSONObject();
try{
    ReservationroomBean rroom = ReservationroomManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("id")));
    GuestBean guest = GuestManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("gid")));
    
    SharerManager.getInstance().deleteByWhere("where guestid = "+guest.getGuestid()+" and reservationroomid = "+rroom.getReservationroomid());
    //FolioManager.getInstance().deleteByWhere("where guestid = "+guest.getGuestid()+" and reservationroomid = "+rroom.getReservationroomid());
    
    js.put("result",1);
}catch(Exception e){
    e.printStackTrace();
    js.put("result",0);
    js.put("error",e.getMessage());
}
%>