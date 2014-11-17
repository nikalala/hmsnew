<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
ReservationroomBean[] reservs = ReservationroomManager.getInstance().loadByWhere("where roomid is not null and reservationid in (select reservationid from reservation where status <= 0 and arraivaldate::date <= now()::date and departuredate::date >= now()::date) and leader = true order by guestid");
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

    } );
</script>
    <div class="panel panel-default" id='leftpanel' style="margin-top: 0px; height: 654px">
        <div class="panel-heading  panel-title" style="text-align: center; font-size: 16px !important; height: 31px; background-color: darkgray !important;">
            <b style='vertical-align: middle; color: #FFFFFF;'><%=dt.format(new Date())%></b>
        </div>
        <div class="panel-body" style="background-color: #F5F5F5;">
            <div class="input-group" style="width: 98%;">
                <div class="col-sm-6">
                    <label for="sortby" style="margin-top:7px; padding-left: 10px;">სორტირება</label>
                </div>
                <div class="col-sm-10">
                    <select id="sortby" class="form-control" style="width: 156px;">
                        <option value="">სტუმრის სახელი</option>
                        <option value="">ოთახის ტიპი</option>
                        <option value="">ოთახი</option>
                        <option value="">სტატუსი</option>
                    </select>
                </div>
            </div><br>
            <div id="roomlist0">
                <table class="lscroll table table-hover" id="roomlist" width="100%">
                    <tbody id="roomlistitems" style='height: 100px;' width="100%">
                        <%//for(int jj=0;jj<5;jj++){
                        for(int i=0;i<reservs.length;i++){
                            GuestBean guest = GuestManager.getInstance().loadByPrimaryKey(reservs[i].getGuestid());
                            SalutationBean salutation = SalutationManager.getInstance().loadByPrimaryKey(guest.getSalutationid());
                            RoomBean room = RoomManager.getInstance().loadByPrimaryKey(reservs[i].getRoomid());
                            RoomtypeBean roomtype = RoomtypeManager.getInstance().loadByPrimaryKey(room.getRoomtypeid());
                            String guestname = salutation.getName()+" ";
                            guestname += guest.getFname() + " " + guest.getLname();
                            ReservationroomBean[] reservs0 = ReservationroomManager.getInstance().loadByWhere("where leader = false and reservationid = "+reservs[i].getReservationid()+" order by guestid");
                            int istatus = getRoomStatus(null,room.getRoomid().intValue());
                            String statusname = "";
                            String statuscolor = "#FFFFFF";
                            if(istatus >= 0) {
                                statusname = roomstatus[istatus];
                                StcolorBean[] stcolor = StcolorManager.getInstance().loadByWhere("where active = true and deleted = false and roomstatus = "+istatus);
                                if(stcolor.length > 0)
                                    statuscolor = stcolor[0].getColor();
                            }
                        %>
                        <tr style="cursor: pointer;" id="<%=reservs[i].getReservationroomid()%>">
                            <td width="100%" class="wwww" style="">
                                <%if(reservs0.length > 0){%><span class="glyphicon glyphicon-user"></span> <%}%>
                                <font style="font-size: 12px;"><%=guestname%></font>
                                <br>
                                <font style="color: #99CAEC; float: left;"><%=(room.getName())%> - <%=(roomtype.getCode())%></font>
                                <font style="color: <%=statuscolor%>; float: right; padding-left: 5px;"><%=statusname%></font>
                            </td>
                        </tr>
                        <%
                        for(int j=0;j<reservs0.length;j++){
                            GuestBean guest0 = GuestManager.getInstance().loadByPrimaryKey(reservs0[j].getGuestid());
                            SalutationBean salutation0 = SalutationManager.getInstance().loadByPrimaryKey(guest0.getSalutationid());
                            RoomBean room0 = RoomManager.getInstance().loadByPrimaryKey(reservs0[j].getRoomid());
                            RoomtypeBean roomtype0 = RoomtypeManager.getInstance().loadByPrimaryKey(room0.getRoomtypeid());
                            String guestname0 = salutation0.getName()+" ";
                            guestname0 += guest0.getFname() + " " + guest0.getLname();
                            int istatus0 = getRoomStatus(null,room.getRoomid().intValue());
                            String statusname0 = "";
                            String statuscolor0 = "#FFFFFF";
                            if(istatus0 >= 0) {
                                statusname0 = roomstatus[istatus0];
                                StcolorBean[] stcolor = StcolorManager.getInstance().loadByWhere("where active = true and deleted = false and roomstatus = "+istatus);
                                if(stcolor.length > 0)
                                    statuscolor0 = stcolor[0].getColor();
                            }
                        %>
                        <tr style="cursor: pointer;" id="<%=reservs0[j].getReservationroomid()%>">
                            <td width="100%" class="wwww" style="">
                                <font style="font-size: 12px;"><%=guestname0%></font>
                                <br>
                                <font style="color: #99CAEC; float: left;"><%=(room0.getName())%> - <%=(roomtype0.getCode())%></font>
                                <font style="color: <%=statuscolor0%>; float: right; padding-left: 5px;"><%=statusname0%></font>
                            </td>
                        </tr>
                        <%}
                        }
                        //}
                        %>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="panel-footer" style="width: 100%; padding-bottom: 1px; padding-top: 10px;">
            
            <div class="panel panel-default" style="">
                <div class="panel-heading  panel-title">
                    <b>ძებნა</b>
                </div>
                
                <div class="panel-body" style="">
                    
                    <table width="100%" cellspacing="0">
                        <tbody>
                            <tr>
                                <td align="left">
                                    
                                    <form class="form-horizontal" role="form" style="">
                                        <div class="form-group" style="">
                                            <label for="filterby" class="col-sm-4" style="margin-top:7px; padding-left: 10px;">ფილტრი</label>
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
                                            <label for="searchterm" class="col-sm-4" style="margin-top:7px; padding-left: 10px;">ტექსტი</label>
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
    

        


