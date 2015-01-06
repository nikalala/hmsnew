<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
String msg = "";
Manager.getInstance().beginTransaction();
try{
    long id = 0;
    ReservationroomBean reserv = ReservationroomManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("rrid")));
    ReservationBean res = ReservationManager.getInstance().loadByPrimaryKey(reserv.getReservationid());
    int newroomid = Integer.parseInt(request.getParameter("rid"));
    RoomBean room = RoomManager.getInstance().loadByPrimaryKey(newroomid);
    int oldroomid = reserv.getRoomid().intValue();
    boolean renewtariffs = new Boolean(request.getParameter("renewRoomPricech")).booleanValue();

//System.out.println("oldroomid = "+oldroomid);
    reserv.setRoomtypeid(room.getRoomtypeid());
    reserv.setRoomid(newroomid);
    reserv = ReservationroomManager.getInstance().save(reserv);
    
    //int oldstatus = (int)getSum("select getroomstatus("+oldroomid+",'"+dtlongs.format(new Date())+"')");
    
    int status = getRoomStatus(dclosedate, oldroomid);
    
    RoomstBean rms = RoomstManager.getInstance().createRoomstBean();
    rms.setRoomid(oldroomid);
    rms.setSt(8);
    rms.setStatusdate(lclosedate);
    rms.setRegbyid(user.getPersonnelid());
    rms = RoomstManager.getInstance().save(rms);
    
    rms = RoomstManager.getInstance().createRoomstBean();
    rms.setRoomid(newroomid);
    //rms.setSt(oldstatus);
    rms.setSt(status);
    rms.setStatusdate(lclosedate);
    rms.setRegbyid(user.getPersonnelid());
    rms = RoomstManager.getInstance().save(rms);
    
    String sql = "where "
            + "folioid in (select folioid from folio where reservationroomid = "+reserv.getReservationroomid()+") and "
            + "itemdate > to_date('"+df.format(dclosedate)+"','DD/MM/YYYY') and "
            + "done = false and "
            + "roomid = "+oldroomid;
    FolioitemBean[] folioitems = FolioitemManager.getInstance().loadByWhere(sql);
    for(int i=0;i<folioitems.length;i++){
        folioitems[i].setRoomid(newroomid);
    }
    folioitems = FolioitemManager.getInstance().save(folioitems);
    
    if(renewtariffs){
        sql = "where "
            + "folioid in (select folioid from folio where reservationroomid = "+reserv.getReservationroomid()+") and "
            + "itemdate > to_date('"+df.format(dclosedate)+"','DD/MM/YYYY') and "
            + "done = false "
            + "order by itemdate asc";
        folioitems = FolioitemManager.getInstance().loadByWhere(sql);
        folio fl = new folio();
        
        fl.changeFolio(folioitems, user, newroomid);
    }
    
    //if(id == 0) throw new Exception("შეცდომა");
    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1,\"id\":"+rms.getSt()+"}";
}catch(Exception e){
    e.printStackTrace();
    Manager.getInstance().endTransaction(false);
    msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}";
}
    
%>
<%=msg%>
