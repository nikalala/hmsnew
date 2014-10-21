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
        BusinesssourceBean ocl = BusinesssourceManager.getInstance().loadByPrimaryKey(new Integer(sid));
        try{
            BusinesssourceManager.getInstance().deleteByPrimaryKey(ocl.getBusinesssourceid());
        }catch(Exception e)
        {
            e.printStackTrace();
            throw new Exception("ბიზნესის წყაროს წაშლა შეუძლებელია!");
        }
    } else if(oper.equalsIgnoreCase("edit")){
        sid = request.getParameter("id");
        BusinesssourceBean ocl = BusinesssourceManager.getInstance().loadByPrimaryKey(new Integer(sid));
        
        String name=request.getParameter("name").trim();
        String nickname=request.getParameter("nickname").trim();
        String status=request.getParameter("status");
        
        if(name.length() == 0)  throw new Exception("დასახელება ცარიელია!");
        if(BusinesssourceManager.getInstance().countWhere("where businesssourceid != "+sid+" and upper(name) = '"+name.toUpperCase().replaceAll("'", "''") +"'") > 0)
            throw new Exception("ასეთი დასახელების ბიზნესის წყარო უკვე არსებობს სისტემაში: "+name);
        
        if(nickname.length() == 0)  throw new Exception("მოკლე დასახელება ცარიელია!");
        if(BusinesssourceManager.getInstance().countWhere("where businesssourceid != "+sid+" and upper(nickname) = '"+name.toUpperCase().replaceAll("'", "''") +"'") > 0)
            throw new Exception("ასეთი მოკლე დასახელების ბიზნესის წყარო უკვე არსებობს სისტემაში: "+nickname);
        
        ocl.setNickname(nickname);
        ocl.setName(name);
        if(status.equalsIgnoreCase("აქტიური"))   ocl.setStatus(true);
        else                                ocl.setStatus(false);
       
        
        ocl = BusinesssourceManager.getInstance().save(ocl);
        
    } else if(oper.equalsIgnoreCase("add")){
        
        BusinesssourceBean ocl = BusinesssourceManager.getInstance().createBusinesssourceBean();
        
        String name=request.getParameter("name").trim();
        String nickname=request.getParameter("nickname").trim();
        String status=request.getParameter("status");
        
        if(name.length() == 0)  throw new Exception("დასახელება ცარიელია!");
        if(BusinesssourceManager.getInstance().countWhere("where upper(name) = '"+name.toUpperCase().replaceAll("'", "''") +"'") > 0)
            throw new Exception("ასეთი დასახელების ბიზნესის წყარო უკვე არსებობს სისტემაში: "+name);
        if(nickname.length() == 0)  throw new Exception("მოკლე დასახელება ცარიელია!");
        if(BusinesssourceManager.getInstance().countWhere("where upper(nickname) = '"+name.toUpperCase().replaceAll("'", "''") +"'") > 0)
            throw new Exception("ასეთი მოკლე დასახელების ბიზნესის წყარო უკვე არსებობს სისტემაში: "+nickname);
        
        ocl.setNickname(nickname);
        ocl.setName(name);
        if(status.equalsIgnoreCase("აქტიური"))   ocl.setStatus(true);
        else                                ocl.setStatus(false);
       
        
        ocl = BusinesssourceManager.getInstance().save(ocl);
        sid = ocl.getBusinesssourceid().toString();
    }

    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1,\"id\":"+sid+"}";
}catch(Exception e){Manager.getInstance().endTransaction(false);e.printStackTrace();msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}"; e.printStackTrace();}
%>
<%=msg%>
