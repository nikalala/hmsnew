<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
int isortby = 0;
String sesisortby = (String)session.getAttribute("sesisortby");
if(sesisortby != null)  isortby = Integer.parseInt(sesisortby);
    
String sortby = request.getParameter("sortby");
if(sortby != null)    isortby = Integer.parseInt(sortby);

session.setAttribute("sesisortby", String.valueOf(isortby));

switch(isortby){
    case 0:
        sortby = "guestname(guestid)";
        break;
    case 1:
        sortby = "(select p.name from roomtype p where p.roomtypeid = reservationroom.roomtypeid)";
        break;
    case 2:
        sortby = "(select r.name from room r where r.roomid = reservationroom.roomid)";
        break;
    case 3:
        sortby = "getroomstatus1(reservationroomid,'"+dflong.format(dclosedate)+"')";
        break;
}

String sqlst = "where getroomstatus1(reservationroomid,'"+dflong.format(dclosedate)+"') in (0,1,2,3,6,7,9) and reservationid in "
        + "(select reservationid from reservation where status in (-1,0))"
        + " order by "+sortby;
//"where reservationid in (select reservationid from reservation where status <= 0 and arraivaldate::date <= N'"+dclosedate+"'::date and departuredate::date >= N'"+dclosedate+"'::date) and leader = true order by guestid"
System.out.println(sqlst);
ReservationroomBean[] reservs = ReservationroomManager.getInstance().loadByWhere(sqlst);
%>
<style>
table.lscroll tbody {
    display:  block;
    overflow-y: auto;
    overflow-x: hidden;
}

table.lscroll tr {
    height: 30px;
}
</style>
<script>
    var $table = $('table.lscroll'),
    $bodyCells = $table.find('tbody tr:first').children(),
    colWidth;

    // Adjust the width of thead cells when window resizes
    $(window).resize(function() {
        // Get the tbody columns width array
        colWidth = $bodyCells.map(function() {
            var wd = $(this).width();
            //alert(wd);
            return wd;
        }).get();

        // Set the width of thead columns
        $table.find('thead tr').children().each(function(i, v) {
            $(v).width(colWidth[i]);
        });    
    }).resize();

    $(document).ready(function() {
        maincontentheight = $("#maincontent").height();
        
            if(maincontentheight > 654){
                $("#leftpanel").height(maincontentheight-2);
            }
            //alert($("#leftpanel").width()+" - "+$(".wwww").width());
        //$("#roomlist").width($("#leftpanel").width()+100);
        $(".wwww").width($("#leftpanel").width());
        $("#roomlist0").height($("#leftpanel").height()-223);
        $("#roomlistitems").height($("#roomlist0").height());


        //var widths = new Array();

        //$("#roomtable1").find('thead tr').children().each(function(i, v) {
        //    widths[i] = $(v).attr('wd')*edittransactionwidth/100;
        //    $(v).width(widths[i]);
        //});

        //$("#roomtable1").find('tbody tr').children().each(function(i, v) {
        //    $(v).width(widths[i]);
        //});

        $('#sortby ,#filterby').selectpicker();

        $('#sortby').on('change',function(data){ 
            $.ajax({
                type: "POST",
                url: "content/stayviewleft.jsp",
                data: { sortby: $('#sortby').val() },
                success: function (data) {
                    $('#leftcontent').html(data);
                },
                async: false
            });
        });
    } );
