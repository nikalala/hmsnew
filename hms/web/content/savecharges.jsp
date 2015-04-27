<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
JSONObject js = new JSONObject();
Manager.getInstance().beginTransaction();
try{

    int payoutid = Integer.parseInt(request.getParameter("type"));
    if(payoutid == 0)   throw new Exception("აირჩიეთ გადასახადის ტიპი");
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
    folioitem.setPayoutid(payoutid);
    folioitem.setRefno(voucherno);
    folioitem.setAmount(amount);
    folioitem.setNote(comment);
    folioitem.setParticular(8);
    folioitem.setFolioid(folioid);
    folioitem.setRegbyid(user.getPersonnelid());
    
    FolioitemBean[] folios = (FolioitemBean[])session.getAttribute("CHARGES_LIST_WHERE");
    if(folios == null)   folios = new FolioitemBean[0];
    folios = appendToArray(folios,folioitem);
    session.setAttribute("CHARGES_LIST_WHERE", (FolioitemBean[])folios);
    
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
