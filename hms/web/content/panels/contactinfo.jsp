<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%
String type = request.getParameter("type");
if(type == null)    type = "";
GuestBean guest = null;
if(request.getParameter("gid") != null)
    guest = GuestManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("gid")));
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
                    <input class="form-control" type="text" id="<%=type%>contacttinfo_email" style="width: 190px;" value="<%= (guest == null) ? "":guest.getEmail() %>">
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
                    <input class="form-control" type="text" id="<%=type%>contacttinfo_phone" style="width: 190px;" value="<%= (guest == null) ? "":guest.getPhone()%>">
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
                    <input class="form-control" type="text" id="<%=type%>contacttinfo_mobile" style="width: 190px;" value="<%= (guest == null) ? "":guest.getMobile()%>">
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
                    <input class="form-control" type="text" id="<%=type%>contacttinfo_fax" style="width: 190px;" value="<%= (guest == null) ? "":guest.getFax() %>">
                </div>
            </div>
            </form>
        </td>
    </tr>

</table>