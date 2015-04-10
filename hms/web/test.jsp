<%-- 
    Document   : test
    Created on : Aug 18, 2014, 1:18:58 PM
    Author     : djorj
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String s = "alert('sdgndfgm')";
        %>
        
        <%=s.replaceAll("'", "\\\\'")%>
        
        
        
    </body>
</html>
