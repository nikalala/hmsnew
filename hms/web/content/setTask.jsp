<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<%
    String rid = (String) request.getParameter("reservationid");
    String roomid = "";
    String idToremove = "";
    ReservationroomBean reservationroomBean = ReservationroomManager.getInstance().loadByPrimaryKey(Long.valueOf(rid));
    RoomtypeBean roomtypeBean = RoomtypeManager.getInstance().loadByPrimaryKey(reservationroomBean.getRoomtypeid());
    if(reservationroomBean.getRoomid() == null || reservationroomBean.getRoomid() < 1)
    {
        roomid = roomtypeBean.getName();
    }else{
        RoomBean roomBean = RoomManager.getInstance().loadByPrimaryKey(reservationroomBean.getRoomid());
        roomid = roomBean.getName() + " - " + roomtypeBean.getName();
        idToremove = roomBean.getRoomid().toString();
    }

    String reservationId = reservationroomBean.getReservationid().toString();

    TaskBean[] prefs = TaskManager.getInstance().loadByWhere("");
    Calendar currDate = Calendar.getInstance();
    int hour = currDate.get(Calendar.HOUR_OF_DAY);
    int minute = currDate.get(Calendar.MINUTE);
%>

<link rel="stylesheet" type="text/css" href="css/grid-filter.css">
<link rel="stylesheet" type="text/css" href="css/timepicker.css">
<script type="text/javascript" src="js/timepicker.js"></script>
<style>
    .datepicker, .dropdown-menu{
        z-index: 10000000 !important;
    }
</style>
<script>
    var originalUrl = "content/gettasks.jsp";
    var idToBeUpdated = 0;
    $(document).ready(function () {
        loadAll();
    });

    $(document).on("click","#btnSavePref",function(e){
        e.preventDefault();
        var sql = "";
        var txt = $("#pref-desc").val();

        if(isNullOrEmpty(txt)){
            BootstrapDialog.alert("შეიყვანეთ ტექსტი");
            return;
        }else{
            var duedt = "to_timestamp('" + $("#arrival_dateFrom").val() + " " + $("#timepicker2").val() + "','DD.MM.YYYY h:m')";
            sql = "INSERT INTO task(taskid, name, depid, alertid, stid, regbyid, duedate,active, deleted, reservationid) VALUES ("+
                       "nextval('taskid_seq'),'" + txt + "'," + $("#pref_type").val() + "," + $("#alert").val() + ",2,<%=user.getPersonnelid()%>, " + duedt + ", TRUE,FALSE,<%=reservationId%>)";
        }

        if(!isNullOrEmpty(sql)){
            loader.show();
            $.post("content/execute.jsp?query=" + encodeURIComponent(sql), {}, function () {
                loader.hide();
                resetAll();
            });
        }
    });

    function removeAllUnUsedOption(){
        var prefType = $("#pref_type").val();
        if(prefType > 0){
            $('#prefs option').each(function()
            {
                var option = $(this);
                if(option.attr('class') != prefType+"pref" && option.val() != 0){
                    option.remove();
                }
            });
            $('#prefs').change();
        }else{
            var html = "<option value='0' selected='selected'>-აირჩიეთ-</option>";
            $("#prefs").html(html);
        }
        $('#prefs').selectpicker("refresh");
        $("#pref_type").next().css('float','rigth');
    }

    function editPref(id,typeid,text){
        $('#pref_type').val(typeid);
        $('#pref_type').change();
        $('#prefs').val(id);
        $('#prefs').change();
        $("#pref-desc").val(text);
        idToBeUpdated = id;
        $("#pref-desc").prop('disabled',false);
    }

    function resetAll(){
   /*     $('#pref_type').val(0);
        $('#pref_type').change();
        $('#prefs').val(0);
        $('#prefs').change();
        $("#pref-desc").val('');
        idToBeUpdated = 0;
        $("#pref-desc").prop('disabled',true);*/
        reloadGrid(taskGrid.id, originalUrl + "?rid=<%=reservationId%>&roomid=<%=roomid%>");
    }

    function removePref(id){
        loader.show();
        var sql = "DELETE FROM preference WHERE preferenceid = "+id;
        $.post("content/execute.jsp?query=" + encodeURIComponent(sql), {}, function () {
            loader.hide();
            if($("#list_tasks")[0].rows.length == 2){
                $('#<%=idToremove%>_room').find('.fa-sun-o').remove();
            }
            resetAll();
        });
    }

    function loadAll(){
        $('.modal-dialog').width(768);
        $('#myModalFooter').hide();
        $('.dropdown').selectpicker();
        taskGrid.url = originalUrl + "?rid=<%=reservationId%>&roomid=<%=roomid%>";
        initializeGrid(taskGrid);
        taskGrid.url = originalUrl;
        $("#pref_type").next().css('float','right');
        $('#grid-table .date').datepicker(<%=pickerFormatForDatePickers%>);
        $('#grid-table .dropdown').selectpicker();
        $("#grid-table .btn-group").css("width", "100%", "!important");
        /*$("#grid-table input[type='text']").css("width", "100%", "!important");*/
        $("#grid-table .date input[type='text']").css("position", "relative");
        $("#grid-table input").height(27, "!important");

        $('#timepicker2').timepicker({
            minuteStep: 1,
    /*        template: 'modal',
            appendWidgetTo: 'body',*/
            showSeconds: false,
            showMeridian: false,
            defaultTime: false
        });

        $('#dateFrom').datepicker(<%=pickerFormatForDatePickers%>);
        var today = new Date();
        $("#dateFrom").datepicker("setDate", today);


    }

