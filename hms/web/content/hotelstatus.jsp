<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<% RoomtypeBean[] roomTypes = RoomtypeManager.getInstance().loadByWhere(""); %>
<% PersonnelBean[] keepers = PersonnelManager.getInstance().loadByWhere("where personneltypeid = 2"); %>

<link rel="stylesheet" type="text/css" href="css/grid-filter.css">

<style>
    .footercont {
        float: left;
        border-right: 1px solid #ddd;
        border-left: 1px solid #ddd;
        margin: 0 10px 0 10px;
        width: auto;
        height: 50px;
    }

    .status-color {
        -webkit-border-radius: 3px;
        -moz-border-radius: 3px;
        border-radius: 3px;
        width: 16px;
        margin-top: 1px;
        margin-right: 4px;
        height: 16px;
        float: left;
    }

</style>

<script type="text/javascript">

    var rid = "";

    $(document).ready(function () {

        loadDefaults();
        drawTwoDimFooterForGuestDbList();
        $('#grid-table .dropdown, #changestatus, #changekeeper, #assigntohk, #viewby').selectpicker();
        $("#changestatus,#assigntohk").next().css("margin-top", "8px");
        $("#viewby").next().css("margin-top", "1px");

    });

    $(document).on("click", "#dismissbutton, #smallmodalbtn", function () {
        $("#updatehs, #updateremark, #updateroomkeeper").css("display", "none");
    });

    function blockunbloc(roomid) {
        newsWindow1('blockunblock', 'ოთახის ბლოკირება', "roomid=" + roomid);
    }

    function loadDefaults() {
        initializeGrid(hsGrid);
        $("#grid-table .btn-group").css("width", "100%", "!important");
        $("#grid-table label").each(function () {
            $(this).css("float", "right", "!important");
            $(this).css("line-height", "27px", "!important");
        });
        $("#grid-table input").height($("#grid-table .btn-group").height() - 6, "!important");
        $("#filter-form input[type='text']").css("width", "100%", "!important");
    }

    function drawTwoDimFooterForGuestDbList() {
        $("#list_hsgrid").closest('.ui-jqgrid-bdiv').height($("#list_hsgrid").closest(".ui-jqgrid-bdiv").height() - 100);
        var html =
                '<div class="panel-footer" style="height: 50px !important; display:table; width: 100%; padding-bottom: 1px; background-color: #FFF;">' +
                '<div>' +
                '<span style="margin: 15px 10px 0 10px; float: left;">მონიშნულის: </span>' +
                '<div class="footercont" style="border-right: 0;">' +
                '<span style="margin: 15px 10px 0 10px; float: left;">სტატუსის შეცვლა: </span>' +
                '<select id="changestatus" class="dropdown changestatus1" style="float: left; margin: 15px 10px 0 10px;">' +
                '<option value="0">--აირჩიეთ--</option>' +
                <% for(int i = 0; i<hksb.length; i++){ %>
                '<option value="<%=hksb[i].getHousekeepingstatusid()%>"><%=hksb[i].getName()%></option>' +
                <% } %>
                '</select>' +
                '<button type="button" onclick="saveMultStatusId()" class="btn btn-primary" id="btnChangeStatus" style="font-weight: bold; margin: 9px 10px 0 5px;">' +
                'შესრულება</button>' +
                '<button type="button" class="btn btn-danger" id="btnRemoveStatus" onclick="removeAllStatus()" style="font-weight: bold; float: right; margin: 9px 10px 0 0;">X</button>'+
                '</div>' +
                '<div class="footercont" style="padding-right: 10px;">' +
                '<span style="margin: 15px 10px 0 10px; float: left;">დაავალე დამლაგებელს: </span>' +
                '<select id="assigntohk" class="dropdown" style="float: left; margin: 15px 10px 0 10px;">' +
                <% for(int i = 0; i<hkeeper.length; i++){ %>
                '<option value="<%=hkeeper[i].getPersonnelid()%>"><%=hkeeper[i].getFname() + " " + hkeeper[i].getLname()%></option>' +
                <% } %>
                '</select>' +
                '<button type="button" class="btn btn-primary" onclick="saveMultKeeper()" id="btnAssignToHK" style="font-weight: bold; margin: 9px 10px 0 5px;">' +
                'მიბმა</button>' +
                '<button type="button" class="btn btn-danger" id="btnRemoveStatus" onclick="removeAllKeeper()" style="font-weight: bold; float: right; margin: 9px 10px 0 0;">X</button>'+
                '</div>' +

                '</div></div>' +
                '<div class="panel-footer" style="height: 50px !important; display:table; width: 100%; padding-bottom: 1px; background-color: #FFF;">' +
                '<div>' +
                '<span style="margin: 15px 10px 0 10px; float: left;">ჩანაწერების რაოდენობა გვერდზე</span>' +
                '<select id="limitselectbox" style="float: left; margin: 15px 10px 0 10px;">' +
                '<option value="5">5</option>' +
                '<option value="15">15</option>' +
                '<option value="25">25</option>' +
                '<option value="50">50</option>' +
                '</select>' +
                '<button type="button" class="btn btn-default" id="btnNext" style="font-weight: bold; float: right; margin: 9px 10px 0 0;">' +
                'შემდეგი</button>' +
                '<button type="button" class="btn btn-danger" id="btnPrev" style="font-weight: bold; float: right; margin: 9px 10px 0 0;">' +
                'წინა</button>' +
                '</div></div>';
        $("#list_hsgrid").closest(".ui-jqgrid-view").find(".panel-footer").remove();
        $("#list_hsgrid").closest(".ui-jqgrid-view").append(html);
    }

    function updateselectedhs(id, _this) {

        $("#updatehs").css("display", "block");
        $("#updatehs").offset($(_this).offset());
        /*$("#mainbody").css({ "background":"lightgray", "opacity":"0.4","filter":"alpha(opacity=40)" })*/
        $("#updatehs").css({'left': $("#updatehs").position().left + 25});
        rid = id;
    }

    function saveStatusId() {
        if (!isNullOrEmpty(rid)) {

            var trid = "NULL";
            var thuid = "NULL";
            var roomquery = "";
            if (rid.indexOf("room") != -1) {
                trid = rid.replace("_room", "");
                roomquery = "?query=DELETE FROM roomhst where roomid = " + trid;
            } else {
                thuid = rid.replace("_house", "");
                roomquery = "?query=DELETE FROM roomhst where houseunitid = " + thuid;
            }

            var hkid = $(".changestatus2").val();

            var sql = "?query=INSERT INTO roomhst(roomhstid, roomid, housekeepingstatusid, regdate, regbyid, houseunitid) " +
                    " VALUES (nextval('roomhstid_seq'), " + trid + ", " + hkid + ", '<%=df2.format(dclosedate)%>', <%=user.getPersonnelid()%>, " + thuid + ")";

            $.post("content/execute.jsp" + roomquery, {}, function (data1) {
                $.post("content/execute.jsp" + sql, {}, function (data2) {
                    reloadGrid(hsGrid.id, hsGrid.url);
                    $("#dismissbutton").click();
                    loader.hide();
                });
            });
        }
    }

    function saveMultStatusId() {

        var hkid = $(".changestatus1").val();

        if(hkid === "0"){
            BootstrapDialog.alert("აირჩიეთ სტატუსი");
            return;
        }

        var ids = getSelectedRowIds(hsGrid.id);

        if(isNullOrEmpty(ids)){
            BootstrapDialog.alert("აირჩიეთ მინიმუმ 1 ოთახი");
            return;
        }

        var result = ids.split(',');

        if(result.length > 10){
            BootstrapDialog.alert("ერთდროულად შეუძლებელია 10-ზე მეტ ოთახზე ცვლილების შეტანა");
            return;
        }

        var generatedSQL = "";

        var q = "?query=";

        var roomids = "";

        var unitids = "";

        $.each(result, function (id,val) {

            var id = val;

            var trid = "NULL";
            var thuid = "NULL";

            if (id.indexOf("room") != -1) {
                roomids += id.replace("_room", "") + ",";
                trid = id.replace("_room", "");
            } else {
                unitids += id.replace("_house", "") + ",";
                thuid = id.replace("_house", "");
            }

            generatedSQL += "INSERT INTO roomhst(roomhstid, roomid, housekeepingstatusid, regdate, regbyid, houseunitid) " +
            " VALUES (nextval('roomhstid_seq'), " + trid + ", " + hkid + ", '<%=df2.format(dclosedate)%>', <%=user.getPersonnelid()%>, " + thuid + ");";

        });

        var roomquery = "";

        var unitquery = "";

        if (!isNullOrEmpty(roomids)) {
            roomids = roomids.substring(0, roomids.trim().lastIndexOf(","));
            roomquery = "DELETE FROM roomhst where roomid IN(" + roomids + ");";
        }

        if (!isNullOrEmpty(unitids)) {
            unitids = unitids.substring(0, unitids.trim().lastIndexOf(","));
            unitquery = "DELETE FROM roomhst where houseunitid IN(" + unitids + ");";
        }

        $.post("content/execute.jsp?query=" + encodeURIComponent(unitquery + roomquery + generatedSQL), {}, function (data) {
            reloadGrid(hsGrid.id, hsGrid.url);
            $("#dismissbutton").click();
            loader.hide();
        });
    }

    function saveMultKeeper() {

        var hkid = $("#assigntohk").val();

        if(hkid === "0"){
            BootstrapDialog.alert("აირჩიეთ დამლაგებელი");
            return;
        }

        var ids = getSelectedRowIds(hsGrid.id);

        if(isNullOrEmpty(ids)){
            BootstrapDialog.alert("აირჩიეთ მინიმუმ 1 ოთახი");
            return;
        }

        var result = ids.split(',');

        if(result.length > 10){
            BootstrapDialog.alert("ერთდროულად შეუძლებელია 10-ზე მეტ ოთახზე ცვლილების შეტანა");
            return;
        }


        var generatedSQL = "";

        var q = "?query=";

        var roomids = "";

        var unitids = "";

        $.each(result, function (id,val) {

            var id = val;

            var trid = "NULL";
            var thuid = "NULL";

            if (id.indexOf("room") != -1) {
                roomids += id.replace("_room", "") + ",";
                trid = id.replace("_room", "");
            } else {
                unitids += id.replace("_house", "") + ",";
                thuid = id.replace("_house", "");
            }

            generatedSQL += " INSERT INTO housekeeper(housekeeperid, personnelid, roomid, houseunitid) " +
            " VALUES " +
            "(nextval('housekeeperid_seq'), '" + $("#assigntohk").val() + "', " + trid + ", " + thuid + ");";

        });

        var roomquery = "";

        var unitquery = "";

        if (!isNullOrEmpty(roomids)) {
            roomids = roomids.substring(0, roomids.trim().lastIndexOf(","));
            roomquery = "UPDATE housekeeper SET deleted = TRUE where roomid IN(" + roomids + ");";
        }

        if (!isNullOrEmpty(unitids)) {
            unitids = unitids.substring(0, unitids.trim().lastIndexOf(","));
            unitquery = "UPDATE housekeeper SET deleted = TRUE where houseunitid IN(" + unitids + ");";
        }

        $.post("content/execute.jsp?query=" + encodeURIComponent(unitquery + roomquery + generatedSQL), {}, function () {
            reloadGrid(hsGrid.id, hsGrid.url);
            $("#dismissbutton").click();
            loader.hide();
        });
    }

    function removeAllStatus() {
        var ids = getSelectedRowIds(hsGrid.id);

        if(isNullOrEmpty(ids)){
            BootstrapDialog.alert("აირჩიეთ მინიმუმ 1 ოთახი");
            return;
        }

        var result = ids.split(',');

        if(result.length > 10){
            BootstrapDialog.alert("ერთდროულად შეუძლებელია 10-ზე მეტ ოთახზე ცვლილების შეტანა");
            return;
        }


        var roomids = "";

        var unitids = "";

        $.each(result, function (id,val) {
            var id = val;
            if (id.indexOf("room") != -1) {
                roomids += id.replace("_room", "") + ",";
            } else {
                unitids += id.replace("_house", "") + ",";
            }
        });

        var roomquery = "";

        var unitquery = "";

        if (!isNullOrEmpty(roomids)) {
            roomids = roomids.substring(0, roomids.trim().lastIndexOf(","));
            roomquery = "DELETE FROM roomhst where roomid IN(" + roomids + ");";
        }

        if (!isNullOrEmpty(unitids)) {
            unitids = unitids.substring(0, unitids.trim().lastIndexOf(","));
            unitquery = "DELETE FROM roomhst where houseunitid IN(" + unitids + ");";
        }

        $.post("content/execute.jsp?query=" + unitquery + roomquery, {}, function (data) {
            reloadGrid(hsGrid.id, hsGrid.url);
            loader.hide();
        });
    }

    function removeAllKeeper() {

        var ids = getSelectedRowIds(hsGrid.id);

        if(isNullOrEmpty(ids)){
            BootstrapDialog.alert("აირჩიეთ მინიმუმ 1 ოთახი");
            return;
        }

        var result = ids.split(',');

        if(result.length > 10){
            BootstrapDialog.alert("ერთდროულად შეუძლებელია 10-ზე მეტ ოთახზე ცვლილების შეტანა");
            return;
        }

        var roomids = "";

        var unitids = "";

        $.each(result, function (id,val) {
            var id = val;
            if (id.indexOf("room") != -1) {
                roomids += id.replace("_room", "") + ",";
            } else {
                unitids += id.replace("_house", "") + ",";
            }
        });

        var roomquery = "";

        var unitquery = "";

        if (!isNullOrEmpty(roomids)) {
            roomids = roomids.substring(0, roomids.trim().lastIndexOf(","));
            roomquery = "UPDATE housekeeper SET deleted = TRUE where roomid IN(" + roomids + ");";
        }

        if (!isNullOrEmpty(unitids)) {
            unitids = unitids.substring(0, unitids.trim().lastIndexOf(","));
            unitquery = "UPDATE housekeeper SET deleted = TRUE where houseunitid IN(" + unitids + ");";
        }

        $.post("content/execute.jsp?query=" + unitquery + roomquery, {}, function (data) {
            reloadGrid(hsGrid.id, hsGrid.url);
            loader.hide();
        });
    }

    function changeRemark(id,remark,isHUnit,_this){

        if(isHUnit){
           $("#saveRemarkBtn").attr("onclick","saveMark(true)");
        }else{
            $("#saveRemarkBtn").attr("onclick","saveMark(false)");
        }

        if(remark === 'null') { remark = ''}
        $("#remarktxt").val(remark);
        $("#updateremark").css("display", "block");
        $("#updateremark").offset($(_this).offset());
        $("#updateremark").css({'left': $("#updateremark").position().left + 25});
        rid = id;

    }

    function saveMark(isHUnit){

        var remark = $("#remarktxt").val();

        if(remark === "null" || remark == ""){
            BootstrapDialog.alert("შეიყვანეთ მინიშნება!!!");
            return;
        }

        var roomId = "NULL";

        var huId = "NULL";

        var deleteRemarks = "";

        if(!isHUnit){
            deleteRemarks = "UPDATE remarks SET deleted = true WHERE roomid in (" + rid + ");";
            roomId = rid;
        }else{
            deleteRemarks = "UPDATE remarks SET deleted = true WHERE houseunitid in (" + rid + ");";
            huId = rid;
        }

        var sql = deleteRemarks + " INSERT INTO remarks(remarkid, remark, roomid, houseunitid) " +
                "VALUES " +
                "(nextval('remarkid_seq'), '" + remark + "', " + roomId + ", " + huId + ");";

        $.post("content/execute.jsp?query=" + encodeURIComponent(sql), {}, function () {

            reloadGrid(hsGrid.id, hsGrid.url);

            $("#dismissbutton").click();

            loader.hide();

        });

    }

    function changeRoomKeeper(id,_this,isHUnit){

        if(isHUnit){
            $("#saveRoomKeeperBtn").attr("onclick","saveRoomKeeper(true)");
        }else{
            $("#saveRoomKeeperBtn").attr("onclick","saveRoomKeeper(false)");
        }

        $("#updateroomkeeper").css("display", "block");
        $("#updateroomkeeper").offset($(_this).offset());
        $("#updateroomkeeper").css({'left': $("#updateroomkeeper").position().left - 255});
        rid = id;
    }

    function saveRoomKeeper(isHUnit){

        var roomId = "NULL";

        var huId = "NULL";

        var deleteRK = "";

        if(!isHUnit){
            deleteRK = "UPDATE housekeeper SET deleted = true WHERE roomid in (" + rid + ");";
            roomId = rid;
        }else{
            deleteRK = "UPDATE housekeeper SET deleted = true WHERE houseunitid in (" + rid + ");";
            huId = rid;
        }

        var sql = deleteRK + " INSERT INTO housekeeper(housekeeperid, personnelid, roomid, houseunitid) " +
                "VALUES " +
                "(nextval('housekeeperid_seq'), '" + $("#changekeeper").val() + "', " + roomId + ", " + huId + ");";

        $.post("content/execute.jsp?query=" + encodeURIComponent(sql), {}, function () {

            reloadGrid(hsGrid.id, hsGrid.url);

            $("#dismissbutton").click();

            loader.hide();

        });
    }

    function removeRoomKeeper(id,isHUnit){

        var query = "";

        if (!isHUnit) {
            query = "UPDATE housekeeper SET deleted = TRUE where roomid IN(" + id + ");";
        } else {
            query = "UPDATE housekeeper SET deleted = TRUE where houseunitid IN(" + id + ");";
        }

        $.post("content/execute.jsp?query=" + query, {}, function () {
            reloadGrid(hsGrid.id, hsGrid.url);
            loader.hide();
        });

    }

    function removeRoomStatus(id,isHUnit){

        var query = "";

        if (!isHUnit) {
            query = "DELETE FROM roomhst where roomid = " + id + ";";
        } else {
            query = "DELETE FROM roomhst where houseunitid = " + id + ";";
        }

        $.post("content/execute.jsp?query=" + query, {}, function () {
            reloadGrid(hsGrid.id, hsGrid.url);
            loader.hide();
        });

    }

