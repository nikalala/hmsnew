<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
    
for(Enumeration e=request.getParameterNames();e.hasMoreElements();){
    String name = (String)e.nextElement();
    String val = request.getParameter(name);
    System.out.println(name + " = " + val);
}
    
String msg = "";
Manager.getInstance().beginTransaction();
try{
    long id = 0;
    ReservationroomBean rroom = ReservationroomManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("reservationroomid")));
    
    int editguestinfo_salutationid = Integer.parseInt(request.getParameter("editguestinfo_salutationid"));
    String editguestinfo_address = request.getParameter("editguestinfo_address").trim();
    String editguestinfo_city = request.getParameter("editguestinfo_city").trim();
    String editguestinfo_zip = request.getParameter("editguestinfo_zip").trim();
    int editguestinfo_countryid = Integer.parseInt(request.getParameter("editguestinfo_countryid"));
    
    int editguestinfo_vipstatusid = Integer.parseInt(request.getParameter("editguestinfo_vipstatusid"));
    int editguestinfo_nationalityid = Integer.parseInt(request.getParameter("editguestinfo_nationalityid"));
    int editguestinfo_idtypeid = Integer.parseInt(request.getParameter("editguestinfo_idtypeid"));
    String editguestinfo_idn = request.getParameter("editguestinfo_idn").trim();
    String editguestinfo_fax = request.getParameter("editcontacttinfo_fax").trim();
    String editguestinfo_mobile = request.getParameter("editcontacttinfo_mobile").trim();
    String editguestinfo_phone = request.getParameter("editcontacttinfo_phone").trim();
    String editguestinfo_email = request.getParameter("editcontacttinfo_email").trim();
    String editguestinfo_fname = request.getParameter("editguestinfo_fname").trim();
    String editguestinfo_lname = request.getParameter("editguestinfo_lname").trim();
    
    int editguestinfo_guestid = Integer.parseInt(request.getParameter("editguestinfo_guestid"));
    
    //String[] names = editguestinfo_name.split(" ",2);
    
    if(editguestinfo_countryid == 0)
        throw new Exception("აირჩიეთ ქვეყანა");
    if(editguestinfo_nationalityid == 0)
        throw new Exception("აირჩიეთ ეროვნება");
    if(editguestinfo_idtypeid == 0)
        throw new Exception("აირჩიეთ საბუთის ტიპი");
    if(editguestinfo_fname.length() == 0)
        throw new Exception("შეიყვანეთ სტუმრის სახელი");
    if(editguestinfo_lname.length() == 0)
        throw new Exception("შეიყვანეთ სტუმრის გვარი");
    GuestBean guest = GuestManager.getInstance().createGuestBean();
    if(editguestinfo_guestid > 0)
        guest = GuestManager.getInstance().loadByPrimaryKey(new Long(editguestinfo_guestid));
    guest.setSalutationid(editguestinfo_salutationid);
    guest.setCountryid(editguestinfo_countryid);
    guest.setAddress(editguestinfo_address);
    guest.setCity(editguestinfo_city);
    guest.setZip(editguestinfo_zip);
    
    if(editguestinfo_vipstatusid > 0)
        guest.setVipstatusid(editguestinfo_vipstatusid);
    guest.setNationalityid(editguestinfo_nationalityid);
    guest.setIdtypeid(editguestinfo_idtypeid);
    guest.setIdn(editguestinfo_idn);
    guest.setFax(editguestinfo_fax);
    guest.setMobile(editguestinfo_mobile);
    guest.setPhone(editguestinfo_phone);
    guest.setEmail(editguestinfo_email);
    guest.setLname(editguestinfo_lname);
    guest.setFname(editguestinfo_fname);
    
    guest = GuestManager.getInstance().save(guest);
    
    rroom.setGuestid(guest.getGuestid());
    
    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1,\"id\":"+id+"}";
}catch(Exception e){
    e.printStackTrace();
    Manager.getInstance().endTransaction(false);
    msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}";
}
    
%>
<%=msg%>
