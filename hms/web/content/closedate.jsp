<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
String msg = "";

Manager.getInstance().beginTransaction();
try{
    Calendar cal = Calendar.getInstance();
    cal.setTimeInMillis(lclosedate);
    cal.add(Calendar.DATE, 1);
    cal.set(Calendar.HOUR_OF_DAY,23);
    cal.set(Calendar.MINUTE,59);
    cal.set(Calendar.SECOND,59);
    cal.set(Calendar.MILLISECOND,999);
    
    ClosedateBean cldate = ClosedateManager.getInstance().createClosedateBean();
    cldate.setRegbyid(user.getPersonnelid());
    cldate.setCldate(cal.getTime());
    cldate = ClosedateManager.getInstance().save(cldate);
    
    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1}";
}catch(Exception e){Manager.getInstance().endTransaction(false);e.printStackTrace();msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}"; e.printStackTrace();}
%>
<%=msg%>
