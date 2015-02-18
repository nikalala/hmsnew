<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
String msg = "";

Manager.getInstance().beginTransaction();
try{
    FolioBean folio = FolioManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("fid")));
    long cid = Long.parseLong(request.getParameter("id"));
    
    int act = Integer.parseInt(request.getParameter("act"));
    
    FolioBean folio1 = FolioManager.getInstance().createFolioBean();
    folio1.setContragentid(folio.getContragentid());
    folio1.setGuestid(folio.getGuestid());
    folio1.setReservationroomid(folio.getReservationroomid());
    folio1.setStatus(folio.getStatus());
    folio1.setNum(folio.getNum());
    folio1.setRegbyid(user.getPersonnelid());
    folio1 = FolioManager.getInstance().save(folio1);
    folio1.setNum(folio1.getFolioid().toString());
    folio1 = FolioManager.getInstance().save(folio1);
    
    if(act == 1)    folio.setContragentid(cid);
    else            folio.setGuestid(cid);
    folio = FolioManager.getInstance().save(folio);
    
    
    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1,\"id\":"+folio.getFolioid()+"}";
}catch(Exception e){
    e.printStackTrace();
    Manager.getInstance().endTransaction(false);
    msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}";
}
%>
<%=msg%>