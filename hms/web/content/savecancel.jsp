<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
boolean act = false;
if(request.getParameter("act") != null)
    act = true;
String msg = "";
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

        System.out.println(request.getParameter("cancel_reasonid"));
        int reasonid = Integer.parseInt(request.getParameter("cancel_reasonid"));

        System.out.println("HEREEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE1");
        if(reasonid == 0)   throw new Exception("აირჩიეთ გაუქმების მიზეზი");
        double cancellationfee = 0;
        try{
            System.out.println("HEREEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE2");
            cancellationfee = Double.parseDouble(request.getParameter("cancel_cancellationfee").trim());
            System.out.println("HEREEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE3");
        }catch(Exception e){
            if(request.getParameter("cancel_cancellationfee").trim().length() > 0)
                System.out.println("HEREEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE4");
                throw new Exception("არასწორი გაუქმების თანხა");
        }


        res.setStatus(1);
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


        ReasonBean reason = ReasonManager.getInstance().loadByPrimaryKey(reasonid);

        if(folio.length > 0){
            FolioitemBean fb = FolioitemManager.getInstance().createFolioitemBean();
            fb.setFolioid(folio[0].getFolioid());
            fb.setItemdate(res.getArraivaldate());
            fb.setRegbyid(user.getPersonnelid());
            fb.setAmount(cancellationfee);
            fb.setDone(true);
            fb.setParticular(6);
            fb.setRoomoper(0);
            fb.setNote(reason.getName());
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