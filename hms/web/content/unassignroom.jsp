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
            rbr.setRoomid(null);
            rbr = ReservationroomManager.getInstance().save(rbr);
        } else throw new Exception("არასწორი რეზერვაცია");

        Manager.getInstance().endTransaction(true);
        errorContrName = "ოპერაცია შესრულდა წარმატებით";
    } catch (Exception e) {
        e.printStackTrace();
        errorContrName = e.getMessage();
        Manager.getInstance().endTransaction(false);
    }
%>

<%=errorContrName%>




