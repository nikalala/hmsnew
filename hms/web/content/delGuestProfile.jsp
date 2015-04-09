<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%

ReservationroomBean rroom = ReservationroomManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("id")));
GuestBean guest = GuestManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("gid")));
    
%>
<script>
    $("#mediummodalfooter").html("");
    var r1 = $('<button type="button" class="btn btn-default" id="mediummodalclose" data-dismiss="modal">დახურვა</button>');
    $("#mediummodalfooter").append(r1);
    r1 = $("<button type=\"button\" class=\"btn btn-primary\" id=\"mediummodalsave\" onclick=\"savedata('mediummodal')\">შენახვა</button>");
    $("#mediummodalfooter").append(r1);
</script>