<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<%

    String errorContrName = "";
    Manager.getInstance().beginTransaction();
    try {
        
        String rid = request.getParameter("rid");
        String reservId = request.getParameter("resid");
        
        if(request.getParameter("reservationid") != null){
            ReservationroomBean rbr = ReservationroomManager.getInstance().loadByPrimaryKey(Long.parseLong(request.getParameter("reservationid")));
            if(rbr == null)  throw new Exception("არასწორი რეზერვაცია");
            if(rbr.getRoomid() == null)  throw new Exception("მიანიჭეთ ოთახი");
            rid = rbr.getRoomid().toString();
            reservId = rbr.getReservationid().toString();
        }

        System.out.println(rid);
        System.out.println(reservId);
/*
        RoomstBean roomstBean = RoomstManager.getInstance().createRoomstBean();
        roomstBean.setRegbyid(user.getPersonnelid());
        roomstBean.setRoomid(Integer.parseInt(rid));
        roomstBean.setSt(0);
        roomstBean.setStatusdate(lclosedate);
        RoomstManager.getInstance().save(roomstBean);
*/
        ReservationBean rb = ReservationManager.getInstance().loadByPrimaryKey(Long.parseLong(reservId));
        
        if(!df.format(new Date(rb.getArraivaldate().getTime())).equals(df.format(dclosedate)))
            throw new Exception("ჩამოსვლის თარიღი არ ემთხვევა სისტემურ თარიღს. გთხოვთ შეცვალოთ დარჩენის ინფორმაცია.");
        
        rb.setStatus(0);
        ReservationManager.getInstance().save(rb);
        
        Manager.getInstance().endTransaction(true);
        errorContrName = "ოპერაცია შესრულდა წარმატებით";
    } catch (Exception e) {
        e.printStackTrace();
        errorContrName = e.getMessage();
        Manager.getInstance().endTransaction(false);
    }
%>
<script>
    $("#myModalSave").remove();
    $("#myModalCheckin").remove();
</script>
<%=errorContrName%>




