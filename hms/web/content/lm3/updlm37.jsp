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
        DiscountBean ocl = DiscountManager.getInstance().loadByPrimaryKey(new Integer(sid));
        try{
            DiscountManager.getInstance().deleteByPrimaryKey(ocl.getDiscountid());
        }catch(Exception e)
        {
            e.printStackTrace();
            throw new Exception("ფასდაკლების წაშლა შეუძლებელია!");
        }
    } else if(oper.equalsIgnoreCase("edit")){
        sid = request.getParameter("id");
        DiscountBean ocl = DiscountManager.getInstance().loadByPrimaryKey(new Integer(sid));
        
        String name=request.getParameter("name").trim();
        String nickname=request.getParameter("nickname").trim();
        double amount = Double.parseDouble(request.getParameter("amount").trim());
        int dct = Integer.parseInt(request.getParameter("discounttype").trim());
        String opendiscount=request.getParameter("opendiscount");
        String sharer=request.getParameter("sharer");
        String extracharge=request.getParameter("extracharge");
        
        if(name.length() == 0)  throw new Exception("დასახელება ცარიელია!");
        if(ReasonManager.getInstance().countWhere("where discountid != "+sid+" and upper(name) = '"+name.toUpperCase().replaceAll("'", "''") +"'") > 0)
            throw new Exception("ასეთი დასახელების ფასდაკლება უკვე არსებობს სისტემაში: "+name);
        
        if(nickname.length() == 0)  throw new Exception("მოკლე დასახელება ცარიელია!");
        if(DiscountManager.getInstance().countWhere("where discountid != "+sid+" and upper(nickname) = '"+nickname.toUpperCase().replaceAll("'", "''") +"'") > 0)
            throw new Exception("ასეთი მოკლე დასახელების ფასდაკლება უკვე არსებობს სისტემაში: "+nickname);
        
        ocl.setName(name);
        ocl.setNickname(nickname);
        ocl.setAmount(amount);
        ocl.setDiscounttype(dct);
        if(opendiscount.equalsIgnoreCase("კი"))   ocl.setOpendiscount(true);
        else                                ocl.setOpendiscount(false);
        if(sharer.equalsIgnoreCase("კი"))   ocl.setSharer(true);
        else                                ocl.setSharer(false);
        if(extracharge.equalsIgnoreCase("კი"))   ocl.setExtracharge(true);
        else                                ocl.setExtracharge(false);
       
        
        ocl = DiscountManager.getInstance().save(ocl);
        
    } else if(oper.equalsIgnoreCase("add")){
        
        DiscountBean ocl = DiscountManager.getInstance().createDiscountBean();
        
        String name=request.getParameter("name").trim();
        String nickname=request.getParameter("nickname").trim();
        double amount = Double.parseDouble(request.getParameter("amount").trim());
        int dct = Integer.parseInt(request.getParameter("discounttype").trim());
        String opendiscount=request.getParameter("opendiscount");
        String sharer=request.getParameter("sharer");
        String extracharge=request.getParameter("extracharge");
        
        if(name.length() == 0)  throw new Exception("დასახელება ცარიელია!");
        if(ReasonManager.getInstance().countWhere("where upper(name) = '"+name.toUpperCase().replaceAll("'", "''") +"'") > 0)
            throw new Exception("ასეთი დასახელების ფასდაკლება უკვე არსებობს სისტემაში: "+name);
        
        if(nickname.length() == 0)  throw new Exception("მოკლე დასახელება ცარიელია!");
        if(DiscountManager.getInstance().countWhere("where upper(nickname) = '"+nickname.toUpperCase().replaceAll("'", "''") +"'") > 0)
            throw new Exception("ასეთი მოკლე დასახელების ფასდაკლება უკვე არსებობს სისტემაში: "+nickname);
        
        ocl.setName(name);
        ocl.setNickname(nickname);
        ocl.setAmount(amount);
        ocl.setDiscounttype(dct);
        if(opendiscount.equalsIgnoreCase("კი"))   ocl.setOpendiscount(true);
        else                                ocl.setOpendiscount(false);
        if(sharer.equalsIgnoreCase("კი"))   ocl.setSharer(true);
        else                                ocl.setSharer(false);
        if(extracharge.equalsIgnoreCase("კი"))   ocl.setExtracharge(true);
        else                                ocl.setExtracharge(false);
       
        
        ocl = DiscountManager.getInstance().save(ocl);
        sid = ocl.getDiscountid().toString();
    }

    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1,\"id\":"+sid+"}";
}catch(Exception e){Manager.getInstance().endTransaction(false);e.printStackTrace();msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}"; e.printStackTrace();}
%>
<%=msg%>
