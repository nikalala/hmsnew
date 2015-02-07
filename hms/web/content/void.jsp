<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
boolean act = false;
if(request.getParameter("act") != null)
    act = true;
ReservationroomBean reserv = null;
    if(request.getParameter("reservationid") != null)
        reserv = ReservationroomManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("reservationid")));
    else
        reserv = ReservationroomManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("rid")));
ReservationBean res = ReservationManager.getInstance().loadByPrimaryKey(reserv.getReservationid());
GuestBean guest = GuestManager.getInstance().loadByPrimaryKey(reserv.getGuestid());
SalutationBean salutation = SalutationManager.getInstance().loadByPrimaryKey(guest.getSalutationid());
int istatus = 0;
String roomname = "";
String companyname = "-";
String taname = "-";
String ownername = "-";
if(reserv.getRoomid() != null){
    RoomBean room = RoomManager.getInstance().loadByPrimaryKey(reserv.getRoomid());
    istatus = getRoomStatus(null,room.getRoomid().intValue());
    roomname = room.getName()+" ";
    String sql = "where deleted = false and type = 0 and contragentid in (select roomownerid from roomownerroom where roomid = "+room.getRoomid()+")";
    ContragentBean[] co = ContragentManager.getInstance().loadByWhere(sql);
    if(co.length > 0){
        ownername = co[0].getFname()+" "+co[0].getLname();
    }
}
if(res.getCompanyid() != null){
    ContragentBean co = ContragentManager.getInstance().loadByPrimaryKey(res.getCompanyid());
    if(co.getName() != null)    companyname = co.getName();
}
if(res.getTaid() != null){
    ContragentBean co = ContragentManager.getInstance().loadByPrimaryKey(res.getTaid());
    taname = co.getFname()+" "+co.getLname();
}
RoomtypeBean roomtype = RoomtypeManager.getInstance().loadByPrimaryKey(reserv.getRoomtypeid());
if(roomtype != null)    roomname += roomtype.getName();
String guestname = salutation.getName()+" ";
guestname += guest.getFname() + " " + guest.getLname();
RatetypeBean rttype = RatetypeManager.getInstance().loadByPrimaryKey(reserv.getRatetypeid());
ReservationtypeBean rtp = ReservationtypeManager.getInstance().loadByPrimaryKey(res.getReservationtypeid());
String bsname = "";
if(res.getBsourceid() != null){
    BsourceBean bs = BsourceManager.getInstance().loadByPrimaryKey(res.getBsourceid());
    bsname = bs.getName();
}
double total = getSum("select sum(amount) from folioitem where particular not in (1,2) and folioid in (select folioid from folio where reservationroomid = "+reserv.getReservationroomid()+")");
double deposit = getSum("select sum(amount) from payment where folioid in (select folioid from folio where reservationroomid = "+reserv.getReservationroomid()+")");

ReasonBean[] reasons = ReasonManager.getInstance().loadByWhere("where deleted = false and active = true and reasoncategory = 13 order by name");
FolioBean[] folio = FolioManager.getInstance().loadByWhere("where reservationroomid = "+reserv.getReservationroomid());
%>
<script>
    var addnew = 0;
    $("#addnewreason").hide();
    
    $("#addremreason").button().click(function(){adddelreason();});
    
    $("#reasonid").change(function(){
        var rid = $("#reasonid").val();
        if(rid > 0){
            addnew = 0;
            $("#addnewreason").hide();
            $("#addremreason").hide();
            $("#addremreason").removeClass("fa-minus");
            $("#addremreason").addClass("fa-plus");
        } else {
            $("#addremreason").show();
            $("#addremreason").removeClass("fa-minus");
            $("#addremreason").addClass("fa-plus");
        }
    });
    
    function adddelreason(){
        if (addnew == 0) {
            $("#addnewreason").show();
            $("#addremreason").removeClass("fa-plus");
            $("#addremreason").addClass("fa-minus");
            addnew = 1;
        } else {
            $("#addnewreason").hide();
            $("#addremreason").removeClass("fa-minus");
            $("#addremreason").addClass("fa-plus");
            addnew = 0;
        }
    }
    
    function reloadAfterVoid(){
        getBody("stayviewleft", "stayview", 'დატვირთულობა', 'res1','',true);
        reloadGrid('list_pendingreservations');
    }
</script>
<%if(act){%>
<input type="hidden" id="action" value="savevoid.jsp?rid=<%=reserv.getReservationroomid()%>"/>
<input type="hidden" id="callbackurl" value="script:reloadGrid(resGrid.id)"/>
<%} else {%>
<input type="hidden" id="action" value="savevoid.jsp?rid=<%=reserv.getReservationroomid()%>"/>
<input type="hidden" id="controls" value="reasonid,newreason"/>
<input type="hidden" id="callbackurl" value="script:reloadAfterVoid()"/>
<%}%>
<table width="100%" class="table table-borderless">
    <tr>
        <td><b>რეზერვაციის #</b></td>
        <td><%=reserv.getReservationroomid()%> <%=rtp.getName()%></td>
        <td><b>ჩამოსვლა</b></td>
        <td><%=dt.format(res.getArraivaldate())%></td>
    </tr>
    <tr>
        <td><b>სტუმარი</b></td>
        <td><%=guestname%></td>
        <td><b>წასვლა</b></td>
        <td><%=dt.format(res.getDeparturedate())%></td>
    </tr>
    <tr>
        <td><b>ოთახი</b></td>
        <td><%=roomname%></td>
        <td><b>კომპანია</b></td>
        <td><%=companyname%></td>
    </tr>
    <tr>
        <td><b>სულ</b></td>
        <td><%=maincurrency.getCode()%> <%=dc.format(total)%></td>
        <td><b>ტურ. აგენტი</b></td>
        <td><%=taname%></td>
    </tr>
    <tr>
        <td><b>დეპოზიტი</b></td>
        <td><%=maincurrency.getCode()%> <%=dc.format(deposit)%></td>
        <td><b>ოთახის მფლობელი</b></td>
        <td><%=ownername%></td>
    </tr>
    <tr>
        <td><b>ფოლიო</b></td>
        <td><%=(folio.length > 0) ? folio[0].getFolioid():""%></td>
        <td><b>მომხმარებელი</b></td>
        <td><%=user.getFname()%> <%=user.getLname()%></td>
    </tr>
    <tr>
        <td><b>ბალანსი</b></td>
        <td><%=maincurrency.getCode()%> <%=dc.format(total-deposit)%></td>
        <td><b>მიზეზი</b></td>
        <td nowrap>
            <select name="reasonid" id="reasonid" style="width: 150px;">
                <option value="0">-- აირჩიეთ --</option>
                <%
                for(int i=0;i<reasons.length;i++){
                %>
                <option value="<%=reasons[i].getReasonid()%>"><%=reasons[i].getName()%></option>
                <%
                }
                %>
            </select>
            <button id="addremreason" class="fa fa-plus" style="color: green; height: 24px;"></button>
        </td>
    </tr>
    <tr id="addnewreason">
        <td colspan="4" align="center">
            <textarea cols="100" rows="3" id="newreason" name="neawreason"></textarea>
        </td>
    </tr>
</table>