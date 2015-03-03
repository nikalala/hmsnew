<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<% RoomBean[] rooms = RoomManager.getInstance().loadByWhere("");
    HouseunitBean[] units = HouseunitManager.getInstance().loadByWhere("");
    PersonnelBean[] personnelBeans = PersonnelManager.getInstance().loadByWhere("where personneltypeid = 2");
    RoomBean[] roomBeans = RoomManager.getInstance().loadByWhere("ORDER BY ord");
    RoomtypeBean[] roomTypes = RoomtypeManager.getInstance().loadByWhere("ORDER BY ord");
%>
<script type="text/javascript">

    var lastroomtypeId = 0;

    var page = BlockRoomGrid.page;

    $(document).ready(function () {
        loadDefaults();
        drawFooter();
    });

    $(document).on("click", "#dismissbutton, #smallmodalbtn", function () {
        $("#updateremark").css("display", "none");
        $("#remarktxt").val('');
    });

    $(document).on("change", "#compl_work_orders", function () {
        if ($(this).prop("checked")) {
            $(this).val("on");
        } else {
            $(this).val("");
        }
    });

    $("#roomType").on('change', function () {
        var element = $("option:selected", this);
        var id = $(this).val();
        var selected = "";
        if (id > 0) {
            var html = "<option value='0'>-ოთახის #-</option>";
            <% for (int i = 0; i < roomBeans.length; i++) {%>
            var value = "<%=roomBeans[i].getRoomtypeid()%>";
            var roomid = "<%=roomBeans[i].getRoomid()%>";
            if (roomid == lastroomtypeId) {
                selected = 'selected="selected"';
            } else {
                selected = '';
            }
            if (id == value) {
                html +=
                        "<option value='<%=roomBeans[i].getRoomid()%>' roomtypeid='<%=roomBeans[i].getRoomtypeid()%>' " + selected + "><%=roomBeans[i].getName()%>";
                html += "</option>";
            }
            <% } %>
        } else {
            var html = "<option value='0'>-ოთახის #-</option>";
            <% for (int i = 0; i < roomBeans.length; i++) {%>
            html += "<option value='<%=roomBeans[i].getRoomid()%>' roomtypeid='<%=roomBeans[i].getRoomtypeid()%>'><%=roomBeans[i].getName()%>";
            html += "</option>";
            <% }%>
        }
        selected = ""
        lastroomtypeId = 0;
        //console.log(html);
        $("#roomBean").html(html);
        $('#roomBean').selectpicker("refresh");
        $('#roomBean').next().css("width", "100%").css("padding-left", "0px");
        /**/
        /*$('#roomBean').change();*/
    });

    $("#roomBean").on('change', function () {
        var element = $("option:selected", this);
        var id = element.attr("roomtypeid");
        if (id > 0) {
            $("#roomType").val(id);
            lastroomtypeId = element.val();
            $('#roomType').change();
        } else {
            var html = "<option value='0' selected='selected'>-ოთახის ტიპი-</option>";
            <% for (int i = 0; i < roomTypes.length; i++) { %>
            html += "<option value='<%=roomTypes[i].getRoomtypeid()%>'><%=roomTypes[i].getName()%></option>";
            <% } %>
            $("#roomType").html(html);
            $('#roomType').selectpicker("refresh");
            $('#roomType').next().css("width", "100%").css("padding-left", "0px");

            var rooms = "<option value='0'>-ოთახის #-</option>";
            <% for (int i = 0; i < roomBeans.length; i++) {%>
            rooms += "<option value='<%=roomBeans[i].getRoomid()%>' roomtypeid='<%=roomBeans[i].getRoomtypeid()%>'><%=roomBeans[i].getName()%>";
            rooms += "</option>";
            <% }%>

            $("#roomBean").html(rooms);
            $('#roomBean').selectpicker("refresh");
            $('#roomBean').next().css("width", "100%").css("padding-left", "0px");
        }
    });

    $("#btnNext").click(function () {
        getNextRecords();
    });

    $("#btnPrev").click(function () {
        getPrevRecords();
    });


    $("#btnBlockMultiple").click(function () {

        newsWindow1('blockunblockmult', 'ოთახის ბლოკირება', "roomid=" + 0);

    });

    $("#btnAddNewWorkOrder").click(function () {

        loader.show();

        $.post("content/addworkorder.jsp", function (result) {

            $(".filter-form1").hide();

            $("#workorder_add").html(result);

            $(".filter-form2").show();

            loader.hide();

        });

    });

    $(document).on("change", "#dpickerfrom", function () {
        var dt = $("#dtfrom").val();
        var dtto = $("#dtto").val();

        var pattern = /(\d{2})\.(\d{2})\.(\d{4})/;
        dt = new Date(dt.replace(pattern, '$3-$2-$1'));
        dtto = new Date(dtto.replace(pattern, '$3-$2-$1'));
        var fDate = new Date(dt);
        var lDate = new Date(dtto);
        if (fDate > lDate) {
            var currDate = $("#dtfrom").val();
            if (!isNullOrEmpty(currDate)) {
                $("#dpickerto").datepicker(<%=pickerFormatForDatePickers%>);
                $("#dpickerto").datepicker("setStartDate", currDate);
                $("#dtto").val(currDate);
            }
        }
    });

    function doFilter(bool) {
        if (bool) {
            $("#filter-form :input").each(function () {
                $(this).val('');
            });
            //clean dropdowns
            $('#filter-form .dropdown option').removeAttr('selected');
            $("#filter-form .dropdown").val(-1);
            $("#filter-form .dropdown").change();
            $("#unblock").prop("checked", false);
        }
        var url = "content/getblocklist.jsp?" + $("#filter-form").serialize();
        var room = $("option:selected", $("#units"));
        var roomtype = $("option:selected", $("#roomtype"));
        var attr = $(room).attr('roomtypeid');
        if (typeof attr !== typeof undefined && attr !== false) {
            url += "&isroom=" + attr;
        }
        if (typeof roomtype !== typeof undefined && roomtype !== "") {
            url += "&roomtype=" + roomtype.val();
        }
        reloadGrid(BlockRoomGrid.id, url);
    }

    function getNextRecords() {
        page += 1;
        BlockRoomGrid.limit = $("#limitselectbox").val();
        var items_per_page = BlockRoomGrid.limit;
        var offset = (page - 1) * items_per_page;
        var limit = " LIMIT " + items_per_page + " OFFSET " + offset;
        var url = doFilter(true, limit);
        reloadGrid(BlockRoomGrid.id, url);

    }

    function getPrevRecords() {
        page -= 1;
        if (page < 1) {
            page = 1;
            return;
        }
        BlockRoomGrid.limit = $("#limitselectbox").val();
        var items_per_page = BlockRoomGrid.limit;
        var offset = (page - 1) * items_per_page;
        var limit = " LIMIT " + items_per_page + " OFFSET " + offset;
        var url = doFilter(true, limit);
        reloadGrid(BlockRoomGrid.id, url);
    }

    function saveRemark(id) {
        var remark = $("#remarktxt").val();

        if (remark === "null" || remark == "") {
            BootstrapDialog.alert("შეიყვანეთ მინიშნება!!!");
            return;
        }
        var sql = "INSERT INTO workorderlog(" +
                "workorderlogid, workorderid, note, regbyid)" +
                "VALUES (" +
                "(SELECT COALESCE(MAX(workorderlogid) + 1,1) FROM workorderlog)," +
                id + ", " +
                "N'" + remark + "', " +
                "N'<%=user.getLoginid()%>');";
        loader.show();
        $.post("content/execute.jsp?query=" + encodeURIComponent(sql), {}, function () {

            $("#dismissbutton").click();
            $("#remarktxt").val('');
            loader.hide();

        });
    }

    function loadDefaults() {
        AddDays(7)
        initializeGrid(BlockRoomGrid);
        $('#grid-table .date').datepicker(<%=pickerFormatForDatePickers%>);
        $('#grid-table .dropdown').selectpicker();
        $("#grid-table .btn-group").css("width", "100%", "!important");
        $("#grid-table label").each(function () {
            $(this).css("float", "right", "!important");
            $(this).css("line-height", "27px", "!important");
        });
        $("#grid-table input").height($("#grid-table .btn-group").height() - 6, "!important");
        $("#filter-form input[type='text']").css("width", "100%", "!important");
        $("#grid-table .date input[type='text']").css("position", "relative");

    }



    function AddDays(arg, fromDt) {

        $('#dtfrom').datepicker(<%=pickerFormatForDatePickers%>);
        $('#dtto').datepicker(<%=pickerFormatForDatePickers%>);

        var today = new Date(<%=lclosedate%>);
        if (!isNullOrEmpty(fromDt)) {
            today = new Date(fromDt);
        }
        $("#dtfrom").datepicker("setDate", today);
        var tomorrow = new Date(<%=lclosedate%>);
        tomorrow.setDate(today.getDate() + arg);
        $("#dtto").datepicker("setDate", tomorrow);

    }

