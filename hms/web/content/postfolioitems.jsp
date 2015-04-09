<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
String msg = "";

Manager.getInstance().beginTransaction();
try{
    String ids = request.getParameter("ids").replaceAll("'", "");
    FolioitemBean[] items = FolioitemManager.getInstance().loadByWhere("where folioitemid in ("+ids+")");
    for(int i=0;i<items.length;i++){
        items[i].setDone(true);
    }
    items = FolioitemManager.getInstance().save(items);
    
    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1}";
}catch(Exception e){Manager.getInstance().endTransaction(false);e.printStackTrace();msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}"; e.printStackTrace();}
%>
<%=msg%>
