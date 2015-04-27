<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
JSONObject js = new JSONObject();
String oper = request.getParameter("oper");
Manager.getInstance().beginTransaction();
try{

    if(oper.equalsIgnoreCase("del")){
        
        long folioid = Long.parseLong(request.getParameter("folioid"));
        FolioitemManager.getInstance().deleteByFolioid(folioid);
        PaymentManager.getInstance().deleteByFolioid(folioid);
        FolioManager.getInstance().deleteByPrimaryKey(folioid);
    } else {
    
        String voucher_nom = request.getParameter("voucher_nom");
        String voucher_date = request.getParameter("voucher_date");
        int paymentmethodid = Integer.parseInt(request.getParameter("voucher_paym"));
        long cid = Long.parseLong(request.getParameter("contragentid"));
        long gid = Long.parseLong(request.getParameter("guestid"));

        long folioid = Long.parseLong(request.getParameter("folioid"));
        FolioBean folio = FolioManager.getInstance().createFolioBean();
        boolean newfolio = true;
        if(folioid == 0){
            if(cid == 0 && gid == 0)
                throw new Exception("აირჩიეთ კონტაქტი");
            folio.setExpence(true);
            folio.setNum(voucher_nom);
            folio.setRegbyid(user.getPersonnelid());
            folio.setStatus(-1);
        } else {
            newfolio = false;
            folio = FolioManager.getInstance().loadByPrimaryKey(folioid);
        }
        if(cid > 0) folio.setContragentid(cid);
        if(gid > 0) folio.setGuestid(gid);
        folio = FolioManager.getInstance().save(folio);
        folioid = folio.getFolioid().longValue();

        FolioitemBean[] charges = (FolioitemBean[])session.getAttribute("CHARGES_LIST_WHERE");
        if(charges == null)   charges = new FolioitemBean[0];
        FolioitemBean[] payments = (FolioitemBean[])session.getAttribute("EXPENCES_LIST_WHERE");
        if(payments == null)   payments = new FolioitemBean[0];
        double bal = 0;
        PaymentBean[] exps = (PaymentBean[])session.getAttribute("PAYMENTS_EXPENCES_LIST_WHERE");
        for(int i=0;i<payments.length;i++){
            exps[i].setFolioid(folioid);
            exps[i].setPaydate(dt.parse(voucher_date));
            exps[i].setVoucherno(voucher_nom);
            exps[i].setRegbyid(user.getPersonnelid());
            exps[i].setPaymentmethodid(paymentmethodid);
            exps[i] = PaymentManager.getInstance().save(exps[i]);
            payments[i].setFolioid(folioid);
            payments[i].setPaymentid(exps[i].getPaymentid());
            payments[i].setItemdate(dt.parse(voucher_date));
            bal += payments[i].getAmount().doubleValue();
        }

        for(int i=0;i<charges.length;i++){
            charges[i].setFolioid(folioid);
            charges[i].setItemdate(dt.parse(voucher_date));
            bal += charges[i].getAmount().doubleValue();
        }
        
        if(charges.length == 0 && payments.length == 0) throw new Exception("ცარიელი ხარჯის შენახვა შეუძლებელია");
        if(newfolio && bal != 0) throw new Exception("გაასწორეთ ბალანსი");
        charges = FolioitemManager.getInstance().save(charges);
        payments = FolioitemManager.getInstance().save(payments);
        

        js.put("id",1);
    }
    Manager.getInstance().endTransaction(true);
    js.put("result",1);
}catch(Exception e){
    e.printStackTrace();
    Manager.getInstance().endTransaction(false);
    js.put("result",0);
    js.put("error",e.getMessage());
}
    
%>
<%=js.toString()%>
