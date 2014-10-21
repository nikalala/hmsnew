<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%
String type = request.getParameter("type");

%>
<script>
    $(document).ready(function(){
        
    });
</script>
<table class="table table-borderless">
    <tr>
        <td class="tbllabel" style="width: 50px;">ელფოსტა</td>
        <td>
            <form class="form-inline" role="form">
            <div class="form-group">
                <div class="input-group-xs">
                    <input class="form-control" type="text" id="contacttinfo_email" style="width: 190px;">
                </div>
            </div>
            </form>
        </td>
    </tr>
    <tr>
        <td class="tbllabel" style="width: 50px;">ტელეფონი</td>
        <td>
            <form class="form-inline" role="form">
            <div class="form-group">
                <div class="input-group-xs">
                    <input class="form-control" type="text" id="contacttinfo_phone" style="width: 190px;">
                </div>
            </div>
            </form>
        </td>
    </tr>
    <tr>
        <td class="tbllabel" style="width: 50px;">მობილური</td>
        <td>
            <form class="form-inline" role="form">
            <div class="form-group">
                <div class="input-group-xs">
                    <input class="form-control" type="text" id="contacttinfo_mobile" style="width: 190px;">
                </div>
            </div>
            </form>
        </td>
    </tr>
    <tr>
        <td class="tbllabel" style="width: 50px;">ფაქსი</td>
        <td>
            <form class="form-inline" role="form">
            <div class="form-group">
                <div class="input-group-xs">
                    <input class="form-control" type="text" id="contacttinfo_fax" style="width: 190px;">
                </div>
            </div>
            </form>
        </td>
    </tr>

</table>