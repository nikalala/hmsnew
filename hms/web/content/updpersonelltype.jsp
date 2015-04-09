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
        PersonelltypeBean ptp = PersonelltypeManager.getInstance().loadByPrimaryKey(new Integer(sid));
        if(PersonelltypeManager.getInstance().countWhere("where personelltypeid = "+ptp.getPersonelltypeid()) > 0)
            throw new Exception("ჯერ წაშალეთ შესაბამისი თანამშრომელი");
        PersonelltypeManager.getInstance().deleteByPrimaryKey(ptp.getPersonelltypeid());
    } else if(oper.equalsIgnoreCase("edit")){
        sid = request.getParameter("id");
        PersonelltypeBean ptp = PersonelltypeManager.getInstance().loadByPrimaryKey(new Integer(sid));
        
        String name=request.getParameter("name").trim();
        String description=request.getParameter("description").trim();
        String code=request.getParameter("code").trim();
        
        if(name.length() == 0)  throw new Exception("თანამდებობის დასახელება ცარიელია!");
        if(code.length() == 0)  throw new Exception("თანამდებობის კოდი ცარიელია!");
        if(PersonelltypeManager.getInstance().countWhere("where personelltypeid != "+sid+" and upper(name) = '"+name.toUpperCase().replace("'", "''") +"'") > 0)
            throw new Exception("თანამდებობა სახელით "+name+" უკვე არსებობს!");
        if(PersonelltypeManager.getInstance().countWhere("where personelltypeid != "+sid+" and upper(code) = '"+code.toUpperCase().replace("'", "''") +"'") > 0)
            throw new Exception("კოდი "+name+" უკვე გამოყენებულია!");
        
        ptp.setCode(code);
        ptp.setName(name);
        ptp.setDescription(description);
        
        ptp = PersonelltypeManager.getInstance().save(ptp);
        
    } else if(oper.equalsIgnoreCase("add")){
        String name=request.getParameter("name").trim();
        String description=request.getParameter("description").trim();
        String code=request.getParameter("code").trim();
        
        if(name.length() == 0)  throw new Exception("თანამდებობის დასახელება ცარიელია!");
        if(code.length() == 0)  throw new Exception("თანამდებობის კოდი ცარიელია!");
        if(PersonelltypeManager.getInstance().countWhere("where personelltypeid != "+sid+" and upper(name) = '"+name.toUpperCase().replace("'", "''") +"'") > 0)
            throw new Exception("თანამდებობა სახელით "+name+" უკვე არსებობს!");
        if(PersonelltypeManager.getInstance().countWhere("where personelltypeid != "+sid+" and upper(code) = '"+code.toUpperCase().replace("'", "''") +"'") > 0)
            throw new Exception("კოდი "+name+" უკვე გამოყენებულია!");
        
        PersonelltypeBean ptp = PersonelltypeManager.getInstance().createPersonelltypeBean();
        ptp.setCode(code);
        ptp.setName(name);
        ptp.setDescription(description);
        
        ptp = PersonelltypeManager.getInstance().save(ptp);
        sid = ptp.getPersonelltypeid().toString();
    }

    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1,\"id\":"+sid+"}";
}catch(Exception e){Manager.getInstance().endTransaction(false);e.printStackTrace();msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}"; e.printStackTrace();}
%>
<%=msg%>
