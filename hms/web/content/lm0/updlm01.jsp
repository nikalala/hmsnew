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
        AmenityManager.getInstance().deleteByPrimaryKey(new Integer(sid));
        ChangelogBean chlog = ChangelogManager.getInstance().createChangelogBean();
        chlog.setChangebyid(user.getPersonellid());
        chlog.setName("AMENITY");
        chlog.setId(new Long(sid));
        chlog = ChangelogManager.getInstance().save(chlog);
    } else if(oper.equalsIgnoreCase("edit")){
        sid = request.getParameter("id");
        AmenityBean amb = AmenityManager.getInstance().loadByPrimaryKey(new Integer(sid));
        
        String name=request.getParameter("name").trim();
        int type = Integer.parseInt(request.getParameter("type"));
        int ord = Integer.parseInt(request.getParameter("ord"));
        String status=request.getParameter("status");

        amb.setName(name);
        amb.setOrd(ord);
        amb.setType(type);
        if(status.equalsIgnoreCase("აქტიური"))   amb.setStatus(true);
        else                                amb.setStatus(false);
        amb = AmenityManager.getInstance().save(amb);
        
        ChangelogBean chlog = ChangelogManager.getInstance().createChangelogBean();
        chlog.setChangebyid(user.getPersonellid());
        chlog.setName("AMENITY");
        chlog.setId(amb.getAmenityid().longValue());
        chlog = ChangelogManager.getInstance().save(chlog);
    } else if(oper.equalsIgnoreCase("add")){
        AmenityBean amb = AmenityManager.getInstance().createAmenityBean();
        
        String name=request.getParameter("name").trim();
        int type = Integer.parseInt(request.getParameter("type"));
        int ord = Integer.parseInt(request.getParameter("ord"));
        String status=request.getParameter("status");

        amb.setName(name);
        amb.setOrd(ord);
        amb.setType(type);
        if(status.equalsIgnoreCase("აქტიური"))   amb.setStatus(true);
        else                                amb.setStatus(false);
        
        amb = AmenityManager.getInstance().save(amb);
        sid = amb.getAmenityid().toString();
        
        ChangelogBean chlog = ChangelogManager.getInstance().createChangelogBean();
        chlog.setChangebyid(user.getPersonellid());
        chlog.setName("AMENITY");
        chlog.setId(amb.getAmenityid().longValue());
        chlog = ChangelogManager.getInstance().save(chlog);
    }

    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1,\"id\":"+sid+"}";
}catch(Exception e){Manager.getInstance().endTransaction(false);e.printStackTrace();msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}"; e.printStackTrace();}
%>
<%=msg%>
