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
        TemplatecategoryBean ocl = TemplatecategoryManager.getInstance().loadByPrimaryKey(new Integer(sid));
        try{
            TemplatecategoryManager.getInstance().deleteByPrimaryKey(ocl.getTemplatecategoryid());
        }catch(Exception e)
        {
            e.printStackTrace();
            throw new Exception("შაბლონის კატეგორიის წაშლა შეუძლებელია!");
        }
    } else if(oper.equalsIgnoreCase("edit")){
        sid = request.getParameter("id");
        TemplatecategoryBean ocl = TemplatecategoryManager.getInstance().loadByPrimaryKey(new Integer(sid));
        
        String name=request.getParameter("name").trim();
        
        
        if(name.length() == 0)  throw new Exception("დასახელება ცარიელია!");
        if(TemplatecategoryManager.getInstance().countWhere("where templatecategoryid != "+sid+" and upper(name) = '"+name.toUpperCase().replaceAll("'", "''") +"'") > 0)
            throw new Exception("ასეთი დასახელების შაბლონის კატეგორია უკვე არსებობს სისტემაში: "+name);
        
        ocl.setName(name);
        
       
        
        ocl = TemplatecategoryManager.getInstance().save(ocl);
        
    } else if(oper.equalsIgnoreCase("add")){
        
        TemplatecategoryBean ocl = TemplatecategoryManager.getInstance().createTemplatecategoryBean();
        
        String name=request.getParameter("name").trim();
        
        
        if(name.length() == 0)  throw new Exception("დასახელება ცარიელია!");
        if(TemplatecategoryManager.getInstance().countWhere("where upper(name) = '"+name.toUpperCase().replaceAll("'", "''") +"'") > 0)
            throw new Exception("ასეთი დასახელების შაბლონის კატეგორია უკვე არსებობს სისტემაში: "+name);
        
        ocl.setName(name);
        
       
        
        ocl = TemplatecategoryManager.getInstance().save(ocl);
        sid = ocl.getTemplatecategoryid().toString();
    }

    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1,\"id\":"+sid+"}";
}catch(Exception e){Manager.getInstance().endTransaction(false);e.printStackTrace();msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}"; e.printStackTrace();}
%>
<%=msg%>
