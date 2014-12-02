<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
String msg = "";
boolean act = false;
if(request.getParameter("act") != null)
    act = true;
Manager.getInstance().beginTransaction();
try{
    ReservationroomBean reserv = ReservationroomManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("rid")));
    ReservationBean res = ReservationManager.getInstance().loadByPrimaryKey(reserv.getReservationid());
    FolioBean[] folio = FolioManager.getInstance().loadByWhere("where reservationroomid = "+reserv.getReservationroomid());
    if(act){
//        res.setStatus(0);
//        res = ReservationManager.getInstance().save(res);
//        ReservationreasonManager.getInstance().deleteByWhere("where reservationid = "+res.getReservationid()+" and reasonid in (select reasonid fr)");
//        String sql = "where (particular = 1 || particular = -1) and length(note) > 0 and itemdate = to_date('DD/MM/YYYY','"+dttt.format(res.getArraivaldate())+"') and folioid = "+folio[0].getFolioid();
//        FolioitemManager.getInstance().deleteByWhere(sql);

    } else {
        int reasonid = Integer.parseInt(request.getParameter("reasonid"));
        if(reasonid == 0)   throw new Exception("აირჩიეთ განულების მიზეზი");
        res.setStatus(3);
        res = ReservationManager.getInstance().save(res);
        ReservationreasonBean rs = ReservationreasonManager.getInstance().createReservationreasonBean();
        rs.setReasonid(reasonid);
        rs.setReservationid(res.getReservationid());
        rs = ReservationreasonManager.getInstance().save(rs);
        
        if(reserv.getRoomid() != null){
            RoomstBean roomst = RoomstManager.getInstance().createRoomstBean();
            roomst.setRegbyid(user.getPersonnelid());
            roomst.setRoomid(reserv.getRoomid());
            roomst.setStatusdate(res.getArraivaldate());
            roomst.setSt(8);
            roomst = RoomstManager.getInstance().save(roomst);
        }
    }

    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1,\"id\":"+reserv.getReservationroomid()+"}";
}catch(Exception e){
    e.printStackTrace();
    Manager.getInstance().endTransaction(false);
    msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}";
}
%>
<%=msg%>