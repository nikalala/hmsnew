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
    RoomtypeBean roomtype = RoomtypeManager.getInstance().loadByPrimaryKey(reserv.getRoomtypeid());
    String guestname = salutation.getName() + " ";
    guestname += guest.getFname() + " " + guest.getLname();
    ReservationtypeBean rtp = ReservationtypeManager.getInstance().loadByPrimaryKey(res.getReservationtypeid());
    Calendar cal1 = Calendar.getInstance();
    cal1.setTime(res.getArraivaldate());
    Calendar cal2 = Calendar.getInstance();
    cal2.setTime(res.getDeparturedate());
    if (checkinsettings.getBeyond() != null)
        cal1.setTime(res.getRegdate());

    String roomWhere = "where getroomstatus(roomid,'"+dflong.format(lclosedate)+"') in (7,8) ";
    if(reserv.getRoomid() != null)
        roomWhere += " or roomid = "+reserv.getRoomid();
    roomWhere += " ORDER BY ord";
    RoomBean[] roomBeans = RoomManager.getInstance().loadByWhere(roomWhere);
    RoomtypeBean[] roomTypes = RoomtypeManager.getInstance().loadByWhere("ORDER BY ord"); 
%>
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