</script>

<link rel="stylesheet" type="text/css" href="css/grid-filter.css">
<style>
    .truncate {
        width: auto !important;
    }
</style>

<div class="modal-custom-content" id="updateremark" style="position: absolute; z-index: 10; display: none;">
    <div class="modal-custom-header" style="background-color: gray; color: white; height: 30px;">
        <button type="button" id="smallmodalbtn" class="close" data-dismiss="modal" aria-hidden="true"
                style="margin-top: -6px;">×
        </button>
        <h4 style="margin-top: -4px;">შენიშვნა</h4>
    </div>
    <div class="modal-custom-body">
        <textarea id="remarktxt" name="remarktxt"></textarea>
    </div>
    <div class="modal-footer" style="margin-top: 10px;">
        <button type="button" class="btn btn-default" id="dismissbutton" data-dismiss="modal" onclick="this.click();">
            დახურვა
        </button>
        <button type="button" id="saveRemarkBtn" class="btn btn-primary">შენახვა</button>
    </div>
</div>
<form name="filter-form" id="filter-form" class="filter-form1">
    <table id="grid-table" class="first-table" style="width: 100%">
        <tr>
            <td>
                <div id="status_bar" class="first-status-bar" align='center'>
                    <div style="width: 100%; float: left;">
                        <span style="float: left; margin: 7px 0 0 10px;">ძიების კრიტერიუმები</span>
                        <button type="button" class="btn btn-default" id="btnBlockMultiple"
                                style="border: 0; font-weight: bold; float: right; margin: 3px 5px 0 0;">
                            დაბლოკვა
                        </button>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div style="width: 100%;float: left;">
                    <div class="col-md-1">
                        <label>დან</label>
                    </div>
                    <div class="col-md-3">
                        <div class="input-append date" id="dpickerfrom">
                            <input type="text" class="span2 " name="dtfrom" id="dtfrom" placeholder=" თარიღიდან">
                            <span class="add-on"
                                  style="position:absolute !important; right : 4px  !important;background : none  !important;border: none !important;top: 1px;">
                        <i class="glyphicon glyphicon-calendar"></i></span>
                        </div>
                    </div>
                    <div class="col-md-1">
                        <label>მდე</label>
                    </div>
                    <div class="col-md-3">
                        <div class="input-append date" id="dpickerto">
                            <input type="text" class="span2 " name="dtto" id="dtto" placeholder=" თარიღამდე">
                            <span class="add-on"
                                  style="position:absolute !important; right : 4px  !important;background : none  !important;border: none !important;top: 1px;">
                        <i class="glyphicon glyphicon-calendar"></i></span>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <label>ბლოკის მოხსნა</label>
                    </div>
                    <div class="col-md-1">
                        <input type="checkbox" name="unblock" id="unblock">
                    </div>
                    <div class="col-md-4">
                        <button type="button" class="btn btn-danger" style="float:left; width: 80px;"
                                id="search_reserve_filer"
                                onclick="doFilter()"
                                style="width: 69px;">ძებნა
                        </button>
                        <button type="button" class="btn" style="float:left; width: 150px;" id="search_filer"
                                onclick="doFilter(true)"
                                style="width: 69px;">მაჩვენე ყველა
                        </button>
                    </div>
                </div>
                <div style="width: 100%;float: left; margin-top: 4px;">
                    <div class="col-md-1">
                        <label>ოთახი</label>
                    </div>
                    <div class="col-md-3">
                        <select class="dropdown col-md-2" id="roomBean">
                            <option value="0">-ოთახის #-</option>
                            <% for (int i = 0; i < roomBeans.length; i++) { %>
                            <option value="<%=roomBeans[i].getRoomid()%>"
                                    roomtypeid="<%=roomBeans[i].getRoomtypeid()%>"><%=roomBeans[i].getName()%>
                            </option>
                            <% } %>
                        </select>
                    </div>
                    <div class="col-md-1">
                        <label>ტიპი</label>
                    </div>
                    <div class="col-md-3">
                        <select class="dropdown col-md-2" id="roomType">
                            <option value="0">-ოთახის ტიპი-</option>
                            <% for (int i = 0; i < roomTypes.length; i++) { %>
                            <option value="<%=roomTypes[i].getRoomtypeid()%>"><%=roomTypes[i].getName()%>
                            </option>
                            <% } %>
                        </select>
                    </div>

                    <div class="col-md-8">

                    </div>
                </div>
            </td>
        </tr>
    </table>
    <table id="grid-table">
        <tr>
            <td>
                <table id='list_blocklist' class="table-striped table-hover" align='center'></table>
            </td>
        </tr>
    </table>
</form>