<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%


String msg = "";
Manager.getInstance().beginTransaction();
try{
    long id = 0;
    FolioitemBean folioitem = FolioitemManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("folioitemid")));
    double amount = Double.parseDouble(request.getParameter("editfolioitem_amount"));
    String note = request.getParameter("editfolioitem_note");
    
    folioitem.setAmount(amount);
    folioitem.setNote(note);
    folioitem.setDone(true);
    folioitem = FolioitemManager.getInstance().save(folioitem);
    id = folioitem.getFolioitemid().longValue();
    
    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1,\"id\":"+id+"}";
}catch(Exception e){
    e.printStackTrace();
    Manager.getInstance().endTransaction(false);
    msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}";
}
    
%>
<%=msg%>
