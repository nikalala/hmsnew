<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<%

    String errorContrName = "";
    Manager.getInstance().beginTransaction();
    try {
        request.setCharacterEncoding("UTF-8");
        String rid = request.getParameter("rid");
        String rti = request.getParameter("rti");
        String rrid = request.getParameter("rrid");
System.out.println("renewRoomPricech = "+request.getParameter("renewRoomPricech"));
        RoomstBean roomstBean = RoomstManager.getInstance().createRoomstBean();
        roomstBean.setRegbyid(user.getPersonnelid());

        Integer reservRoomId = Integer.parseInt(rid);
        roomstBean.setRoomid(reservRoomId);

        ReservationtypeBean rtb = ReservationtypeManager.getInstance().loadByPrimaryKey( Integer.parseInt(rti) );
        System.out.println(rtb);
        roomstBean.setSt(rtb.getConfirmed() ? 0 : 7);
        roomstBean.setStatusdate(lclosedate);
        RoomstManager.getInstance().save(roomstBean);

        ReservationroomBean rrb = ReservationroomManager.getInstance().loadByPrimaryKey( Long.parseLong(rrid));
        rrb.setRoomid(reservRoomId);
        ReservationroomManager.getInstance().save(rrb);
        Manager.getInstance().endTransaction(true);
    } catch (Exception e) {
        e.printStackTrace();
        Manager.getInstance().endTransaction(false);
    }
%>
<%="{\"status\":\""+errorContrName+"\"}"%>




