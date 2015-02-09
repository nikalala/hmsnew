<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
boolean act = false;
if(request.getParameter("act") != null)
    act = true;
String rid = request.getParameter("rid");
if(rid == null)
    rid = request.getParameter("reservationroomid");
if(rid == null)
    rid = request.getParameter("reservationid");
ReservationroomBean reserv = ReservationroomManager.getInstance().loadByPrimaryKey(new Long(rid));

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
double total0 = getSum("select sum(amount) from folioitem where particular = 6 and folioid in (select folioid from folio where reservationroomid = "+reserv.getReservationroomid()+")");

Calendar cal1 = Calendar.getInstance();
cal1.setTime(res.getArraivaldate());
Calendar cal2 = Calendar.getInstance();
cal2.setTime(res.getDeparturedate());
double ddt = checkinsettings.getAmountcancell().doubleValue();
if(checkinsettings.getBeyond() != null)
    cal1.setTime(res.getRegdate());

int dday = DayDiff(cal1,cal2);

ReasonBean[] reasons = ReasonManager.getInstance().loadByWhere("where deleted = false and active = true and reasoncategory = 1 order by name");
FolioBean[] folio = FolioManager.getInstance().loadByWhere("where reservationroomid = "+reserv.getReservationroomid());
double tax = 0;
if(checkinsettings.getPostcancellationfee().intValue() == 1){
    if(checkinsettings.getTotalchargecancell().booleanValue())
        tax = total*checkinsettings.getAmountcancell().doubleValue()/100;
    else
        tax = total0*checkinsettings.getAmountcancell().doubleValue()/100;
} else if(checkinsettings.getPostcancellationfee().intValue() == 2){
    tax = checkinsettings.getAmountcancell().doubleValue();
} else if(checkinsettings.getPostcancellationfee().intValue() == 3 && dday > 0){
    tax = ddt*total0/dday;
}
%>
<script>
    var addnew = 0;
    
    function adddelreason1(){
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
    
    $(document).ready(function () {
        
        
        $("#addnewreason").hide();

        $("#addremreason").button().click(function(){adddelreason1();});

        $("#cancel_reasonid").change(function(){
            var rid = $("#cancel_reasonid").val();
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
        
        $("#cancel_cancellationfee").on("change",function(){
            var val = Number($("#cancel_cancellationfee").val());
            var valtax = val*0.18;
            var total = <%=total-deposit%>+val*1.18;
            $("#cancel_taxvalue").html("<%=maincurrency.getCode()%> "+valtax.toFixed(2));
            $("#cancel_totalvalue").html("<%=maincurrency.getCode()%> "+total.toFixed(2));
        });
        
        $("#myModalSave").remove();
        $("#myModalCheckin").remove();
        
        var r1 = $('<button type="button" class="btn btn-primary" id="myModalSave" onclick="savedata(\'myModal\')">შენახვა</button>');
        $("#myModalFooter").append(r1);
    });
    
    function reloadAfterCancell(){
        getBody("stayviewleft", "stayview", 'დატვირთულობა', 'res1','',true);
        reloadGrid('list_pendingreservations');
    }
</script>
<%if(act){%>
<input type="hidden" id="action" value="savecancel.jsp?rid=<%=reserv.getReservationroomid()%>"/>
<input type="hidden" id="callbackurl" value="script:reloadGrid(resGrid.id)"/>
<%} else {%>
<input type="hidden" id="action" value="savecancel.jsp?rid=<%=reserv.getReservationroomid()%>"/>
<input type="hidden" id="controls" value="cancel_reasonid,cancel_cancellationfee,cancel_newreason"/>
<input type="hidden" id="callbackurl" value="script:reloadAfterCancell()"/>
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
        <td><b>ოპერატორი</b></td>
        <td><%=user.getFname()%> <%=user.getLname()%></td>
    </tr>
    
    <tr>
        <td><b>გაუქმების გადასახადი</b></td>
        <td>
            <%=maincurrency.getCode()%> <input type='text' name='cancel_cancellationfee' id='cancel_cancellationfee' size="10" value='<%=dc.format(tax)%>'/>
        </td>
        <td><b>მიზეზი</b></td>
        <td>
            <select name="cancel_reasonid" id="cancel_reasonid">
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
    <tr>
        <td><b>ანგარიში</b></td>
        <td>გაუქმების ანგარიში</td>
        <td><b>დაკისრებული გადასახადი</b></td>
        <td>დღგ</td>
    </tr>
    
    <tr>
        <td><b>გადასახადის ოდენობა</b></td>
        <td id="cancel_taxvalue"><%=maincurrency.getCode()%> <%=dc.format(tax*0.18)%></td>
        <td><b>ბალანსი</b></td>
        <td id="cancel_totalvalue"><%=maincurrency.getCode()%> <%=dc.format(tax*1.18+total-deposit)%></td>
    </tr>
    <tr id="addnewreason">
        <td colspan="4" align="center">
            <textarea cols="100" rows="3" id="cancel_newreason" name="cancel_neawreason"></textarea>
        </td>
    </tr>
</table>