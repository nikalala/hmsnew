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
        ReasonBean ocl = ReasonManager.getInstance().loadByPrimaryKey(new Integer(sid));
        try{
            ReasonManager.getInstance().deleteByPrimaryKey(ocl.getReasonid());
        }catch(Exception e)
        {
            e.printStackTrace();
            throw new Exception("მიზეზის წაშლა შეუძლებელია!");
        }
    } else if(oper.equalsIgnoreCase("edit")){
        sid = request.getParameter("id");
        ReasonBean ocl = ReasonManager.getInstance().loadByPrimaryKey(new Integer(sid));
        
        String name=request.getParameter("name").trim();
        int category = Integer.parseInt(request.getParameter("category").trim());
        String status=request.getParameter("status");
        
        if(name.length() == 0)  throw new Exception("დასახელება ცარიელია!");
        if(ReasonManager.getInstance().countWhere("where reasonid != "+sid+" and upper(name) = '"+name.toUpperCase().replaceAll("'", "''") +"'") > 0)
            throw new Exception("ასეთი დასახელების მიზეზი უკვე არსებობს სისტემაში: "+name);
        
        ocl.setName(name);
        ocl.setCategory(category);
        if(status.equalsIgnoreCase("აქტიური"))   ocl.setStatus(true);
        else                                ocl.setStatus(false);
       
        
        ocl = ReasonManager.getInstance().save(ocl);
        
    } else if(oper.equalsIgnoreCase("add")){
        
        ReasonBean ocl = ReasonManager.getInstance().createReasonBean();
        
        String name=request.getParameter("name").trim();
        int category = Integer.parseInt(request.getParameter("category").trim());
        String status=request.getParameter("status");
        
        if(name.length() == 0)  throw new Exception("დასახელება ცარიელია!");
        if(ReasonManager.getInstance().countWhere("where upper(name) = '"+name.toUpperCase().replaceAll("'", "''") +"'") > 0)
            throw new Exception("ასეთი დასახელების მიზეზი უკვე არსებობს სისტემაში: "+name);
        
        ocl.setName(name);
        ocl.setCategory(category);
        if(status.equalsIgnoreCase("აქტიური"))   ocl.setStatus(true);
        else                                ocl.setStatus(false);
       
        
        ocl = ReasonManager.getInstance().save(ocl);
        sid = ocl.getReasonid().toString();
    }

    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1,\"id\":"+sid+"}";
}catch(Exception e){Manager.getInstance().endTransaction(false);e.printStackTrace();msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}"; e.printStackTrace();}
%>
<%=msg%>