</script>

<div class="modal-custom-content" id="updatehs" style="position: absolute; z-index: 10; display: none;">
    <div class="modal-custom-header" style="background-color: gray; color: white; height: 30px;">
        <button type="button" id="smallmodalbtn" class="close" data-dismiss="modal" aria-hidden="true"
                style="margin-top: -6px;">×
        </button>
        <h4 style="margin-top: -4px;">სტატუსის შეცვლა</h4>
    </div>
    <div class="modal-custom-body">
        <select id="changestatus" class="dropdown changestatus2" style="float: left; margin: 15px 10px 0 10px;">
            <% for (int i = 0; i < hksb.length; i++) { %>
            <option value="<%=hksb[i].getHousekeepingstatusid()%>"><%=hksb[i].getName()%>
            </option>
            <% } %>
        </select>
    </div>
    <div class="modal-footer" style="margin-top: 10px;">
        <button type="button" class="btn btn-default" id="dismissbutton" data-dismiss="modal" onclick="this.click();">
            დახურვა
        </button>
        <button type="button" class="btn btn-primary" onclick="saveStatusId()">შენახვა</button>
    </div>
</div>

<div class="modal-custom-content" id="updateroomkeeper" style="position: absolute; z-index: 10; display: none;">
    <div class="modal-custom-header" style="background-color: gray; color: white; height: 30px;">
        <button type="button" id="smallmodalbtn" class="close" data-dismiss="modal" aria-hidden="true"
                style="margin-top: -6px;">×
        </button>
        <h4 style="margin-top: -4px;">დამლაგებლის შეცვლა</h4>
    </div>
    <div class="modal-custom-body">
        <select id="changekeeper" class="dropdown changestatus3" style="float: left; margin: 15px 10px 0 10px;">
            <% for (int i = 0; i < keepers.length; i++) { %>
            <option value="<%=keepers[i].getPersonnelid()%>"><%=keepers[i].getFname() + " " + keepers[i].getLname()%>
            </option>
            <% } %>
        </select>
    </div>
    <div class="modal-footer" style="margin-top: 10px;">
        <button type="button" class="btn btn-default" id="dismissbutton" data-dismiss="modal" onclick="this.click();">
            დახურვა
        </button>
        <button type="button" class="btn btn-primary" id="saveRoomKeeperBtn" onclick="saveRoomKeeper()">შენახვა</button>
    </div>