</script>
    <div class="panel panel-default" id='leftpanel' style="margin-top: 0px; height: 654px; font-family: bgmtavr;">
        <div class="panel-heading  panel-title" style="text-align: center; font-size: 16px !important; height: 31px; background-color: #474544 !important;">
            <b style='vertical-align: middle; color: #FFFFFF; font-family: bgmtavr;'><%=dt.format(dclosedate)%></b>
        </div>
        <div class="panel-body" style="background-color: #FFFFFF;">
            <div class="input-group" style="width: 98%;">
                <div class="col-sm-6">
                    <label for="sortby" style="margin-top:7px; padding-left: 10px;">სორტირება</label>
                </div>
                <div class="col-sm-10">
                    <select id="sortby" class="dropdown form-control" style="width: 156px;">
                        <option value="0" <%=(isortby == 0) ? "selected":""%>>სტუმრის სახელი</option>
                        <option value="1" <%=(isortby == 1) ? "selected":""%>>ოთახის ტიპი</option>
                        <option value="2" <%=(isortby == 2) ? "selected":""%>>ოთახი</option>
                        <option value="3" <%=(isortby == 3) ? "selected":""%>>სტატუსი</option>
                    </select>
                </div>
            </div><br>
            <div id="roomlist0">
                <table class="lscroll table table-hover" id="roomlist" width="100%">
                    <tbody id="roomlistitems" style='height: 100px;' width="100%">
                        <%for(int i=0;i<reservs.length;i++){
                            GuestBean guest = GuestManager.getInstance().loadByPrimaryKey(reservs[i].getGuestid());
                            SalutationBean salutation = SalutationManager.getInstance().loadByPrimaryKey(guest.getSalutationid());
                            ReservationBean reserv = ReservationManager.getInstance().loadByPrimaryKey(reservs[i].getReservationid());
                            int istatus = 0;
                            String roomname = "";
                            int hasroom = 0;
                            int samedate = 0;
                            if(df.format(reserv.getArraivaldate().getTime()).equals(df.format(dclosedate)))
                                samedate = 1;
                            if(reservs[i].getRoomid() != null){
                                RoomBean room = RoomManager.getInstance().loadByPrimaryKey(reservs[i].getRoomid());
                                //istatus = getRoomStatus(dclosedate,room.getRoomid().intValue());
                                roomname = room.getName();
                                hasroom = 1;
                            }
                            istatus = getRoomStatus1(dclosedate,reservs[i].getReservationroomid());
                            RoomtypeBean roomtype = RoomtypeManager.getInstance().loadByPrimaryKey(reservs[i].getRoomtypeid());
                            String guestname = salutation.getName()+" ";
                            guestname += guest.getFname() + " " + guest.getLname();
                            
                            String statusname = "";
                            String statuscolor = "#FFFFFF";
                            if(istatus >= 0) {
                                statusname = roomstatus[istatus];
                                StcolorBean[] stcolor = StcolorManager.getInstance().loadByWhere("where active = true and deleted = false and roomstatus = "+istatus);
                                if(stcolor.length > 0)
                                    statuscolor = stcolor[0].getColor();
                            }
                            int children = ReservationroomManager.getInstance().countWhere("where leader = false and reservationid = "+reservs[i].getReservationid());
                            
                        %>
                        <tr style="cursor: pointer;" id="<%=reservs[i].getReservationroomid()%>" status="<%=istatus%>" hasroom="<%=hasroom%>" samedate="<%=samedate%>">
                            <td width="100%" class="wwww" style="">
                                <%if(children > 0){%><span class="glyphicon glyphicon-user"></span> <%}%>
                                <font class="col-md-7" title="<%=guestname%>" style="font-size: 12px;float: left;white-space: nowrap !important; overflow: hidden !important; text-overflow: ellipsis !important;"><%=guestname%></font>
                                <font style="color: <%=statuscolor%>;" class="stayview-left-reserv ool-md-9"><%=statusname%></font>
                                <br><br>
                                <font class="stayview-left-room"><%=roomname%> - <%=(roomtype.getCode())%></font>
                            </td>
                        </tr>
                        <%
                        }
                        //}
                        %>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="panel-footer" style="width: 100%; padding-bottom: 1px; padding-top: 10px;">
            
            <div class="panel panel-default" style="height: 119px;">
                <div class="panel-heading  panel-title" style="text-align: center;height: 31px;background-color: #474544 !important; color: #FFF !important; font-family: bgmtavr; line-height: 26px;">
                    <b>ძებნა</b>
                </div>
                
                <div class="panel-body" style="">
                    
                    <table width="100%" cellspacing="0">
                        <tbody>
                            <tr>
                                <td align="left">
                                    
                                    <form class="form-horizontal" role="form" id="filterbyfrm" style="">
                                        <div class="form-group" style="">
                                            <label for="filterby" class="col-sm-4" style="margin-top:7px; padding-left: 10px;">ფილტრი</label>
                                            <div class="col-sm-12">
                                                <select id="filterby" name="filterby" class="form-control">
                                                    <option value="name">სტუმრის სახელი</option>
                                                    <option value="roomtype">ოთახის ტიპი</option>
                                                    <option value="room">ოთახი</option>
                                                    <option value="reserv">რეზერვაცია</option>
                                                    <option value="folio">ფოლიო</option>
                                                    <option value="mobile">მობილური</option>
                                                    <option value="invoice">ინვოისი</option>
                                                    <option value="voucher">ვაუჩერი</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group" style="">
                                            <label for="searchterm" class="col-sm-4" style="margin-top:7px; padding-left: 10px;">ტექსტი</label>
                                            <div class="col-sm-12">
                                                <div class="input-group">
                                                    <input class="form-control" id="searchterm" name="searchterm">
                                                    <div class="input-group-addon" style="cursor: pointer; padding: 5px 10px;" onclick="search()">
                                                        <span class="glyphicon glyphicon-search"></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    
                </div>
                
            </div>
            
            
        </div>
                    
        <%--           
        <div class="panel-footer" style="height: 18%; background-color: white;">
            <div class="panel panel-default" style="height: 100%">
                <div class="panel-heading  panel-title">
                    <b>ძებნა</b>
                </div>
                <div class="panel-body" style="height: 100%">
                    <form class="form-horizontal" role="form" style="">
                        <div class="form-group" style="">
                            <label for="filterby" class="col-sm-4" style="margin-top:7px;">ფილტრი</label>
                            <div class="col-sm-12">
                                <select id="filterby" class="form-control">
                                    <option value="">სტუმრის სახელი</option>
                                    <option value="">ოთახის ტიპი</option>
                                    <option value="">ოთახი</option>
                                    <option value="">რეზერვაცია</option>
                                    <option value="">ფოლიო</option>
                                    <option value="">მობილური</option>
                                    <option value="">ინვოისი</option>
                                    <option value="">ვაუჩერი</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group" style="">
                            <label for="searchterm" class="col-sm-4" style="margin-top:7px;">ტექსტი</label>
                            <div class="col-sm-12">
                                <div class="input-group">
                                    <input class="form-control" id="searchterm">
                                    <div class="input-group-addon" style="cursor: pointer;" onclick="alert('ძებნა');">
                                        <span class="glyphicon glyphicon-search"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        --%>
    </div>
    

        


