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
        CurrencyBean ocl = CurrencyManager.getInstance().loadByPrimaryKey(new Integer(sid));
        try{
            CurrencyManager.getInstance().deleteByPrimaryKey(ocl.getCurrencyid());
        }catch(Exception e)
        {
            e.printStackTrace();
            throw new Exception("ვალუტის წაშლა შეუძლებელია!");
        }
    } else if(oper.equalsIgnoreCase("edit")){
        sid = request.getParameter("id");
        CurrencyBean ocl = CurrencyManager.getInstance().loadByPrimaryKey(new Integer(sid));
        
        String name=request.getParameter("name").trim();
        String code=request.getParameter("code").trim();
        String basic=request.getParameter("basic").trim();
        
        if(name.length() == 0)  throw new Exception("დასახელება ცარიელია!");
        if(CurrencyManager.getInstance().countWhere("where currencyid != "+sid+" and upper(name) = '"+name.toUpperCase().replaceAll("'", "''") +"'") > 0)
            throw new Exception("ასეთი დასახელების ვალუტა უკვე არსებობს სისტემაში: "+name);
        
        if(code.length() == 0)  throw new Exception("კოდი ცარიელია!");
        if(CurrencyManager.getInstance().countWhere("where currencyid != "+sid+" and upper(code) = '"+code.toUpperCase().replaceAll("'", "''") +"'") > 0)
            throw new Exception("ასეთი კოდი უკვე არსებობს სისტემაში: "+code);
        
        ocl.setName(name);
        ocl.setCode(code);
        if(basic.equals("არა")) ocl.setBasic(false);
        else                    ocl.setBasic(true);
        
        if(ocl.getBasic().booleanValue() && CurrencyManager.getInstance().countWhere("where currencyid != "+sid+" and basic = true") > 0)
            throw new Exception("ბაზისური ვალუტა უკვე განსაზღვრულია");
        
        ocl = CurrencyManager.getInstance().save(ocl);
        
    } else if(oper.equalsIgnoreCase("add")){
        String name=request.getParameter("name").trim();
        String code=request.getParameter("code").trim();
        String basic=request.getParameter("basic").trim();
        
        if(name.length() == 0)  throw new Exception("დასახელება ცარიელია!");
        if(CurrencyManager.getInstance().countWhere("where upper(name) = '"+name.toUpperCase().replaceAll("'", "''") +"'") > 0)
            throw new Exception("ასეთი დასახელების ვალუტა უკვე არსებობს სისტემაში: "+name);
        
        if(code.length() == 0)  throw new Exception("კოდი ცარიელია!");
        if(CurrencyManager.getInstance().countWhere("where currencyid != "+sid+" and upper(code) = '"+code.toUpperCase().replaceAll("'", "''") +"'") > 0)
            throw new Exception("ასეთი კოდი უკვე არსებობს სისტემაში: "+code);

        CurrencyBean ocl = CurrencyManager.getInstance().createCurrencyBean();
        
        ocl.setName(name);
        ocl.setCode(code);
        if(basic.equals("არა")) ocl.setBasic(false);
        else                    ocl.setBasic(true);
        
        if(ocl.getBasic().booleanValue() && CurrencyManager.getInstance().countWhere("where basic = true") > 0)
            throw new Exception("ბაზისური ვალუტა უკვე განსაზღვრულია");

        ocl = CurrencyManager.getInstance().save(ocl);
        sid = ocl.getCurrencyid().toString();
    }

    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1,\"id\":"+sid+"}";
}catch(Exception e){Manager.getInstance().endTransaction(false);e.printStackTrace();msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}"; e.printStackTrace();}
%>
<%=msg%>
