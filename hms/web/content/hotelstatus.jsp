<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<% RoomtypeBean[] roomTypes = RoomtypeManager.getInstance().loadByWhere(""); %>

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
        $('#grid-table .dropdown, #changestatus,#assigntohk, #viewby').selectpicker();
        $("#changestatus,#assigntohk").next().css("margin-top", "8px");
        $("#viewby").next().css("margin-top", "1px");
        /*$(".first-table").css("width",$(".filter-form1").width(),"!important");*/

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
        $(".ui-jqgrid-bdiv").height($(".ui-jqgrid-bdiv").height() - 100);
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
                '</div>' +
                '<div class="footercont" style="padding-right: 10px;">' +
                '<span style="margin: 15px 10px 0 10px; float: left;">დაავალე დამლაგებელს: </span>' +
                '<select id="assigntohk" class="dropdown" style="float: left; margin: 15px 10px 0 10px;">' +
                <% for(int i = 0; i<hkeeper.length; i++){ %>
                '<option value="<%=hkeeper[i].getPersonnelid()%>"><%=hkeeper[i].getFname() + " " + hkeeper[i].getLname()%></option>' +
                <% } %>
                '</select>' +
                '<button type="button" class="btn btn-primary" id="btnAssignToHK" style="font-weight: bold; margin: 9px 10px 0 5px;">' +
                'მიბმა</button>' +
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
        $(".ui-jqgrid-view").find(".panel-footer").remove();
        $(".ui-jqgrid-view").append(html);
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
                    " VALUES ((SELECT COALESCE(MAX(roomhstid) %2B 1,1) FROM roomhst), " + trid + ", " + hkid + ", '<%=df2.format(dclosedate)%>', <%=user.getPersonnelid()%>, " + thuid + ")";

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
        if(hkid === "0")
        {
            BootstrapDialog.alert("აირჩიეთ სტატუსი");
            return;
        }

        var ids = getSelectedRowIds(hsGrid.id);

        var result = ids.split(',');

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
            " VALUES ((SELECT COALESCE(MAX(roomhstid) %2B 1,1) FROM roomhst), " + trid + ", " + hkid + ", '<%=df2.format(dclosedate)%>', <%=user.getPersonnelid()%>, " + thuid + ");";

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
            $.post("content/execute.jsp" + q + generatedSQL, {}, function (data2) {
                reloadGrid(hsGrid.id, hsGrid.url);
                $("#dismissbutton").click();
                loader.hide();
            });
        });
    }

    $(document).on("click", "#dismissbutton, #smallmodalbtn", function () {
        $("#updatehs").css("display", "none");
    });

</script>

<div class="modal-content" id="updatehs" style="position: absolute; z-index: 10; display: none;">
    <div class="modal-header" style="background-color: gray; color: white; height: 30px;">
        <button type="button" id="smallmodalbtn" class="close" data-dismiss="modal" aria-hidden="true"
                style="margin-top: -6px;">×
        </button>
        <h4 id="smheader" style="margin-top: -4px;">ვალუტის კურსი</h4>
    </div>
    <div class="modal-body" id="smbody">
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