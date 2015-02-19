<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<script>
    if(maincontentheight > 654){
        $("#spacer").height(maincontentheight-654);
    }
</script>
<%
ReservationroomBean rroom = ReservationroomManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("reservationroomid")));
ReservationBean reserv = ReservationManager.getInstance().loadByPrimaryKey(rroom.getReservationid());
ReservationroomBean[] childs = ReservationroomManager.getInstance().loadByWhere("where reservationid = "+reserv.getReservationid()+" and leader = false order by reservationid");
GuestBean guest = GuestManager.getInstance().loadByPrimaryKey(rroom.getGuestid());
String guestname = "";
SalutationBean salutation = SalutationManager.getInstance().loadByPrimaryKey(guest.getSalutationid());
guestname += salutation.getName()+" ";
guestname += guest.getFname() + " " + guest.getLname();
String guestaddress = "";
if(guest.getCountryid() != null){
    CountryBean country = CountryManager.getInstance().loadByPrimaryKey(guest.getCountryid());
    guestaddress = country.getName()+" ";
}
if(guest.getCity() != null) guestaddress += guest.getCity()+" ";
if(guest.getZip() != null)  guestaddress += guest.getZip();

RatetypeBean rtp = RatetypeManager.getInstance().loadByPrimaryKey(rroom.getRatetypeid());

int sts = 0;
String rname = "ნომრის გარეშე";
String rtypecode = "";
if(rroom.getRoomid() != null){
    RoomBean room = RoomManager.getInstance().loadByPrimaryKey(rroom.getRoomid());
    rname = room.getCode();

    if(rname == null)   rname = room.getName();
    if(rname == null || rname.trim().length() == 0) rname = "ნომრის გარეშე";
    sts = getRoomStatus(new Date(), room.getRoomid().intValue());
}

RoomtypeBean roomtype = RoomtypeManager.getInstance().loadByPrimaryKey(rroom.getRoomtypeid());
FolioBean[] folio = FolioManager.getInstance().loadByReservationroomid(rroom.getReservationroomid());
String fnum = "0";
if(folio.length > 0)    fnum = folio[0].getFolioid().toString();

rtypecode = " - " + roomtype.getCode();
String restp = "";
String bsrc = "";
String marketname = "";
String agentname = "";
String companyname = "";
if(reserv.getReservationtypeid() != null){
    ReservationtypeBean restype = ReservationtypeManager.getInstance().loadByPrimaryKey(reserv.getReservationtypeid());
    restp = "<span style=\"color: "+restype.getColor()+"\">"+restype.getName()+"</span>";
}
if(reserv.getBsourceid()!= null){
    BsourceBean bs = BsourceManager.getInstance().loadByPrimaryKey(reserv.getBsourceid());
    bsrc = bs.getName();
}
if(reserv.getMarketid() != null){
    MarketBean bs = MarketManager.getInstance().loadByPrimaryKey(reserv.getMarketid());
    marketname = bs.getName();
}
if(reserv.getTaid() != null){
    ContragentBean bs = ContragentManager.getInstance().loadByPrimaryKey(reserv.getTaid());
    agentname = bs.getFname()+" "+bs.getLname();
}
if(reserv.getCompanyid()!= null){
    ContragentBean bs = ContragentManager.getInstance().loadByPrimaryKey(reserv.getCompanyid());
    companyname = bs.getName();
}

double topay = 0;
double paid = 0;

PaymentmethodBean[] ptps = PaymentmethodManager.getInstance().loadByWhere("order by paymentmethodid");
ContragentBean[] contragents = ContragentManager.getInstance().loadByWhere("order by name, lname");
//ViewSourcemixlistTravelagentOrCompanyAllBean[] scs =ViewSourcemixlistTravelagentOrCompanyAllManager.getInstance().loadByWhere(" order by name asc");
String[] paytaypevalue = new String[2];
paytaypevalue[0] = "<select id='paymentmethodid' style='width: 200px;'><option value='0'>-- აირჩიეთ --</option>";
for(int i=0;i<ptps.length;i++){
    String sel = "";
    if(reserv.getPaymentmethodid() != null && ptps[i].getPaymentmethodid().intValue() == reserv.getPaymentmethodid().intValue())
        sel = "selected";
    paytaypevalue[0] += "<option value='"+ptps[i].getPaymentmethodid()+"' "+sel+">"+ptps[i].getName()+"</option>";
    
}
paytaypevalue[0] += "</select>";
paytaypevalue[1] = "<select id='paymentmethodid' style='width: 200px;'><option value='0'>-- აირჩიეთ --</option>";
for(int i=0;i<contragents.length;i++){
    String cname = contragents[i].getName();
    if(cname == null || cname.trim().length() == 0)
        cname = contragents[i].getFname()+" "+contragents[i].getLname();
    String sel = "";
    if(reserv.getPaymentcontragentid() != null && contragents[i].getContragentid().intValue() == reserv.getPaymentcontragentid().intValue())
        sel = "selected";
    paytaypevalue[1] += "<option value='"+contragents[i].getContragentid()+"' "+sel+">"+cname+"</option>";
}
paytaypevalue[1] += "</select>";

