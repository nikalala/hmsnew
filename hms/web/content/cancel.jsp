<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
ReservationroomBean reserv = ReservationroomManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("rid")));
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
<input type="hidden" id="action" value="savecancel.jsp?rid=<%=reserv.getReservationroomid()%>"/>
<input type="hidden" id="controls" value="cancel_reasonid,cancel_cancellationfee"/>
<input type="hidden" id="callbackurl" value="script:reloadGrid('list_pendingreservations')"/>
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
        </td>
    </tr>
    <tr>
        <td><b>ანგარიში</b></td>
        <td>გაუქმების ანგარიში</td>
        <td><b>გადასახადის ტიპი</b></td>
        <td>დღგ</td>
    </tr>
    
    <tr>
        <td><b>გადასახადი</b></td>
        <td><%=maincurrency.getCode()%> <%=dc.format(tax)%></td>
        <td><b>ბალანსი</b></td>
        <td><%=maincurrency.getCode()%> <%=dc.format(total-deposit)%></td>
    </tr>
</table>