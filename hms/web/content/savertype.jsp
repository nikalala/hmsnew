<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<%
    String errorContrName = "0";
    Manager.getInstance().beginTransaction();
    try {
        String rid = request.getParameter("rid");
        String rTypeid = request.getParameter("tid");

        ReservationBean reservationBean = ReservationManager.getInstance().loadByPrimaryKey(Long.parseLong(rid));
        reservationBean.setReservationtypeid(Integer.parseInt(rTypeid));
        reservationBean.setRegbyid(user.getPersonnelid());
        ReservationManager.getInstance().save(reservationBean);

        Manager.getInstance().endTransaction(true);
        errorContrName = "1";
    } catch (Exception e) {
        e.printStackTrace();
        Manager.getInstance().endTransaction(false);
    }
%>
<%="{\"status\":\""+errorContrName+"\"}"%>