<%@ page import="java.util.List" %>
<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<%
    String errorContrName = "0";
    Manager.getInstance().beginTransaction();
    try {
/*        String rid = request.getParameter("rid");
        String rTypeid = request.getParameter("tid");*/

        String roomId = request.getParameter("roomid");
        String arrdt = request.getParameter("arrdt");

        String depDate = request.getParameter("dep");

        String reason = request.getParameter("reason");

        int status = 5;

        Date lastDate = df3.parse(depDate);
        boolean equals = false;
        Date nextDay = null;
        Date prevDay = df3.parse(arrdt);
        Collection<Date> dtsToInsert = new ArrayList<Date>();
        dtsToInsert.add(prevDay);
        while (!equals) {
            nextDay = CodeHelpers.getNextDay(prevDay);
            dtsToInsert.add(nextDay);
            System.out.println(df3.format(lastDate).split(" ")[0]);
            if (df3.format(nextDay).split(" ")[0].equals(df3.format(lastDate).split(" ")[0])) {
                equals = true;
                break;
            }
            prevDay = nextDay;
        }

        String generatedInsert = "";
        for (Date obj : dtsToInsert) {
            generatedInsert += "INSERT INTO roomst(roomstid, roomid, statusdate, st, regbyid) " +
                    " VALUES " +
                    "((SELECT COALESCE(MAX(roomstid) + 1,1) FROM roomst), " + roomId + ", '" + obj + "', " + status + ", " + user.getPersonnelid() + ");";
        }

        Connection con = Manager.getInstance().getConnection();
        con.createStatement().executeUpdate(generatedInsert);
        Manager.getInstance().releaseConnection(con);

       /* ReservationBean reservationBean = ReservationManager.getInstance().loadByPrimaryKey(Long.parseLong(rid));
        reservationBean.setReservationtypeid(Integer.parseInt(rTypeid));
        reservationBean.setRegbyid(user.getPersonnelid());
        ReservationManager.getInstance().save(reservationBean);*/

        Manager.getInstance().endTransaction(true);
        errorContrName = "1";
    } catch (Exception e) {
        e.printStackTrace();
        Manager.getInstance().endTransaction(false);
    }
%>
<%="{\"status\":\"" + errorContrName + "\"}"%>