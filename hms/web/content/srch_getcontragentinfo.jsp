<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
ContragentBean contr = ContragentManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("id")));
SalutationBean salutation = SalutationManager.getInstance().loadByPrimaryKey(contr.getSalutationid());
String guestname = salutation.getName()+" " + contr.getFname() + " " + contr.getLname();
CountryBean country = CountryManager.getInstance().loadByPrimaryKey(contr.getCountryid());
String phone = contr.getPhone();
if(phone == null)   phone = "";
String mobile = contr.getMobile();
if(mobile == null)  mobile = "";
String idn = contr.getIdn();
if(idn == null) idn = "";
String email = contr.getEmail();
if(email == null)   email = "";
ReservationroomBean[] rooms = ReservationroomManager.getInstance().loadByWhere("where reservationid in (select reservationid from reservation where companyid = "+contr.getContragentid()+") order by reservationid");
%>
<table class="" width='100%'>
    <tr>
        <td width='30%' valign='top'>
            <table class="table table-borderless" width='100%'>
                <tr>
                    <td style="font-size: 12px; width: 110px; color: #7DA341; font-weight: bold;"><%=guestname%></td>
                </tr>
                <tr>
                    <td style="width: 110px; color: #7DA341;"><%=(contr.getAddress() != null) ? contr.getAddress():""%></td>
                </tr>
                <tr>
                    <td style="width: 110px; color: #7DA341;"><%=(contr.getCity()!= null) ? contr.getCity():""%><%=(contr.getZip() != null) ? ", "+contr.getZip():""%></td>
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