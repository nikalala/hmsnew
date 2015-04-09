<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%
/*
for(Enumeration e=request.getParameterNames();e.hasMoreElements();){
    String name = (String)e.nextElement();
    String val = request.getParameter(name);
    System.out.println(name + " = " + val);
}
*/
String msg = "";
String act = request.getParameter("act");
Manager.getInstance().beginTransaction();
try{
    if(act.equalsIgnoreCase("del")){
        
        msg = "{\"result\":1}";
    } else if(act.equalsIgnoreCase("add")){
        
        String companyname = request.getParameter("companyname").trim();
        int salutationid = Integer.parseInt(request.getParameter("salutationid"));
        String contactname = request.getParameter("contactname").trim();
        String mobile = request.getParameter("mobile").trim();
        String phone = request.getParameter("phone").trim();
        String email = request.getParameter("email").trim();
        String fax = request.getParameter("fax").trim();
        String address = request.getParameter("address").trim();
        int countryid = Integer.parseInt(request.getParameter("countryid"));
        String city = request.getParameter("city").trim();
        String zip = request.getParameter("zip").trim();
        
        if(companyname.length() == 0)   throw new Exception("შეიყვანეთ დასახელება");
        if(ContragentManager.getInstance().countWhere("where upper(name) = '"+companyname.toUpperCase().replaceAll("'", "''") +"' and type = 1") > 0)
            throw new Exception("ასეთი სახელით კომპანია უკვე არსებობს");
        if(contactname.length() == 0)   throw new Exception("შეიყვანეთ საკონტაქტო პირის სახელი");
        //if(mobile.length() == 0)   throw new Exception("შეიყვანეთ მობილური");
        //if(phone.length() == 0)   throw new Exception("შეიყვანეთ ტელეფონი");
        //if(email.length() == 0)   throw new Exception("შეიყვანეთ ელფოსტა");
        //if(fax.length() == 0)   throw new Exception("შეიყვანეთ ფაქსი");
        //if(address.length() == 0)   throw new Exception("შეიყვანეთ მისამართი");
        //if(city.length() == 0)   throw new Exception("შეიყვანეთ ქალაქი");
        //if(zip.length() == 0)   throw new Exception("შეიყვანეთ ინდექსი");
        if(countryid == 0)   throw new Exception("აირჩიეთ ქვეყანა");
        
        String[] cname = contactname.split(" ",2);
        
        ContragentBean cn = ContragentManager.getInstance().createContragentBean();
        cn.setBsource(false);
        cn.setAddress(address);
        cn.setCity(city);
        cn.setCountryid(countryid);
        cn.setEmail(email);
        cn.setFax(fax);
        cn.setMobile(mobile);
        cn.setName(companyname);
        cn.setRegbyid(user.getPersonnelid());
        cn.setSalutationid(salutationid);
        cn.setZip(zip);
        cn.setType(1);
        cn.setCommissionplan(0);
        cn.setVal(0);
        cn.setRate(0);
        cn.setLname(cname[0]);
        if(cname.length > 1)
            cn.setLname(cname[1]);
        cn = ContragentManager.getInstance().save(cn);
        
        msg = "{\"result\":1,\"id\":"+cn.getContragentid()+",\"name\":\""+cn.getName().replaceAll("'", "\\'") +"\"}";
        Manager.getInstance().endTransaction(true);
    }
}catch(Exception e){
    e.printStackTrace();
    Manager.getInstance().endTransaction(false);
    msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}";
}
    
%>
<%=msg%>