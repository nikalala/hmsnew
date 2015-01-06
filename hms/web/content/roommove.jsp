<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>
<%
    for(Enumeration e=request.getParameterNames();e.hasMoreElements();){
        String name = (String)e.nextElement();
        String val = request.getParameter(name);
        System.out.println(name+" = "+val);
    }
    
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
    String roomWhere = "where getroomstatus(roomid,'"+dflong.format(lclosedate)+"') = 8 ";
    if(reserv.getRoomid() != null)
        roomWhere += " or roomid = "+reserv.getRoomid();
    roomWhere += " ORDER BY ord";
    System.out.println(roomWhere);
    RoomBean[] roomBeans = RoomManager.getInstance().loadByWhere(roomWhere); %>
<% RoomtypeBean[] roomTypes = RoomtypeManager.getInstance().loadByWhere("ORDER BY ord"); %>
<script>
    var lastroomtypeId = 0;
    $("#mediummodalsave").attr('disabled','disabled');
    $("#roomType").on('change', function () {
        var id = $(this).val();
        modifyRate(id != <%=reserv.getRoomtypeid()%>);
        if (id > 0) {
            var html = "<option value='0'>-ოთახის #-</option>";
            <% for (int i = 0; i < roomBeans.length; i++) {
                String sel = "";
                if(reserv.getRoomid() != null && reserv.getRoomid().intValue() == roomBeans[i].getRoomid().intValue()) sel = "selected";
            %>
            var value = "<%=roomBeans[i].getRoomtypeid()%>";
            if (id == value) {
                html += "<option value='<%=roomBeans[i].getRoomid()%>' roomtypeid='<%=roomBeans[i].getRoomtypeid()%>' <%=sel%>><%=roomBeans[i].getName()%></option>";
            }
            <% } %>
        } else {
            var html = "<option value='0'>-ოთახის #-</option>";
            <% for (int i = 0; i < roomBeans.length; i++) {
                String sel = "";
                if(reserv.getRoomid() != null && reserv.getRoomid().intValue() == roomBeans[i].getRoomid().intValue()) sel = "selected";
            %>
            html += "<option value='<%=roomBeans[i].getRoomid()%>' roomtypeid='<%=roomBeans[i].getRoomtypeid()%>' <%=sel%>><%=roomBeans[i].getName()%></option>";
            <% }%>
        }
        $("#assignroom_roomid").html(html);
    });
    $("#assignroom_roomid").on('change', function () {
        var id = $(this).val();
        if(id > 0)
        {
            $("#mediummodalsave").removeAttr('disabled');
            $(".assignroomURL").val(generateUrl(id));
        }else{
            $("#mediummodalsave").attr('disabled','disabled');
        }
    });
    function modifyRate(bool)
    {
        if(bool){
            $("#renewRoomPrice").css("display","block");
        }else{
            $("#renewRoomPrice").css("display","none");
        }
    }

    function populateRoomFirst(id)
    {
        var html = "<option value='0'>-ოთახის #-</option>";
        <% for (int i = 0; i < roomBeans.length; i++) {
            String sel = "";
            if(reserv.getRoomid() != null && reserv.getRoomid().intValue() == roomBeans[i].getRoomid().intValue())
                sel = "selected";
        %>
        var value = "<%=roomBeans[i].getRoomtypeid()%>";
        if (id == value) {
            html += "<option value='<%=roomBeans[i].getRoomid()%>' roomtypeid='<%=roomBeans[i].getRoomtypeid()%>' <%=sel%>><%=roomBeans[i].getName()%></option>";
        }
        <% } %>
        $("#assignroom_roomid").html(html);
    }
    $(document).ready(function(){
        populateRoomFirst($("#roomType").val());
        $("#myModalCheckin").remove();
        $("#myModalSave").remove();
        $("#myModalFooter").append('<button type="button" class="btn btn-primary" id="myModalSave" onclick="savedata(\'myModal\')">შენახვა</button>');

    });

    function generateUrl(value)
    {
        return "saveroommove.jsp?rrid=<%=reserv.getReservationroomid()%>&rid="+value;
    }
    
    function reloadAfterAssignRoom(){
        getBody("stayviewleft", "stayview", 'დატვირთულობა', 'res1','',true);
        reloadGrid('list_pendingreservations');
    }
</script>
<input type="hidden" id="action" class="assignroomURL"/>
<input type="hidden" id="controls" value="assignroom_roomid,renewRoomPricech"/>
<input type="hidden" id="callbackurl" value="script:reloadAfterAssignRoom()"/>
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
            <select class="dropdown" id="roomType">
                <%
                    String selected = "";
                    for (int i = 0; i < roomTypes.length; i++) {
                        if (reserv.getRoomtypeid().equals(roomTypes[i].getRoomtypeid())) {
                            selected = "selected='selected'";
                        } else {
                            selected = "";
                        }
                %>
                <option value="<%=roomTypes[i].getRoomtypeid()%>" <%=selected%>><%=roomTypes[i].getName()%>
                </option>
                <% } %>
            </select>
            <select class="dropdown" id="assignroom_roomid">
                <option value="0">-ოთახის #-</option>
                <% for (int i = 0; i < roomBeans.length; i++) { 
                    String sel = "";
                    if(reserv.getRoomid() != null && reserv.getRoomid().intValue() == roomBeans[i].getRoomid().intValue())
                        sel = "selected";
                %>
                <option value="<%=roomBeans[i].getRoomid()%>"
                        roomtypeid="<%=roomBeans[i].getRoomtypeid()%>" <%=sel%>><%=roomBeans[i].getName()%>
                </option>
                <% } %>
            </select>
        </td>
    </tr>
    <tr>
        <td><b>სტუმარი</b></td>
        <td><%=guestname%>
        </td>
    </tr>
    <tr>
        <td><b>ჩამოსვლა</b></td>
        <td><%=dt.format(res.getArraivaldate())%>
        </td>
    </tr>
    <tr>
        <td><b>წასვლა</b></td>
        <td><%=dt.format(res.getDeparturedate())%>
        </td>
    </tr>
    <tr>
        <td><b>ღამეები</b></td>
        <td>
            <%=DayDiff(cal1, cal2) + 1%>
        </td>
    </tr>
    <tr id="renewRoomPrice"  style="display: none;" >
        <td><b>ოთახის ტარიფის განახლება</b></td>
        <td>
            <input type="checkbox" id="renewRoomPricech" name="renewRoomPricech"/>
        </td>
    </tr>
</table>
