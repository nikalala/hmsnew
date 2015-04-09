<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
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
        MarketcodeBean ocl = MarketcodeManager.getInstance().loadByPrimaryKey(new Integer(sid));
        try{
            MarketcodeManager.getInstance().deleteByPrimaryKey(ocl.getMarketcodeid());
        }catch(Exception e)
        {
            e.printStackTrace();
            throw new Exception("ბაზრის კოდის წაშლა შეუძლებელია!");
        }
    } else if(oper.equalsIgnoreCase("edit")){
        sid = request.getParameter("id");
        MarketcodeBean ocl = MarketcodeManager.getInstance().loadByPrimaryKey(new Integer(sid));
        
        String name=request.getParameter("name").trim();
        String status=request.getParameter("status");
        
        if(name.length() == 0)  throw new Exception("დასახელება ცარიელია!");
        if(MarketcodeManager.getInstance().countWhere("where marketcodeid != "+sid+" and upper(name) = '"+name.toUpperCase().replaceAll("'", "''") +"'") > 0)
            throw new Exception("ასეთი დასახელების ბაზრის კოდი უკვე არსებობს სისტემაში: "+name);
        
        ocl.setName(name);
        if(status.equalsIgnoreCase("აქტიური"))   ocl.setStatus(true);
        else                                ocl.setStatus(false);
       
        
        ocl = MarketcodeManager.getInstance().save(ocl);
        
    } else if(oper.equalsIgnoreCase("add")){
        
        MarketcodeBean ocl = MarketcodeManager.getInstance().createMarketcodeBean();
        
        String name=request.getParameter("name").trim();
        String status=request.getParameter("status");
        
        if(name.length() == 0)  throw new Exception("დასახელება ცარიელია!");
        if(MarketcodeManager.getInstance().countWhere("where marketcodeid != "+sid+" and upper(name) = '"+name.toUpperCase().replaceAll("'", "''") +"'") > 0)
            throw new Exception("ასეთი დასახელების ბაზრის კოდი უკვე არსებობს სისტემაში: "+name);
        
        ocl.setName(name);
        if(status.equalsIgnoreCase("აქტიური"))   ocl.setStatus(true);
        else                                ocl.setStatus(false);
       
        
        ocl = MarketcodeManager.getInstance().save(ocl);
        sid = ocl.getMarketcodeid().toString();
    }

    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1,\"id\":"+sid+"}";
}catch(Exception e){Manager.getInstance().endTransaction(false);e.printStackTrace();msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}"; e.printStackTrace();}
%>
<%=msg%>
