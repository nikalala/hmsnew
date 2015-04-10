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
        VipstatusBean ocl = VipstatusManager.getInstance().loadByPrimaryKey(new Integer(sid));
        try{
            VipstatusManager.getInstance().deleteByPrimaryKey(ocl.getVipstatusid());
        }catch(Exception e)
        {
            e.printStackTrace();
            throw new Exception("VIP სტატუსის წაშლა შეუძლებელია!");
        }
    } else if(oper.equalsIgnoreCase("edit")){
        sid = request.getParameter("id");
        VipstatusBean ocl = VipstatusManager.getInstance().loadByPrimaryKey(new Integer(sid));
        
        String name=request.getParameter("name").trim();
        
        if(name.length() == 0)  throw new Exception("დასახელება ცარიელია!");
        if(VipstatusManager.getInstance().countWhere("where vipstatusid != "+sid+" and upper(name) = '"+name.toUpperCase().replaceAll("'", "''") +"'") > 0)
            throw new Exception("ასეთი დასახელების VIP სტატუსი უკვე არსებობს სისტემაში: "+name);
        
        ocl.setName(name);       
        
        ocl = VipstatusManager.getInstance().save(ocl);
        
    } else if(oper.equalsIgnoreCase("add")){
        
        VipstatusBean ocl = VipstatusManager.getInstance().createVipstatusBean();
        
        String name=request.getParameter("name").trim();
        
        if(name.length() == 0)  throw new Exception("დასახელება ცარიელია!");
        if(VipstatusManager.getInstance().countWhere("where upper(name) = '"+name.toUpperCase().replaceAll("'", "''") +"'") > 0)
            throw new Exception("ასეთი დასახელების VIP სტატუსი უკვე არსებობს სისტემაში: "+name);
        
        ocl.setName(name);       
        
        ocl = VipstatusManager.getInstance().save(ocl);
        sid = ocl.getVipstatusid().toString();
    }

    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1,\"id\":"+sid+"}";
}catch(Exception e){Manager.getInstance().endTransaction(false);e.printStackTrace();msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}"; e.printStackTrace();}
%>
<%=msg%>
