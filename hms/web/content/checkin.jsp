<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<%

    String errorContrName = "";
    Manager.getInstance().beginTransaction();
    try {
        String rid = request.getParameter("rid");
        System.out.println(rid);
        RoomstBean roomstBean = RoomstManager.getInstance().createRoomstBean();
        roomstBean.setRegbyid(user.getPersonnelid());
        roomstBean.setRoomid(Integer.parseInt(rid));
        roomstBean.setSt(1);
        roomstBean.setStatusdate(lclosedate);
        RoomstManager.getInstance().save(roomstBean);
        Manager.getInstance().endTransaction(true);
    } catch (Exception e) {
        e.printStackTrace();
        Manager.getInstance().endTransaction(false);
    }
%>
<%="{\"status\":\""+errorContrName+"\"}"%>




