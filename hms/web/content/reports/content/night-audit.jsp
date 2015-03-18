<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../../includes/init.jsp"%>
<%
    ReportBean report = ReportManager.getInstance().loadByPrimaryKey(new Integer(request.getParameter("rid")));
    String reportdate = dt.format(dclosedate);
    if(request.getParameter("reportdate") != null)
        reportdate = request.getParameter("reportdate");
    Calendar cal = Calendar.getInstance();
    cal.setTime(dt.parse(reportdate));
    FolioitemBean[] items = FolioitemManager.getInstance().loadByWhere("where reservationroomid in (select r.reservationroomid from reservation s, reservationroom r where s.reservationid = r.reservationid and s.status = -1) and roomid is not null and particular = 6 and itemdate::date = to_date('"+df.format(dt.parse(reportdate))+"','DD/MM/YYYY') order by roomid");
    ReservationroomBean[] rrooms = ReservationroomManager.getInstance().loadByWhere("where roomid is not null and reservationid in (select reservationid from reservation where departuredate::date = to_date('"+df.format(dt.parse(reportdate))+"','DD/MM/YYYY')) and getroomstatus(roomid,'"+df.format(dt.parse(reportdate))+"') = 4 order by roomid");
System.out.println("select * from reservationroom where roomid is not null and reservationid in (select reservationid from reservation where departuredate::date = to_date('"+df.format(dt.parse(reportdate))+"','DD/MM/YYYY')) and getroomstatus(roomid,'"+df.format(dt.parse(reportdate))+"') = 4 order by roomid");
%>

        <style> 
        @font-face {
            font-family: table-font;
            src: url(font/helvetica-neue-medium-1361522099.ttf);
        }

        body {
            font-family: table-font;
            font-size: 12px;
        }
        td {
            padding-left: 5px;
            padding-right: 5px;
        }
        </style>
        <script>
            $('#reportdate').datepicker(<%=pickerformat1%>).on('changeDate', function (e) {
                $.post("content/reports/content/night-audit.jsp",{ rid: <%=report.getReportid()%>, reportdate: $('#reportdate').val() },function(data){$("#report_<%=report.getReportid()%>").html(data);});
            });
        </script>

        <table style="width: 100%;">
            <thead>
             <tr>
                 <td style="border-bottom: 1px solid #000;"><b style="font-size: 13px;">თარიღისთვის:</b> 
                     <span>
                         <input readonly="" size="10" value="<%=reportdate%>" type="text" id="reportdate">
                     </span>
                 </td>
             </tr>
            </thead>
        </table>
        <%if(items.length > 0){%>
        <table style="width: 100%;">
            <thead>
             <tr>
                 <td style="border-bottom: 1px solid #000;"><b style="font-size: 13px;">1. ოთახის გადასახადები</b></td>
             </tr>
            </thead>
        </table> 
        <table style="width: 100%;">
             <tr>
                 <td style="border-bottom: 1px solid #000;"><b>ოთახი</b></td>
                 <td style="border-bottom: 1px solid #000; width: 58px;"><b>ფოლიო N.</b></td>
                 <td style="border-bottom: 1px solid #000;"><b>სტუმარი</b></td>
                 <td style="border-bottom: 1px solid #000;"><b>წყარო</b></td>
                 <td style="border-bottom: 1px solid #000; width: 65px;"><b>გაქირავების თარიღი</b></td>
                 <td style="border-bottom: 1px solid #000; width: 65px;"><b>ტარიფის ტიპი</b></td>
                 <td style="border-bottom: 1px solid #000; width: 73px;"><b>სტანდარტული ტარიფი</b></td>
                 <td style="border-bottom: 1px solid #000; width: 71px;"><b>შეთავაზებული ტარიფი</b></td>
                 <td style="border-bottom: 1px solid #000; width: 60px;"><b>სულ ბეგარა</b></td>
                 <td style="border-bottom: 1px solid #000; width: 67px;"><b>სულ თანხა</b></td>
                 <td style="border-bottom: 1px solid #000; width: 38px;"><b>%-ული სხვაობა</b></td>
                 <td style="border-bottom: 1px solid #000; width: 74px;"><b>ოპერატორი</b></td> 
             </tr>
             <%
             double[] tots = new double[5];
             for(int i=0;i<items.length;i++){
                 ReservationroomBean rroom = ReservationroomManager.getInstance().loadByPrimaryKey(items[i].getReservationroomid());
                 ReservationBean res = ReservationManager.getInstance().loadByPrimaryKey(rroom.getReservationid());
                 RoomBean room = RoomManager.getInstance().loadByPrimaryKey(items[i].getRoomid());
                 RoomtypeBean roomtype = RoomtypeManager.getInstance().loadByPrimaryKey(room.getRoomtypeid());
                 RatetypeBean rttype = RatetypeManager.getInstance().loadByPrimaryKey(rroom.getRatetypeid());
                 String guestname = "";
                 if(rroom.getGuestid() != null){
                    GuestBean guest = GuestManager.getInstance().loadByPrimaryKey(rroom.getGuestid());
                    SalutationBean slt = SalutationManager.getInstance().loadByPrimaryKey(guest.getSalutationid());
                    guestname = slt.getName()+" "+guest.getFname()+" "+guest.getLname();
                 }
                 String bname = "";
                 if(res.getBsourceid() != null){
                     BusinesssourceBean bs = BusinesssourceManager.getInstance().loadByPrimaryKey(res.getBsourceid());
                     bname = bs.getName();
                 }
                 
                 tariff trf = new tariff();
                 trf.init(rroom.getReservationroomid().longValue(),0);
                 
                 double stprice = trf.tariff_rate;  // - trf.tariff_tax;
                 double tax = getSum("select sum(amount) from folioitem where particular = -1 and reservationroomid = "+rroom.getReservationroomid()+" and itemdate::date = to_date('"+df.format(items[i].getItemdate())+"','DD/MM/YYYY')");
                 double discount = getSum("select sum(amount) from folioitem where particular = 4 and reservationroomid = "+rroom.getReservationroomid()+" and itemdate::date = to_date('"+df.format(items[i].getItemdate())+"','DD/MM/YYYY')");
                 double var = stprice*100/(items[i].getAmount().doubleValue()-discount)-100;
                 PersonnelBean pers = PersonnelManager.getInstance().loadByPrimaryKey(items[i].getRegbyid());
                 tots[0] += stprice;
                 tots[1] += items[i].getAmount().doubleValue()-discount;
                 tots[2] += tax;
                 tots[3] += tax+items[i].getAmount().doubleValue()-discount;
                 tots[4] += var;
             %>
             <tr>
                 <td><%=room.getName()%> - <%=roomtype.getCode()%></td>
                 <td><%=items[i].getFolioid()%></td>
                 <td><%=guestname%></td>
                 <td><%=bname%></td>
                 <td><%=dt.format(items[i].getItemdate())%></td>
                 <td><%=rttype.getName()%></td>
                 <td align="right"><%=dc.format(stprice)%></td>
                 <td align="right"><%=dc.format(items[i].getAmount().doubleValue()-discount)%></td>
                 <td align="right"><%=dc.format(tax)%></td>
                 <td align="right"><%=dc.format(tax+items[i].getAmount().doubleValue()-discount)%></td>
                 <td align="right"><%=dc.format(var)%></td>
                 <td><%=pers.getFname()%> <%=pers.getLname()%></td>
             </tr>
             <%}%>
             <tr>
                 <td></td>
                 <td></td>
                 <td></td>
                 <td></td>
                 <td></td>
                 <td align="right"><b>ჯამი</b></td>
                 <%
                 for(int i=0;i<tots.length;i++){
                     %><td style="border-bottom: 1px dotted #000; border-top: 1px dotted #000;" align="right"><b><%=dc.format(tots[i])%></b></td><%
                 }
                 %>
                 <td></td>
             </tr>
        </table>
        <%} if(rrooms.length > 0){%>
        <br>
        <table style="width: 100%;">
            <thead>
             <tr>
                 <td style="border-bottom: 1px solid #000;"><b style="font-size: 13px;">2. გაწერილები</b></td>
             </tr>
            </thead>
        </table> 
        <table style="width: 100%;">
             <tr>
                 <td style="border-bottom: 1px solid #000;"><b>ოთახი</b></td>
                 <td style="border-bottom: 1px solid #000;"><b>სტუმარი</b></td>
                 <td style="border-bottom: 1px solid #000; width: 62px;"><b>ჩამოსვლა</b></td>
                 <td style="border-bottom: 1px solid #000; width: 65px;"><b>წასვლა</b></td>
                 <td style="border-bottom: 1px solid #000; width: 42px;"><b>ღამეები</b></td>
                 <td style="border-bottom: 1px solid #000; width: 94px;"><b>ოთახის გადასახადები</b></td>
                 <td style="border-bottom: 1px solid #000; width: 92px;"><b>დამატებითი გადასახადები</b></td>
                 <td style="border-bottom: 1px solid #000; width: 58px;"><b>ფასდაკლება</b></td>
                 <td style="border-bottom: 1px solid #000; width: 40px;"><b>ბეგარა</b></td>
                 <td style="border-bottom: 1px solid #000; width: 44px;"><b>დამრგვალება</b></td>
                 <td style="border-bottom: 1px solid #000; width: 56px;"><b>გადახდილი</b></td>
                 <td style="border-bottom: 1px solid #000; width: 56px;"><b>ბალანსი</b></td> 
             </tr>
             <%
             double[] tots = new double[7];
             for(int i=0;i<rrooms.length;i++){
                 ReservationBean res = ReservationManager.getInstance().loadByPrimaryKey(rrooms[i].getReservationid());
                 RoomBean room = RoomManager.getInstance().loadByPrimaryKey(rrooms[i].getRoomid());
                 RoomtypeBean roomtype = RoomtypeManager.getInstance().loadByPrimaryKey(room.getRoomtypeid());
                 RatetypeBean rttype = RatetypeManager.getInstance().loadByPrimaryKey(rrooms[i].getRatetypeid());
                 String guestname = "";
                 if(rrooms[i].getGuestid() != null){
                    GuestBean guest = GuestManager.getInstance().loadByPrimaryKey(rrooms[i].getGuestid());
                    SalutationBean slt = SalutationManager.getInstance().loadByPrimaryKey(guest.getSalutationid());
                    guestname = slt.getName()+" "+guest.getFname()+" "+guest.getLname();
                 }
                 Calendar cal1 = Calendar.getInstance();
                 cal1.setTime(res.getArraivaldate());
                 Calendar cal2 = Calendar.getInstance();
                 cal2.setTime(res.getDeparturedate());
                 int nights = DayDiff(cal1,cal2);
                 double price = getSum("select sum(amount) from folioitem where particular = 6 and reservationroomid = "+rrooms[i].getReservationroomid());
                 double extra = getSum("select sum(amount) from folioitem where particular = 5 and reservationroomid = "+rrooms[i].getReservationroomid());
                 double discount = getSum("select sum(amount) from folioitem where particular = 4 and reservationroomid = "+rrooms[i].getReservationroomid());
                 double tax = getSum("select sum(amount) from folioitem where particular = -1 and reservationroomid = "+rrooms[i].getReservationroomid());
                 double rnd = getSum("select sum(amount) from folioitem where particular = 0 and reservationroomid = "+rrooms[i].getReservationroomid());
                 double paid = getSum("select sum(amount) from folioitem where particular in (1,2) and reservationroomid = "+rrooms[i].getReservationroomid());
                 double bal = price+extra+discount+tax+rnd+paid;
                 tots[0] += price;
                 tots[1] += extra;
                 tots[2] += discount;
                 tots[3] += tax;
                 tots[4] += rnd;
                 tots[5] += paid;
                 tots[6] += bal;
             %>
             <tr>
                 <td><%=room.getName()%> - <%=roomtype.getCode()%></td>
                 <td><%=guestname%></td>
                 <td><%=dt.format(res.getArraivaldate())%></td>
                 <td><%=dt.format(res.getDeparturedate())%></td>
                 <td align="right"><%=nights%></td>
                 <td align="right"><%=dc.format(price)%></td>
                 <td align="right"><%=dc.format(extra)%></td>
                 <td align="right"><%=dc.format(discount)%></td>
                 <td align="right"><%=dc.format(tax)%></td>
                 <td align="right"><%=dc.format(rnd)%></td>
                 <td align="right"><%=dc.format(paid)%></td>
                 <td align="right"><%=dc.format(bal)%></td>
             </tr>
             <%}%>
             <tr>
                 <td></td>
                 <td></td>
                 <td></td>
                 <td></td>
                 <td align="right"><b>ჯამი</b></td>
                 <%
                 for(int i=0;i<tots.length;i++){
                     %><td style="border-bottom: 1px dotted #000; border-top: 1px dotted #000;" align="right"><b><%=dc.format(tots[i])%></b></td><%
                 }
                 %>
             </tr>
        </table>
        <%}%>
        <br>
        <table style="width: 100%;">
            <thead>
             <tr>
                 <td style="border-bottom: 1px solid #000;"><b style="font-size: 13px;">3. დღიური გაყიდვანი</b></td>
             </tr>
            </thead>
        </table> 
        <table style="width: 100%;">
             <tr>
                 <td style="border-bottom: 1px solid #000;"><b>გაყიდვის ტიპი</b></td>
                 <td style="border-bottom: 1px solid #000;"><b>ოთახის გადასახადნი</b></td>
                 <td style="border-bottom: 1px solid #000;"><b>დამატებითი გადასახადნი</b></td>
                 <td style="border-bottom: 1px solid #000;"><b>ბეგარა</b></td>
                 <td style="border-bottom: 1px solid #000;"><b>ფასის დაკლება</b></td>
                 <td style="border-bottom: 1px solid #000;"><b>დამრგვალება</b></td>
                 <td style="border-bottom: 1px solid #000;"><b>ნეტო ფასი</b></td>
             </tr>
             <tr>
                 <td>გაყიდული ოთახები</td>
                 <td>0.00</td>
                 <td>0.00</td>
                 <td>0.00</td>
                 <td>0.00</td>
                 <td>0.00</td>
                 <td>0.00</td>
             </tr>
             <tr>
                 <td>პირდაპირ გაყიდული ოთახები</td>
                 <td>0.00</td>
                 <td>0.00</td>
                 <td>0.00</td>
                 <td>0.00</td>
                 <td>0.00</td>
                 <td>0.00</td>
             </tr>
             <tr>
                 <td>გაუქმება</td>
                 <td>0.00</td>
                 <td>0.00</td>
                 <td>0.00</td>
                 <td>0.00</td>
                 <td>0.00</td>
                 <td>0.00</td>
             </tr>
             <tr>
                 <td>არ გამოცხადება</td>
                 <td>0.00</td>
                 <td>0.00</td>
                 <td>0.00</td>
                 <td>0.00</td>
                 <td>0.00</td>
                 <td>0.00</td>
             </tr>
             <tr>
                 <td>დღიური გამოყენება</td>
                 <td>0.00</td>
                 <td>0.00</td>
                 <td>0.00</td>
                 <td>0.00</td>
                 <td>0.00</td>
                 <td>0.00</td>
             </tr>
             <tr>
                 <td>გვიან გაწერა</td>
                 <td>0.00</td>
                 <td>0.00</td>
                 <td>0.00</td>
                 <td>0.00</td>
                 <td>0.00</td>
                 <td>0.00</td>
             </tr>
             <tr>
                 <td>ადრე მიღება</td>
                 <td>0.00</td>
                 <td>0.00</td>
                 <td>0.00</td>
                 <td>0.00</td>
                 <td>0.00</td>
                 <td>0.00</td>
             </tr>
             <tr>
                 <td>გაუთვალისწინებელი</td>
                 <td>0.00</td>
                 <td>0.00</td>
                 <td>0.00</td>
                 <td>0.00</td>
                 <td>0.00</td>
                 <td>0.00</td>
             </tr>
             <tr>
                 <td><b>Total</b></td>
                 <td style="border-bottom: 1px dotted #000; border-top: 1px dotted #000;"><b>0.00</b></td>
                 <td style="border-bottom: 1px dotted #000; border-top: 1px dotted #000;"><b>0.00</b></td>
                 <td style="border-bottom: 1px dotted #000; border-top: 1px dotted #000;"><b>0.00</b></td>
                 <td style="border-bottom: 1px dotted #000; border-top: 1px dotted #000;"><b>0.00</b></td>
                 <td style="border-bottom: 1px dotted #000; border-top: 1px dotted #000;"><b>0.00</b></td>
                 <td style="border-bottom: 1px dotted #000; border-top: 1px dotted #000;"><b>0.00</b></td>
             </tr>
        </table>
        <br>
        <table style="width: 100%;">
            <thead>
             <tr>
                 <td style="border-bottom: 1px solid #000;"><b style="font-size: 13px;">4. Receipt - Detail</b></td>
             </tr>
            </thead>
        </table> 
        <table style="width: 100%;">
             <tr>
                 <td style="border-bottom: 1px solid #000;"><b>Date</b></td>
                 <td style="border-bottom: 1px solid #000;"><b>Receipt</b></td>
                 <td style="border-bottom: 1px solid #000;"><b>Reference</b></td>
                 <td style="border-bottom: 1px solid #000;"><b>Amount</b></td>
                 <td style="border-bottom: 1px solid #000;"><b>User</b></td>
                 <td style="border-bottom: 1px solid #000;"><b>Entered On</b></td>
                 <td style="border-bottom: 1px solid #000;"><b>Remark</b></td>
             </tr>
             <tr>
                 <td><b>Pay Method</b></td>
                 <td>Cash(GEL)</td>
                 <td></td>
                 <td></td>
                 <td></td>
                 <td></td>
                 <td></td>
             </tr>
             <tr>
                 <td>undefined</td>
                 <td>undefined</td>
                 <td>undefined</td>
                 <td>undefined</td>
                 <td>undefined</td>
                 <td>undefined</td>
                 <td></td>
             </tr>
             <tr>
                 <td></td>
                 <td></td>
                 <td></td>
                 <td><b>Total</b></td>
                 <td style="border-bottom: 1px dotted #000; border-top: 1px dotted #000;"><b>0.00</b></td>
                 <td></td>
                 <td></td>
             </tr>
             <tr>
                 <td></td>
                 <td></td>
                 <td></td>
                 <td><b>Grand Total</b></td>
                 <td style="border-bottom: 1px dotted #000; border-top: 1px dotted #000;"><b>0.00</b></td>
                 <td></td>
                 <td></td>
             </tr>
        </table>
        <br>
        <table style="width: 100mm;">
            <thead>
             <tr>
                 <td style="border-bottom: 1px solid #000;"><b style="font-size: 13px;">5. Receipt - Summary</b></td>
             </tr>
            </thead>
        </table> 
        <table style="width: 100mm;">
             <tr>
                 <td style="border-bottom: 1px solid #000; width: 150px;"><b>User</b></td>
                 <td style="border-bottom: 1px solid #000;"><b>Amount</b></td>
             </tr>
             <tr>
                 <td>admin</td>
                 <td>0.00</td>
             </tr>
             <tr>
                 <td><b>Total</b></td>
                 <td style="border-bottom: 1px dotted #000; border-top: 1px dotted #000;"><b>0.00</b></td>
             </tr>
        </table>
        <table style="width: 100mm;">
             <tr>
                 <td style="border-bottom: 1px solid #000; width: 150px;"><b>Pay Method</b></td>
                 <td style="border-bottom: 1px solid #000;"><b>Amount</b></td>
             </tr>
             <tr>
                 <td>bank</td>
                 <td>0.00</td>
             </tr>
             <tr>
                 <td>cash</td>
                 <td>0.00</td>
             </tr>
             <tr>
                 <td><b>Total</b></td>
                 <td style="border-bottom: 1px dotted #000; border-top: 1px dotted #000;"><b>0.00</b></td>
             </tr>
        </table>
        <br>
        <table style="width: 100%;">
            <thead>
             <tr>
                 <td style="border-bottom: 1px solid #000;"><b style="font-size: 13px;">6. Misc. Charges</b></td>
             </tr>
            </thead>
        </table> 
        <table style="width: 100%;">
             <tr>
                 <td style="border-bottom: 1px solid #000;"><b>Room</b></td>
                 <td style="border-bottom: 1px solid #000; width: 58px;"><b>Folio No.</b></td>
                 <td style="border-bottom: 1px solid #000;"><b>Guest</b></td>
                 <td style="border-bottom: 1px solid #000; width: 82px;"><b>Charge Date</b></td>
                 <td style="border-bottom: 1px solid #000; width: 75px;"><b>Voucher No</b></td>
                 <td style="border-bottom: 1px solid #000; width: 57px;"><b>Charge</b></td>
                 <td style="border-bottom: 1px solid #000; width: 58px;"><b>Amount</b></td>
                 <td style="border-bottom: 1px solid #000;"><b>Entered On</b></td>
                 <td style="border-bottom: 1px solid #000;"><b>Remark</b></td>
             </tr>
             <tr>
                 <td>100 - king</td>
                 <td>55</td>
                 <td>mr. asmkdlkmasldkm asldmkl asm</td>
                 <td>00.00.0000</td>
                 <td>69</td>
                 <td>0.00</td>
                 <td>0.00</td>
                 <td></td>
                 <td></td>
             </tr>
             <tr>
                 <td></td>
                 <td></td>
                 <td></td>
                 <td></td>
                 <td></td>
                 <td><b>Total</b></td>
                 <td style="border-bottom: 1px dotted #000; border-top: 1px dotted #000;"><b>0.00</b></td>
                 <td></td>
                 <td></td>
             </tr>
        </table>
        <br>
        <table style="width: 100%;">
            <thead>
             <tr>
                 <td style="border-bottom: 1px solid #000;"><b style="font-size: 13px;">8. Room Status</b></td>
             </tr>
            </thead>
        </table> 
        <table style="width: 100%;">
             <tr>
                 <td style="border-bottom: 1px solid #000;"><b>Date</b></td>
                 <td style="border-bottom: 1px solid #000;"><b>Total Rooms</b></td>
                 <td style="border-bottom: 1px solid #000;"><b>Occupied</b></td>
                 <td style="border-bottom: 1px solid #000;"><b>Due Out</b></td>
                 <td style="border-bottom: 1px solid #000;"><b>Vacant</b></td>
                 <td style="border-bottom: 1px solid #000;"><b>Departed</b></td>
                 <td style="border-bottom: 1px solid #000;"><b>Reserve</b></td>
                 <td style="border-bottom: 1px solid #000;"><b>Blocked</b></td>
             </tr>
             <tr>
                 <td>undefined</td>
                 <td>undefined</td>
                 <td>undefined</td>
                 <td>undefined</td>
                 <td>undefined</td>
                 <td>undefined</td>
                 <td>undefined</td>
                 <td>undefined</td>
             </tr>
        </table>
        <br>
        <table style="width: 200mm;">
            <thead>
             <tr>
                 <td style="border-bottom: 1px solid #000;"><b style="font-size: 13px;">9. Pax Status</b></td>
             </tr>
            </thead>
        </table> 
        <table style="width: 200mm;">
             <tr>
                 <td style="border-bottom: 1px solid #000;"><b>Status</b></td>
                 <td style="border-bottom: 1px solid #000;"><b>Rooms</b></td>
                 <td style="border-bottom: 1px solid #000;"><b>Adult</b></td>
                 <td style="border-bottom: 1px solid #000;"><b>Child</b></td>
             </tr>
             <tr>
                 <td>Arrival</td>
                 <td>undefined</td>
                 <td>undefined</td>
                 <td>undefined</td>
             </tr>
             <tr>
                 <td>Checked Out</td>
                 <td>undefined</td>
                 <td>undefined</td>
                 <td>undefined</td>
             </tr>
             <tr>
                 <td>Stay over</td>
                 <td>undefined</td>
                 <td>undefined</td>
                 <td>undefined</td>
             </tr>
        </table>
        <br>
        <table style="width: 150mm;">
            <thead>
             <tr>
                 <td style="border-bottom: 1px solid #000;"><b style="font-size: 13px;">10. Pax Analysis</b></td>
             </tr>
            </thead>
        </table> 
        <table style="width: 150mm;">
             <tr>
                 <td style="border-bottom: 1px solid #000;"><b>Rate Type</b></td>
                 <td style="border-bottom: 1px solid #000;"><b>Adult</b></td>
                 <td style="border-bottom: 1px solid #000;"><b>Child</b></td>
             </tr>
             <tr>
                 <td>Single</td>
                 <td>undefined</td>
                 <td>undefined</td>
             </tr>
             <tr>
                 <td>Double</td>
                 <td>undefined</td>
                 <td>undefined</td>
             </tr>
        </table>

