<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
String msg = "";
Manager.getInstance().beginTransaction();
try{
    long id = 0;
    Calendar cal = Calendar.getInstance();
    cal.setTime(dt.parse(request.getParameter("amenddeparturedate")));
    ReservationBean reserv = ReservationManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("reservationid")));
    Calendar cal1 = Calendar.getInstance();
    cal1.setTime(reserv.getDeparturedate());
    cal.set(Calendar.HOUR_OF_DAY, cal1.get(Calendar.HOUR_OF_DAY));
    cal.set(Calendar.MINUTE, cal1.get(Calendar.MINUTE));
    reserv.setDeparturedate(cal.getTimeInMillis());
    reserv = ReservationManager.getInstance().save(reserv);
    
    //if(id == 0) throw new Exception("შეცდომა");
    
    folio fl = new folio();
    fl.reSetFolio(reserv, user);
    
    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1,\"id\":"+reserv.getReservationid()+"}";
}catch(Exception e){
    e.printStackTrace();
    Manager.getInstance().endTransaction(false);
    msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}";
}
    
%>
<%=msg%>
