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
        BedtypeManager.getInstance().deleteByPrimaryKey(new Integer(sid));
        ChangelogBean chlog = ChangelogManager.getInstance().createChangelogBean();
        chlog.setChangebyid(user.getPersonellid());
        chlog.setName("BEDTYPE");
        chlog.setId(new Long(sid));
        chlog = ChangelogManager.getInstance().save(chlog);
    } else if(oper.equalsIgnoreCase("edit")){
        sid = request.getParameter("id");
        BedtypeBean amb = BedtypeManager.getInstance().loadByPrimaryKey(new Integer(sid));
        
        String name=request.getParameter("name").trim();
        String nickname=request.getParameter("nickname").trim();

        amb.setName(name);
        amb.setNickname(nickname);
        amb = BedtypeManager.getInstance().save(amb);
        
        ChangelogBean chlog = ChangelogManager.getInstance().createChangelogBean();
        chlog.setChangebyid(user.getPersonellid());
        chlog.setName("BEDTYPE");
        chlog.setId(amb.getBedtypeid().longValue());
        chlog = ChangelogManager.getInstance().save(chlog);
    } else if(oper.equalsIgnoreCase("add")){
        BedtypeBean amb = BedtypeManager.getInstance().createBedtypeBean();
        
        String name=request.getParameter("name").trim();
        String nickname=request.getParameter("nickname").trim();

        amb.setName(name);
        amb.setNickname(nickname);
        amb = BedtypeManager.getInstance().save(amb);
        sid = amb.getBedtypeid().toString();
        
        ChangelogBean chlog = ChangelogManager.getInstance().createChangelogBean();
        chlog.setChangebyid(user.getPersonellid());
        chlog.setName("BEDTYPE");
        chlog.setId(amb.getBedtypeid().longValue());
        chlog = ChangelogManager.getInstance().save(chlog);
    }

    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1,\"id\":"+sid+"}";
}catch(Exception e){Manager.getInstance().endTransaction(false);e.printStackTrace();msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}"; e.printStackTrace();}
%>
<%=msg%>
