<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%

JSONObject obj = new JSONObject();
try{
ContragentBean contr = ContragentManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("id")));
String guestname = contr.getFname() + " " + contr.getLname();
String phone = contr.getPhone();
if(phone == null)   phone = "";
String mobile = contr.getMobile();
if(mobile == null)  mobile = "";
String idn = contr.getIdn();
if(idn == null) idn = "";
String email = contr.getEmail();
if(email == null)   email = "";
String fax = contr.getFax();
if(fax == null)   fax = "";

obj.put("guestname", guestname);
obj.put("guestfname", contr.getFname());
obj.put("guestlname", contr.getLname());
obj.put("address", (contr.getAddress() != null) ? contr.getAddress():"" );
obj.put("city", (contr.getCity() != null) ? contr.getCity():"");
obj.put("zip", (contr.getZip() != null) ? contr.getZip():"");
obj.put("countryid", contr.getCountryid().toString());
obj.put("mobile", mobile);
obj.put("phone", phone);
obj.put("email", email);
obj.put("fax", fax);
//obj.put("nationalityid", (guest.getNationalityid() != null) ? guest.getNationalityid().toString():"0");
//obj.put("idtypeid", (guest.getIdtypeid() != null) ? guest.getIdtypeid().toString():"0");
obj.put("idn", (contr.getIdn() != null) ? contr.getIdn():"");
//obj.put("gender", (guest.getGender() != null) ? guest.getGender().intValue():"");
//obj.put("vipstatusid", (guest.getVipstatusid()!= null) ? guest.getVipstatusid().intValue():"0");
obj.put("salutationid", (contr.getSalutationid()!= null) ? contr.getSalutationid().intValue():"0");
obj.put("status", "1");

}catch(Exception e){
    obj.put("status", "0");
    obj.put("error", e.getMessage());
}

%>
<%=obj.toString()%>
