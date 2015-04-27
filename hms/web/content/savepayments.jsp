<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
JSONObject js = new JSONObject();
Manager.getInstance().beginTransaction();
try{

    int paymentmethodid = Integer.parseInt(request.getParameter("type"));
    if(paymentmethodid == 0)   throw new Exception("აირჩიეთ გადასახადის ტიპი");
    int currencyid = Integer.parseInt(request.getParameter("currencyid"));
    double amount = 0;
    try{
        amount = Double.parseDouble(request.getParameter("amount"));
    }catch(Exception ex){ throw new Exception("არასწორი თანხა"); }
    if(amount < 0)  throw new Exception("თანხა არ შეიძლება იყოს უარყოფითი");
    
    
    String voucherno = request.getParameter("voucherno");
    String comment = request.getParameter("comment");
    
    //String voucher_nom = request.getParameter("voucher_nom");
    //String voucher_date = request.getParameter("voucher_date");
    //int paymentmethodid = Integer.parseInt(request.getParameter("voucher_paym"));
    
    long folioid = Long.parseLong(request.getParameter("folioid"));
    
    FolioitemBean folioitem = FolioitemManager.getInstance().createFolioitemBean();
    folioitem.setRefno(voucherno);
    folioitem.setAmount(-1*amount);
    folioitem.setNote(comment);
    folioitem.setParticular(2);
    folioitem.setFolioid(folioid);
    folioitem.setRegbyid(user.getPersonnelid());
    
    FolioitemBean[] folios = (FolioitemBean[])session.getAttribute("EXPENCES_LIST_WHERE");
    if(folios == null)   folios = new FolioitemBean[0];
    folios = appendToArray(folios,folioitem);
    session.setAttribute("EXPENCES_LIST_WHERE", (FolioitemBean[])folios);
    
    PaymentBean payment = PaymentManager.getInstance().createPaymentBean();
    payment.setAmount(amount);
    payment.setCurrencyid(currencyid);
    payment.setFolioid(folioid);
    payment.setPaymentmethodid(paymentmethodid);
    payment.setRegbyid(user.getPersonnelid());
    
    PaymentBean[] payments = (PaymentBean[])session.getAttribute("PAYMENTS_EXPENCES_LIST_WHERE");
    if(payments == null)   payments = new PaymentBean[0];
    payments = appendToArray(payments,payment);
    session.setAttribute("PAYMENTS_EXPENCES_LIST_WHERE", (PaymentBean[])payments);
    
    
    Manager.getInstance().endTransaction(true);
    js.put("result",1);
    js.put("id",1);
}catch(Exception e){
    e.printStackTrace();
    Manager.getInstance().endTransaction(false);
    js.put("result",0);
    js.put("error",e.getMessage());
}
    
%>
<%=js.toString()%>
