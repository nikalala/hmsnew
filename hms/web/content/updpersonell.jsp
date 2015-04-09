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
        if(user.getPersonellid().intValue() == Integer.parseInt(sid))
            throw new Exception("მიმდინარე თანამშრომლის წაშლა შეუძლებელია!");
        PersonellBean ptp = PersonellManager.getInstance().loadByPrimaryKey(new Integer(sid));
        try{
            PersonellManager.getInstance().deleteByPrimaryKey(ptp.getPersonellid());
        }catch(Exception e)
        {
            e.printStackTrace();
            throw new Exception("თანამშრომლის წაშლა შეუძლებელია!");
        }
    } else if(oper.equalsIgnoreCase("edit")){
        sid = request.getParameter("id");
        PersonellBean ptp = PersonellManager.getInstance().loadByPrimaryKey(new Integer(sid));
        
        String fname = (request.getParameter("fname")).trim();
        String lname = (request.getParameter("lname")).trim();
        String phone = (request.getParameter("phone")).trim();
        int personelltypeid = Integer.parseInt(request.getParameter("personelltypeid"));
        int depid = Integer.parseInt(request.getParameter("departamentid"));
        String loginid = (request.getParameter("loginid")).trim();
        String password = (request.getParameter("password")).trim();
        String address = (request.getParameter("address")).trim();
        String deleted = (request.getParameter("deleted")).trim();
        String code = (request.getParameter("code")).trim();

        if(loginid.length() < 4)  throw new Exception("სარეგისტრაციო სახელი უნდა იყოს მინიმუმ 4 სიმბოლო!");
        if(password.length() < 4)  throw new Exception("პაროლი უნდა იყოს მინიმუმ 4 სიმბოლო!");
        if(lname.length() == 0)  throw new Exception("გვარი ცარიელია!");
        if(fname.length() == 0)  throw new Exception("სახელი ცარიელია!");
        if(PersonellManager.getInstance().countWhere("where personellid != "+sid+" and upper(loginid) = '"+loginid.toUpperCase().replaceAll("'", "''") +"'") > 0)
            throw new Exception("სარეგისტრაციო სახელი "+loginid+" უკვე არსებობს!");
        if(PersonellManager.getInstance().countWhere("where personellid != "+sid+" and departamentid = "+depid+" and upper(code) = '"+code.toUpperCase().replaceAll("'", "''") +"'") > 0)
            throw new Exception("კოდი "+code+" უკვე არსებობს!");
        
        ptp.setFname(fname);
        ptp.setLname(lname);
        ptp.setAddress(address);
        if(deleted.equalsIgnoreCase("დიახ"))    ptp.setDeleted(true);
        else                                    ptp.setDeleted(false);
        ptp.setPhone(phone);
        ptp.setLoginid(loginid);
        ptp.setPassword(password);
        ptp.setDepartamentid(depid);
        ptp.setCode(code);
        ptp.setPersonelltypeid(personelltypeid);
        
        ptp = PersonellManager.getInstance().save(ptp);
        
    } else if(oper.equalsIgnoreCase("add")){
        String fname = (request.getParameter("fname")).trim();
        String lname = (request.getParameter("lname")).trim();
        String phone = (request.getParameter("phone")).trim();
        int personelltypeid = Integer.parseInt(request.getParameter("personelltypeid"));
        String loginid = (request.getParameter("loginid")).trim();
        String password = (request.getParameter("password")).trim();
        String address = (request.getParameter("address")).trim();
        String deleted = (request.getParameter("deleted")).trim();
        int depid = Integer.parseInt(request.getParameter("departamentid"));
        String code = (request.getParameter("code")).trim();
        
        if(loginid.length() < 4)  throw new Exception("სარეგისტრაციო სახელი უნდა იყოს მინიმუმ 4 სიმბოლო!");
        if(password.length() < 4)  throw new Exception("პაროლი უნდა იყოს მინიმუმ 4 სიმბოლო!");
        if(lname.length() == 0)  throw new Exception("გვარი ცარიელია!");
        if(fname.length() == 0)  throw new Exception("სახელი ცარიელია!");
        if(PersonellManager.getInstance().countWhere("where upper(loginid) = '"+loginid.toUpperCase().replaceAll("'", "''") +"'") > 0)
            throw new Exception("სარეგისტრაციო სახელი "+loginid+" უკვე არსებობს!");
        if(PersonellManager.getInstance().countWhere("where departamentid = "+depid+" and upper(code) = '"+code.toUpperCase().replaceAll("'", "''") +"'") > 0)
            throw new Exception("კოდი "+code+" უკვე არსებობს!");
        
        PersonellBean ptp = PersonellManager.getInstance().createPersonellBean();
        ptp.setFname(fname);
        ptp.setLname(lname);
        ptp.setAddress(address);
        if(deleted.equalsIgnoreCase("დიახ"))    ptp.setDeleted(true);
        else                                    ptp.setDeleted(false);
        ptp.setPhone(phone);
        ptp.setLoginid(loginid);
        ptp.setPassword(password);
        ptp.setPersonelltypeid(personelltypeid);
        ptp.setDepartamentid(depid);
        ptp.setCode(code);
        ptp = PersonellManager.getInstance().save(ptp);
        sid = ptp.getPersonellid().toString();
    }

    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1,\"id\":"+sid+"}";
}catch(Exception e){Manager.getInstance().endTransaction(false);e.printStackTrace();msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}"; e.printStackTrace();}
%>
<%=msg%>
