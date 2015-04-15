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

        String depDate = request.getParameter("dep") + " 23:59";

        String reason = request.getParameter("reason");
        String generatedInsert = "";
        System.out.println(depDate);
        if (roomId.contains(",")) {
            String[] rooms = roomId.split(",");
            for (String room : rooms) {
                BlockroomBean br = BlockroomManager.getInstance().createBlockroomBean();
                br.setRoomid(new Integer(room));
                br.setBlockstart(dt.parse(arrdt).getTime());
                br.setBlockend(dflongwithdots.parse(depDate).getTime());
                br.setReasonid(new Integer(reason));
                br.setRegbyid(user.getPersonnelid());
                br = BlockroomManager.getInstance().save(br);
            }
        } else {
            BlockroomBean br = BlockroomManager.getInstance().createBlockroomBean();
            br.setRoomid(new Integer(roomId));
            br.setBlockstart(dt.parse(arrdt).getTime());
            br.setBlockend(dflongwithdots.parse(depDate).getTime());
            br.setReasonid(new Integer(reason));
            br.setRegbyid(user.getPersonnelid());
            br = BlockroomManager.getInstance().save(br);
        }

        Manager.getInstance().endTransaction(true);
        errorContrName = "1";
    } catch (Exception e) {
        e.printStackTrace();
        Manager.getInstance().endTransaction(false);
    }
%>
<%="{\"status\":\"" + errorContrName + "\"}"%>