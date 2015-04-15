<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%

    String ses = request.getParameter("ses");
    panel pl = (panel)session.getAttribute(ses);
    
%>
<%=pl.drawpanel()%>
