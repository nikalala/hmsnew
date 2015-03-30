<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
boolean act = false;
if(request.getParameter("act") != null)
    act = true;
String msg = "";
SimpleDateFormat dttt = new SimpleDateFormat("DD/MM/YYYY");
Manager.getInstance().beginTransaction();
try{
    ReservationroomBean reserv = ReservationroomManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("rid")));
    ReservationBean res = ReservationManager.getInstance().loadByPrimaryKey(reserv.getReservationid());
    FolioBean[] folio = FolioManager.getInstance().loadByWhere("where reservationroomid = "+reserv.getReservationroomid());
    if(act){
        //res.setStatus(0);
        //res = ReservationManager.getInstance().save(res);
        //ReservationreasonManager.getInstance().deleteByReservationid(res.getReservationid());
        //String sql = "where (particular = 1 || particuler = -1) and length(note) > 0 and itemdate = to_date('DD/MM/YYYY','"+dttt.format(res.getArraivaldate())+"') and folioid = "+folio[0].getFolioid();
        //FolioitemManager.getInstance().deleteByWhere(sql);
    } else {
    
        int reasonid = Integer.parseInt(request.getParameter("nowshow_reasonid"));
        String newreason = request.getParameter("nowshow_newreason");
        if(reasonid == 0 && (newreason == null || newreason.trim().length() == 0))   throw new Exception("აირჩიეთ არ გამოცხადების მიზეზი");
        if(reasonid == 0){
            ReasonBean resn = ReasonManager.getInstance().createReasonBean();
            resn.setReasoncategory(7);
            resn.setName(newreason);
            resn.setRegbyid(user.getPersonnelid());
            resn = ReasonManager.getInstance().save(resn);
            reasonid = resn.getReasonid().intValue();
        }
        double cancellationfee = 0;
        try{
            cancellationfee = Double.parseDouble(request.getParameter("nowshow_cancellationfee").trim());
        }catch(Exception e){
            if(request.getParameter("nowshow_cancellationfee").trim().length() > 0)
                throw new Exception("არასწორი არ გამოცხადების თანხა");
        }
        res.setStatus(2);
        res = ReservationManager.getInstance().save(res);
        ReservationreasonBean rs = ReservationreasonManager.getInstance().createReservationreasonBean();
        rs.setReasonid(reasonid);
        rs.setReservationid(res.getReservationid());
        rs.setRegbyid(user.getPersonnelid());
        rs = ReservationreasonManager.getInstance().save(rs);
/*
        if(reserv.getRoomid() != null){
            RoomstBean roomst = RoomstManager.getInstance().createRoomstBean();
            roomst.setRegbyid(user.getPersonnelid());
            roomst.setRoomid(reserv.getRoomid());
            roomst.setStatusdate(res.getArraivaldate());
            roomst.setSt(8);
            roomst = RoomstManager.getInstance().save(roomst);
        }
*/

        ReasonBean reason = ReasonManager.getInstance().loadByPrimaryKey(reasonid);

        if(folio.length > 0){
            FolioitemBean fb = FolioitemManager.getInstance().createFolioitemBean();
            fb.setFolioid(folio[0].getFolioid());
            fb.setItemdate(res.getArraivaldate());
            fb.setRegbyid(user.getPersonnelid());
            fb.setAmount(cancellationfee);
            fb.setDone(true);
            fb.setParticular(6);
            fb.setRoomoper(4);
            fb.setNote(reason.getName());
            fb.setReservationroomid(reserv.getReservationroomid());
            fb = FolioitemManager.getInstance().save(fb);

            tariff trf = new tariff();
            trf.init(reserv.getReservationroomid(),0);

            fb = FolioitemManager.getInstance().createFolioitemBean();
            fb.setFolioid(folio[0].getFolioid());
            fb.setItemdate(res.getArraivaldate());
            fb.setRegbyid(user.getPersonnelid());
            fb.setTaxid(trf.taxid);
            fb.setAmount(trf.tariff_tax);
            fb.setDone(true);
            fb.setParticular(-1);
            fb.setNote(reason.getName());
            fb.setReservationroomid(reserv.getReservationroomid());
            fb = FolioitemManager.getInstance().save(fb);
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