</div>

<div class="modal-custom-content" id="updateremark" style="position: absolute; z-index: 10; display: none;">
    <div class="modal-custom-header" style="background-color: gray; color: white; height: 30px;">
        <button type="button" id="smallmodalbtn" class="close" data-dismiss="modal" aria-hidden="true"
                style="margin-top: -6px;">×
        </button>
        <h4 style="margin-top: -4px;">სტატუსის შეცვლა</h4>
    </div>
    <div class="modal-custom-body">
        <textarea id="remarktxt"></textarea>
    </div>
    <div class="modal-footer" style="margin-top: 10px;">
        <button type="button" class="btn btn-default" id="dismissbutton" data-dismiss="modal" onclick="this.click();">
            დახურვა
        </button>
        <button type="button" id="saveRemarkBtn" class="btn btn-primary">შენახვა</button>
    </div>
</div>

<form name="filter-form" id="filter-form">
    <table id="grid-table" class="first-table">
        <tr>
            <td>
                <div id="status_bar" class="first-status-bar" align='center'>
                    <div style="width: 100%; float: left; text-align: left;">
                        <span style="margin: 15px 10px 0 10px;">სორტირება: </span>
                        <select id="viewby" class="dropdown" style="margin: 15px 10px 0 10px;">
                            <% for (int i = 0; i < roomTypes.length; i++) {%>
                            <option value="<%=roomTypes[i].getRoomtypeid()%>"><%=roomTypes[i].getName()%>
                            </option>
                            <% } %>
                        </select>
                        <button type="button" class="btn btn-default" id="btnSearch"
                                style="border: 0; font-weight: bold; margin: 3px 5px 0 0; background-color: red; color: #fff;">
                            ძიება
                        </button>
                        <button type="button" class="btn btn-default" id="btnShowAll"
                                style="font-weight: bold; margin: 3px 5px 0 0;">
                            მაჩვენე ყველა
                        </button>
                    </div>
                </div>
            </td>
        </tr>
    </table>
    <table id="grid-table">
        <tr>
            <td>
                <table id='list_hsgrid' class="table-striped table-hover" align='center'></table>
            </td>
        </tr>
    </table>
</form>