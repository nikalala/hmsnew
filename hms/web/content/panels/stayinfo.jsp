<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../../includes/init.jsp" %>
<%
    int wintype = 0;
    if (request.getParameter("wintype") != null)
        wintype = Integer.parseInt(request.getParameter("wintype"));
    String type = request.getParameter("type");
    RoomtypeBean[] roomtypes = RoomtypeManager.getInstance().loadByWhere("order by name");
    RoomBean[] rooms = RoomManager.getInstance().loadByWhere("order by name");
    RoomrateBean[] roomrates = RoomrateManager.getInstance().loadByWhere("order by ord");
    ReservationtypeBean[] resrvationtypes = ReservationtypeManager.getInstance().loadByWhere("order by name");
    Calendar arr = Calendar.getInstance();
    int hour = arr.get(Calendar.HOUR_OF_DAY);
    int minute = arr.get(Calendar.MINUTE);
    arr.setTime(dclosedate);
    arr.set(Calendar.HOUR_OF_DAY,hour);
    arr.set(Calendar.MINUTE,minute);
    Calendar dep = Calendar.getInstance();
    dep.setTime(dclosedate);
    String pkfmt = pickerformat2;

    Calendar depDate = Calendar.getInstance();
    depDate.setTime(dclosedate);
    depDate.add(Calendar.DATE, 1);  // number of days to add

    if (wintype > 0) {
        //arr.add(Calendar.DATE, 1);
        //dep.add(Calendar.DATE, 1);
        //pkfmt = pickerformat2.replaceAll("new Date()","new Date("+arr.getTimeInMillis()+")");
    }
    int nights = 1;
    if (checkinsettings != null) {
        Calendar tm = Calendar.getInstance();
        tm.setTime(checkinsettings.getCheckintime());
        hour = tm.get(Calendar.HOUR_OF_DAY);
        minute = tm.get(Calendar.MINUTE);
        tm.setTime(dclosedate);
        tm.set(Calendar.HOUR_OF_DAY,hour);
        tm.set(Calendar.MINUTE,minute);
        if (!checkinsettings.getHours24().booleanValue())
            tm.setTime(checkinsettings.getCheckouttime());
        dep.set(Calendar.HOUR_OF_DAY, tm.get(Calendar.HOUR_OF_DAY));
        dep.set(Calendar.MINUTE, tm.get(Calendar.MINUTE));
        if (dep.before(arr)) {
            dep.add(Calendar.DATE, 1);
            if (!checkinsettings.getHours24().booleanValue()) {
                dep.set(Calendar.HOUR_OF_DAY, tm.get(Calendar.HOUR_OF_DAY));
                dep.set(Calendar.MINUTE, tm.get(Calendar.MINUTE));
            }
            nights = 1; //DayDiff(arr,dep);
        } else if (checkinsettings.getHours24().booleanValue()) {
            dep.add(Calendar.DATE, 1);
            nights = 1;
        } else
            nights = DayDiff(arr, dep);
    }
    System.out.println("arr.getTime() = "+dt.format(arr.getTime()));
%>
<script>
    
    function getRoomtypes(id) { if(id > 0)
        $.post(
            "content/ajax/getRoomsByType.jsp",
            {
                roomtypeid: id, 
                arrivaldate: $("#guestinfo_arrivaldate").val(), 
                arrivaltime: $("#guestinfo_arrivaltime").val(), 
                departuredate: $("#guestinfo_departuredate").val(), 
                departuretime: $("#guestinfo_departuretime").val(),
                rtp: $("#guestinfo_reservationtypeid").val()
            },
            function (data) {
                $("#guestinfo_roomid").html(data.selectroom);
                $("#guestinfo_ratetypeid").html(data.selectratetype);
                $("#guestinfo_adult").html(data.selectadult);
                $("#guestinfo_child").html(data.selectcild);
                var sho = true;
                if ($('input[name$="payinfo_ratetype"]:checked').val() == 1 && $('#payinfo_contragentid').val() == 0)
                    sho = false;
                if (id > 0 && sho) $("#walkin_set_rates").show();
                else $("#walkin_set_rates").hide();
            },
            "json"
        );
    }
    
    $(document).ready(function () {
        $('#guestinfo_arrivaldate').datepicker(<%=pkfmt%>).on('changeDate', function (e) {
            updateWalkinStayInfo(1);
            getRoomtypes($("#guestinfo_roomtypeid").val());
        });
        $('#guestinfo_departuredate').datepicker(<%=pkfmt%>).on('changeDate', function (e) {
            updateWalkinStayInfo(2);
            getRoomtypes($("#guestinfo_roomtypeid").val());
        });
        $('#guestinfo_arrivaltime').keyup(function (e) {
            updateWalkinStayInfo(1);
        });
        $('#guestinfo_departuretime').keyup(function (e) {
            updateWalkinStayInfo(2);
        });
        $('#guestinfo_night').keyup(function (e) {
            updateWalkinStayInfo(3);
        });

        $("#guestinfo_roomtypeid").change(function () {
            getRoomtypes($(this).val());
        });
        
        $("#guestinfo_reservationtypeid").change(function () {
            getRoomtypes($("#guestinfo_roomtypeid").val());
        });
        
        $("#guestinfo_roomnumber").keyup(function (e) {
            if ((e.which > 31 && e.which < 48) || e.which > 57) return false;
        });

        $("#guestinfo_roomnumber").change(function () {
            var rnum = $(this).val();
            if (rnum) {
                if (rnum == 0) {
                    rnum = 1;
                    $(this).val(rnum);
                } else {
                    $('tr[id^=walkin_guest_]').each(function (index) {
                        var wid = $(this).attr('id').substring(13);
                        delRow(wid);
                    });
                    for (var i = 1; i < rnum; i++)
                        addRow();
                    /*
                     var allrows = $('tr[id^=walkin_guest_]').length;
                     var diff = rnum - allrows - 1;
                     if(diff < 0){
                     $('tr[id^=walkin_guest_]').each(function( index ) {
                     var wid = $(this).attr('id').substring(13);
                     delRow(wid);
                     });
                     for(var i=1;i<rnum;i++)
                     addRow();
                     } else {
                     for(var i=0;i<diff;i++)
                     addRow();
                     }
                     */
                }
            }
        });

    });
