<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>
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
    if (reserv.getRoomid() != null) {
        RoomBean room = RoomManager.getInstance().loadByPrimaryKey(reserv.getRoomid());
        istatus = getRoomStatus(null, room.getRoomid().intValue());
        roomname = room.getName() + " ";
        String sql = "where deleted = false and type = 0 and contragentid in (select roomownerid from roomownerroom where roomid = " + room.getRoomid() + ")";
        ContragentBean[] co = ContragentManager.getInstance().loadByWhere(sql);
        if (co.length > 0) {
            ownername = co[0].getFname() + " " + co[0].getLname();
        }
    }
    if (res.getCompanyid() != null) {
        ContragentBean co = ContragentManager.getInstance().loadByPrimaryKey(res.getCompanyid());
        if (co.getName() != null) companyname = co.getName();
    }
    if (res.getTaid() != null) {
        ContragentBean co = ContragentManager.getInstance().loadByPrimaryKey(res.getTaid());
        taname = co.getFname() + " " + co.getLname();
    }
    RoomtypeBean roomtype = RoomtypeManager.getInstance().loadByPrimaryKey(reserv.getRoomtypeid());
    if (roomtype != null) roomname += roomtype.getName();
    String guestname = salutation.getName() + " ";
    guestname += guest.getFname() + " " + guest.getLname();
    RatetypeBean rttype = RatetypeManager.getInstance().loadByPrimaryKey(reserv.getRatetypeid());
    ReservationtypeBean rtp = ReservationtypeManager.getInstance().loadByPrimaryKey(res.getReservationtypeid());
    String bsname = "";
    if (res.getBsourceid() != null) {
        BsourceBean bs = BsourceManager.getInstance().loadByPrimaryKey(res.getBsourceid());
        bsname = bs.getName();
    }
    Calendar cal1 = Calendar.getInstance();
    cal1.setTime(res.getArraivaldate());
    Calendar cal2 = Calendar.getInstance();
    cal2.setTime(res.getDeparturedate());
    double total = getSum("select sum(amount) from folioitem where particular not in (1,2) and folioid in (select folioid from folio where reservationroomid = " + reserv.getReservationroomid() + ")");
    double deposit = getSum("select sum(amount) from payment where folioid in (select folioid from folio where reservationroomid = " + reserv.getReservationroomid() + ")");
    int dday = DayDiff(cal1, cal2);
    ReasonBean[] reasons = ReasonManager.getInstance().loadByWhere("where deleted = false and active = true and reasoncategory = 7 order by name");
    double total0 = getSum("select sum(amount) from folioitem where particular = 6 and folioid in (select folioid from folio where reservationroomid = " + reserv.getReservationroomid() + ")");

    FolioBean[] folio = FolioManager.getInstance().loadByWhere("where reservationroomid = " + reserv.getReservationroomid());
    
    boolean totalchargenoshow = true;
    if(checkinsettings.getTotalchargenoshow().booleanValue())
        totalchargenoshow = false;
    
    double ddt = checkinsettings.getAmountnoshow().doubleValue();
    double tax = 0;
    if(totalchargenoshow){
        if (checkinsettings.getPostnoshowfee().intValue() == 1) {
            if (!checkinsettings.getTotalchargenoshow().booleanValue())
                tax = total * checkinsettings.getAmountnoshow().doubleValue() / 100;
            else
                tax = total0 * checkinsettings.getAmountnoshow().doubleValue() / 100;
        } else if (checkinsettings.getPostnoshowfee().intValue() == 2) {
            tax = checkinsettings.getAmountnoshow().doubleValue();
        } else if (checkinsettings.getPostnoshowfee().intValue() == 3 && dday > 0) {
            tax = ddt * total0 / dday;
        }
    }
