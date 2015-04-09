<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
ReservationroomBean rroom = ReservationroomManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("reservationroomid")));
ReservationBean reserv = ReservationManager.getInstance().loadByPrimaryKey(rroom.getReservationid());
boolean editable = false;

%>
<script>
    <%if(editable){%>
        $('#arrivaldate').datepicker(<%=pickerformat2%>);
        $('#departuredate').datepicker(<%=pickerformat2%>);
    <%}%>
</script>
<input type="hidden" id="action" value="savearraivalinfo.jsp?reservationid=<%=reserv.getReservationid()%>"/>
<input type="hidden" id="controls" value="arrivaldate,arraivaltime,departuredate,departuretime"/>
<input type="hidden" id="callbackurl" value="content/stayinfodates.jsp?reservationroomid=<%=rroom.getReservationroomid()%>"/>
<input type="hidden" id="callbackdata" value="stayinfo"/>
<table width="100%" class="table table-borderless">
    <tbody>
        <tr>
            <td><b>ჩამოსვლა</b></td>
            <td>
                <div class="input-append date" data-date="" data-date-format="dd/mm/yyyy">
                    <input class="span2" size="10" value="<%=dt.format(reserv.getArraivaldate())%>" readonly="" type="text" id="arrivaldate">
                </div>
            </td>
            <td>
                <input class="" size="5" maxlength="5" value="<%=dtime.format(reserv.getArraivaldate())%>" type="text" id="arraivaltime">
            </td>
        </tr>
        <tr>
            <td><b>გამგზავრება</b></td>
            <td>
                <div class="input-append date" data-date="" data-date-format="dd/mm/yyyy">
                    <input class="span2" size="10" value="<%=dt.format(reserv.getDeparturedate())%>" readonly="" type="text" id="departuredate">
                </div>
            </td>
            <td>
                <input class="" size="5" maxlength="5" value="<%=dtime.format(reserv.getDeparturedate())%>" type="text" id="departuretime">
            </td>
        </tr>
    </tbody>
</table>

