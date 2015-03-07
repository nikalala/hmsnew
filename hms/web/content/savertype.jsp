<%@ page import="java.util.List" %>
<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<%
    String errorContrName = "0";
    Manager.getInstance().beginTransaction();
    try {
        String rid = request.getParameter("rid");
        String roomId = request.getParameter("roomid");
        String rTypeid = request.getParameter("tid");
        String arrdt = request.getParameter("arrdt");
        String confirmed = request.getParameter("confirmed");
        String depDate = request.getParameter("dep");

        int status = confirmed.equals("true") ? 0 : 7;
        Date lastDate = sdf1.parse(depDate);
        boolean equals = false;
        Date nextDay = null;
        Date prevDay = sdf1.parse(arrdt);
        Collection<Date> dtsToInsert = new ArrayList<Date>();
        dtsToInsert.add(prevDay);
        while (!equals) {
            nextDay = CodeHelpers.getNextDay(prevDay);
            System.out.println("NEXT DAY " + sdf1.format(nextDay).split(" ")[0]);
            dtsToInsert.add(nextDay);
            if (sdf1.format(nextDay).split(" ")[0].equals(sdf1.format(lastDate).split(" ")[0])) {
                equals = true;
                break;
            }
            prevDay = nextDay;
        }
/*
        String generatedInsert = "";
        for (Date obj : dtsToInsert) {
            generatedInsert += "INSERT INTO roomst(roomstsid, roomid, statusdate, st, regbyid) " +
                    " VALUES " +
                    "((SELECT COALESCE(MAX(roomstsid) + 1,1) FROM roomst), " + roomId + ", '" + obj + "', " + status + ", " + user.getPersonnelid() + ");";
        }

        Connection con = Manager.getInstance().getConnection();
        con.createStatement().executeUpdate(generatedInsert);
        Manager.getInstance().releaseConnection(con);
*/
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
<%="{\"status\":\"" + errorContrName + "\"}"%>