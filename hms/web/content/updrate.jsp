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
CurrencyBean currency = CurrencyManager.getInstance().loadByPrimaryKey(new Integer(request.getParameter("currencyid")));
String oper = request.getParameter("oper");
Manager.getInstance().beginTransaction();
try{
    if(oper.equalsIgnoreCase("del")){
        sid = request.getParameter("id");
        RateBean ocl = RateManager.getInstance().loadByPrimaryKey(new Long(sid));
        try{
            RateManager.getInstance().deleteByPrimaryKey(ocl.getRateid());
        }catch(Exception e)
        {
            e.printStackTrace();
            throw new Exception("ვალუტის კურსის წაშლა შეუძლებელია!");
        }
    } else if(oper.equalsIgnoreCase("edit")){
        sid = request.getParameter("id");
        RateBean ocl = RateManager.getInstance().loadByPrimaryKey(new Long(sid));
        
        String ratedate=request.getParameter("ratedate").trim();
        String val=request.getParameter("value").trim();
        
        ocl.setCurrencyid(currency.getCurrencyid());
        ocl.setRatedate(dt.parse(ratedate).getTime());
        ocl.setValue(Double.parseDouble(val));
        
        ocl = RateManager.getInstance().save(ocl);
        
    } else if(oper.equalsIgnoreCase("add")){
        String ratedate=request.getParameter("ratedate").trim();
        String val=request.getParameter("value").trim();
        
        RateBean ocl = RateManager.getInstance().createRateBean();

        ocl.setCurrencyid(currency.getCurrencyid());
        ocl.setRatedate(dt.parse(ratedate).getTime());
        ocl.setValue(Double.parseDouble(val));
        
        ocl = RateManager.getInstance().save(ocl);
        sid = ocl.getRateid().toString();
    }

    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1,\"id\":"+sid+"}";
}catch(Exception e){Manager.getInstance().endTransaction(false);e.printStackTrace();msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}"; e.printStackTrace();}
%>
<%=msg%>
