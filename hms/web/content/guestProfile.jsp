<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
String type = "sharer";
ReservationroomBean rroom = ReservationroomManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("id")));
GuestBean guest = null;
long gid = 0;
if(request.getParameter("gid") != null) {
    guest = GuestManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("gid")));
    gid = guest.getGuestid().longValue();
}
String fields = type+"guestinfo_salutationid,"+type+"guestinfo_fname,"+type+"guestinfo_lname,"+type+"guestinfo_address,"+type+"guestinfo_city,"+type+"guestinfo_zip,"+type+"guestinfo_countryid,"
        + type+"contacttinfo_email,"+type+"contacttinfo_phone,"+type+"contacttinfo_mobile,"+type+"contacttinfo_fax,"+type+"guestinfo_idtypeid,"+type+"guestinfo_nationalityid,";
for (int i = 0; i < gender.length; i++) {
        fields += type+"guestinfo_gender" + i + ",";
    }
fields += type+"guestinfo_vipstatusid,createfolio";
String url = "addsharer.jsp?id="+rroom.getReservationroomid()+"&type="+type;
if(guest != null)   url += "&action=edit&gid="+gid;
else                url += "&action=add";

%>
<script>
    $("#mediummodalfooter").html("");
    var r1 = $('<button type="button" class="btn btn-default" id="mediummodalclose" data-dismiss="modal">დახურვა</button>');
    $("#mediummodalfooter").append(r1);
    r1 = $("<button type=\"button\" class=\"btn btn-primary\" id=\"mediummodalsave\" onclick=\"savedataprefix('mediummodal','<%=type%>')\">შენახვა</button>");
    $("#mediummodalfooter").append(r1);
</script>
<input type="hidden" id="<%=type%>action" value="<%=url%>"/>
<input type="hidden" id="<%=type%>controls" value="<%=fields%>"/>
<input type="hidden" id="<%=type%>callbackurl" value="script:refreshSharerlist()"/>
<div class="container-fluid" id="sharerreg" style="padding-top: 4px; height: 100%;">
    <div class="row" style="margin-top: 0px; margin-bottom: 0px; padding-left: 5px;  padding-right: 5px;">
        <div class="col-md-9">
            <div class="panel panel-primary" id='reg_guestinfo'>
                <div class="panel-heading">
                    <h3 class="panel-title">
                        ზოგადი ინფორმაცია
                    </h3>
                </div>
                <div class="panel-body" style="height: 140px;">
                    <jsp:include page="panels/guestinfo.jsp">
                        <jsp:param name="type" value="<%=type%>"/>
                        <jsp:param name="gid" value="<%=gid%>"/>
                    </jsp:include>
                </div>
            </div>
        </div>
        <div class="col-md-7">
            <div class="panel panel-primary" id='reg_contactinfo'>
                <div class="panel-heading">
                    <h3 class="panel-title">საკონტაქტო ინფორმაცია</h3>
                </div>
                <div class="panel-body" style="height: 140px;">
                    <jsp:include page="panels/contactinfo.jsp">
                        <jsp:param name="type" value="<%=type%>"/>
                        <jsp:param name="gid" value="<%=gid%>"/>
                    </jsp:include>
                </div>
            </div>
        </div>
    </div>
    <div class="row" style="margin-top: 0px; margin-bottom: 0px; padding-left: 5px;  padding-right: 5px;">
        <div class="col-md-12">
            <div class="panel panel-primary" id='reg_guestinfo'>
                <div class="panel-heading">
                    <h3 class="panel-title">სხვა ინფორმაცია</h3>
                </div>
                <div class="panel-body" style="height: 125px;">
                    <jsp:include page="panels/otherinfo.jsp">
                        <jsp:param name="type" value="<%=type%>"/>
                        <jsp:param name="gid" value="<%=gid%>"/>
                    </jsp:include>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <%if(gid == 0){%>
            <input type="checkbox" id="createfolio">&nbsp;
            <label for="createfolio">შეიქმნას ფოლიო</label>&nbsp;
            <%}%>
        </div>
    </div>
</div>
