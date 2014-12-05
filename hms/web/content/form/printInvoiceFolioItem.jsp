<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%
String id = request.getParameter("id");
String act = request.getParameter("act");
String src = "";
if(act.equalsIgnoreCase("folioitem"))   src = "printFolioItemPdf.jsp?id="+id;
if(act.equalsIgnoreCase("folio"))   src = "printFolioPdf.jsp?id="+id;
%>
<script>
    
</script>
<iframe src="content/form/<%=src%>" width="100%" height="500" ></iframe>