Calendar c1 = Calendar.getInstance();
Calendar c2 = Calendar.getInstance();
c1.setTime(reserv.getArraivaldate());
c2.setTime(reserv.getDeparturedate());

double[] prices = getRoomrateForStay(rroom.getReservationroomid().longValue());
topay = prices[0];
paid = getSum("select sum(amount*ratedate("+maincurrency.getCurrencyid()+",currencyid,paydate)) from payment where folioid in (select folioid from folio where reservationroomid = "+rroom.getReservationroomid()+")");

String reldate = (reserv.getAdvancepaymentdate() == null) ? "":dt.format(reserv.getAdvancepaymentdate());
String relterm = (reserv.getAdvancepaymentamount() == null) ? "":dc.format(reserv.getAdvancepaymentamount());
String vouchernum = (reserv.getVoucher() == null) ? "":reserv.getVoucher();
%>
<style>
    .trh1 {
        line-height: 31px; 
        min-height: 31px; 
        height: 31px;
    }
</style>
<script>
    function chPayType(tp){
        if(tp == 1){
            $("#paytypelabel").html("გადახდის მეთოდი");
            $("#paytaypevalue").html("<%=paytaypevalue[0]%>");
        } else {
            $("#paytypelabel").html("პირდაპირი დარიცხვა");
            $("#paytaypevalue").html("<%=paytaypevalue[1]%>");
        }
    }
    
    $(document).ready(function(){
    
        $('#reldate').datepicker();
        
        getReasonList1(<%=rroom.getReservationid()%>);
        
        <%if(reserv.getPaymentmode() != null && reserv.getPaymentmode().intValue() == 0){%>
            $("#paytypelabel").html("გადახდის მეთოდი");
            $("#paytaypevalue").html("<%=paytaypevalue[0]%>");
            $("#paytype1").prop('checked', true);
        <%} else if(reserv.getPaymentmode() != null && reserv.getPaymentmode().intValue() == 1){%>
            $("#paytypelabel").html("პირდაპირი დარიცხვა");
            $("#paytaypevalue").html("<%=paytaypevalue[1]%>");
            $("#paytype2").prop('checked', true);
        <%}%>
       
        //$('#transactiongeninfopanel1').height($("#edittransactionbody").height()-50);
        
        
        //$('#transactiongeninfopanel2').height($("#transactiongeninfopanel1").height()*0.58);
        //$('#transactiongeninfopanel3').height($("#transactiongeninfopanel1").height()-$("#transactiongeninfopanel2").height()-14);
        //$('#transactiongeninfopanel4').height($("#transactiongeninfopanel1").height()*0.65);
        //$('#transactiongeninfopanel5').height($("#transactiongeninfopanel1").height()-$("#transactiongeninfopanel4").height()-14);
    
    });
