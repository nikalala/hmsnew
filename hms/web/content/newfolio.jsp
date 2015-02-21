<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
String msg = "";
int tp = Integer.parseInt(request.getParameter("tp"));
Manager.getInstance().beginTransaction();
try{
    FolioBean folio = FolioManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("fid")));
    long cid = Long.parseLong(request.getParameter("id"));
    
    int act = Integer.parseInt(request.getParameter("act"));
    
    if(tp == 0){
        FolioBean folio1 = FolioManager.getInstance().createFolioBean();
        if(act == 1)    folio1.setContragentid(cid);
        else            folio1.setGuestid(cid);
        folio1.setReservationroomid(folio.getReservationroomid());
        folio1.setStatus(folio.getStatus());
        folio1.setNum(folio.getNum());
        folio1.setRegbyid(user.getPersonnelid());
        folio1 = FolioManager.getInstance().save(folio1);
        folio1.setNum(folio1.getFolioid().toString());
        folio1 = FolioManager.getInstance().save(folio1);
    } else if(tp == 1){
        folio.setContragentid(null);
        folio.setGuestid(null);
        if(act == 1)    folio.setContragentid(cid);
        else            folio.setGuestid(cid);
        folio = FolioManager.getInstance().save(folio);
    }
    
    
    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1,\"id\":"+folio.getFolioid()+"}";
}catch(Exception e){
    e.printStackTrace();
    Manager.getInstance().endTransaction(false);
    msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}";
}
%>
<%=msg%>