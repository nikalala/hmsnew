<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
ReservationroomBean rroom = ReservationroomManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("reservationroomid")));
ReservationBean reserv = ReservationManager.getInstance().loadByPrimaryKey(rroom.getReservationid());
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

RoomBean room = RoomManager.getInstance().loadByPrimaryKey(rroom.getRoomid());
String rname = room.getCode();
if(rname == null)   rname = room.getName();
if(rname == null || rname.trim().length() == 0) rname = "ნომრის გარეშე";

RoomtypeBean roomtype = RoomtypeManager.getInstance().loadByPrimaryKey(room.getRoomtypeid());
int sts = getRoomStatus(new Date(), room.getRoomid().intValue());
StcolorBean[] stcolor = StcolorManager.getInstance().loadByWhere("where active = true and deleted = false and roomstatus = "+sts);
String statuscolor = "#FFFFFF";
if(stcolor.length > 0)
    statuscolor = stcolor[0].getColor();
FolioBean[] folio = FolioManager.getInstance().loadByReservationroomid(rroom.getReservationroomid());
String fnum = "0";
if(folio.length > 0)    fnum = folio[0].getFolioid().toString();

//PersonnelBean reservedby = PersonnelManager.getInstance().loadByPrimaryKey(reserv.get)

int[] pheights = {24,145,200};
%>
<script>
var edittransactionwidth = 0;
var edittransactionheight = 0;
var roomch_opened = 0;
var selected_action = 0;

