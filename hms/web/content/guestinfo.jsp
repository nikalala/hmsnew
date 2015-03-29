<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
String rid  = request.getParameter("reservationroomid");
ReservationroomBean rroom = null;
GuestBean guest = null;
String guestname = "";
String guestaddress = "";

if(!rid.equals("null")){
    rroom = ReservationroomManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("reservationroomid")));
    if(rroom.getGuestid() != null){
        guest = GuestManager.getInstance().loadByPrimaryKey(rroom.getGuestid());
        SalutationBean salutation = SalutationManager.getInstance().loadByPrimaryKey(guest.getSalutationid());
        guestname += salutation.getName()+" ";
        guestname += guest.getFname() + " " + guest.getLname();
        if(guest.getCountryid() != null){
            CountryBean country = CountryManager.getInstance().loadByPrimaryKey(guest.getCountryid());
            guestaddress = country.getName()+" ";
        }
        if(guest.getCity() != null) guestaddress += guest.getCity()+" ";
        if(guest.getZip() != null)  guestaddress += guest.getZip();
    }
}

%>
<div class="panel-heading">
    <h3 class="panel-title">
        სტუმრის ინფორმაცია 
        <%if(rroom != null){%>
        <div class="btn-group pull-right">
            <a href="javascript:printRegCard(<%=rroom.getReservationroomid()%>)" class="glyphicon glyphicon-credit-card iconblack" style="text-decoration: none;" data-toggle="tooltip" title="ბარათის გატარება"></a>
            <a href="javascript:newmWindow1('editguestinfo','სტუმრის პროფილის რედაქტირება','reservationroomid=<%=rroom.getReservationroomid()%>&mode=edit');" class="glyphicon glyphicon-pencil iconblack" style="text-decoration: none; padding-left: 10px; padding-right: 10px;" data-toggle="tooltip" title="სტუმრის პროფილის რედაქტირება"></a>
            <a href="javascript:newmWindow1('editguestinfo','სტუმრის პროფილის დამატება','reservationroomid=<%=rroom.getReservationroomid()%>&mode=add');" class="glyphicon glyphicon-plus iconblack" style="text-decoration: none;" data-toggle="tooltip" title="სტუმრის პროფილის დამატება"></a>
        </div>
        <%}%>
    </h3>
</div>
<div class="panel-body" style="height:110px;">
    <table width="100%" class="table table-borderless">
        <tbody>
            <tr>
                <td><b><span style="color: #598904"><%=guestname%></span></b></td>
                <td><b>მობილური</b></td>
                <td><%=(guest != null && guest.getMobile() != null) ? guest.getMobile():""%></td>
            </tr>
            <tr>
                <td></td>
                <td><b>ტელეფონი</b></td>
                <td><%=(guest != null && guest.getPhone() != null) ? guest.getPhone():""%></td>
            </tr>
            <tr>
                <td></td>
                <td><b>ელფოსტა</b></td>
                <td><%=(guest != null && guest.getEmail()!= null) ? guest.getEmail():""%></td>
            </tr>
            <tr>
                <td colspan="3">
                    <%=guestaddress%>
                </td>
            </tr>
        </tbody>
    </table>
</div>
