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
        RoomtypeamenityManager.getInstance().deleteByRoomtypeid(new Integer(sid));
        RoomtypeManager.getInstance().deleteByPrimaryKey(new Integer(sid));
        ChangelogBean chlog = ChangelogManager.getInstance().createChangelogBean();
        chlog.setChangebyid(user.getPersonellid());
        chlog.setName("ROOMTYPE");
        chlog.setId(new Long(sid));
        chlog = ChangelogManager.getInstance().save(chlog);
    } else if(oper.equalsIgnoreCase("edit")){
        sid = request.getParameter("id");
        RoomtypeBean amb = RoomtypeManager.getInstance().loadByPrimaryKey(new Integer(sid));
        
        
        String nickname=request.getParameter("nickname").trim();
        String name=request.getParameter("name").trim();
        int baseadalt = Integer.parseInt(request.getParameter("baseadalt"));
        
        int basechild = Integer.parseInt(request.getParameter("basechild"));
        int maxadalt = Integer.parseInt(request.getParameter("maxadalt"));
        int maxchild = Integer.parseInt(request.getParameter("maxchild"));
        
        String color=request.getParameter("color").trim();
        
        int ord = Integer.parseInt(request.getParameter("ord"));
        
        String web=request.getParameter("web");
        
        String[] amenities = request.getParameter("amenities").split(",");

        amb.setBaseadalt(baseadalt);
        amb.setBasechild(basechild);
        amb.setColor(color);
        amb.setMaxadalt(maxadalt);
        amb.setMaxchild(maxchild);
        amb.setNickname(nickname);
        amb.setName(name);
        amb.setOrd(ord);
        if(web.equalsIgnoreCase("კი"))   amb.setWeb(true);
        else                                amb.setWeb(false);
        
        amb = RoomtypeManager.getInstance().save(amb);

        RoomtypeamenityManager.getInstance().deleteByRoomtypeid(amb.getRoomtypeid());
        RoomtypeamenityBean[] rtams = new RoomtypeamenityBean[amenities.length];
        for(int i=0;i<rtams.length;i++){
            rtams[i] = RoomtypeamenityManager.getInstance().createRoomtypeamenityBean();
            rtams[i].setAmenityid(new Integer(amenities[i]));
            rtams[i].setRoomtypeid(amb.getRoomtypeid());
        }
        rtams = RoomtypeamenityManager.getInstance().save(rtams);
        
        ChangelogBean chlog = ChangelogManager.getInstance().createChangelogBean();
        chlog.setChangebyid(user.getPersonellid());
        chlog.setName("ROOMTYPE");
        chlog.setId(amb.getRoomtypeid().longValue());
        chlog = ChangelogManager.getInstance().save(chlog);
    } else if(oper.equalsIgnoreCase("add")){
        RoomtypeBean amb = RoomtypeManager.getInstance().createRoomtypeBean();
        
        String nickname=request.getParameter("nickname").trim();
        String name=request.getParameter("name").trim();
        int baseadalt = Integer.parseInt(request.getParameter("baseadalt"));
        
        int basechild = Integer.parseInt(request.getParameter("basechild"));
        int maxadalt = Integer.parseInt(request.getParameter("maxadalt"));
        int maxchild = Integer.parseInt(request.getParameter("maxchild"));
        
        String color=request.getParameter("color").trim();
        
        int ord = Integer.parseInt(request.getParameter("ord"));
        
        String web=request.getParameter("web");
        
        String[] amenities = request.getParameter("amenities").split(",");

        amb.setBaseadalt(baseadalt);
        amb.setBasechild(basechild);
        amb.setColor(color);
        amb.setMaxadalt(maxadalt);
        amb.setMaxchild(maxchild);
        amb.setNickname(nickname);
        amb.setName(name);
        amb.setOrd(ord);
        if(web.equalsIgnoreCase("კი"))   amb.setWeb(true);
        else                             amb.setWeb(false);
        
        amb = RoomtypeManager.getInstance().save(amb);
        sid = amb.getRoomtypeid().toString();
        
        
        RoomtypeamenityBean[] rtams = new RoomtypeamenityBean[amenities.length];
        for(int i=0;i<rtams.length;i++){
            rtams[i] = RoomtypeamenityManager.getInstance().createRoomtypeamenityBean();
            rtams[i].setAmenityid(new Integer(amenities[i]));
            rtams[i].setRoomtypeid(amb.getRoomtypeid());
        }
        rtams = RoomtypeamenityManager.getInstance().save(rtams);
        
        ChangelogBean chlog = ChangelogManager.getInstance().createChangelogBean();
        chlog.setChangebyid(user.getPersonellid());
        chlog.setName("ROOMTYPE");
        chlog.setId(amb.getRoomtypeid().longValue());
        chlog = ChangelogManager.getInstance().save(chlog);
    }

    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1,\"id\":"+sid+"}";
}catch(Exception e){Manager.getInstance().endTransaction(false);e.printStackTrace();msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}"; e.printStackTrace();}
%>
<%=msg%>
