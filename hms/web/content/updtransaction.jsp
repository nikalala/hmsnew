<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
SimpleDateFormat ssdd = new SimpleDateFormat("dd/MM/yyyy");

ReservationroomBean rroom = ReservationroomManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("reservationroomid")));
ReservationBean reserv = ReservationManager.getInstance().loadByPrimaryKey(rroom.getReservationid());
String msg = "";

String[] sels = request.getParameter("sels").split(",");
Date roomdate = dt.parse(request.getParameter("roomdate"));
int ratetypeid = Integer.parseInt(request.getParameter("ratetypeid"));
Boolean updtariff = new Boolean(request.getParameter("updtariff"));
double manualrate = Double.parseDouble(request.getParameter("manualrate"));
Boolean incl = new Boolean(request.getParameter("incl"));
int adult = Integer.parseInt(request.getParameter("adult"));
int child = Integer.parseInt(request.getParameter("child"));
Boolean onlydate = new Boolean(request.getParameter("onlydate"));
Boolean wholeperiod = new Boolean(request.getParameter("wholeperiod"));

System.out.println("incl = "+incl);
if(incl){
    TaxBean[] tax = TaxManager.getInstance().loadByWhere("limit 1");
    if(tax[0].getPostingtype().intValue() == 0)
        manualrate = manualrate * 100 / (100 + tax[0].getAmount().doubleValue());
    else
        manualrate -= tax[0].getAmount().doubleValue();
}

Manager.getInstance().beginTransaction();
try{
    rroom.setRatetypeid(ratetypeid);
    rroom.setAdult(adult);
    rroom.setChild(child);
    rroom = ReservationroomManager.getInstance().save(rroom);
    
    
    if(updtariff){
        folio fl = new folio();
        for(int i=0;i<sels.length;i++)
            fl.reSetFolio1(reserv, user,Integer.parseInt(sels[i]));
    }
    /*
    String foliosql = "where folioid in (select folioid from folio where reservationroomid = "+rroom.getReservationroomid()+" and guestid = "+rroom.getGuestid()+")";   // and "
//            + "roomid = "+rroom.getRoomid();
    if(onlydate.booleanValue())
        foliosql += " and itemdate = to_date('"+ssdd.format(roomdate)+"','DD/MM/YYYY')";
    FolioitemBean[] items = FolioitemManager.getInstance().loadByWhere(foliosql);
    
    for(int i=0;i<items.length;i++){
        if(onlydate.booleanValue() && i > 0)
            break;
        int particular = items[i].getParticular().intValue();
        tariff trf = new tariff();
        int day = folio.getFolioDay(items[i]);
        trf.init(rroom.getReservationroomid().longValue(),day);
        trf.manualrate = manualrate;
        trf.getTraiffPars();
        
        if(items[i].getRoomid() != null && items[i].getRoomid().intValue() == rroom.getRoomid().intValue()){
            items[i].setAmount(manualrate);
            items[i].setDone(true);
        } else if(particular == 4){
            items[i].setAmount((-1)*trf.tariff_discount);
        } else if(particular == -1){
            if(items[i].getTaxid() != null){
                items[i].setAmount(trf.tariff_tax);
            }
        } else if(particular == 0){
            
        }
        items[i] = FolioitemManager.getInstance().save(items[i]);
    }
    */
    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1}";
}catch(Exception e){
    Manager.getInstance().endTransaction(false);
    e.printStackTrace();
    msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}"; 
    }
%>
<%=msg%>