$(document).ready(function(){
    $('.specialTab').click(function(e) {
        e.preventDefault();
        //var containerId = '#content'; /** Specify which element container */
        var self = $(this);
        var url = self.attr('href');
        $(self.data('target'))
            .load(url, function(){
               self.tab('show');
            });
    });
    
    edittransactionwidth = $("#geninfo").width();
    maincontentheight = $("#maincontent").height();
    edittransactionheight = $("#edittransaction0").height();
    
    //$("#edittransactionbody").height(maincontentheight-339);
    //$("#geninfo").height(edittransactionheight*0.50);
    //$("#tabpanel").height(edittransactionheight-200);
    
    //$("#tabpane").height(edittransactionheight-24-145-93);
    //$("#tabpane").height(edittransactionheight*0.58);
});
</script>
<div class="container-fluid" id="edittransaction0" style="padding-top: 4px; height: 100%;">
    <div class="row" style="margin-bottom: 0px; padding-left: 5px;  padding-right: 5px;">
        <div class="col-md-16" style="height: 24px;">
            <table class="table table-condensed table-bordered" width="100%" cellspacing="0" id="transaction-title" style="background-color: #FFFFFF;">
                <tbody>
                    <tr>
                        <td align="center" style="font-size: 13px"><b>ოთახი: <span style="color: #598904"><%=rname%></span></b></td>
                        <td align="center" style="font-size: 13px"><b>ინვ. &numero;: <span style="color: #598904"><%=fnum%></span></b></td>
                        <td align="center" style="font-size: 13px"><b>რეს. &numero;: <span style="color: #598904"><%=reserv.getReservationid()%></span></b></td>
                        <td width="50%" align="center" style="font-size: 13px"></td>
                        <td align="center" style="font-size: 13px"><b><span style="color: <%=statuscolor%>"><%=(sts < 0) ? "N/A":roomstatus[sts]%></span></b></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row" style="margin-top: 0px; margin-bottom: 0px; padding-left: 5px;  padding-right: 5px;">
        <div class="col-md-7" style="height: 145px;">
            <div class="panel panel-primary" id='guestinfo'>
                <jsp:include page="guestinfo.jsp">
                    <jsp:param name="reservationroomid" value="<%=rroom.getReservationroomid()%>"/>
                </jsp:include>
            </div>
        </div>
        <div class="col-md-4" style="height: 145px;">
            <div class="panel panel-primary" id='stayinfo'>
                <jsp:include page="stayinfodates.jsp">
                    <jsp:param name="reservationroomid" value="<%=rroom.getReservationroomid()%>"/>
                </jsp:include>
            </div>
        </div>
        <div class="col-md-5" style="height: 145px;">
            <div class="panel panel-primary" id='otherinfo'>
                <jsp:include page="otherinfo.jsp">
                    <jsp:param name="reservationroomid" value="<%=rroom.getReservationroomid()%>"/>
                </jsp:include>
            </div>
        </div>
    </div>
    <div class="row" style="margin-top: 0px; padding-left: 5px;  padding-right: 5px;" id="tabpane">
        <div class="col-md-16" style="height: 100%;">
            <div class="panel panel-default" id="tabpanel" style="height: 100%;">
                <ul class="nav nav-tabs" id="infotabs" style="background-color: #F5F5F5;" role="tablist">
                  <li class="active"><a class="specialTab" href="content/geninfo.jsp?reservationroomid=<%=rroom.getReservationroomid()%>" role="tab" data-target="#geninfo" data-toggle="tab">ძირითადი ინფორმაცია</a></li>
                  <li><a class="specialTab" href="content/roomch.jsp?reservationroomid=<%=rroom.getReservationroomid()%>" role="tab" data-target="#roomcharges" data-toggle="tab">ოთახის ფასები</a></li>
                  <li><a class="specialTab" href="content/folio.jsp?reservationroomid=<%=rroom.getReservationroomid()%>" role="tab" data-target="#foliodetail" data-toggle="tab">ინვოისი</a></li>
                </ul>
                <div class="tab-content panel-body" id="edittransactionbody" style="height: 100%; padding-bottom: 0px;">
                    <div class="tab-pane active" id="geninfo" style="height: 100%;">
                        <jsp:include page="geninfo.jsp">
                            <jsp:param name="reservationroomid" value="<%=rroom.getReservationroomid()%>"/>
                        </jsp:include>
                    </div>
                    <div class="tab-pane" id="roomcharges" style="height: 100%;">
                        <jsp:include page="roomch.jsp">
                            <jsp:param name="reservationroomid" value="<%=rroom.getReservationroomid()%>"/>
                        </jsp:include>
                    </div>
                    <div class="tab-pane" id="foliodetail" style="height: 100%;">
                        <jsp:include page="folio.jsp">
                            <jsp:param name="reservationroomid" value="<%=rroom.getReservationroomid()%>"/>
                        </jsp:include>
                    </div>
                    <p style="height: 0px;" id='spacer'></p>
                </div>
                <div class="panel-footer" style="height: 38px;">
                    <table width="100%" cellspacing="0">
                        <tbody>
                            <tr>
                                <td align="right" colspan="2">
                                    <form class="form-inline" role="form">
                                      <div class="form-group">
                                      <input type="checkbox" id="tksmail">&nbsp;
                                      <label for="tksmail">მადლობის წერილის გაგზავნა გაწერისას</label>&nbsp;
                                      <select class="form-control" id="tkstemplate">
                                          <option value="">-- აირჩიეთ შაბლონი --</option>
                                          <option value="">მადლობის წერილი ქართულად</option>
                                          <option value="">მადლობის წერილი ინგლისურად</option>
                                          <option value="">მადლობის წერილი რუსულად</option>
                                      </select>
                                      </div>
                                    </form>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="panel-footer" style="height: 20px !important; display:table; width: 100%; padding-bottom: 1px;">
    <table width="100%" cellspacing="0">
        <tbody>
            <tr>
                <td align="left">
                    რეზერვირებულია <span style="color: #52A2E5;"><%=user.getFname()%> <%=user.getLname()%></span>
                </td>
                <td align="right">
                    <button type="button" class="btn btn-sm btn-primary navbar-btn">აუდიტი</button>
                    <button type="button" class="btn btn-sm btn-default navbar-btn">შენახვა</button>
                    <button type="button" class="btn btn-sm btn-default navbar-btn">გაუქმება</button>
                    <button type="button" class="btn btn-sm btn-danger navbar-btn">მიღება</button>
                </td>
            </tr>
        </tbody>
    </table>
</div>
