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
        TemplatesBean ocl = TemplatesManager.getInstance().loadByPrimaryKey(new Integer(sid));
        try{
            TemplatesManager.getInstance().deleteByPrimaryKey(ocl.getTemplatesid());
            ChangelogBean chlog = ChangelogManager.getInstance().createChangelogBean();
            chlog.setChangebyid(user.getPersonellid());
            chlog.setName("TEMPLATES");
            chlog.setId(ocl.getTemplatesid());
            chlog = ChangelogManager.getInstance().save(chlog);
        }catch(Exception e)
        {
            e.printStackTrace();
            throw new Exception("შაბლონის წაშლა შეუძლებელია!");
        }
    } else if(oper.equalsIgnoreCase("edit")){
        sid = request.getParameter("id");
        TemplatesBean ocl = TemplatesManager.getInstance().loadByPrimaryKey(new Integer(sid));
        
        String name=request.getParameter("name").trim();
        String note=request.getParameter("note").trim();
        int catid = Integer.parseInt(request.getParameter("templatecategoryid"));
        String status=request.getParameter("status");
        
        if(name.length() == 0)  throw new Exception("დასახელება ცარიელია!");
        if(TemplatesManager.getInstance().countWhere("where templatesid != "+sid+" and upper(name) = '"+name.toUpperCase().replaceAll("'", "''") +"'") > 0)
            throw new Exception("ასეთი დასახელების შაბლონი უკვე არსებობს სისტემაში: "+name);
        
        ocl.setName(name);
        ocl.setTemplatecategoryid(catid);
        ocl.setNote(note);
        if(status.equalsIgnoreCase("აქტიური"))   ocl.setStatus(true);
        else                                ocl.setStatus(false);
       
        
        ocl = TemplatesManager.getInstance().save(ocl);
        ChangelogBean chlog = ChangelogManager.getInstance().createChangelogBean();
        chlog.setChangebyid(user.getPersonellid());
        chlog.setName("TEMPLATES");
        chlog.setId(ocl.getTemplatesid());
        chlog = ChangelogManager.getInstance().save(chlog);
        
    } else if(oper.equalsIgnoreCase("add")){
        
        TemplatesBean ocl = TemplatesManager.getInstance().createTemplatesBean();
        
        String name=request.getParameter("name").trim();
        String note=request.getParameter("note").trim();
        int catid = Integer.parseInt(request.getParameter("templatecategoryid"));
        String status=request.getParameter("status");
        
        if(name.length() == 0)  throw new Exception("დასახელება ცარიელია!");
        if(TemplatesManager.getInstance().countWhere("where upper(name) = '"+name.toUpperCase().replaceAll("'", "''") +"'") > 0)
            throw new Exception("ასეთი დასახელების შაბლონი უკვე არსებობს სისტემაში: "+name);
        
        ocl.setName(name);
        ocl.setTemplatecategoryid(catid);
        ocl.setNote(note);
        if(status.equalsIgnoreCase("აქტიური"))   ocl.setStatus(true);
        else                                ocl.setStatus(false);
       
        
        ocl = TemplatesManager.getInstance().save(ocl);
        
        ChangelogBean chlog = ChangelogManager.getInstance().createChangelogBean();
        chlog.setChangebyid(user.getPersonellid());
        chlog.setName("TEMPLATES");
        chlog.setId(ocl.getTemplatesid());
        chlog = ChangelogManager.getInstance().save(chlog);
        
        
        sid = ocl.getTemplatesid().toString();
    }

    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1,\"id\":"+sid+"}";
}catch(Exception e){Manager.getInstance().endTransaction(false);e.printStackTrace();msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}"; e.printStackTrace();}
%>
<%=msg%>
