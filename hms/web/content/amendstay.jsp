<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>
<%
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
    double total = getSum("select sum(amount) from folioitem where particular not in (1,2) and folioid in (select folioid from folio where reservationroomid = " + reserv.getReservationroomid() + ")");
    double deposit = getSum("select sum(amount) from payment where folioid in (select folioid from folio where reservationroomid = " + reserv.getReservationroomid() + ")");
    double total0 = getSum("select sum(amount) from folioitem where particular = 6 and folioid in (select folioid from folio where reservationroomid = " + reserv.getReservationroomid() + ")");

    Calendar cal1 = Calendar.getInstance();
    cal1.setTime(res.getArraivaldate());
    Calendar cal2 = Calendar.getInstance();
    cal2.setTime(res.getDeparturedate());
    double ddt = checkinsettings.getAmountcancell().doubleValue();
    if (checkinsettings.getBeyond() != null)
        cal1.setTime(res.getRegdate());

    int dday = DayDiff(cal1, cal2);

    ReasonBean[] reasons = ReasonManager.getInstance().loadByWhere("where deleted = false and active = true and reasoncategory = 1 order by name");
    FolioBean[] folio = FolioManager.getInstance().loadByWhere("where reservationroomid = " + reserv.getReservationroomid());
    double tax = 0;
    if (checkinsettings.getPostcancellationfee().intValue() == 1) {
        if (checkinsettings.getTotalchargecancell().booleanValue())
            tax = total * checkinsettings.getAmountcancell().doubleValue() / 100;
        else
            tax = total0 * checkinsettings.getAmountcancell().doubleValue() / 100;
    } else if (checkinsettings.getPostcancellationfee().intValue() == 2) {
        tax = checkinsettings.getAmountcancell().doubleValue();
    } else if (checkinsettings.getPostcancellationfee().intValue() == 3 && dday > 0) {
        tax = ddt * total0 / dday;
    }
    %>
<script>
    $("#mediummodalsave").removeAttr('disabled');
    
    $(document).ready(function(){
        $('#amenddeparturedate').datepicker(<%=pickerformat2%>);
        
        $("#mediummodalsave").remove();
        //$("#myModalCheckin").remove();
        
        var r1 = $('<button type="button" class="btn btn-primary" id="mediummodalsave" onclick="savedata(\'mediummodal\')">შენახვა</button>');
        $("#mediummodalfooter").append(r1);
    });

    function reloadAfterAmendStay(){
        getBody("stayviewleft", "stayview", 'დატვირთულობა', 'res1','',true);
        reloadGrid('list_roomstatus');
    }
    
</script>
<input type="hidden" id="action" value="doamendstay.jsp?reservationid=<%=reserv.getReservationid()%>"/>
<input type="hidden" id="controls" value="amenddeparturedate"/>
<input type="hidden" id="callbackurl" value="script:reloadAfterAmendStay()"/>
<table width="100%" class="table table-borderless">
    <tr>
        <td><b>რეზერვაციის #</b></td>
        <td><%=reserv.getReservationroomid()%> <%=rtp.getName()%>
        </td>
        <td rowspan="6" style="width:300px;">
            <table width="100%" class="table table-borderless" style="border: solid 1px #CDCDCD;border-spacing: 2px;border-collapse: separate;">
                <tr>
                   <td colspan="2" style="margin-left: 10px; text-align: left; color: green; font-weight: bold;border-bottom: solid 1px #CDCDCD;">შემდეგი რეზერვაცია</td>
                </tr>
                <tr>
                    <td style="width: 35%;"><b>რეზ. #</b></td><td>-</td>
                </tr>
                <tr>
                    <td><b>სტუმარი</b></td><td>-</td>
                </tr>
                <tr>
                    <td><b>ჩამოსვლა</b></td><td>-</td>
                </tr>
                <tr>
                    <td><b>წასვლა</b></td><td>-</td>
                </tr>
                <tr>
                    <td><b>გარანტია</b></td><td>-</td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td><b>ოთახი</b></td>
        <td>
            <%=roomname%>
        </td>
    </tr>
    <tr>
        <td><b>სტუმარი</b></td>
        <td><%=guestname%>
        </td>
    </tr>
    <tr>
        <td><b>ჩამოსვლა</b></td>
        <td><%=dt.format(res.getArraivaldate())%></td>
    </tr>
    <tr>
        <td><b>წასვლა</b></td>
        <td>
            <div class="input-append date" data-date="" data-date-format="dd/mm/yyyy">
                <input class="span2" size="10" value="<%=dt.format(res.getDeparturedate())%>" readonly="" type="text" id="amenddeparturedate">
            </div>
        </td>
    </tr>
    <tr>
        <td><b>ღამეები</b></td>
        <td>
            <%=DayDiff(cal1, cal2) + 1%>
        </td>
    </tr>
    <%--
    <tr id="renewRoomPrice">
        <td><b>ოთახის ტარიფის განახლება</b></td>
        <td>
            <input type="checkbox" id="amendrenewRoomPricech" name="amendrenewRoomPricech"/>
        </td>
    </tr>
    --%>
</table>