%>
<script>
    var addnew = 0;
    
    function adddelreason2(){
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

        $("#addremreason").button().click(function(){adddelreason2();});

        $("#nowshow_reasonid").change(function(){
            var rid = $("#nowshow_reasonid").val();
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
        
        $("#nowshow_cancellationfee").on("change",function(){
            var val = Number($("#nowshow_cancellationfee").val());
            var valtax = val*0.18;
            var total = <%=total-deposit%>+val*1.18;
            $("#nowshow_taxvalue").html("<%=maincurrency.getCode()%> "+valtax.toFixed(2));
            $("#nowshow_totalvalue").html("<%=maincurrency.getCode()%> "+total.toFixed(2));
        });
        
        $("#mediummodalsave").remove();
        var r1 = $('<button type="button" class="btn btn-primary" id="mediummodalsave" onclick="savedata(\'mediummodal\')">შენახვა</button>');
        $("#mediummodalfooter").append(r1);

    });
    
    function reloadAfterNoShow(){
        getBody("stayviewleft", "stayview", 'დატვირთულობა', 'res1','',true);
        reloadGrid('list_pendingreservations');
    }
</script>
<%if(act){%>
<input type="hidden" id="action" value="savenowshow.jsp?rid=<%=reserv.getReservationroomid()%>"/>
<input type="hidden" id="callbackurl" value="script:reloadGrid(resGrid.id)"/>
<%} else {%>
<input type="hidden" id="action" value="savenowshow.jsp?rid=<%=reserv.getReservationroomid()%>"/>
<input type="hidden" id="controls" value="nowshow_reasonid,nowshow_cancellationfee,nowshow_newreason"/>
<input type="hidden" id="callbackurl" value="script:reloadAfterNoShow()"/>
<%}%>
<table width="100%" class="table table-borderless">
    <tr>
        <td><b>რეზერვაციის #</b></td>
        <td><%=reserv.getReservationroomid()%> <%=rtp.getName()%>
        </td>
        <td><b>ჩამოსვლა</b></td>
        <td><%=dt.format(res.getArraivaldate())%></td>
    </tr>
    <tr>
        <td><b>სტუმარი</b></td>
        <td><%=guestname%>
        </td>
        <td><b>წასვლა</b></td>
        <td><%=dt.format(res.getDeparturedate())%></td>
    </tr>
    <tr>
        <td><b>ოთახი</b></td>
        <td><%=roomname%>
        </td>
        <td><b>კომპანია</b></td>
        <td><%=companyname%></td>
    </tr>
    <tr>
        <td><b>სულ</b></td>
        <td><%=maincurrency.getCode()%> <%=dc.format(total)%>
        </td>
        <td><b>ტურ. აგენტი</b></td>
        <td><%=taname%></td>
    </tr>
    <tr>
        <td><b>დეპოზიტი</b></td>
        <td><%=maincurrency.getCode()%> <%=dc.format(deposit)%>
        </td>
        <td><b>ოთახის მფლობელი</b></td>
        <td><%=ownername%></td>
    </tr>
    <tr>
        <td><b>ფოლიო</b></td>
        <td><%=(folio.length > 0) ? folio[0].getFolioid() : ""%>
        </td>
        <td><b>მომხმარებელი</b></td>
        <td><%=user.getFname()%> <%=user.getLname()%></td>
    </tr>
    <tr>
        <td><b>არ გამოცხადების გადასახადი</b></td>
        <td>
            <%=maincurrency.getCode()%> <input type='text' name='nowshow_cancellationfee' id='nowshow_cancellationfee' size="10" value='<%=dc.format(tax)%>'/>
        </td>
        <td><b>მიზეზი</b></td>
        <td>
            <select name="nowshow_reasonid" id="nowshow_reasonid">
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
        <td>არ გამოცხადების ანგარიში</td>
        </td>
        <td><b>დაკისრებული გადასახადი</b></td>
        <td>დღგ</td>
    </tr>
    <tr>
        <td><b>გადასახადის ოდენობა</b></td>
        <td id="nowshow_taxvalue"><%=maincurrency.getCode()%> <%=dc.format(tax*0.18)%>
        <td><b>ბალანსი</b></td>
        <td id="nowshow_totalvalue"><%=maincurrency.getCode()%> <%=dc.format(tax*1.18+total-deposit)%></td>
    </tr>
    <tr id="addnewreason">
        <td colspan="4" align="center">
            <textarea cols="100" rows="3" id="nowshow_newreason" name="nowshow_neawreason"></textarea>
        </td>
    </tr>
</table>