<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<%
    PreferencetypeBean[] pTypes = PreferencetypeManager.getInstance().loadByWhere("");
    String rid = (String) request.getParameter("reservationid");


    ReservationroomBean reservationroomBean = ReservationroomManager.getInstance().loadByPrimaryKey(Long.valueOf(rid));
    RoomBean roomBean = RoomManager.getInstance().loadByPrimaryKey(reservationroomBean.getRoomid());
    RoomtypeBean roomtypeBean = RoomtypeManager.getInstance().loadByPrimaryKey(roomBean.getRoomtypeid());
    String roomid = roomBean.getName() + " - " + roomtypeBean.getName();
    String reservationId = reservationroomBean.getReservationid().toString();
    String idToremove = roomBean.getRoomid().toString();
    PreferenceBean[] prefs = PreferenceManager.getInstance().loadByWhere("where isstandart = true");
%>

<link rel="stylesheet" type="text/css" href="css/grid-filter.css">

<script>
    var originalUrl = "content/getpreferences.jsp";
    var idToBeUpdated = 0;
    $(document).ready(function () {
        $('.modal-dialog').width(600);
        $('#myModalFooter').hide();
        $('.dropdown').selectpicker();
        preferencesGrid.url = originalUrl + "?rid=<%=reservationId%>&roomid=<%=roomid%>";
        console.log(preferencesGrid.url);
        initializeGrid(preferencesGrid);
        preferencesGrid.url = originalUrl;
        $("#pref_type").next().css('float','right');
    });

    $(document).on("click","#btnSavePref",function(e){
        e.preventDefault();
        var sql = "";
        var txt = $("#pref-desc").val();
        if($("#prefs").val() == 0 || $("#prefs").val() == null){
            if(isNullOrEmpty(txt)){
                BootstrapDialog.alert("შეიყვანეთ ტექსტი");
                return;
            }else{
                if(idToBeUpdated > 0){
                    sql = "UPDATE preference SET name = '" + txt + "', preferencetypeid = " + $("#pref_type").val() + " WHERE preferenceid = " + idToBeUpdated;
                }else{
                    sql = "INSERT INTO preference(preferenceid, name, preferencetypeid, regbyid, active,deleted, reservationid, isstandart) " +
                    "VALUES ((SELECT COALESCE(MAX(preferenceid) + 1,1) FROM preference), '" + txt + "', " + $("#pref_type").val() + ", <%=user.getPersonnelid()%>, TRUE,FALSE,<%=reservationId%>, FALSE);";
                }
            }
        }else{
            if($("#prefs").val() > 0){
                if(idToBeUpdated > 0){
                    sql = "UPDATE preference SET name = '" + txt + "', preferencetypeid = " + $("#pref_type").val() + " WHERE preferenceid = " + idToBeUpdated;
                }else{
                    sql = "INSERT INTO preference(preferenceid, name, preferencetypeid, regbyid, active,deleted, reservationid, isstandart) " +
                    "VALUES ((SELECT COALESCE(MAX(preferenceid) + 1,1) FROM preference), '" + $("#prefs").next().find('.filter-option').text() + "', " + $("#pref_type").val() + ", <%=user.getPersonnelid()%>, TRUE,FALSE,<%=reservationId%>, FALSE);";
                }
            }
        }
        if(!isNullOrEmpty(sql)){
            loader.show();
            $.post("content/execute.jsp?query=" + encodeURIComponent(sql), {}, function () {
                loader.hide();
                resetAll();
            });
        }
    });

    $("#pref_type").on('change', function () {
        var element = $("option:selected", this);
        var id = element.val();
        if (id > 0) {
            var html = "<option value='0' selected='selected'>-აირჩიეთ-</option>";
            <% for (int i = 0; i < prefs.length; i++) { %>
                html += "<option class='<%=prefs[i].getPreferencetypeid()%>pref' value='<%=prefs[i].getPreferenceid()%>'><%=prefs[i].getName()%></option>";
            <% } %>
            $("#prefs").html(html);
        } else {
            var html = "<option value='0' selected='selected'>-აირჩიეთ-</option>";
            $("#prefs").html(html);
        }
        $("#pref-desc").prop("disabled",id == 0);
        $("#btnSavePref").prop("disabled",id == 0);
        removeAllUnUsedOption();
    });

    $("#prefs").on('change', function () {
        var element = $("option:selected", this);
        var id = element.val();
        $("#pref-desc").prop("disabled",id != 0);
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
        $('#pref_type').val(0);
        $('#pref_type').change();
        $('#prefs').val(0);
        $('#prefs').change();
        $("#pref-desc").val('');
        idToBeUpdated = 0;
        $("#pref-desc").prop('disabled',true);
        reloadGrid(preferencesGrid.id, originalUrl + "?rid=<%=reservationId%>&roomid=<%=roomid%>");
    }

    function removePref(id){
        loader.show();
        var sql = "DELETE FROM preference WHERE preferenceid = "+id;
        $.post("content/execute.jsp?query=" + encodeURIComponent(sql), {}, function () {
            loader.hide();
            if($("#list_preferences")[0].rows.length == 2){
                $('#<%=idToremove%>_room').find('.fa-sun-o').remove();
            }
            resetAll();
        });
    }

</script>

<table style="width: 580px;">
    <tr>
        <td>
            ნომერი
        </td>
        <td>
            <%=roomid%>
        </td>
        <td>
            <div style="width: 100%;">
                <div style="width: 355px; float: right;">
                    <select id="pref_type" class="dropdown" style="float: right;">
                        <option value='0' selected='selected'>-აირჩიეთ-</option>
                        <% for (int i = 0; i < pTypes.length; i++) { %>
                        <option value="<%=pTypes[i].getPreferencetypeid()%>"><%=pTypes[i].getName()%>
                        </option>
                        <% } %>
                    </select>
                </div>
                <div style="float: right;">ტიპი</div>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            უპირატესობა
        </td>
        <td colspan="2" style="height: 30px;">
            <select id="prefs" class="dropdown" style="width: 170px;">
                <option value='0' selected='selected'>-აირჩიეთ-</option>
            </select>
            ან<br/>
        </td>
    </tr>
    <td>
        &nbsp;
    </td>
    <td colspan="2">
        <textarea id="pref-desc" style="width: 100%; height: 80px !important;" disabled></textarea>
    </td>
</table>
<div class="modal-footer" style="margin-top: 10px;">
    <button type="button" class="btn btn-default" id="dismissbutton" data-dismiss="modal" onclick="this.click();">
        დახურვა
    </button>
    <button type="button" class="btn btn-primary" id="btnSavePref" disabled onclick="">შენახვა</button>
</div>
<div class="modal-custom-body" style="width: 578px;">
    <table id='list_preferences' class="table-striped table-hover" align='center'></table>
</div>