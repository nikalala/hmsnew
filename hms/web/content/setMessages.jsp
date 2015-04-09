<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<%
    String rid = (String) request.getParameter("reservationid");
    String isHotelStatus = request.getParameter("ishotelstatus");
    VSharerBean[] vshares = VSharerManager.getInstance().loadByWhere("where reservationroomid = " + rid);
    VSharer2Bean[] vSharer2Beans = VSharer2Manager.getInstance().loadByWhere("where reservationroomid = " + rid);
    String roomid = "";
    ReservationroomBean reservationroomBean = ReservationroomManager.getInstance().loadByPrimaryKey(Long.valueOf(rid));
    RoomtypeBean roomtypeBean = RoomtypeManager.getInstance().loadByPrimaryKey(reservationroomBean.getRoomtypeid());
    if(reservationroomBean.getRoomid() == null || reservationroomBean.getRoomid() < 1)
    {
        roomid = roomtypeBean.getName();
    }else{
        RoomBean roomBean = RoomManager.getInstance().loadByPrimaryKey(reservationroomBean.getRoomid());
        roomid = roomBean.getName() + " - " + roomtypeBean.getName();
    }

    String reservationId = reservationroomBean.getReservationid().toString();
%>

<link rel="stylesheet" type="text/css" href="css/grid-filter.css">
<style>
    .datepicker, .dropdown-menu{
        z-index: 10000000 !important;
    }
</style>
<script>
    var originalUrl = "content/getmessages.jsp";
    var idToBeUpdated = 0;
    $(document).ready(function () {
        loadAll();
    });

    function savePref() {
        var sql = "";
        var txt = $("#pref-desc").val();
        var perfType = $("#pref_type").val();

        if (isNullOrEmpty(txt)) {
            $("#pref-desc").addClass("error");
            return;
        }else{
            if($("#pref-desc").hasClass("error")){
                $("#pref-desc").addClass("valid");
            }
            $("#pref-desc").removeClass("error");
        }

        if (isNullOrEmpty(perfType)) {
            $("#pref_type").next().addClass("error");
            return;
        }else{
            if($("#pref_type").next().hasClass("error")){
                $("#pref_type").next().addClass("valid");
            }
            $("#pref_type").next().removeClass("error");
        }

        $("#pref-desc").removeClass("valid");
        $("#alert").next().removeClass("valid");
        $("#pref_type").next().removeClass("valid");
        $("#timepicker2").removeClass("valid");

        if(idToBeUpdated == 0){
            sql = "INSERT INTO message(messageid, name, guestid, stid, regbyid, active, deleted, reservationid) VALUES (" +
            "nextval('messageid_seq'),'" + txt + "'," + $("#pref_type").val() + ",0,<%=user.getPersonnelid()%>, TRUE,FALSE,<%=reservationId%>)";
        }else{
            sql = "UPDATE message SET name = '" + txt + "', guestid = " + $("#pref_type").val() + " WHERE messageid = " + idToBeUpdated;
        }

        if (!isNullOrEmpty(sql)) {
            loader.show();
            $.post("content/execute.jsp?query=" + encodeURIComponent(sql), {}, function () {
                loader.hide();
                resetAll();
            });
        }
    }

    function editPref(taskid,depid,text){
        idToBeUpdated = taskid;
        $('#pref_type').val(depid);
        $('#pref_type').change();
        $("#pref-desc").val(text);
    }

    function resetAll(){
        $('#pref_type').val("");
        $('#pref_type').change();
        $("#pref-desc").val('');
        idToBeUpdated = 0;
        $('#grid-table .date').datepicker(<%=pickerFormatForDatePickers%>);
        reloadGrid(messageGrid.id, originalUrl + "?rid=<%=reservationId%>&roomid=<%=roomid%>");
        <% if (!CodeHelpers.isNullOrEmpty(isHotelStatus)){ %>
        getBody('stayviewleft','hotelstatus','სასტუმროს სტატუსი','res1','',true);
        <% } %>
    }

    function removePref(id){
        loader.show();
        var sql = "DELETE FROM message WHERE messageid = "+id;
        $.post("content/execute.jsp?query=" + encodeURIComponent(sql), {}, function () {
            loader.hide();
            if($("#list_messages")[0].rows.length == 2){
                <% if (!CodeHelpers.isNullOrEmpty(isHotelStatus)){ %>
                getBody('stayviewleft','hotelstatus','სასტუმროს სტატუსი','res1','',true);
                <% } %>
            }
        });
    }

    function saveST(){
        loader.show();
        if (!isNullOrEmpty(idToBeUpdated) && idToBeUpdated > 0) {
            var st = $("#changeST").val();
            var sql = "UPDATE message SET stid = " + st + " WHERE messageid = " + idToBeUpdated;
            $.post("content/execute.jsp?query=" + sql, {}, function () {
                resetAll();
                loader.hide();
                $('#STBlock').hide();
            });
        }
    }

    function loadAll(){
        $('.modal-dialog').width(652);
        $('#myModalFooter').hide();
        $('.dropdown').selectpicker();
        messageGrid.url = originalUrl + "?rid=<%=reservationId%>&roomid=<%=roomid%>";
        initializeGrid(messageGrid);
        messageGrid.url = originalUrl;
        $("#pref_type").next().css('float','right');
        $('#grid-table .date').datepicker(<%=pickerFormatForDatePickers%>);
        $('#grid-table .dropdown').selectpicker();
        $("#grid-table .btn-group").css("width", "100%", "!important");
        /*$("#grid-table input[type='text']").css("width", "100%", "!important");*/
        $("#grid-table .date input[type='text']").css("position", "relative");
        $("#grid-table input").height(27, "!important");

    }
    function updateST(id, _this) {
        $("#STBlock").css("display", "block");
        $("#STBlock").offset($(_this).offset());
        $("#STBlock").css({'left': $("#STBlock").position().left - 217});
        idToBeUpdated = id;
    }
