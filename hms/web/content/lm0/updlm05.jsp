<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%
SimpleDateFormat sdt0 = new SimpleDateFormat("yyyy-MM-dd");
SimpleDateFormat sdt1 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
String msg = "";

String sid = "0";
String oper = request.getParameter("oper");
Manager.getInstance().beginTransaction();
try{
    if(oper.equalsIgnoreCase("del")){
        sid = request.getParameter("id");
        RoomstatusManager.getInstance().deleteByPrimaryKey(new Integer(sid));
    } else if(oper.equalsIgnoreCase("edit")){
        sid = request.getParameter("id");
        RoomstatusBean amb = RoomstatusManager.getInstance().loadByPrimaryKey(new Integer(sid));
        
        String name=request.getParameter("name").trim();
        String color=request.getParameter("color").trim();
        
        amb.setName(name);
        amb.setColor(color);
        amb = RoomstatusManager.getInstance().save(amb);
        
    } else if(oper.equalsIgnoreCase("add")){
        RoomstatusBean amb = RoomstatusManager.getInstance().createRoomstatusBean();
        
        String name=request.getParameter("name").trim();
        String color=request.getParameter("color").trim();
        
        amb.setName(name);
        amb.setColor(color);
        amb = RoomstatusManager.getInstance().save(amb);
        sid = amb.getRoomstatusid().toString();
        
    }

    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1,\"id\":"+sid+"}";
}catch(Exception e){Manager.getInstance().endTransaction(false);e.printStackTrace();msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}"; e.printStackTrace();}
%>
<%=msg%>
