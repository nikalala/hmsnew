<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
boolean act = false;
if(request.getParameter("act") != null)
    act = true;
JSONObject ob = new JSONObject();
Manager.getInstance().beginTransaction();
try{
    ReservationroomBean reserv = ReservationroomManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("id")));
    ReservationBean res = ReservationManager.getInstance().loadByPrimaryKey(reserv.getReservationid());
    GuestBean guest = GuestManager.getInstance().loadByPrimaryKey(reserv.getGuestid());
    
    int payinstruction = Integer.parseInt(request.getParameter("payinstruction"));
    int paytype = Integer.parseInt(request.getParameter("paytype"));
    int paymentmethodid = Integer.parseInt(request.getParameter("paymentmethodid"));
    String reldate = request.getParameter("reldate");
    String relterm = request.getParameter("relterm");
    String vouchernum = request.getParameter("vouchernum");
    //String rgnum = request.getParameter("rgnum");
    //String billnum = request.getParameter("billnum");
    String platenum = request.getParameter("platenum");
    
    res.setBillto(payinstruction);
    if(paytype == 0){
        if(paymentmethodid == 0)
            throw new Exception("აირჩიეთ გადახდის მეთოდი");
        res.setPaymentmethodid(paymentmethodid);
        res.setPaymentmode(0);
    } else if(paytype == 1){
        if(paymentmethodid == 0)
            throw new Exception("აირჩიეთ გადახდის მეთოდი");
        res.setPaymentcontragentid(paymentmethodid);
        res.setPaymentmode(1);
    }
    if(reldate.trim().length() > 0){
        try{ res.setAdvancepaymentdate(dt.parse(reldate.trim())); } catch(Exception ex){
            throw new Exception("არასწორი რელიზის თარიღი");
        }
        try{ res.setAdvancepaymentamount(new Double(relterm)); } catch(Exception ex){
            throw new Exception("არასწორი პირობა");
        }
    } else {
        res.setAdvancepaymentdate(null);
        res.setAdvancepaymentamount(null);
    }
    res.setVoucher(vouchernum);
    
    res = ReservationManager.getInstance().save(res);
    
    
    Manager.getInstance().endTransaction(true);
    ob.put("result", 1);
    
}catch(Exception e){
    e.printStackTrace();
    Manager.getInstance().endTransaction(false);
    ob.put("result", 0);
    ob.put("error", e.getMessage());
}
%>
<%=ob.toString()%>
