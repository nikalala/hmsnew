<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
String msg = "";
Manager.getInstance().beginTransaction();
try{
    ReservationroomBean reserv = ReservationroomManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("rid")));
    ReservationBean res = ReservationManager.getInstance().loadByPrimaryKey(reserv.getReservationid());
    int reasonid = Integer.parseInt(request.getParameter("cancel_reasonid"));
    if(reasonid == 0)   throw new Exception("აირჩიეთ გაუქმების მიზეზი");
    double cancellationfee = 0;
    try{
        cancellationfee = Double.parseDouble(request.getParameter("cancel_cancellationfee").trim());
    }catch(Exception e){
        if(request.getParameter("cancel_cancellationfee").trim().length() > 0)
            throw new Exception("არასწორი გაუქმების თანხა");
    }
    res.setStatus(1);
    res = ReservationManager.getInstance().save(res);
    ReservationreasonBean rs = ReservationreasonManager.getInstance().createReservationreasonBean();
    rs.setReasonid(reasonid);
    rs.setReservationid(res.getReservationid());
    rs = ReservationreasonManager.getInstance().save(rs);

    FolioBean[] folio = FolioManager.getInstance().loadByWhere("where reservationroomid = "+reserv.getReservationroomid());
    
    if(folio.length > 0){
        FolioitemBean fb = FolioitemManager.getInstance().createFolioitemBean();
        fb.setFolioid(folio[0].getFolioid());
        fb.setItemdate(res.getArraivaldate());
        fb.setRegbyid(user.getPersonnelid());
        fb.setAmount(cancellationfee);
        fb.setDone(false);
        fb.setParticular(1);
        fb = FolioitemManager.getInstance().save(fb);
    }
            
    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1,\"id\":"+reserv.getReservationroomid()+"}";
}catch(Exception e){
    e.printStackTrace();
    Manager.getInstance().endTransaction(false);
    msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}";
}
%>
<%=msg%>