</script>
<table class="" width="100%" style="height: 100%;">
    <tbody>
        <tr id='geninfotr'>
            <td class="transactiongeninfotd" style="width: 420px; padding-left: 5px; padding-right: 2px; padding-bottom: 0px; padding-top: 5px;">
                <div class="panel panel-primary" id="transactiongeninfopanel1" style='height: 260px;'>
                    <div class="panel-heading">
                        <h3 class="panel-title">გადახდის ინფორმაცია</h3>
                    </div>
                    <div class="panel-body">
                        <table width="100%" class="table table-borderless table-condensed">
                            <tbody>
                                <tr class="trh">
                                    <td><b>გადახდის ინსტრუქცია</b></td>
                                    <td>
                                        <select id="payinstruction" style="width: 200px;">
                                            <option value="-1">-- აირჩიეთ --</option>
                                            <%
                                            for(int i=0;i<billto.length;i++){
                                                String sel = "";
                                                if(reserv.getBillto().intValue() == i)
                                                    sel = "selected";
                                            %>
                                            <option value="<%=i%>" <%=sel%>><%=billto[i]%></option>
                                            <%
                                            }
                                            %>
                                        </select>
                                    </td>
                                </tr>
                                <tr class="trh">
                                    <td><b>ტიპი</b></td>
                                    <td>
                                        <div class="radio-inline">
                                            <label>
                                                <input type="radio" name="paytype" id="paytype1" value="cash" onchange="chPayType(1)">
                                                ნაღდი
                                            </label>
                                        </div>
                                        <div class="radio-inline">
                                            <label>
                                                <input type="radio" name="paytype" id="paytype2" value="credit" onchange="chPayType(2)">
                                                კრედიტი
                                            </label>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="trh">
                                    <td style="width: 160px; overflow: hidden; display: inline-block; white-space: nowrap;"><b id="paytypelabel">გადახდის მეთოდი</b></td>
                                    <td id="paytaypevalue">
                                        <%=paytaypevalue[0]%>
                                    </td>
                                </tr>
                                <tr class="trh">
                                    <td><b>რელიზის თარიღი</b></td>
                                    <td>
                                        <div class="input-append date" data-date="" data-date-format="dd/mm/yyyy">
                                            <input class="span2" size="10" value="<%=reldate%>" readonly="" type="text" id="reldate">
                                        </div>
                                    </td>
                                </tr>
                                <tr class="trh">
                                    <td><b>რელიზის პირობა</b></td>
                                    <td>
                                        <input class="" size="6" value="<%=relterm%>" type="text" id="relterm" style="text-align: right;">%
                                    </td>
                                </tr>
                                <tr class="trh">
                                    <td><b>ქვითრის ნომერი</b></td>
                                    <td>
                                        <input class="" size="15" value="<%=vouchernum%>" type="text" id="vouchernum">
                                    </td>
                                </tr>
                                <tr class="trh">
                                    <td><b>რეგისტაციის ბარათი</b></td>
                                    <td>
                                        <input class="" size="10" value="" type="text" id="rgnum" value="<%=rroom.getReservationroomid()%>" readonly="">
                                    </td>
                                </tr>
                                <tr class="trh">
                                    <td><b>ანგარიშის ნომერი</b></td>
                                    <td>
                                        <input class="" size="10" value="" type="text" id="billnum" readonly="">
                                    </td>
                                </tr>
                                <%--
                                <tr class="trh">
                                    <td><b>მანქანის ნომერი</b></td>
                                    <td>
                                        <input class="" size="15" value="" type="text" id="platenum">
                                    </td>
                                </tr>
                                --%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </td>
            <td class="transactiongeninfotd" style="padding-left: 3px; padding-right: 2px; padding-bottom: 0px; padding-top: 5px;">
                <table width="100%">
                    <tbody>
                        <tr>
                            <td>
                                <div class="panel panel-primary" id="transactiongeninfopanel2" style='height: 150px;'>
                                    <div class="panel-heading">
                                        <h3 class="panel-title">
                                            მეზობლის ინფორმაცია
                                            <div class="btn-group pull-right">
                                                <a href="#" class="glyphicon glyphicon-plus iconblack" style="text-decoration: none;" data-toggle="tooltip" title=""></a>
                                            </div>
                                        </h3>
                                    </div>
                                    <div class="panel-body">
                                        <table width="100%" class="table table-striped table-condensed table-hover">
                                            <thead style="background-color: #E9E9E9;">
                                                <tr>
                                                    <td><input type="checkbox" name="allguests" id="allguests" value="0" onclick="checkAll($(this),'guestcheck')"/></td>
                                                    <td><b>სახელი</b></td>
                                                    <td><b>სქესი</b></td>
                                                    <td><b>მოქმედება</b></td>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                for(int i=0;i<childs.length;i++){
                                                    GuestBean gs = GuestManager.getInstance().loadByPrimaryKey(childs[i].getGuestid());
                                                    String gname = "";
                                                    salutation = SalutationManager.getInstance().loadByPrimaryKey(guest.getSalutationid());
                                                    gname += salutation.getName()+" ";
                                                    gname += guest.getFname() + " " + guest.getLname();
                                                    String gendername = "?";
                                                    if(gs.getGender() != null){
                                                        gendername = gender[gs.getGender().intValue()];
                                                    }
                                                %>
                                                <tr>
                                                    <td><input type="checkbox" class="guestcheck" name="guest_<%=gs.getGuestid()%>" id="guest_<%=gs.getGuestid()%>" value="<%=gs.getGuestid()%>"/></td>
                                                    <td><%=gname%></td>
                                                    <td><%=gendername%></td>
                                                    <td>
                                                        <span onclick="" style="cursor: pointer;" class="glyphicon glyphicon-pencil" data-toggle="tooltip" title="რედაქტირება"></span>
                                                        <span onclick="" style="cursor: pointer;" class="glyphicon glyphicon-arrow-down" data-toggle="tooltip" title="მოყვანა"></span>
                                                        <span onclick="" style="cursor: pointer;" class="glyphicon glyphicon-arrow-up" data-toggle="tooltip" title="წაყვანა"></span>
                                                        <span onclick="" style="cursor: pointer;" class="glyphicon glyphicon-user" data-toggle="tooltip" title="შავ სიაში დამატება"></span>
                                                        <span onclick="" style="cursor: pointer;" class="glyphicon glyphicon-list-alt" data-toggle="tooltip" title="სტუმრის სარეგისტრაციო ბარათი"></span>
                                                    </td>
                                                </tr>
                                                <%}%>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="panel-footer">
                                        არჩეული
                                        <span onclick="" style="cursor: pointer;" class="glyphicon glyphicon-list-alt" data-toggle="tooltip" title="სტუმრის სარეგისტრაციო ბარათი"></span>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="panel panel-primary" id="transactiongeninfopanel3" style="height: 98px;">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">
                                            შეიცავს
                                            <div class="btn-group pull-right">
                                                <a href="#" class="glyphicon glyphicon-plus iconblack" style="text-decoration: none;" data-toggle="tooltip" title=""></a>
                                            </div>
                                        </h3>
                                    </div>
                                    <div class="panel-body">
                                        <table width="100%">
                                            <tbody>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
            <td class="transactiongeninfotd" style="padding-left: 3px; padding-right: 5px; padding-bottom: 0px; padding-top: 5px;">
                <table width="100%">
                    <tbody>
                        <tr>
                            <td>
                                <div class="panel panel-primary" id="transactiongeninfopanel4" style='height: 150px;'>
                                    <div class="panel-heading">
                                        <h3 class="panel-title">
                                            შენიშვნები
                                            <div class="btn-group pull-right">
                                                <a href="javascript:newmWindow1('remarks','შენიშვნები','script=getReasonList1(<%=rroom.getReservationid()%>)&rid=<%=rroom.getReservationroomid()%>')" class="glyphicon glyphicon-plus iconblack" style="text-decoration: none;" data-toggle="tooltip" title=""></a>
                                            </div>
                                        </h3>
                                    </div>
                                    <div class="panel-body">
                                        <table width="100%">
                                            <tbody>
                                                <tr>
                                                    <td id="geninfo_remarks"></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="panel panel-primary" id="transactiongeninfopanel5" style="height: 98px;">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">
                                            ჯამი
                                            <div class="btn-group pull-right">
                                                <a href="javascript:infopage('reateinfo','ტარიფის ინფორმაცია','reservationroomid=<%=rroom.getReservationroomid()%>');" class="glyphicon glyphicon-usd iconblack" style="text-decoration: none;" data-toggle="tooltip" title=""></a>
                                            </div>
                                        </h3>
                                    </div>
                                    <div class="panel-body" style="background-color: #F5F5F5; padding-bottom: 0px; padding-top: 2px;">
                                        <table width="100%" class="table table-condensed table-bordered">
                                            <tbody>
                                                <tr style="background-color: #F5F5F5;">
                                                    <td style="border-right: none;"><b>გადასახდელი</b></td>
                                                    <td style="border-left: none;" align="right"><%=maincurrency.getCode()%> <%=dc.format(topay)%></td>
                                                </tr>
                                                <tr style="background-color: #F5F5F5;">
                                                    <td style="border-right: none;"><b>გადახდილი</b></td>
                                                    <td style="border-left: none;" align="right"><%=maincurrency.getCode()%> <%=dc.format(paid)%></td>
                                                </tr>
                                                <tr style="background-color: #F5F5F5;">
                                                    <td style="border-right: none;"><b style="color: #E13B27; font-size: larger;">ბალანსი</b></td>
                                                    <td style="border-left: none;" align="right"><b style="color: #E13B27; font-size: larger;"><%=maincurrency.getCode()%> <%=dc.format(topay-paid)%></b></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
        <tr>
            <td style="" colspan="3">
                <table style="border: 1px solid #C8C8C8; background-color: #F5F5F5;" width="100%" cellspacing="0" id="transaction-title">
                    <tbody>
                        <tr>
                            <td align="left" width='50%' style="border: 1px solid #C8C8C8;">
                                <form class="form-inline" role="form">
                                      <div class="form-group">
                                      &nbsp;&nbsp;&nbsp;<input type="checkbox" id="hidetarf">&nbsp;
                                      <label for="srrc">დაფარე ტარიფები რეგისტრაციის ბარათში</label>
                                      </div>
                                </form>
                            </td>
                            <td align="center" style="border: 1px solid #C8C8C8;" width='20%'><b>საკრედიტო ბარათის ინფორმაცია</b></td>
                            <td align="center" style="border: 1px solid #C8C8C8; cursor: pointer;" width='10%' onclick="newWindowWithParams('setPreference','უპირატესობის მინიჭება','?reservationid=<%=reserv.getReservationid()%>&roomid=<%=rname+rtypecode%>')"><b>უპირატესობები</b></td>
                            <td align="center" style="border: 1px solid #C8C8C8;" width='10%'><b>დავალებები</b></td>
                            <td align="center" style="border: 1px solid #C8C8C8;" width='10%'><b>შეტყობინებები</b></td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
    </tbody>
</table>