</script>

<table style="width: 580px;" id="grid-table">
    <tr>
        <td>
            ნომერი
        </td>
        <td>
            <%=roomid%>
        </td>
        <td>
            <div style="width: 100%;">
                <div style="width: 235px; float: right;">
                    <select id="pref_type" class="dropdown" style="float: right;">
                        <option value='0' selected='selected'>-აირჩიეთ-</option>
                        <% for(int i = 0; i < departments.length; i++){ %>
                        <option value="<%=i%>"><%=departments[i]%></option>
                        <% } %>
                    </select>
                </div>
                <div style="width: auto; float: right; padding-top: 5px;">
                    განკუთვნილია&nbsp;
                </div>
            </div>
        </td>
    </tr>
    <tr>
        <td colspan="3" style="padding-top: 0px;">
        </td>
    </tr>
    <tr>
        <td>
            ტექსტი
        </td>
        <td colspan="2" style="height: 30px;">
            <textarea id="pref-desc" style="width: 100%; height: 80px !important;"></textarea>
        </td>
    </tr>
    <tr>
    <tr>
        <td colspan="3" style="padding-top: 0px;">

        </td>
    </tr>
    <tr>
        <td>
            თარიღი:
        </td>
        <td>
            <div class="input-append date" id="dateFrom" style="position: relative;">
                <input type="text" class="span2 " name="arrival_dateFrom" id="arrival_dateFrom" disabled>
                    <span class="add-on"
                          style="  position: absolute !important;
                                                      right: 17px !important;
                                                      background: none !important;
                                                      border: none !important;
                                                      top: 5px;">
                        <i class="glyphicon glyphicon-calendar"></i>
                    </span>
            </div>
        </td>
        <td>
            <div class="input-append bootstrap-timepicker" style=" float: left;">
                <input id="timepicker2" type="text" class="input-small" style="width: 60px;" value="<%=hour + ":" + minute %>" >
                 <span class="add-on" style="height: 33px;">
                    <i class="fa fa-clock-o" style="padding-top: 6px;"></i>
                </span>
            </div>
            <div style="width: 235px; float: right;  margin-top: 3px;">
                <select id="alert" class="dropdown" style="float: right;">
                    <option value='0' selected='selected'>-აირჩიეთ-</option>
                    <% for(int i = 0; i < alerts.length; i++){ %>
                    <option value="<%=i%>"><%=alerts[i]%></option>
                    <% } %>
                </select>
            </div>
            <div style="width: auto; float: right; padding-top: 10px;">
                Alert&nbsp;
            </div>
        </td>
    </tr>
</table>
<div class="modal-footer" style="margin-top: 10px;">
    <button type="button" class="btn btn-default" id="dismissbutton" data-dismiss="modal" onclick="this.click();">
        დახურვა
    </button>
    <button type="button" class="btn btn-primary" id="btnSavePref" onclick="">შენახვა</button>
</div>
<div class="modal-custom-body" style="width: 578px;">
    <table id='list_tasks' class="table-striped table-hover" align='center'></table>
</div>