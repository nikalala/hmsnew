<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>
<%

    String act = request.getParameter("act");
    String ses = request.getParameter("ses");
    String html = "";
    String js = "";
    if(act.equalsIgnoreCase("panel")){
        panel pl = (panel)session.getAttribute(ses);
        html = pl.drawpanel();
        js = pl.getScript();
    }
%>
<%=js%>
<%=html%>

