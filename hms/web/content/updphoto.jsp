<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet" %>
<%
SimpleDateFormat sdt0 = new SimpleDateFormat("yyyy-MM-dd");
SimpleDateFormat sdt1 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
String msg = "";
//String basedir = session.getServletContext().getRealPath("/");
String sid = "0";
String oper = request.getParameter("oper");
Manager.getInstance().beginTransaction();
try{
    if(oper.equalsIgnoreCase("del")){
        sid = request.getParameter("id");
        PhotoBean ph = PhotoManager.getInstance().loadByPrimaryKey(new Integer(sid));
        try{
            PhotoManager.getInstance().deleteByPrimaryKey(ph.getPhotoid());
        }catch(Exception e)
        {
            e.printStackTrace();
            throw new Exception("წაშლა შეუძლებელია!");
        }
        File fl = new File(basedir+"/gallery/"+ph.getName()+".jpg");
        fl.delete();
        fl = new File(basedir+"/gallery/thumbs/t"+ph.getName()+".jpg");
        fl.delete();
    } else if(oper.equalsIgnoreCase("edit")){
        sid = request.getParameter("id");
        PhotoBean ph = PhotoManager.getInstance().loadByPrimaryKey(new Integer(sid));
        String name = request.getParameter("name").trim();
        ph.setName(name);
        ph = PhotoManager.getInstance().save(ph);
    }
    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1,\"id\":"+sid+"}";
}catch(Exception e){Manager.getInstance().endTransaction(false);e.printStackTrace();msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}"; e.printStackTrace();}
%>
<%=msg%>
