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
        SalaryManager.getInstance().deleteByPrimaryKey(new Long(sid));
    } else if(oper.equalsIgnoreCase("edit")){
        sid = request.getParameter("id");
        SalaryBean ptp = SalaryManager.getInstance().loadByPrimaryKey(new Long(sid));
        
        Date paydate = dt.parse(request.getParameter("paydate"));
        Date fordate = dt.parse(request.getParameter("fordate"));
        Calendar cal = Calendar.getInstance();
        cal.setTime(fordate);
        cal.set(Calendar.DATE, 1);
        String note=request.getParameter("note").trim();
        double amount = Double.parseDouble(request.getParameter("amount"));
        int personellid = Integer.parseInt(request.getParameter("personellid"));
        int paytypeid = Integer.parseInt(request.getParameter("paytypeid"));
        
        ptp.setAmount(amount);
        ptp.setFordate(cal.getTime());
        ptp.setPaydate(paydate.getTime());
        ptp.setNote(note);
        ptp.setPersonellid(personellid);
        ptp.setPaytypeid(paytypeid);
        
        ptp = SalaryManager.getInstance().save(ptp);
        
    } else if(oper.equalsIgnoreCase("add")){
        SalaryBean ptp = SalaryManager.getInstance().createSalaryBean();
        
        Date paydate = dt.parse(request.getParameter("paydate"));
        Date fordate = dt.parse(request.getParameter("fordate"));
        Calendar cal = Calendar.getInstance();
        cal.setTime(fordate);
        cal.set(Calendar.DATE, 1);

        String note=request.getParameter("note").trim();
        double amount = Double.parseDouble(request.getParameter("amount"));
        int personellid = Integer.parseInt(request.getParameter("personellid"));
        int paytypeid = Integer.parseInt(request.getParameter("paytypeid"));
        
        ptp.setAmount(amount);
        ptp.setFordate(cal.getTime());
        ptp.setPaydate(paydate.getTime());
        ptp.setNote(note);
        ptp.setPersonellid(personellid);
        ptp.setPaytypeid(paytypeid);
        
        ptp = SalaryManager.getInstance().save(ptp);
        sid = ptp.getSalaryid().toString();
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
