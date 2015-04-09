<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%
String ses = request.getParameter("ses");
if(ses != null) session.setAttribute("EXPORT_001", (String)ses);
ses = (String)session.getAttribute("EXPORT_001");
Integer val = (Integer)session.getAttribute(ses);
if(val == null) val = new Integer(0);
%>
<script>
    $("#progressbar01").progressbar({ value: <%=val.toString()%> });
</script>
<center>
    <table align="center" width="100%">
        <tr><td align="center"><font size="+1"><b><%=val.toString()%>%</b></font></td></tr>
        <tr><td align="center"><div class="demo"><div id="progressbar01" style="width: 50%;"></div></div></td></tr>
    </table>
</center>
