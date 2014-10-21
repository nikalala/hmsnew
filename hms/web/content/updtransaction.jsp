<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
SimpleDateFormat ssdd = new SimpleDateFormat("dd/MM/yyyy");

ReservationroomBean rroom = ReservationroomManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("reservationroomid")));
ReservationBean reserv = ReservationManager.getInstance().loadByPrimaryKey(rroom.getReservationid());
String msg = "";

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
System.out.println("manualrate = "+manualrate);
Manager.getInstance().beginTransaction();
try{
    String foliosql = "where folioid in (select folioid from folio where reservationroomid = "+rroom.getReservationroomid()+" and guestid = "+rroom.getGuestid()+") and "
            + "roomid = "+rroom.getRoomid()+" and itemdate = to_date('"+ssdd.format(roomdate)+"','DD/MM/YYYY')";
    FolioitemBean[] items = FolioitemManager.getInstance().loadByWhere(foliosql);
    items[0].setAmount(manualrate);
    //items[0].set
    items[0] = FolioitemManager.getInstance().save(items[0]);
    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1}";
}catch(Exception e){
    Manager.getInstance().endTransaction(false);
    e.printStackTrace();
    msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}"; 
    }
%>
<%=msg%>
