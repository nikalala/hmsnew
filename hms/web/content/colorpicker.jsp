<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
String ccolor = request.getParameter("ccolor");
String id = request.getParameter("id");
%>
<script>
$(document).ready( function() {
    $("#color").miniColors({
        //change: function(hex, rgb) { $("#color").miniColors('hide'); }
    });
});
</script>
<table align="center" width="100%">
    <tr>
        <td align="center" class="gText" width="100%">
            <input type="text" name="color" id="color" size="7" value="<%=ccolor%>">
        </td>
    </tr>
</table>