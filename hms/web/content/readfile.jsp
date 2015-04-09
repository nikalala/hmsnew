<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="java.io.*"%>
<%
String filename = request.getParameter("name");
response.reset();
//response.setContentType("application/rtf");
response.addHeader("Content-Disposition","filename="+filename.substring(5));
OutputStream oout = response.getOutputStream();
FileInputStream fi = new FileInputStream(filename);
byte[] bt = new byte[fi.available()];
fi.read(bt);
fi.close();
oout.write(bt);
oout.close();
%>
