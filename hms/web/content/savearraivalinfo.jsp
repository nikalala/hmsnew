<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%

for(Enumeration e=request.getParameterNames();e.hasMoreElements();){
    String name = (String)e.nextElement();
    String val = request.getParameter(name);
    System.out.println(name + " = " + val);
}

String msg = "";
Manager.getInstance().beginTransaction();
try{
    long id = 0;
    ReservationBean reserv = ReservationManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("reservationid")));
    Date arrivaldate = dtlong.parse(request.getParameter("arrivaldate").trim()+" "+request.getParameter("arraivaltime").trim());
    Date departuredate = dtlong.parse(request.getParameter("departuredate").trim()+" "+request.getParameter("departuretime").trim());
    
    reserv.setArraivaldate(arrivaldate.getTime());
    reserv.setDeparturedate(departuredate.getTime());
    
    System.out.println(departuredate);
    
    reserv = ReservationManager.getInstance().save(reserv);
    
    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1,\"id\":"+id+"}";
}catch(Exception e){
    e.printStackTrace();
    Manager.getInstance().endTransaction(false);
    msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}";
}
    
%>
<%=msg%>
