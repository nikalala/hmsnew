<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet" %>
<%
String msg = "";

String sid = "0";
String oper = request.getParameter("oper");
Manager.getInstance().beginTransaction();
try{
    if(oper.equalsIgnoreCase("del")){
        sid = request.getParameter("id");
        try{
            HallidaytypeManager.getInstance().deleteByPrimaryKey(new Integer(sid));
        }catch(Exception e)
        {
            e.printStackTrace();
            throw new Exception("წაშლა შეუძლებელია!");
        }
    } else if(oper.equalsIgnoreCase("chcolor")){
        sid = request.getParameter("id");
        
        String color = "#"+(request.getParameter("color")).trim();
        
        HallidaytypeBean br = HallidaytypeManager.getInstance().loadByPrimaryKey(new Integer(sid));
        br.setColor(color);
        br = HallidaytypeManager.getInstance().save(br);
        
    } else if(oper.equalsIgnoreCase("edit")){
        sid = request.getParameter("id");
        String name = request.getParameter("name");
        double perc = Double.parseDouble(request.getParameter("perc"));
        
        String sqlcheck = "where hallidaytypeid != "+sid+" and upper(name) = '"+name.replaceAll("'", "''").toUpperCase() +"'";
        if(HallidaytypeManager.getInstance().countWhere(sqlcheck) > 0)
            throw new Exception("დასახელება უკვე გამოყენებულია!");
        
        HallidaytypeBean br = HallidaytypeManager.getInstance().loadByPrimaryKey(new Integer(sid));
        br.setName(name);
        br.setPerc(perc);
        br = HallidaytypeManager.getInstance().save(br);
        
    } else if(oper.equalsIgnoreCase("add")){
        String name = request.getParameter("name");
        double perc = Double.parseDouble(request.getParameter("perc"));
        
        String sqlcheck = "where upper(name) = '"+name.replaceAll("'", "''").toUpperCase() +"'";
        if(HallidaytypeManager.getInstance().countWhere(sqlcheck) > 0)
            throw new Exception("დასახელება უკვე გამოყენებულია!");
        
        HallidaytypeBean br = HallidaytypeManager.getInstance().createHallidaytypeBean();
        br.setName(name);
        br.setPerc(perc);
        br = HallidaytypeManager.getInstance().save(br);
        sid = br.getHallidaytypeid().toString();
    }

    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1,\"id\":"+sid+"}";
}catch(Exception e){Manager.getInstance().endTransaction(false);e.printStackTrace();msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}"; e.printStackTrace();}
%>
<%=msg%>
