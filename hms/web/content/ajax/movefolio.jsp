<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%
/*
for(Enumeration e=request.getParameterNames();e.hasMoreElements();){
    String name = (String)e.nextElement();
    String val = request.getParameter(name);
    System.out.println(name + " = " + val);
}
*/
JSONObject ob = new JSONObject();
Manager.getInstance().beginTransaction();
try{
    String froms = request.getParameter("ids");
    String fid1 = request.getParameter("fromfolio");
    String fid2 = request.getParameter("tofolio");
    String gid = request.getParameter("gid");
    
    long rid = 0;
    FolioitemBean[] fols = FolioitemManager.getInstance().loadByWhere("where folioid = "+fid1+" and itemdate in (select itemdate from folioitem where folioitemid in ("+froms+"))");
    if(fid2.equals("0")){
        FolioBean fol = FolioManager.getInstance().createFolioBean();
        fol.setGuestid(new Long(gid));
        fol.setRegbyid(user.getPersonnelid());
        fol.setReservationroomid(fols[0].getReservationroomid());
        fol.setStatus(0);
        fol.setNum("");
        fol = FolioManager.getInstance().save(fol);
        fol.setNum(fol.getFolioid().toString());
        fol = FolioManager.getInstance().save(fol);
        rid = fols[0].getReservationroomid();
        fid2 = fol.getFolioid().toString();
    } else {
        FolioBean fol = FolioManager.getInstance().loadByPrimaryKey(new Long(fid2));
        rid = fol.getReservationroomid();
    }
    for(int i=0;i<fols.length;i++){
        fols[i].setFolioid(new Long(fid2));
        fols[i].setReservationroomid(rid);
    }
    fols = FolioitemManager.getInstance().save(fols);
    
    
    Manager.getInstance().endTransaction(true);
    ob.put("result", 1);
}catch(Exception e){
    e.printStackTrace();
    Manager.getInstance().endTransaction(false);
    ob.put("result", 0);
    ob.put("error",e.getMessage());
}

%>
<%=ob.toString()%>