<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet" %>
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
        try{
            UnittypeManager.getInstance().deleteByPrimaryKey(new Integer(sid));
        }catch(Exception e)
        {
            e.printStackTrace();
            throw new Exception("ერთეულის წაშლა შეუძლებელია!");
        }
    } else if(oper.equalsIgnoreCase("edit")){
        sid = request.getParameter("id");
        String name = (request.getParameter("name")).trim();
        String code = (request.getParameter("code")).trim();
        
        if(UnittypeManager.getInstance().countWhere("where unittypeid != "+sid+" and upper(name) = '"+name.toUpperCase().replaceAll("'", "''")+"'") > 0)
            throw new Exception("ასეთი დასახელება უკვე არსებობს");
        if(UnittypeManager.getInstance().countWhere("where unittypeid != "+sid+" and upper(code) = '"+code.toUpperCase().replaceAll("'", "''")+"'") > 0)
            throw new Exception("ასეთი კოდი უკვე არსებობს");
        
        UnittypeBean br = UnittypeManager.getInstance().loadByPrimaryKey(new Integer(sid));
        br.setName(name);
        br.setCode(code);
        br = UnittypeManager.getInstance().save(br);
        
    } else if(oper.equalsIgnoreCase("add")){
        String name = (request.getParameter("name")).trim();
        String code = (request.getParameter("code")).trim();
        
        if(UnittypeManager.getInstance().countWhere("where upper(name) = '"+name.toUpperCase().replaceAll("'", "''")+"'") > 0)
            throw new Exception("ასეთი დასახელება უკვე არსებობს");
        if(UnittypeManager.getInstance().countWhere("where upper(code) = '"+code.toUpperCase().replaceAll("'", "''")+"'") > 0)
            throw new Exception("ასეთი კოდი უკვე არსებობს");
        
        UnittypeBean br = UnittypeManager.getInstance().createUnittypeBean();
        br.setName(name);
        br.setCode(code);
        br = UnittypeManager.getInstance().save(br);
        sid = br.getUnittypeid().toString();
    }

    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1,\"id\":"+sid+"}";
}catch(Exception e){Manager.getInstance().endTransaction(false);e.printStackTrace();msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}"; e.printStackTrace();}
%>
<%=msg%>
