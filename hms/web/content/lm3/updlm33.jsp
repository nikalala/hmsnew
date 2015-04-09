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
        ExtrachargeBean ocl = ExtrachargeManager.getInstance().loadByPrimaryKey(new Integer(sid));
        try{
            ExtrachargeManager.getInstance().deleteByPrimaryKey(ocl.getExtrachargeid());
        }catch(Exception e)
        {
            e.printStackTrace();
            throw new Exception("დამატებითიგადასახადის წაშლა შეუძლებელია!");
        }
    } else if(oper.equalsIgnoreCase("edit")){
        sid = request.getParameter("id");
        ExtrachargeBean ocl = ExtrachargeManager.getInstance().loadByPrimaryKey(new Integer(sid));
        
        String name=request.getParameter("name").trim();
        String nickname=request.getParameter("nickname").trim();
        double rate=Double.parseDouble(request.getParameter("rate").trim());
        String fixed=request.getParameter("fixedprice").trim();
        String web=request.getParameter("publish").trim();
        int ord = Integer.parseInt(request.getParameter("ord").trim());
        
        if(name.length() == 0)  throw new Exception("დასახელება ცარიელია!");
        if(ExtrachargeManager.getInstance().countWhere("where extrachargeid != "+sid+" and upper(name) = '"+name.toUpperCase().replaceAll("'", "''") +"'") > 0)
            throw new Exception("ასეთი დასახელების დამატებითი გადასახადი უკვე არსებობს სისტემაში: "+name);
        
        if(nickname.length() == 0)  throw new Exception("დასახელება ცარიელია!");
        if(ExtrachargeManager.getInstance().countWhere("where extrachargeid != "+sid+" and upper(nickname) = '"+name.toUpperCase().replaceAll("'", "''") +"'") > 0)
            throw new Exception("ასეთი დასახელების დამატებითი გადასახადი უკვე არსებობს სისტემაში: "+name);
        
        ocl.setName(name);
        ocl.setNickname(nickname);
        ocl.setRate(rate);
        ocl.setOrd(ord);
        if(fixed.equals("არა")) ocl.setFixedprice(false);
        else                    ocl.setFixedprice(true);
        if(web.equals("არა")) ocl.setPublish(false);
        else                    ocl.setPublish(true);
       
        
        ocl = ExtrachargeManager.getInstance().save(ocl);
        
    } else if(oper.equalsIgnoreCase("add")){
        
        ExtrachargeBean ocl = ExtrachargeManager.getInstance().createExtrachargeBean();
        
        String name=request.getParameter("name").trim();
        String nickname=request.getParameter("nickname").trim();
        double rate=Double.parseDouble(request.getParameter("rate").trim());
        String fixed=request.getParameter("fixedprice").trim();
        String web=request.getParameter("publish").trim();
        int ord = Integer.parseInt(request.getParameter("ord").trim());
        
        if(name.length() == 0)  throw new Exception("დასახელება ცარიელია!");
        if(ExtrachargeManager.getInstance().countWhere("where upper(name) = '"+name.toUpperCase().replaceAll("'", "''") +"'") > 0)
            throw new Exception("ასეთი დასახელების დამატებითი გადასახადი უკვე არსებობს სისტემაში: "+name);
        
        if(nickname.length() == 0)  throw new Exception("მოკლე დასახელება ცარიელია!");
        if(ExtrachargeManager.getInstance().countWhere("where upper(nickname) = '"+name.toUpperCase().replaceAll("'", "''") +"'") > 0)
            throw new Exception("ასეთი მოკლე დასახელების დამატებითი გადასახადი უკვე არსებობს სისტემაში: "+name);
        
        ocl.setName(name);
        ocl.setNickname(nickname);
        ocl.setRate(rate);
        ocl.setOrd(ord);
        if(fixed.equals("არა")) ocl.setFixedprice(false);
        else                    ocl.setFixedprice(true);
        if(web.equals("არა")) ocl.setPublish(false);
        else                    ocl.setPublish(true);
       
        
        ocl = ExtrachargeManager.getInstance().save(ocl);
        sid = ocl.getExtrachargeid().toString();
    }

    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1,\"id\":"+sid+"}";
}catch(Exception e){Manager.getInstance().endTransaction(false);e.printStackTrace();msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}"; e.printStackTrace();}
%>
<%=msg%>
