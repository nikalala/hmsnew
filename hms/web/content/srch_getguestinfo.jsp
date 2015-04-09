<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
GuestBean guest = GuestManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("id")));
SalutationBean salutation = SalutationManager.getInstance().loadByPrimaryKey(guest.getSalutationid());
String guestname = salutation.getName()+" " + guest.getFname() + " " + guest.getLname();
CountryBean country = CountryManager.getInstance().loadByPrimaryKey(guest.getCountryid());
String phone = guest.getPhone();
if(phone == null)   phone = "";
String mobile = guest.getMobile();
if(mobile == null)  mobile = "";
String idn = guest.getIdn();
if(idn == null) idn = "";
String email = guest.getEmail();
if(email == null)   email = "";
ReservationroomBean[] rooms = ReservationroomManager.getInstance().loadByWhere("where guestid = "+guest.getGuestid()+" order by reservationid");
%>
<table class="" width='100%'>
    <tr>
        <td width='30%' valign='top'>
            <table class="table table-borderless" width='100%'>
                <tr>
                    <td style="font-size: 12px; width: 110px; color: #7DA341; font-weight: bold;"><%=guestname%></td>
                </tr>
                <tr>
                    <td style="width: 110px; color: #7DA341;"><%=(guest.getAddress() != null) ? guest.getAddress():""%></td>
                </tr>
                <tr>
                    <td style="width: 110px; color: #7DA341;"><%=(guest.getCity()!= null) ? guest.getCity():""%><%=(guest.getZip() != null) ? ", "+guest.getZip():""%></td>
                </tr>
                <tr>
                    <td style="width: 110px; color: #7DA341;"><%=country.getName()%></td>
                </tr>
            </table>
        </td>
        <td width='20%' valign='top'>
            <table class="table table-borderless" width='100%'>
                <tr>
                    <td class="tbllabel" style="width: 80px;">მობილური</td>
                    <td style="width: 110px;"><%=mobile%></td>
                </tr>
                <tr>
                    <td class="tbllabel" style="width: 80px;">ტელეფონი</td>
                    <td style="width: 110px;"><%=phone%></td>
                </tr>
                <tr>
                    <td class="tbllabel" style="width: 80px;">ელფოსტა</td>
                    <td style="width: 110px;"><a href="mailto:<%=email%>"><%=email%></a></td>
                </tr>
            </table>
        </td>
        <td width='50%' valign='top' style="border: #DDDDDD 1px solid;">
            <table class="scrollsrch1" id="search_tbl1" width="100%">
                <thead>
                    <tr style='height: 10px;'>
                        <th nowrap align="center" style="width: 110px;">&nbsp;&nbsp;ოთახი</th>
                        <th nowrap align="center" style="width: 90px;">&nbsp;&nbsp;ჩამოსვლა</th>
                        <th nowrap align="center" style="width: 110px;">&nbsp;&nbsp;წასვლა</th>
                        <th nowrap align="center" style="width: 90px;">&nbsp;&nbsp;ტარიფი</th>
                    </tr>
                </thead>

                <tbody id="search_table_body1" style="height: 100px;">
                    <%for(int i=0;i<rooms.length;i++){
                        RoomBean room = RoomManager.getInstance().loadByPrimaryKey(rooms[i].getRoomid());
                        ReservationBean res = ReservationManager.getInstance().loadByPrimaryKey(rooms[i].getReservationid());
                        String ddate = "";
                        if(res.getDeparturedate() != null)  ddate = dt.format(res.getDeparturedate());
                        double roomrate = 0;
                        if(res.getRatetype().intValue() == 0){
                            
                        } else if(res.getRatetype().intValue() == 1){
                            
                        } else if(res.getRatetype().intValue() == 2){
                            roomrate = res.getManualrate().doubleValue();
                        }
                    %>
                    <tr>
                        <td style='width: 100px;'><%=room.getName()%></td>
                        <td style='width: 100px;'><%=dt.format(res.getArraivaldate())%></td>
                        <td style='width: 100px;'><%=ddate%></td>
                        <td style='width: 100px;'><%=roomrate%></td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </td>
    </tr>
</table>