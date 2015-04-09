<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>
<%
    boolean loggedon = false;
    if (request.getParameter("login") != null) {
        try {
            PersonnelBean[] tuser = PersonnelManager.getInstance().loadByWhere("where deleted = false and upper(loginid) = '" + request.getParameter("loginid").toUpperCase().replaceAll("'", "''") + "' and password = '" + request.getParameter("password").replaceAll("'", "''") + "'");
            if (tuser != null && tuser.length > 0) {
                user.copy(tuser[0]);
                loggedon = true;
                HotelBean[] hotels = HotelManager.getInstance().loadByWhere("");
                hotel.copy(hotels[0]);
            }
        } catch (Exception ign) {
        }
    } else if (request.getParameter("logout") != null) {
        PersonnelBean tuser = PersonnelManager.getInstance().createPersonnelBean();
        user.copy(tuser);
        loggedon = false;
    }
%>
<%=loggedon%>
