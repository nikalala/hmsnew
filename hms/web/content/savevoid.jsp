<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
String msg = "";
Manager.getInstance().beginTransaction();
try{
    ReservationroomBean reserv = ReservationroomManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("rid")));
    ReservationBean res = ReservationManager.getInstance().loadByPrimaryKey(reserv.getReservationid());
    int reasonid = Integer.parseInt(request.getParameter("reasonid"));
    if(reasonid == 0)   throw new Exception("აირჩიეთ განულების მიზეზი");
    res.setStatus(3);
    res = ReservationManager.getInstance().save(res);
    ReservationreasonBean rs = ReservationreasonManager.getInstance().createReservationreasonBean();
    rs.setReasonid(reasonid);
    rs.setReservationid(res.getReservationid());
    rs = ReservationreasonManager.getInstance().save(rs);

    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1,\"id\":"+reserv.getReservationroomid()+"}";
}catch(Exception e){
    e.printStackTrace();
    Manager.getInstance().endTransaction(false);
    msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}";
}
%>
<%=msg%>