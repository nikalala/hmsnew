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
        IdtypeManager.getInstance().deleteByPrimaryKey(new Integer(sid));
    } else if(oper.equalsIgnoreCase("edit")){
        sid = request.getParameter("id");
        IdtypeBean idtype = IdtypeManager.getInstance().loadByPrimaryKey(new Integer(sid));
        
        String name=request.getParameter("name").trim();
        String status=request.getParameter("status");
        
        if(name.length() == 0)  throw new Exception("დასახელება ცარიელია!");
        if(IdtypeManager.getInstance().countWhere("where idtypeid != "+sid+" and upper(name) = '"+name.toUpperCase().replaceAll("'", "''") +"'") > 0)
            throw new Exception("ასეთი დასახელების საბუთის ტიპი უკვე არსებობს სისტემაში: "+name);
        
        idtype.setName(name);
        if(status.equalsIgnoreCase("აქტიური"))   idtype.setStatus(true);
        else                                idtype.setStatus(false);
        
        idtype = IdtypeManager.getInstance().save(idtype);
    } else if(oper.equalsIgnoreCase("add")){
        IdtypeBean idtype = IdtypeManager.getInstance().createIdtypeBean();
        
        String name=request.getParameter("name").trim();
        String status=request.getParameter("status");
        
        if(name.length() == 0)  throw new Exception("დასახელება ცარიელია!");
        if(IdtypeManager.getInstance().countWhere("where upper(name) = '"+name.toUpperCase().replaceAll("'", "''") +"'") > 0)
            throw new Exception("ასეთი დასახელების საბუთის ტიპი უკვე არსებობს სისტემაში: "+name);
        
        idtype.setName(name);
        if(status.equalsIgnoreCase("აქტიური"))   idtype.setStatus(true);
        else                                idtype.setStatus(false);
        
        idtype = IdtypeManager.getInstance().save(idtype);
        
        sid = idtype.getIdtypeid().toString();
        
    }

    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1,\"id\":"+sid+"}";
}catch(Exception e){
    Manager.getInstance().endTransaction(false);
    e.printStackTrace();
    msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}"; 
    }
%>
<%=msg%>
