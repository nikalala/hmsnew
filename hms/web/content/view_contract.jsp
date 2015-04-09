<%@page import="javax.servlet.http.*, javax.servlet.*"%>
<%@ include file="../includes/init.jsp" %>
<%
PcontractBean contract = PcontractManager.getInstance().loadByPrimaryKey(new Integer(request.getParameter("pcontractid")));
String contenttype = "application/pdf";
String fname = "contract_"+contract.getPcontractid()+".pdf";
byte[] content = contract.getContent();
OutputStream stream = response.getOutputStream();
response.reset();
response.setContentType(contenttype);
String hdr = "filename="+fname;
response.addHeader("Content-Disposition",hdr);
stream.write(content);
stream.close();
%>