</script>

<div class="modal-custom-content" id="STBlock" style="position: absolute; z-index: 10; display: none;">
    <div class="modal-custom-header" style="background-color: gray; color: white; height: 30px;">
        <button type="button" id="smallmodalbtn" class="close" onclick="javascript:$('#STBlock').hide();" aria-hidden="true"
                style="margin-top: -6px;">×
        </button>
        <h4 style="margin-top: -4px;">სტატუსის შეცვლა</h4>
    </div>
    <div class="modal-custom-body">
        <select id="changeST" class="dropdown changestatus2" style="float: left; margin: 15px 10px 0 10px;">
            <% for (int i = 0; i < messageStatuses.length; i++) { %>
            <option value="<%=i%>"><%=messageStatuses[i]%></option>
            <% } %>
        </select>
    </div>
    <div class="modal-footer" style="margin-top: 10px;">
        <button type="button" class="btn btn-default"  onclick="javascript:$('#STBlock').hide();">
            დახურვა
        </button>
        <button type="button" class="btn btn-primary" onclick="saveST()">შენახვა</button>
    </div>
</div>

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
                        <option value="">--აირჩიეთ--</option>
                        <% for(int i = 0; i < vshares.length; i++){ %>
                        <option value="<%=vshares[i].getGuestid()%>"><%=vshares[i].getGuest()%></option>
                        <% } %>
                        <% for(int i = 0; i < vSharer2Beans.length; i++){ %>
                        <option value="<%=vSharer2Beans[i].getGuestid()%>"><%=vSharer2Beans[i].getGuest()%></option>
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
</table>
<div class="modal-footer" style="margin-top: 10px;">
    <button type="button" class="btn btn-default" id="dismissbutton" data-dismiss="modal" onclick="this.click();">
        დახურვა
    </button>
    <button type="button" class="btn btn-primary" onclick="savePref()">შენახვა</button>
</div>
<div class="modal-custom-body" style="width: 578px;">
    <table id='list_messages' class="table-striped table-hover" align='center'></table>
</div>