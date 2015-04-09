<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
String msg = "";
Manager.getInstance().beginTransaction();
try{
    String ids = request.getParameter("ids");
    FolioitemBean[] folioitems = FolioitemManager.getInstance().loadByWhere("where folioitemid in ("+ids+")");
    int reasonid = 0;
    if(request.getParameter("reasonid") != null && !request.getParameter("reasonid").equalsIgnoreCase("undefined"))
        reasonid = Integer.parseInt(request.getParameter("reasonid"));
    String reasonname = request.getParameter("reasonname");
    if(reasonname == null)  reasonname = "";
    
    if(reasonid == 0 && reasonname.length() == 0)
        throw new Exception("აირჩიეთ მიზეზი ან დაამატეთ ახალი");
    
    
    
    if(reasonid == 0){
        ReasonBean reason = ReasonManager.getInstance().createReasonBean();
        reason.setActive(true);
        reason.setDeleted(false);
        reason.setName(reasonname);
        reason.setReasoncategory(4);
        reason.setRegbyid(user.getPersonnelid());
        reason = ReasonManager.getInstance().save(reason);
        reasonid = reason.getReasonid().intValue();
    } else {
        ReasonBean reason = ReasonManager.getInstance().loadByPrimaryKey(reasonid);
        reasonname = reason.getName();
    }
    
    for(int i=0;i<folioitems.length;i++){
        folioitems[i].setZvoid(true);
        FoliologBean log = FoliologManager.getInstance().createFoliologBean();
        log.setContent(reasonname);
        log.setLogname("გაუქმება");
        log.setFolioitemid(folioitems[i].getFolioitemid());
        log.setRegbyid(user.getPersonnelid());
        log = FoliologManager.getInstance().save(log);
        //folioitems[i].setNote(reasonname);
    }
    folioitems = FolioitemManager.getInstance().save(folioitems);
    
    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1,\"id\":"+ids+"}";
}catch(Exception e){
    e.printStackTrace();
    Manager.getInstance().endTransaction(false);
    msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}";
}
    
%>
<%=msg%>
