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
JSONObject ob = new JSONObject();
String act = request.getParameter("act");
Manager.getInstance().beginTransaction();
try{
    if(act.equalsIgnoreCase("del")){
        
    } else if(act.equalsIgnoreCase("edit")){
        
    } if(act.equalsIgnoreCase("add")){

        Date date = dt.parse(request.getParameter("date"));
        
        int actiontype = Integer.parseInt(request.getParameter("actiontype"));
        if(actiontype < 0)  throw new Exception("აირჩიეთ ტიპი");
        int actionvalue = Integer.parseInt(request.getParameter("actionvalue"));
        int currencyid = Integer.parseInt(request.getParameter("currencyid"));
        int discountid = 0;
        try{ discountid = Integer.parseInt(request.getParameter("discountid")); }catch(Exception ign){}
        double amount = 0;
        try{ amount = Double.parseDouble(request.getParameter("amount")); }catch(Exception ign){ throw new Exception("აირჩიეთ თანხა"); }
        double qty = 0;
        try{ qty = Double.parseDouble(request.getParameter("qty")); }catch(Exception ign){}
        String voucher = request.getParameter("voucher").trim();
        String comment = request.getParameter("comment").trim();
        long folioid = Long.parseLong(request.getParameter("folioid"));
        double discount = 0;
        if(request.getParameter("discount").length() > 0)
            discount = Double.parseDouble(request.getParameter("discount"));
        
        FolioBean folio = FolioManager.getInstance().loadByPrimaryKey(folioid);
        ReservationroomBean resroom = ReservationroomManager.getInstance().loadByPrimaryKey(folio.getReservationroomid());
        ReservationBean res = ReservationManager.getInstance().loadByPrimaryKey(resroom.getReservationid());
        //if(res.getArraivaldate().after(date))   throw new Exception("თარიღი ნაკლებია ჩამოსვლის თარიღზე");
        //if(res.getDeparturedate().before(date))   throw new Exception("თარიღი მეტია გაწერის თარიღზე თარიღზე");
        if(discountid > 0 && discount == 0)
            throw new Exception("აირჩიეთ ფასდაკლების მნიშვნელობა");
        
        FolioitemBean fitem = FolioitemManager.getInstance().createFolioitemBean();
        fitem.setFolioid(folioid);
        fitem.setItemdate(date);
        fitem.setNote(comment);
        fitem.setAmount(amount);
        fitem.setParticular(actiontype);
        fitem.setRegbyid(user.getPersonnelid());
        fitem.setManual(true);
        fitem.setDone(false);
        
        ExtrachargefolioBean ex = null;

        if(actiontype == 0){                // შესწორება
                         
        } else if(actiontype == 1){         // ბანკი
            PaymentBean payment = PaymentManager.getInstance().createPaymentBean();
            payment.setRegbyid(user.getPersonnelid());
            payment.setPaymentmethodid(actionvalue);
            payment.setCurrencyid(currencyid);
            payment.setAmount(amount);
            payment.setPaydate(date);
            payment.setVoucherno(voucher);
            payment.setFolioid(folioid);
            payment = PaymentManager.getInstance().save(payment);
            fitem.setPaymentid(payment.getPaymentid());
        } else if(actiontype == 2){         // ნაღდი
            PaymentBean payment = PaymentManager.getInstance().createPaymentBean();
            payment.setRegbyid(user.getPersonnelid());
            payment.setPaymentmethodid(actionvalue);
            payment.setCurrencyid(currencyid);
            payment.setAmount(amount);
            payment.setPaydate(date);
            payment.setVoucherno(voucher);
            payment.setFolioid(folioid);
            payment = PaymentManager.getInstance().save(payment);
            fitem.setPaymentid(payment.getPaymentid());
        } else if(actiontype == 3){         // კონტრაქტორი
            /*
            PaymentBean payment = PaymentManager.getInstance().createPaymentBean();
            payment.setRegbyid(user.getPersonnelid());
            payment.setPaymentmethodid(actionvalue);
            payment.setCurrencyid(currencyid);
            payment.setAmount(amount);
            payment.setPaydate(date);
            payment.setVoucherno(voucher);
            payment.setFolioid(folioid);
            payment = PaymentManager.getInstance().save(payment);
            fitem.setPaymentid(payment.getPaymentid());
            */
        } else if(actiontype == 4){         // ფასდაკლება
            fitem.setDiscountid(actionvalue);
            fitem.setAmount((-1)*amount);
        } else if(actiontype == 5){         // მომსახურება
            fitem.setExtrachargeid(actionvalue);
            ex = ExtrachargefolioManager.getInstance().createExtrachargefolioBean();
            ex.setPostingtype(-1);

            ex.setChargeapplyrieson(4);
            ex.setQty((int)qty);
            ex.setExtrachargeid(actionvalue);
            ex.setAdult(1);
            double rate0 = amount;
            if(discountid > 0){
                DiscountBean dsc = DiscountManager.getInstance().loadByPrimaryKey(discountid);
                if(dsc.getPerctype().booleanValue())    rate0 = amount - amount*discount/100;
                else                                    rate0 = amount - discount;
            }
            ex.setRate(rate0);
        } else if(actiontype == 6){     // ოთახის გადასახადი
            
        } else if(actiontype == 7){     // გადატანა
            
        }
        
        fitem = FolioitemManager.getInstance().save(fitem);
        if(ex != null){
            ex.setFolioitemid(fitem.getFolioitemid());
            ex = ExtrachargefolioManager.getInstance().save(ex);
        }
    }
    
    
    Manager.getInstance().endTransaction(true);
    ob.put("result", 1);
}catch(Exception e){
    e.printStackTrace();
    Manager.getInstance().endTransaction(false);
    ob.put("result", 0);
    ob.put("error",e.getMessage());
}

%>
<%=ob.toString()%>