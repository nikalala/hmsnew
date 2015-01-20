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

    function addHStatusToRoom() {

        loader.show();

        var ids = getSelectedRowIds(hsGrid.id);
        var roomids = "";
        var unitids = "";
        var idstospl = ids.split(',');

        idstospl.forEach(function (item) {
            if (item.indexOf("room") != -1) {
                roomids += item.replace('_room', '') + ",";
            } else {
                unitids += item.replace('_room', '') + ",";
            }
        });

        if (!isNullOrEmpty(roomids)) {
            roomids = roomids.substring(0, roomids.trim().lastIndexOf(","));
            var roomquery = "?query=DELETE FROM roomhst where roomid IN(" + roomids + ")";
            $.post("content/execute.jsp" + roomquery, {}, function (data) {
                var regbyid = ",<%=user.getPersonnelid()%>";
                var st = $("#changestatus").val();
                var rmsplited = roomids.split(',');
                var q = "?query=";
                var insert = "";
                rmsplited.forEach(function (item) {
                    insert += "INSERT INTO roomhst (roomhstid,roomid,housekeepingstatusid,regbyid) VALUES ((SELECT COALESCE(MAX(roomhstid) %2B 1,1) FROM roomhst)," + item + "," + st + regbyid + ");";
                });
                $.post("content/execute.jsp" + q + insert, {}, function (data2) {
                    reloadGrid(hsGrid.id, hsGrid.url);
                    loader.hide();
                });
            });
        }
    }

    function drawTwoDimFooterForGuestDbList() {
        $(".ui-jqgrid-bdiv").height($(".ui-jqgrid-bdiv").height() - 100);
        var html =
                '<div class="panel-footer" style="height: 50px !important; display:table; width: 100%; padding-bottom: 1px; background-color: #FFF;">' +
                '<div>' +
                '<span style="margin: 15px 10px 0 10px; float: left;">მონიშნულის: </span>' +
                '<div class="footercont" style="border-right: 0;">' +
                '<span style="margin: 15px 10px 0 10px; float: left;">სტატუსის შეცვლა: </span>' +
                '<select id="changestatus" class="dropdown" style="float: left; margin: 15px 10px 0 10px;">' +
                <% for(int i = 0; i<hksb.length; i++){ %>
                '<option value="<%=hksb[i].getHousekeepingstatusid()%>"><%=hksb[i].getName()%></option>' +
                <% } %>
                '</select>' +
                '<button type="button" onclick="addHStatusToRoom()" class="btn btn-primary" id="btnChangeStatus" style="font-weight: bold; margin: 9px 10px 0 5px;">' +
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

</script>

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