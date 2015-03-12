<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
String type = request.getParameter("type");
if(type == null)    type = "";

String s = "";

for(Enumeration e=request.getParameterNames();e.hasMoreElements();){
    String name = (String)e.nextElement();
    String[] val = request.getParameterValues(name);
    if(val == null) val = new String[0];
    s += name+": ";
    for(int i=0;i<val.length;i++)
        s += val[i]+"; ";
    s += "\n";
}
System.out.println(s);

String action = request.getParameter("action");
String msg = "";
Manager.getInstance().beginTransaction();
try{
    ReservationroomBean rroom = ReservationroomManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("id")));
    boolean createfolio = false;
    GuestBean guest = GuestManager.getInstance().createGuestBean();
    
    if(action.equalsIgnoreCase("edit")) guest = GuestManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("gid")));
    
    for(Enumeration e=request.getParameterNames();e.hasMoreElements();){
        String name = (String)e.nextElement();
        String val = request.getParameter(name);
        if(val == null) val = "";
        val = val.trim();
        
        if(name.equalsIgnoreCase("createfolio")){
            createfolio = true;
        } else if(name.equalsIgnoreCase(type+"guestinfo_salutationid")){
            guest.setSalutationid(new Integer(val));
        } else if(name.equalsIgnoreCase(type+"guestinfo_fname")){
            //String[] names = val.split(" ");
            //guest.setLname(names[0]);
            //if(names.length > 1)
            guest.setFname(val);
        } else if(name.equalsIgnoreCase(type+"guestinfo_lname")){
            //String[] names = val.split(" ");
            //guest.setLname(names[0]);
            //if(names.length > 1)
            guest.setLname(val);
        } else if(name.equalsIgnoreCase(type+"guestinfo_address")){
            guest.setAddress(val);
        } else if(name.equalsIgnoreCase(type+"guestinfo_city")){
            guest.setCity(val);
        } else if(name.equalsIgnoreCase(type+"guestinfo_zip")){
            guest.setZip(val);
        } else if(name.equalsIgnoreCase(type+"guestinfo_countryid")){
            int countryid = Integer.parseInt(val);
            if(countryid > 0)
                //throw new Exception("აირჩიეთ ქვეყანა");
            guest.setCountryid(countryid);
        } else if(name.equalsIgnoreCase(type+"contacttinfo_email")){
            guest.setEmail(val);
        } else if(name.equalsIgnoreCase(type+"contacttinfo_phone")){
            guest.setPhone(val);
        } else if(name.equalsIgnoreCase(type+"contacttinfo_mobile")){
            guest.setMobile(val);
        } else if(name.equalsIgnoreCase(type+"contacttinfo_fax")){
            guest.setFax(val);
        } else if(name.equalsIgnoreCase(type+"guestinfo_idtypeid")){
            if(val.equals("0")) guest.setIdtypeid(null);
            else                guest.setIdtypeid(new Integer(val));
        } else if(name.equalsIgnoreCase(type+"guestinfo_idn")){
            guest.setIdn(val);
        } else if(name.equalsIgnoreCase(type+"guestinfo_nationalityid")){
            if(val.equals("0")) guest.setNationalityid(null);
            else guest.setNationalityid(new Integer(val));
        } else if(name.equalsIgnoreCase(type+"guestinfo_vipstatusid")){
            if(val.equals("0")) guest.setVipstatusid(null);
            else guest.setVipstatusid(new Integer(val));
        }
        
    }
    
    if(guest.getGender() == null)   guest.setGender(2);
    //if(guest.get == null)   guest.setGender(2);
    
    CheckinreservationsettingsBean[] stt = CheckinreservationsettingsManager.getInstance().loadAll();
    if(stt.length > 0){
            if(stt[0].getGuestnamewalkin().booleanValue()){
                if(guest.getFname() == null || guest.getFname().trim().length() == 0)
                    throw new Exception("სტუმრის სახელი არაა მითითებული");
                if(guest.getLname() == null || guest.getLname().trim().length() == 0)
                    throw new Exception("სტუმრის გვარი არაა მითითებული");
            if(stt[0].getAddresswalkin().booleanValue() && (guest.getAddress() == null || guest.getAddress().trim().length() == 0))
                throw new Exception("სტუმრის მისამართი არაა მითითებული");
            if(stt[0].getGuestidnwalkin().booleanValue() && (guest.getIdn() == null || guest.getIdn().trim().length() == 0))
                throw new Exception("სტუმრის საბუთის ნომერი არაა მითითებული");
            if(stt[0].getNationalitywalkin().booleanValue() && guest.getNationalityid()== null)
                throw new Exception("სტუმრის ეროვნება არაა მითითებული");
        }
    }

    guest.setRegbyid(user.getPersonnelid());
    
System.out.println("gid1 = "+guest.getGuestid());
    
    guest = GuestManager.getInstance().save(guest);
    
System.out.println("gid2 = "+guest.getGuestid());

    SharerBean sh = SharerManager.getInstance().createSharerBean();
    sh.setGuestid(guest.getGuestid());
    sh.setReservationroomid(rroom.getReservationroomid());
    sh = SharerManager.getInstance().save(sh);

    if(createfolio){
        FolioBean folio = FolioManager.getInstance().createFolioBean();
        folio.setGuestid(guest.getGuestid());
        folio.setReservationroomid(rroom.getReservationroomid());
        folio.setStatus(0);
        folio.setNum("");
        folio.setRegbyid(user.getPersonnelid());
        folio = FolioManager.getInstance().save(folio);
        folio.setNum(folio.getFolioid().toString());
        folio = FolioManager.getInstance().save(folio);
    }
    
    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1,\"id\":"+guest.getGuestid()+"}";
}catch(Exception e){
    e.printStackTrace();
    Manager.getInstance().endTransaction(false);
    msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}";
}
%>
<%=msg%>
