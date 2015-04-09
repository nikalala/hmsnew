<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
ReservationroomBean rroom = ReservationroomManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("id")));
FoliologBean[] logs = FoliologManager.getInstance().loadByWhere("where folioitemid in (select f.folioitemid from folio l, folioitem f where f.folioid = l.folioid and l.reservationroomid = "+rroom.getReservationroomid()+")");
%>

<table width="100%" class="table table-borderless">
    <%
    for(int i=0;i<logs.length;i++){
    %>
    <tr>
        <td><b><%=dt.format(logs[i].getRegdate().getTime())%></b></td>
        <td valign="top">
            <b><%=logs[i].getLogname()%></b><br>
            
        </td>
    </tr>
    <%
    }
    %>
</table>
