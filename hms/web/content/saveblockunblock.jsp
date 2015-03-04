<%@ page import="java.util.List" %>
<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<%
    String errorContrName = "0";
    Manager.getInstance().beginTransaction();
    try {

        String roomId = request.getParameter("roomid");

        String arrdt = request.getParameter("arrdt");

        String depDate = request.getParameter("dep");

        String reason = request.getParameter("reason");

        String generatedInsert = "";
        if (roomId.contains(",")) {
            String[] rooms = roomId.split(",");
            for (String room : rooms) {
                generatedInsert += "INSERT INTO blockroom(" +
                        "            blockroomid, roomid, blockstart, blockend, reasonid, note, regbyid) " +
                        "    VALUES ((SELECT COALESCE(MAX(blockroomid) + 1,1) FROM blockroom), " + room + ", to_timestamp('" + arrdt.replace(".","/") + "','dd/mm/yyyy'), to_timestamp('" + depDate.replace(".", "/") + "','dd/mm/yyyy'), '" + reason + "', '', " + user.getPersonnelid() + ");";
            }
        } else {
            generatedInsert += "INSERT INTO blockroom( " +
                    "            blockroomid, roomid, blockstart, blockend, reasonid, note, regbyid) " +
                    "    VALUES ((SELECT COALESCE(MAX(blockroomid) + 1,1) FROM blockroom), " + roomId + ", to_timestamp('" + arrdt.replace(".","/") + "','dd/mm/yyyy'), to_timestamp('" + depDate.replace(".", "/") + "','dd/mm/yyyy'), " + reason + ", '', " + user.getPersonnelid() + ");";
        }

        System.out.println(generatedInsert);

        Connection con = Manager.getInstance().getConnection();
        con.createStatement().executeUpdate(generatedInsert);
        Manager.getInstance().releaseConnection(con);

        Manager.getInstance().endTransaction(true);
        errorContrName = "1";
    } catch (Exception e) {
        e.printStackTrace();
        Manager.getInstance().endTransaction(false);
    }
%>
<%="{\"status\":\"" + errorContrName + "\"}"%>