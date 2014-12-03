<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<%
    ReservationtypeBean[] reservationtypeBeans = ReservationtypeManager.getInstance().loadByWhere("");
    String rid = request.getParameter("rid");
%>
<script>
    $(document).ready(function () {
        $('#changertype .dropdown').selectpicker();
        $("#mediummodalsave").attr('disabled', 'disabled');
    });

    $("#reservsType").on('change', function () {
        var id = $(this).val();
        if (id > 0) {
            $("#mediummodalsave").removeAttr('disabled');
            $(".changertypeURL").val(generateUrl(id));
        } else {
            $("#mediummodalsave").attr('disabled', 'disabled');
        }
    });
    function generateUrl(value) {
        return "savertype.jsp?rid=<%=rid%>&tid=" + value;
    }
</script>
<input type="hidden" id="action" value="" class="changertypeURL"/>
<input type="hidden" id="controls" value="reservsType"/>
<input type="hidden" id="callbackurl" value="script:reloadGrid('list_reservs')"/>

<div id="changertype">
    <select class="dropdown" id="reservsType">
        <option value="">-რეზერვაციის ტიპი-</option>
        <% for (int i = 0; i <= reservationtypeBeans.length - 1; i++) { %>
        <option value="<%=reservationtypeBeans[i].getReservationtypeid()%>"><%=reservationtypeBeans[i].getName()%>
        </option>
        <% } %>
    </select>
</div>