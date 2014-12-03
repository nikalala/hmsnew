<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<%

    String errorContrName = "";
    Manager.getInstance().beginTransaction();
    try {
        String rid = request.getParameter("rid");
        String reservId = request.getParameter("resid");

        System.out.println(rid);
        System.out.println(reservId);

        RoomstBean roomstBean = RoomstManager.getInstance().createRoomstBean();
        roomstBean.setRegbyid(user.getPersonnelid());
        roomstBean.setRoomid(Integer.parseInt(rid));
        roomstBean.setSt(1);
        roomstBean.setStatusdate(lclosedate);
        RoomstManager.getInstance().save(roomstBean);

        ReservationBean rb = ReservationManager.getInstance().loadByPrimaryKey(Long.parseLong(reservId));
        rb.setStatus(-1);
        ReservationManager.getInstance().save(rb);

        Manager.getInstance().endTransaction(true);
        errorContrName = "ოპერაცია შესრულდა წარმატებით";
    } catch (Exception e) {
        e.printStackTrace();
        errorContrName = "მოხდა შეცდომა";
        Manager.getInstance().endTransaction(false);
    }
%>

<%=errorContrName%>




