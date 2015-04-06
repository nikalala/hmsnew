<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>
<%
    String format = request.getParameter("format");
    if(format == null)  format = "html";
    String errorContrName = "";
    JSONObject js = new JSONObject();
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

        
/*
        RoomstBean roomstBean = RoomstManager.getInstance().createRoomstBean();
        roomstBean.setRegbyid(user.getPersonnelid());
        roomstBean.setRoomid(Integer.parseInt(rid));
        roomstBean.setSt(1);
        roomstBean.setStatusdate(lclosedate);
        RoomstManager.getInstance().save(roomstBean);
*/
        ReservationBean rb = ReservationManager.getInstance().loadByPrimaryKey(Long.parseLong(reservId));
        
        if(!df.format(new Date(rb.getArraivaldate().getTime())).equals(df.format(dclosedate)))
            throw new Exception("ჩამოსვლის თარიღი არ ემთხვევა სისტემურ თარიღს. გთხოვთ შეცვალოთ დარჩენის ინფორმაცია.");
        
        rb.setStatus(-1);
        ReservationManager.getInstance().save(rb);
        
        Manager.getInstance().endTransaction(true);
        errorContrName = "ოპერაცია შესრულდა წარმატებით";
        js.put("result",1);
        js.put("msg",errorContrName);
    } catch (Exception e) {
        e.printStackTrace();
        errorContrName = e.getMessage();
        Manager.getInstance().endTransaction(false);
        js.put("result",0);
        js.put("errot",errorContrName);
    }
    
if(format.equalsIgnoreCase("html")){
%>
<script>
    $("#myModalSave").remove();
    $("#myModalCheckin").remove();
</script>
<%=errorContrName%>
<%} else if(format.equalsIgnoreCase("json")){%>
<%=js.toString()%>
<%}%>




