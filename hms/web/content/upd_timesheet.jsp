<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet" %>
<%
Vector v = new Vector();

SimpleDateFormat sdt0 = new SimpleDateFormat("yyyy-MM-dd");
SimpleDateFormat sdt1 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
String msg = "";

String sid = "0";
Calendar cal = Calendar.getInstance();
int year = Integer.parseInt(request.getParameter("year"));
int month = Integer.parseInt(request.getParameter("month"));
cal.set(Calendar.YEAR, year);
cal.set(Calendar.MONTH, month);

String oper = request.getParameter("oper");
Manager.getInstance().beginTransaction();
try{
    if(oper.equalsIgnoreCase("del")){
        sid = request.getParameter("id");
        try{
            
        }catch(Exception e)
        {
            e.printStackTrace();
            throw new Exception("წაშლა შეუძლებელია!");
        }
    } else if(oper.equalsIgnoreCase("edit")){
        sid = request.getParameter("id");
        
        for(Enumeration e = request.getParameterNames();e.hasMoreElements();){
        String name = (String)e.nextElement();
        if(name.indexOf("d_") == 0){
            String val = request.getParameter(name);
            int day = Integer.parseInt(name.substring(2))+1;
            cal.set(Calendar.DATE, day);
            WorkhoursBean wb = WorkhoursManager.getInstance().loadByPrimaryKey(new Integer(sid), cal.getTime());
            if(wb == null){
                wb = WorkhoursManager.getInstance().createWorkhoursBean();
                wb.setPersonellid(new Integer(sid));
                wb.setWdate(cal.getTime());
            }
            wb.setHours(new Double(val));
            wb = WorkhoursManager.getInstance().save(wb);
            PpremiumBean pp = PpremiumManager.getInstance().loadByPrimaryKey(new Integer(sid), year, month);
            if(pp == null){
                pp = PpremiumManager.getInstance().createPpremiumBean();
                pp.setMonth(month);
                pp.setYear(year);
                pp.setPersonellid(new Integer(sid));
            }
            String prem = request.getParameter("premium");
            if(prem.equalsIgnoreCase("დიახ"))   pp.setPremium(true);
            else                                pp.setPremium(false);
            pp = PpremiumManager.getInstance().save(pp);
            }
        else if(name.equalsIgnoreCase("extra")){
            ExtrahoursBean extra = ExtrahoursManager.getInstance().loadByPrimaryKey(year, month, new Integer(sid));
            if(extra == null){
                extra = ExtrahoursManager.getInstance().createExtrahoursBean();
                extra.setMonth(month);
                extra.setYear(year);
                extra.setPersonellid(new Integer(sid));
            }
            extra.setAmount(new Double(request.getParameter(name)));
            extra = ExtrahoursManager.getInstance().save(extra);
        }
        }
        
        
    } else if(oper.equalsIgnoreCase("add")){
    }

    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1,\"id\":"+sid+"}";
}catch(Exception e){
    Manager.getInstance().endTransaction(false);
    e.printStackTrace();
    //msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}"; 
    //e.printStackTrace();
}
%>
<%=msg%>