</script>
<table class="table table-borderless table-condensed">
    <tr>
        <td class="tbllabel" style="width: 50px;">ოთახ(ებ)ი</td>
        <td>
            <form class="form-inline" role="form">
                <div class="form-group">
                    <div class="input-group-xs">
                        <input class="form-control" type="text" id="guestinfo_roomnumber" style="width: 30px;"
                               value="1">
                        <select class="form-control dropdown" name="guestinfo_roomtypeid" id="guestinfo_roomtypeid"
                                style="width: 150px;">
                            <option value="0">--აირჩიეთ--</option>
                            <%
                                for (int i = 0; i < roomtypes.length; i++) {
                            %>
                            <option value="<%=roomtypes[i].getRoomtypeid()%>"><%=roomtypes[i].getName()%>
                            </option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                </div>
            </form>
        </td>
        <td>
            <form class="form-inline" role="form">
                <div class="form-group">
                    <div class="input-group-xs">
                        <select class="form-control dropdown" name="guestinfo_roomid" id="guestinfo_roomid"
                                style="width: 85px;">

                        </select>
                    </div>
                </div>
            </form>
        </td>
        <td>
            <form class="form-inline" role="form">
                <div class="form-group">
                    <div class="input-group-xs">
                        <select class="form-control dropdown" name="guestinfo_ratetypeid" id="guestinfo_ratetypeid"
                                style="width: 100px;">

                        </select>
                    </div>
                </div>
            </form>
        </td>
    </tr>
    <tr>
        <td class="tbllabel">ჩამოსვლა</td>
        <td valign="top">
            <form class="form-inline" role="form">
                <div class="form-group">
                    <div class="input-group-xs">
                        <div class="input-append date">
                            <input class="span2 form-control" readonly="" size="10"
                                   value="<%=dt.format(arr.getTime())%>" type="text" id="guestinfo_arrivaldate">
                            <input class="form-control" type="text" size="5" maxlength="5"
                                   value="<%=dtime.format(arr.getTime())%>" type="text" id="guestinfo_arrivaltime">
                        </div>
                    </div>
                </div>
            </form>
        </td>
        <td class="tbllabel">ღამე</td>
        <td valign="top">
            <form class="form-inline" role="form">
                <div class="form-group">
                    <div class="input-group-xs">
                        <input class="form-control" type="text" size="5" maxlength="5" value="<%=nights%>" type="text"
                               id="guestinfo_night">
                    </div>
                </div>
            </form>
        </td>
    </tr>
    <tr>
        <td class="tbllabel">წასვლა</td>
        <td valign="top">
            <form class="form-inline" role="form">
                <div class="form-group">
                    <div class="input-group-xs">
                        <div class="input-append date">
                            <input class="span2 form-control" readonly="" size="10"
                                   value="<%=dt.format(depDate.getTime())%>" type="text" id="guestinfo_departuredate">
                            <input class="form-control" type="text" size="5" maxlength="5"
                                   value="<%=dtime.format(dep.getTime())%>" type="text" id="guestinfo_departuretime">
                        </div>
                    </div>
                </div>
            </form>
        </td>
        <td class="tbllabel">უფროსი</td>
        <td valign="top">
            <form class="form-inline" role="form">
                <div class="form-group">
                    <div class="input-group-xs">
                        <select class="form-control dropdown" name="guestinfo_adult" id="guestinfo_adult">

                        </select>
                    </div>
                </div>
            </form>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <table>
                <tr>
                    <td class="tbllabel" style="padding-right: 5px;">რეზერვაციის ტიპი</td>
                    <td valign="top">
                        <form class="form-inline" role="form">
                            <div class="form-group">
                                <div class="input-group-xs">
                                    <select style="width: 100px;" class="form-control dropdown"
                                            name="guestinfo_reservationtypeid" id="guestinfo_reservationtypeid">
                                        <%
                                            for (int i = 0; i < resrvationtypes.length; i++) {
                                                String sel = "";
                                                if(displaysettings.length > 0 && displaysettings[0].getReservationtypeid().intValue() == resrvationtypes[i].getReservationtypeid().intValue())
                                                    sel = "selected";
                                        %>
                                        <option value="<%=resrvationtypes[i].getReservationtypeid()%>" <%=sel%>><%=resrvationtypes[i].getName()%>
                                        </option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>
                        </form>
                    </td>
                </tr>
            </table>
        </td>
        <td class="tbllabel">ბავშვი</td>
        <td valign="top">
            <form class="form-inline" role="form">
                <div class="form-group">
                    <div class="input-group-xs">
                        <select class="form-control dropdown" name="guestinfo_child" id="guestinfo_child">

                        </select>
                    </div>
                </div>
            </form>
        </td>
    </tr>
</table>