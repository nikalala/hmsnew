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
ReservationroomBean reserv = ReservationroomManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("rid")));
ReservationBean res = ReservationManager.getInstance().loadByPrimaryKey(reserv.getReservationid());
Manager.getInstance().beginTransaction();
try{
    if(act.equalsIgnoreCase("del1")){
        ReservationdiscountBean rrb = ReservationdiscountManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("id")));
        FolioitemManager.getInstance().deleteByWhere("where folioid in (select folioid from folio where reservationroomid = "+reserv.getReservationroomid()+") and discountid = "+rrb.getDiscountid());
        ReservationdiscountManager.getInstance().deleteByPrimaryKey(rrb.getReservationdiscountid());
    } else if(act.equalsIgnoreCase("del")){
        FolioitemManager.getInstance().deleteByWhere("where folioid in (select folioid from folio where reservationroomid = "+reserv.getReservationroomid()+") and discountid = "+res.getDiscountid());
        res.setDiscountid(null);
        res.setPostingtype(null);
        res.setPostingvalueevery(null);
        res = ReservationManager.getInstance().save(res);
    } if(act.equalsIgnoreCase("add")){

        
        int discountid = Integer.parseInt(request.getParameter("discountid"));
        int discountplan0 = Integer.parseInt(request.getParameter("discountplan"));
        boolean opendates = Boolean.parseBoolean(request.getParameter("opendates"));
        boolean auditeddates = Boolean.parseBoolean(request.getParameter("auditeddates"));
        int nights = 0;
        double amount = 0;
        if(request.getParameter("nights") != null)  try{nights = Integer.parseInt(request.getParameter("nights"));}catch(Exception ign){}
        if(request.getParameter("amount") != null)  try{amount = Double.parseDouble(request.getParameter("amount"));}catch(Exception ign){}
        long rdid = 0;
        if(res.getDiscountid() == null){
            res.setDiscountid(discountid);
            res.setPostingtype(discountplan0);
            res.setPostingvalueevery(amount);
            res.setDiscountnights(nights);
            res = ReservationManager.getInstance().save(res);
        } else {
            ReservationdiscountBean rb = ReservationdiscountManager.getInstance().createReservationdiscountBean();
            rb.setAuditeddays(auditeddates);
            rb.setDiscountid(discountid);
            rb.setDiscountnights(nights);
            rb.setOpendates(opendates);
            rb.setPostingtype(discountplan0);
            rb.setPostingvalueevery(amount);
            rb.setRegbyid(user.getPersonnelid());
            rb.setReservationid(reserv.getReservationid());
            rb = ReservationdiscountManager.getInstance().save(rb);
            rdid = rb.getReservationdiscountid().longValue();
        }
        
        tariff tr = new tariff();
        String sql = "where folioid in (select folioid from folio where reservationroomid = "+reserv.getReservationroomid()+") and particular = 6 and zvoid = false and manual = false";
        if(!opendates)  sql += " and itemdate < to_date('"+df.format(dclosedate)+"','DD/MM/YYYY')";
        if(!auditeddates)  sql += " and itemdate >= to_date('"+df.format(dclosedate)+"','DD/MM/YYYY')";
        sql += " order by itemdate";
        FolioitemBean[] items = FolioitemManager.getInstance().loadByWhere(sql);
        int n = 0;
        for(int i=0;i<items.length;i++){

            tr.init(reserv.getReservationroomid().longValue(),i);

            FolioitemBean[] fbs = FolioitemManager.getInstance().loadByWhere("where folioid in (select folioid from folio where reservationroomid = "+reserv.getReservationroomid()+") and particular = -1 and itemdate = to_date('"+df.format(items[i].getItemdate())+"','DD/MM/YYYY')");
            if(fbs.length > 0){
                fbs[0].setAmount(tr.tariff_tax);
                fbs[0] = FolioitemManager.getInstance().save(fbs[0]);
            }
            
            n++;
            if(discountplan0 == 0){
                if(n-1 != nights) {
                    continue;
                } else n = 0;
            } else if(discountplan0 == 2){
                if(i > 0)   continue;
            } else if(discountplan0 == 3){
                if(i < items.length-1)  continue;
            }
            
            double dicountvalue = 0;

            if(rdid == 0)
                dicountvalue = tr.tariff_discount1;
            else {
                for(int j=0;j<tr.discounts.length;j++){
                    if(tr.discounts[j].getReservationdiscountid().longValue() == rdid){
                        dicountvalue = tr.discamounts[j];
                        break;
                    }
                }
            }

            
            FolioitemBean fb = FolioitemManager.getInstance().createFolioitemBean();
            fb.setFolioid(items[i].getFolioid());
            fb.setItemdate(items[i].getItemdate());
            fb.setRegbyid(user.getPersonnelid());
            fb.setDiscountid(discountid);
            fb.setAmount((-1)*dicountvalue);
            fb.setDone(false);
            fb.setParticular(4);
            fb = FolioitemManager.getInstance().save(fb);
            
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