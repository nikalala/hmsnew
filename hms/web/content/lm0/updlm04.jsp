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
        RoomManager.getInstance().deleteByPrimaryKey(new Long(sid));
        ChangelogBean chlog = ChangelogManager.getInstance().createChangelogBean();
        chlog.setChangebyid(user.getPersonellid());
        chlog.setName("ROOM");
        chlog.setId(new Long(sid));
        chlog = ChangelogManager.getInstance().save(chlog);
    } else if(oper.equalsIgnoreCase("edit")){
        sid = request.getParameter("id");
        RoomBean amb = RoomManager.getInstance().loadByPrimaryKey(new Long(sid));
        
        String name=request.getParameter("name").trim();
        String nickname=request.getParameter("nickname").trim();
        
        int roomtypeid = Integer.parseInt(request.getParameter("roomtypeid"));
        int bedtypeid = Integer.parseInt(request.getParameter("bedtypeid"));
        
        int ord = Integer.parseInt(request.getParameter("ord"));
        String status=request.getParameter("status");
        String smoke=request.getParameter("smoke");

        amb.setNickname(nickname);
        amb.setName(name);
        amb.setOrd(ord);
        amb.setBedtypeid(bedtypeid);
        amb.setRoomtypeid(roomtypeid);
        
        if(smoke.equalsIgnoreCase("კი"))   amb.setSmoke(true);
        else                                amb.setSmoke(false);
        
        if(status.equalsIgnoreCase("აქტიური"))   amb.setStatus(true);
        else                                amb.setStatus(false);
        amb = RoomManager.getInstance().save(amb);
        
        ChangelogBean chlog = ChangelogManager.getInstance().createChangelogBean();
        chlog.setChangebyid(user.getPersonellid());
        chlog.setName("ROOM");
        chlog.setId(amb.getRoomid().longValue());
        chlog = ChangelogManager.getInstance().save(chlog);
    } else if(oper.equalsIgnoreCase("add")){
        RoomBean amb = RoomManager.getInstance().createRoomBean();
        
        String name=request.getParameter("name").trim();
        String nickname=request.getParameter("nickname").trim();
        
        int roomtypeid = Integer.parseInt(request.getParameter("roomtypeid"));
        int bedtypeid = Integer.parseInt(request.getParameter("bedtypeid"));
        
        int ord = Integer.parseInt(request.getParameter("ord"));
        String status=request.getParameter("status");
        String smoke=request.getParameter("smoke");

        amb.setNickname(nickname);
        amb.setName(name);
        amb.setOrd(ord);
        amb.setBedtypeid(bedtypeid);
        amb.setRoomtypeid(roomtypeid);
        
        if(smoke.equalsIgnoreCase("კი"))   amb.setSmoke(true);
        else                                amb.setSmoke(false);
        
        if(status.equalsIgnoreCase("აქტიური"))   amb.setStatus(true);
        else                                amb.setStatus(false);
        amb = RoomManager.getInstance().save(amb);
        sid = amb.getRoomid().toString();
        
        ChangelogBean chlog = ChangelogManager.getInstance().createChangelogBean();
        chlog.setChangebyid(user.getPersonellid());
        chlog.setName("ROOM");
        chlog.setId(amb.getRoomid().longValue());
        chlog = ChangelogManager.getInstance().save(chlog);
    }

    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1,\"id\":"+sid+"}";
}catch(Exception e){Manager.getInstance().endTransaction(false);e.printStackTrace();msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}"; e.printStackTrace();}
%>
<%=msg%>
