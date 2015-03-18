<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
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
//System.out.println(s);

String msg = "";
Manager.getInstance().beginTransaction();
try{
    boolean printcard = false;
    boolean payregcard = false;
    boolean printfolio = false;
    boolean printbill = false;
    boolean checkin = false;
    int wintype = Integer.parseInt(request.getParameter("wintype"));
    
    int resroomnum = 0;
    for(resroomnum = 0;request.getParameter("walkin_guest_"+String.valueOf(resroomnum+1)) != null;resroomnum++);
    
    ReservationBean res = ReservationManager.getInstance().createReservationBean();
    ReservationroomBean resroom = ReservationroomManager.getInstance().createReservationroomBean();
    ReservationroomBean[] resrooms = new ReservationroomBean[resroomnum];
    PaymentBean payment = PaymentManager.getInstance().createPaymentBean();
    payment.setRegbyid(user.getPersonnelid());
    GuestBean[] guests = new GuestBean[resroomnum];
    resroom.setLeader(true);
    GuestBean guest = GuestManager.getInstance().createGuestBean();
    for(Enumeration e=request.getParameterNames();e.hasMoreElements();){
        String name = (String)e.nextElement();
        String val = request.getParameter(name);
        if(val == null) val = "";
        val = val.trim();
        
        if(name.equalsIgnoreCase("checkin")){
            checkin = true;
        } else if(name.equalsIgnoreCase("guestinfo_guestid")){
            try{
                long gid = Long.parseLong(val);
                if(gid > 0) guest = GuestManager.getInstance().loadByPrimaryKey(gid);
            }catch(Exception ex){ }
        } else if(name.equalsIgnoreCase("guestinfo_salutationid")){
            guest.setSalutationid(new Integer(val));
        } else if(name.equalsIgnoreCase("guestinfo_fname")){
            //String[] names = val.split(" ");
            //guest.setLname(names[0]);
            //if(names.length > 1)
            guest.setFname(val);
        } else if(name.equalsIgnoreCase("guestinfo_lname")){
            //String[] names = val.split(" ");
            //guest.setLname(names[0]);
            //if(names.length > 1)
            guest.setLname(val);
        } else if(name.equalsIgnoreCase("guestinfo_address")){
            guest.setAddress(val);
        } else if(name.equalsIgnoreCase("guestinfo_city")){
            guest.setCity(val);
        } else if(name.equalsIgnoreCase("guestinfo_zip")){
            guest.setZip(val);
        } else if(name.equalsIgnoreCase("guestinfo_countryid")){
            int countryid = Integer.parseInt(val);
            if(countryid > 0)
                //throw new Exception("აირჩიეთ ქვეყანა");
            guest.setCountryid(countryid);
        } else if(name.equalsIgnoreCase("guestinfo_roomid")){
            if(checkin && (val == null || val.equalsIgnoreCase("null") || val.equals("0")))
                throw new Exception("აირჩიეთ ოთახი");
            if(!checkin && val != null && !val.equalsIgnoreCase("null") && !val.equals("0"))
                resroom.setRoomid(new Integer(val));
        } else if(name.equalsIgnoreCase("guestinfo_ratetypeid")){
            if(val == null || val.equalsIgnoreCase("null") || val.equals("0"))
                throw new Exception("აირჩიეთ ოთახის ტიპი");
            resroom.setRatetypeid(new Integer(val));
        } else if(name.equalsIgnoreCase("guestinfo_arrivaldate")){
            if(res.getArraivaldate() != null){
                String arrdate = dtime.format(res.getArraivaldate());
                res.setArraivaldate(dtlong.parse(val+" "+arrdate).getTime());
            } else {
                res.setArraivaldate(dt.parse(val).getTime());
            }
        } else if(name.equalsIgnoreCase("guestinfo_arrivaltime")){
            if(res.getArraivaldate() != null){
                String arrdate = dt.format(res.getArraivaldate());
                res.setArraivaldate(dtlong.parse(arrdate + " " + val).getTime());
            } else {
                res.setArraivaldate(dtime.parse(val).getTime());
            }
        } else if(name.equalsIgnoreCase("guestinfo_departuredate")){
            if(res.getDeparturedate() != null){
                String depdate = dtime.format(res.getDeparturedate());
                res.setDeparturedate(dtlong.parse(val+" "+depdate).getTime());
            } else {
                res.setDeparturedate(dt.parse(val).getTime());
            }
        } else if(name.equalsIgnoreCase("guestinfo_departuretime")){
            if(res.getDeparturedate() != null){
                String depdate = dt.format(res.getDeparturedate());
                res.setDeparturedate(dtlong.parse(depdate + " " + val).getTime());
            } else {
                res.setDeparturedate(dtime.parse(val).getTime());
            }
        } else if(name.equalsIgnoreCase("guestinfo_adult")){
            resroom.setAdult(new Integer(val));
        } else if(name.equalsIgnoreCase("guestinfo_child")){
            resroom.setChild(new Integer(val));
        } else if(name.equalsIgnoreCase("guestinfo_roomtypeid")){
            resroom.setRoomtypeid(new Integer(val));
        } else if(name.equalsIgnoreCase("guestinfo_reservationtypeid")){
            res.setReservationtypeid(new Integer(val));
        } else if(name.equalsIgnoreCase("contacttinfo_email")){
            guest.setEmail(val);
        } else if(name.equalsIgnoreCase("contacttinfo_phone")){
            guest.setPhone(val);
        } else if(name.equalsIgnoreCase("contacttinfo_mobile")){
            guest.setMobile(val);
        } else if(name.equalsIgnoreCase("contacttinfo_fax")){
            guest.setFax(val);
        } else if(name.equalsIgnoreCase("guestinfo_idtypeid")){
            if(val.equals("0")) guest.setIdtypeid(null);
            else                guest.setIdtypeid(new Integer(val));
        } else if(name.equalsIgnoreCase("guestinfo_idn")){
            guest.setIdn(val);
        } else if(name.equalsIgnoreCase("guestinfo_nationalityid")){
            if(val.equals("0")) guest.setNationalityid(null);
            else guest.setNationalityid(new Integer(val));
        } else if(name.equalsIgnoreCase("guestinfo_vipstatusid")){
            if(val.equals("0")) guest.setVipstatusid(null);
            else guest.setVipstatusid(new Integer(val));
        } else if(name.equalsIgnoreCase("payinfo_contragentid")){
            Boolean payinfo_ratetype1 = new Boolean(request.getParameter("payinfo_ratetype1"));
            if(payinfo_ratetype1){
                if(val.equals("0")) throw new Exception("აირჩიეთ სპეციალური ტარიფი");
                res.setContractcontragentid(new Long(val));
            } else res.setContractcontragentid(null);
            
        } else if(name.equalsIgnoreCase("guestinfo_manual")){
            Boolean payinfo_ratetype2 = new Boolean(request.getParameter("payinfo_ratetype2"));
            if(payinfo_ratetype2){
                try{
                    res.setManualrate(new Double(val));
                }catch(Exception ign){ throw new Exception("არასწორი ტარიფი"); }
            } else res.setManualrate(null);
            
            
        } else if(name.equalsIgnoreCase("payinfo_tax")){
            res.setNomanualtax(new Boolean(val));
        } else if(name.equalsIgnoreCase("payinfo_billto")){
            //if(val.equals("-1"))
                //throw new Exception("აირჩიეთ გადამხდელი");
            res.setBillto(new Integer(val));
        } else if(name.equalsIgnoreCase("payinfo_notax")){
            res.setNotax(new Boolean(val));
        } else if(name.equalsIgnoreCase("guestinfo_taxid")){
            res.setTaxexemptionreason(val);
        } else if(name.equalsIgnoreCase("payinfo_paymentmethodid")){
            Boolean payinfo_paymentmode0 = new Boolean(request.getParameter("payinfo_paymentmode0"));
            if(payinfo_paymentmode0){
                if(val.equals("0"))
                    throw new Exception("აირჩიეთ გადახდის მეთოდი");
                res.setPaymentmethodid(new Integer(val));
                res.setPaymentmode(0);
                guest.setPaymentmethodid(new Integer(val));
            } else res.setPaymentmethodid(null);
        } else if(name.equalsIgnoreCase("payinfo_paymentcontragentid")){
            Boolean payinfo_paymentmode1 = new Boolean(request.getParameter("payinfo_paymentmode1"));
            if(payinfo_paymentmode1){
                if(val.equals("0"))
                    throw new Exception("აირჩიეთ გადახდის მეთოდი");
                res.setPaymentcontragentid(new Long(val));
                res.setPaymentmode(1);
                guest.setContragentid(new Integer(val));
            } else res.setPaymentcontragentid(null);
            
        } else if(name.equalsIgnoreCase("payinfo_relesedate")){
            Boolean payinfo_hasrelesedate = new Boolean(request.getParameter("payinfo_hasrelesedate"));
            if(payinfo_hasrelesedate){
                System.out.println(val);
                try{ res.setAdvancepaymentdate(dt.parse(val)); } catch(Exception ex){
                    throw new Exception("არასწორი რელიზის თარიღი");
                }
            } else res.setAdvancepaymentdate(null);
        } else if(name.equalsIgnoreCase("payinfo_term")){
            Boolean payinfo_hasrelesedate = new Boolean(request.getParameter("payinfo_hasrelesedate"));
            if(payinfo_hasrelesedate){
                try{ res.setAdvancepaymentamount(new Double(val)); } catch(Exception ex){
                    throw new Exception("არასწორი პირობა");
                }
            } else res.setAdvancepaymentamount(null);
            
        } else if(name.equalsIgnoreCase("wlakin_other_companyid")){
            res.setCompanyid(new Long(val));
        } else if(name.equalsIgnoreCase("guestinfo_roomnumber")){
            res.setNum(val);
        } else if(name.equalsIgnoreCase("wlakin_other_marketid")){
            if(val.equals("0")) res.setMarketid(null);
            else res.setMarketid(new Integer(val));
        } else if(name.equalsIgnoreCase("wlakin_other_bsourceid")){
            if(val.equals("0")) res.setBsourceid(null);
            else res.setBsourceid(new Integer(val));
        } else if(name.equalsIgnoreCase("wlakin_other_taid")){
            if(val.equals("0")) res.setTaid(null);
            else res.setTaid(new Long(val));
        } else if(name.equalsIgnoreCase("wlakin_other_commissionplan")){
            if(val.equals("-1")) res.setCommissionplan(null);
            else res.setCommissionplan(new Integer(val));
        } else if(name.equalsIgnoreCase("wlakin_other_value")){
            try{ res.setCommissionvalue(new Double(val)); }catch(Exception ex){}
        } else if(name.equalsIgnoreCase("wlakin_other_voucher")){
            res.setVoucher(val);
        } else if(name.equalsIgnoreCase("wlakin_payment_paymentmethod")){
            payment.setPaymentmethodid(new Integer(val));
        } else if(name.equalsIgnoreCase("wlakin_payment_currencyid")){
            payment.setCurrencyid(new Integer(val));
        } else if(name.equalsIgnoreCase("wlakin_payment_amount")){
            if(val.length() > 0){
                try{
                payment.setAmount(new Double(val));
                payment.setPaydate(new Date());
                }catch(Exception ex){
                    throw new Exception("არასწორი გადახდილი თანხა");
                }
            }
        } else if(name.equalsIgnoreCase("wlakin_payment_vaoucher")){
            payment.setVoucherno(val);
        } else if(name.equalsIgnoreCase("walkin_printcard")){
            printcard = new Boolean(val).booleanValue();
        } else if(name.equalsIgnoreCase("walkin_payregcard")){
            payregcard = new Boolean(val).booleanValue();
        } else if(name.equalsIgnoreCase("walkin_printfolio")){
            printfolio = new Boolean(val).booleanValue();
        } else if(name.equalsIgnoreCase("walkin_printbill")){
            printbill = new Boolean(val).booleanValue();
        } else if(name.indexOf("guestinfo_gender") >= 0){
            for(int i=0;i<gender.length;i++){
                if(name.equalsIgnoreCase("guestinfo_gender"+i)){
                    if(val.equalsIgnoreCase("true")){
                        guest.setGender(i);
                        break;
                    }
                }
            }
        } else if(name.equalsIgnoreCase("wlakin_discount_discountid")){
            int discountid = Integer.parseInt(val);
            if(discountid > 0)  res.setDiscountid(discountid);
        } else if(name.equalsIgnoreCase("wlakin_discount_discountplan")){
            int wdiscountplan = Integer.parseInt(val);
            if(wdiscountplan >= 0)  res.setPostingtype(wdiscountplan);
        } else if(name.equalsIgnoreCase("wlakin_discount_nights")){
            try{
                res.setDiscountnights(new Integer(val));
            }catch(Exception ex){}
        } else if(name.equalsIgnoreCase("wlakin_discount_amount")){
            try{
                res.setPostingvalueevery(new Double(val));
            }catch(Exception ex){}
        } else if(name.indexOf("payinfo_ratetype") >= 0){
            for(int i=0;i<ratetype.length;i++){
                if(name.equalsIgnoreCase("payinfo_ratetype"+i)){
                    if(val.equalsIgnoreCase("true")){
                        res.setRatetype(i);
                        break;
                    }
                }
            }
        } else if(name.indexOf("payinfo_paymentmode") >= 0){
            for(int i=0;i<paymentmode.length;i++){
                if(name.equalsIgnoreCase("payinfo_paymentmode"+i)){
                    if(val.equalsIgnoreCase("true")){
                        
                        break;
                    }
                }
            }
        } else if(name.indexOf("walkin_roomid_") >= 0){
            for(int i=0;i<resrooms.length;i++){
                if(resrooms[i] == null) resrooms[i] = ReservationroomManager.getInstance().createReservationroomBean();
                if(guests[i] == null)   guests[i] = GuestManager.getInstance().createGuestBean();
                if(name.equalsIgnoreCase("walkin_roomid_"+String.valueOf(i+1))){
                    resrooms[i].setRoomid(new Integer(val));
                }
            }
        } else if(name.indexOf("walkin_ratetypeid_") >= 0){
            for(int i=0;i<resrooms.length;i++){
                if(resrooms[i] == null) resrooms[i] = ReservationroomManager.getInstance().createReservationroomBean();
                if(guests[i] == null)   guests[i] = GuestManager.getInstance().createGuestBean();
                if(name.equalsIgnoreCase("walkin_ratetypeid_"+String.valueOf(i+1))){
                    resrooms[i].setRatetypeid(new Integer(val));
                }
            }
        } else if(name.indexOf("walkin_adult_") >= 0){
            for(int i=0;i<resrooms.length;i++){
                if(resrooms[i] == null) resrooms[i] = ReservationroomManager.getInstance().createReservationroomBean();
                if(guests[i] == null)   guests[i] = GuestManager.getInstance().createGuestBean();
                if(name.equalsIgnoreCase("walkin_adult_"+String.valueOf(i+1))){
                    resrooms[i].setAdult(new Integer(val));
                }
            }
        } else if(name.indexOf("walkin_child_") >= 0){
            for(int i=0;i<resrooms.length;i++){
                if(resrooms[i] == null) resrooms[i] = ReservationroomManager.getInstance().createReservationroomBean();
                if(guests[i] == null)   guests[i] = GuestManager.getInstance().createGuestBean();
                if(name.equalsIgnoreCase("walkin_child_"+String.valueOf(i+1))){
                    resrooms[i].setChild(new Integer(val));
                }
            }
        } else if(name.indexOf("walkin_salutationid_") >= 0){
            for(int i=0;i<resrooms.length;i++){
                if(resrooms[i] == null) resrooms[i] = ReservationroomManager.getInstance().createReservationroomBean();
                if(guests[i] == null)   guests[i] = GuestManager.getInstance().createGuestBean();
                if(name.equalsIgnoreCase("walkin_salutationid_"+String.valueOf(i+1))){
                    guests[i].setSalutationid(new Integer(val));
                }
            }
        } else if(name.indexOf("walkin_name_") >= 0){
            for(int i=0;i<resrooms.length;i++){
                if(resrooms[i] == null) resrooms[i] = ReservationroomManager.getInstance().createReservationroomBean();
                if(guests[i] == null)   guests[i] = GuestManager.getInstance().createGuestBean();
                if(name.equalsIgnoreCase("walkin_name_"+String.valueOf(i+1))){
                    String[] nms = val.split(" ");
                    guests[i].setFname(nms[0]);
                    guests[i].setLname(nms[1]);
                }
            }
        } else if(name.indexOf("walkin_idtypeid_") >= 0){
            for(int i=0;i<resrooms.length;i++){
                if(resrooms[i] == null) resrooms[i] = ReservationroomManager.getInstance().createReservationroomBean();
                if(guests[i] == null)   guests[i] = GuestManager.getInstance().createGuestBean();
                if(name.equalsIgnoreCase("walkin_idtypeid_"+String.valueOf(i+1))){
                    guests[i].setIdtypeid(new Integer(val));
                }
            }
        } else if(name.indexOf("walkin_idn_") >= 0){
            for(int i=0;i<resrooms.length;i++){
                if(resrooms[i] == null) resrooms[i] = ReservationroomManager.getInstance().createReservationroomBean();
                if(guests[i] == null)   guests[i] = GuestManager.getInstance().createGuestBean();
                if(name.equalsIgnoreCase("walkin_idn_"+String.valueOf(i+1))){
                    guests[i].setIdn(val);
                }
            }
        }
        
    }
    
    if(guest.getGender() == null)   guest.setGender(2);
    //if(guest.get == null)   guest.setGender(2);
    
    if(res.getRatetype() == null)
        throw new Exception("აირჩიეთ ტარიფი");
    //if(res.getPaymentmode()== null)
    //    throw new Exception("აირჩიეთ გადახდის მეთოდი");
    
    
    if(payment.getAmount() != null)
        payment.setPaydate(dclosedate);
    if(payment.getAmount() != null && payment.getPaymentmethodid().intValue() == 0)
        throw new Exception("აირჩიეთ გადახდის ტიპი გადახდაში");
    
    CheckinreservationsettingsBean[] stt = CheckinreservationsettingsManager.getInstance().loadAll();
    if(stt.length > 0){
        if(checkin){
            if(stt[0].getGuestnamewalkin().booleanValue()){
                if(guest.getFname() == null || guest.getFname().trim().length() == 0)
                    throw new Exception("სტუმრის სახელი არაა მითითებული");
                if(guest.getLname() == null || guest.getLname().trim().length() == 0)
                    throw new Exception("სტუმრის გვარი არაა მითითებული");
            }
            if(stt[0].getAddresswalkin().booleanValue() && (guest.getAddress() == null || guest.getAddress().trim().length() == 0))
                throw new Exception("სტუმრის მისამართი არაა მითითებული");
            if(stt[0].getGuestidnwalkin().booleanValue() && (guest.getIdn() == null || guest.getIdn().trim().length() == 0))
                throw new Exception("სტუმრის საბუთის ნომერი არაა მითითებული");
            if(stt[0].getNationalitywalkin().booleanValue() && guest.getNationalityid()== null)
                throw new Exception("სტუმრის ეროვნება არაა მითითებული");
            if(stt[0].getPaymenttypewalkin().booleanValue() && res.getPaymentmode() == null)
                throw new Exception("აირჩიეთ გადახდის მეთოდი");
            if(stt[0].getCompanywalkin().booleanValue() && (res.getCompanyid() == null || res.getCompanyid().longValue() == 0))
                throw new Exception("აირჩიეთ კომპანია");
            if(stt[0].getMarketcodewalkin().booleanValue() && res.getMarketid() == null)
                throw new Exception("სეგმენტი არაა მითითებული");
            if(stt[0].getBsourcewalkin().booleanValue() && res.getBsourceid() == null)
                throw new Exception("აირჩიეთ ბიზნესის წყარო");
            if(stt[0].getTawalkin().booleanValue() && res.getTaid() == null)
                throw new Exception("აირჩიეთ ტურისტული აგენტი");
        } else {
            if(stt[0].getGuestnamereserv().booleanValue()){
                if(guest.getFname() == null || guest.getFname().trim().length() == 0)
                    throw new Exception("სტუმრის სახელი არაა მითითებული");
                if(guest.getLname() == null || guest.getLname().trim().length() == 0)
                    throw new Exception("სტუმრის გვარი არაა მითითებული");
            }
            if(stt[0].getAddressreserv().booleanValue() && (guest.getAddress() == null || guest.getAddress().trim().length() == 0))
                throw new Exception("სტუმრის მისამართი არაა მითითებული");
            if(stt[0].getGuestidnreserv().booleanValue() && (guest.getIdn() == null || guest.getIdn().trim().length() == 0))
                throw new Exception("სტუმრის საბუთის ნომერი არაა მითითებული");
            if(stt[0].getNationalityreserv().booleanValue() && guest.getNationalityid()== null)
                throw new Exception("სტუმრის ეროვნება არაა მითითებული");
            if(stt[0].getPaymenttypereserv().booleanValue() && res.getPaymentmode() == null)
                throw new Exception("აირჩიეთ გადახდის მეთოდი");
            if(stt[0].getCompanyreserv().booleanValue() && (res.getCompanyid() == null || res.getCompanyid().longValue() == 0))
                throw new Exception("აირჩიეთ კომპანია");
            if(stt[0].getMarketcodereserv().booleanValue() && res.getMarketid() == null)
                throw new Exception("სეგმენტი არაა მითითებული");
            if(stt[0].getBsourcereserv().booleanValue() && res.getBsourceid() == null)
                throw new Exception("აირჩიეთ ბიზნესის წყარო");
            if(stt[0].getTareserv().booleanValue() && res.getTaid() == null)
                throw new Exception("აირჩიეთ ტურისტული აგენტი");
        }
    }
    
    if(resroom.getRoomid() != null && resroom.getRoomid().intValue() == 0)
        resroom.setRoomid(null);
    
    if(res.getDiscountid() != null && res.getPostingvalueevery() == null)
        throw new Exception("მიუთითეთ ფასდაკლება");
    if(res.getPostingtype() != null && res.getPostingtype().intValue() == 0 && res.getDiscountnights() == null)
        throw new Exception("მიუთითეთ ფასდაკლების ღამე(ებ)ი");
    if(checkin && resroom.getRoomid() == null)
        throw new Exception("აირჩიეთ ოთახი");
    if(resroom.getRoomtypeid().intValue() == 0)
        throw new Exception("აირჩიეთ ოთახის ტიპი");
    
    if(resroom.getRoomid() != null && !isRoomAvailable(res.getArraivaldate(),res.getDeparturedate(),resroom.getRoomid().intValue())){
            throw new Exception("ოთახი ამ პერიოდში დაკავებულია");
    } else {
        if(!getAvailableRoomtypes(res.getArraivaldate(),res.getDeparturedate(),resroom.getRoomtypeid().intValue()))
            throw new Exception("ოთახის ტიპი ამ პერიოდში დაკავებულია");
    }
    res.setRegbyid(user.getPersonnelid());
    if(!checkin){
        res.setWalkin(false);
        res.setStatus(0);
    } else {
        res.setWalkin(true);
        res.setStatus(-1);
    }
    

    
    
    if(DateUtils.isBeforeDay(new Date(res.getDeparturedate().getTime()), dclosedate)){
        if(resroom.getRoomid() == null) throw new Exception("აირჩიეთ ოთახი");
        res.setStatus(4);
    } else if(DateUtils.isBeforeDay(new Date(res.getArraivaldate().getTime()), dclosedate) || DateUtils.isSameDay(new Date(res.getArraivaldate().getTime()), dclosedate)){
        if(resroom.getRoomid() == null) throw new Exception("აირჩიეთ ოთახი");
        res.setStatus(-1);
    }
    
    res = ReservationManager.getInstance().save(res);
    ReservationtypeBean restype = ReservationtypeManager.getInstance().loadByPrimaryKey(res.getReservationtypeid());
    guest.setRegbyid(user.getPersonnelid());
    guest = GuestManager.getInstance().save(guest);
    resroom.setGuestid(guest.getGuestid());
    resroom.setReservationid(res.getReservationid());
    resroom.setRegbyid(user.getPersonnelid());
    resroom = ReservationroomManager.getInstance().save(resroom);
    /*
    if(resroom.getRoomid() != null){
        RoomstBean roomst = RoomstManager.getInstance().createRoomstBean();
        roomst.setRegbyid(user.getPersonnelid());
        roomst.setRoomid(resroom.getRoomid());
        roomst.setStatusdate(res.getArraivaldate());
        if(checkin) roomst.setSt(1);
        else {
            if(restype.getConfirmed().booleanValue())        roomst.setSt(0);
            else                                             roomst.setSt(7);
        }
        roomst = RoomstManager.getInstance().save(roomst);
        for(int i=0;i<guests.length;i++){
            guests[i].setRegbyid(user.getPersonnelid());
            guests[i] = GuestManager.getInstance().save(guests[i]);
        }
    }
    */
    for(int i=0;i<resrooms.length;i++){
        if(resrooms[i].getRoomid() != null && resrooms[i].getRoomid().intValue() == 0)
            resrooms[i].setRoomid(null);
        resrooms[i].setGuestid(guests[i].getGuestid());
        resrooms[i].setReservationid(res.getReservationid());
        resrooms[i].setRegbyid(user.getPersonnelid());
        resrooms[i] = ReservationroomManager.getInstance().save(resrooms[i]);
        /*
        if(resrooms[i].getRoomid() != null){
            RoomstBean roomst = RoomstManager.getInstance().createRoomstBean();
            roomst.setRegbyid(user.getPersonnelid());
            roomst.setRoomid(resrooms[i].getRoomid());
            roomst.setStatusdate(res.getArraivaldate());
            if(checkin) roomst.setSt(1);
            else {
                if(restype.getConfirmed().booleanValue())        roomst.setSt(0);
                else                                             roomst.setSt(7);
            }
            roomst = RoomstManager.getInstance().save(roomst);
        }
        */
    }
    
    Vector v = (Vector)session.getAttribute("WALKIN_REMARKS");
    if(v == null)   v = new Vector();
    for(int i=0;i<v.size();i++){
        ReasonBean reason = (ReasonBean)v.elementAt(i);
        reason = ReasonManager.getInstance().save(reason);
        ReservationreasonBean resreas = ReservationreasonManager.getInstance().createReservationreasonBean();
        resreas.setReasonid(reason.getReasonid());
        resreas.setReservationid(res.getReservationid());
        resreas = ReservationreasonManager.getInstance().save(resreas);
    }
    
    v = (Vector)session.getAttribute("WALKIN_EXTRACHARGES");
    if(v == null)   v = new Vector();
    folio fl = new folio();

    
    fl.setFolio(res, resroom, payment, dateformats2[dff], v,res.getBillto().intValue(),user);
    
    /*
    switch(res.getBillto().intValue()){
        case 0:
            saveFolio(res, resroom, dateformats2[dff], v, 0, user);
            break;
        case 1:
            saveFolio(res, resroom, dateformats2[dff], v, 1, user);
            break;
        case 2:
            saveFolio(res, resroom, dateformats2[dff], v, 2, user);
            break;
        case 3:
            saveFolio(res, resroom, dateformats2[dff], v, 3, user);
    }
    */

    
    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1,\"id\":"+res.getReservationid()+"}";
}catch(Exception e){
    e.printStackTrace();
    Manager.getInstance().endTransaction(false);
    msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}";
}
%>
<%=msg%>
