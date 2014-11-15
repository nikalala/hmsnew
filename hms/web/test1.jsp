<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    double val = 106;
    int prc = Integer.parseInt(request.getParameter("prc"));
    double[] roundtype = {0,0.1,1,10,100,1000,10000};
    double x = Math.round(val * roundtype[prc]) / roundtype[prc];
    
%>
<%=x%>
