<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
JSONObject obj = new JSONObject();
try{
GuestBean guest = GuestManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("id")));
String guestname = guest.getFname() + " " + guest.getLname();
String phone = guest.getPhone();
if(phone == null)   phone = "";
String mobile = guest.getMobile();
if(mobile == null)  mobile = "";
String idn = guest.getIdn();
if(idn == null) idn = "";
String email = guest.getEmail();
if(email == null)   email = "";
String fax = guest.getFax();
if(fax == null)   fax = "";

obj.put("guestname", guestname);
obj.put("address", (guest.getAddress() != null) ? guest.getAddress():"" );
obj.put("city", (guest.getCity() != null) ? guest.getCity():"");
obj.put("zip", (guest.getZip() != null) ? guest.getZip():"");
obj.put("countryid", guest.getCountryid().toString());
obj.put("mobile", mobile);
obj.put("phone", phone);
obj.put("email", email);
obj.put("fax", fax);
obj.put("nationalityid", (guest.getNationalityid() != null) ? guest.getNationalityid().toString():"0");
obj.put("idtypeid", (guest.getIdtypeid() != null) ? guest.getIdtypeid().toString():"0");
obj.put("idn", (guest.getIdn() != null) ? guest.getIdn():"");
obj.put("gender", (guest.getGender() != null) ? guest.getGender().intValue():"");
obj.put("vipstatusid", (guest.getVipstatusid()!= null) ? guest.getVipstatusid().intValue():"0");
obj.put("salutationid", (guest.getSalutationid()!= null) ? guest.getSalutationid().intValue():"0");
obj.put("status", "1");

}catch(Exception e){
    obj.put("status", "0");
    obj.put("error", e.getMessage());
}
%>
<%=obj.toString()%>
