<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<%
    WorkorderBean workorderBean = null;
    String wid = (String) request.getParameter("wid");
    if (wid != null) {
        workorderBean = WorkorderManager.getInstance().loadByWhere("where workorderid = " + wid)[0];
    } else {
        workorderBean = WorkorderManager.getInstance().createWorkorderBean();
    }
    RoomBean[] rooms = RoomManager.getInstance().loadByWhere("");
    HouseunitBean[] units = HouseunitManager.getInstance().loadByWhere("");
    PersonnelBean[] personnelBeans = PersonnelManager.getInstance().loadByWhere("where personneltypeid = 2");
    String ordNum = "ახალი";
    if (!CodeHelpers.isNullOrEmpty(workorderBean.getNum())) {
        ordNum = workorderBean.getNum();
    }
%>

<script>
    $(document).ready(function () {
        $('.dropdown').selectpicker();
        $(".work-table .btn-group").css("width", "250px", "!important");
        $(".work-table input").css("height", "27px", "!important").css("margin-left", "4px");
        $("#dt-block-st").css("margin-left", "0");
        $('.work-table .date').datepicker(<%=pickerFormatForDatePickers%>);
        reloadHistory();
        $("#work-descr").val($("#work-descr").val().trim());
        <% if(CodeHelpers.isNullOrEmpty(wid)){ %>
        $("#work-workOrderStatus").val(3);
        $("#work-workOrderStatus").change();
        <% } %>
        <% if(!CodeHelpers.isNullOrEmpty(wid) && workorderBean.getBlockend() == null){ %>
        $("#dt-block-st, #dt-block-end").val('');
        <% } %>
        <% if(!CodeHelpers.isNullOrEmpty(wid) && workorderBean.getDeadline() == null){ %>
        $("#dt-dedline").val('');
        <% } %>
    });

    function cancelSaveWorkorder() {
        $(".filter-form1").show();
        $("#workorder_add").html('');
        $(".filter-form2").hide();
    }

    function reloadHistory() {
        $.post("content/getworkorderhistory.jsp?wid=<%=wid%>", function (data) {
            $("#history-table").html(data);
        });
    }

    function saveWorkOrder() {

        var wid = '<%=wid%>';
        var roomid = "NULL";
        var unitid = "NULL";
        var dtst = $("#dt-block-st").val();
        var dtbend = $("#dt-block-end").val();
        var descr = $("#work-descr").val();
        var cat = $("#work-workOrderCategory").val();
        var prioval = $("#work-workOrderPriority").val();
        var roomval = $("#work-units").val();

        if (isNullOrEmpty(descr)) {
            $("#work-descr").addClass("error");
            return;
        } else {
            $("#work-descr").removeClass("error");
        }

        if (isNullOrEmpty(cat) || cat == "") {
            $("#work-workOrderCategory").next().addClass("error");
            return;
        } else {
            $("#work-workOrderCategory").next().removeClass("error");
        }

        if (isNullOrEmpty(roomval) || roomval == "") {
            $("#work-units").next().addClass("error");
            return;
        } else {
            $("#work-units").next().removeClass("error");
        }

        if (isNullOrEmpty(prioval) || prioval == "") {
            $("#work-workOrderPriority").next().addClass("error");
            return;
        } else {
            $("#work-workOrderPriority").next().removeClass("error");
        }

        if (isNullOrEmpty(dtst) && !isNullOrEmpty(dtbend)) {
            $("#dt-block-st").addClass("error");
            return;
        } else {
            $("#dt-block-st").removeClass("error");
        }

        if (!isNullOrEmpty(dtst) && isNullOrEmpty(dtbend)) {
            $("#dt-block-end").addClass("error");
            return;
        } else {
            $("#dt-block-end").removeClass("error");
        }

        var blocks = "";

        var dts = "";

        if (!isNullOrEmpty(dtst)) {
            dts = "to_date('" + $("#dt-block-st").val() + "','dd.mm.yyyy')," + "to_date('" + $("#dt-block-end").val() + "','dd.mm.yyyy'),";
            blocks = "blockstart, blockend,";

        }

        var dedline = isNullOrEmpty($("#dt-dedline").val()) ? "" : "to_date('" + $("#dt-dedline").val() + "','dd.mm.yyyy'),";

        var dedline_top = isNullOrEmpty($("#dt-dedline").val()) ? "" : "deadline,";

        var workunits = $("#work-units").find('option:selected');

        var wpers = isNullOrEmpty($("#work-personnel").val()) ? "" : $("#work-personnel").val() + ",";

        var wpres_top = isNullOrEmpty($("#work-personnel").val()) ? "" : "assignedtoid,";

        var worderst = isNullOrEmpty($("#work-workOrderStatus").val()) ? "" : $("#work-workOrderStatus").val() + ",";

        var worderst_top = isNullOrEmpty($("#work-workOrderStatus").val()) ? "" : "orderstatus,";

        var room = workunits.attr("room");

        if (!isNullOrEmpty(room)) {
            roomid = $("#work-units").val();
        } else {
            unitid = $("#work-units").val();
        }

        var sql = "INSERT INTO workorder(" +
                "workorderid, num, description, category, roomid, houseunitid," +
                blocks + " priority, " + wpres_top + worderst_top + dedline_top +
                "regbyid)" +
                "VALUES (" +
                "(SELECT COALESCE(MAX(workorderid) + 1,1) FROM workorder)," +
                "(SELECT COALESCE(MAX(workorderid) + 1,1) FROM workorder)," +
                "'" + $("#work-descr").val().trim() + "'," +
                $("#work-workOrderCategory").val() + "," +
                roomid + "," +
                unitid + "," +
                dts +
                $("#work-workOrderPriority").val() + "," +
                wpers +
                worderst +
                dedline + " <%=user.getPersonnelid()%> )";

        if (!isNullOrEmpty(wid.trim()) && wid.trim() != "null") {
            if (!isNullOrEmpty(dtst)) {
                dts = "blockstart = to_date('" + $("#dt-block-st").val() + "','dd.mm.yyyy'), blockend = " + "to_date('" + $("#dt-block-end").val() + "','dd.mm.yyyy'),";
            }
            var pr = isNullOrEmpty($("#work-workOrderPriority").val()) ? "NULL" : $("#work-workOrderPriority").val();
            var pers = isNullOrEmpty($("#work-personnel").val()) ? "NULL" : $("#work-personnel").val();
            var st = isNullOrEmpty($("#work-workOrderStatus").val()) ? "NULL" : $("#work-workOrderStatus").val();
            var ded =  isNullOrEmpty($("#dt-dedline").val()) ? "NULL" : "to_date('" + $("#dt-dedline").val() + "','dd.mm.yyyy')";
            sql = "UPDATE workorder SET description='" + $("#work-descr").val().trim() + "', category=" + $("#work-workOrderCategory").val() + ", roomid=" + roomid + ", " +
            "houseunitid=" + unitid + ", priority=" + pr + ", " +
            "assignedtoid=" + pers + ", " +
            "orderstatus=" + st + ", " +
            dts +
            "deadline=" + ded + ", updatedon=now() " +
            "WHERE workorderid=<%=wid%>;";
        }

        loader.show();

        if (!isNullOrEmpty(dtst)) {
            var select = "select getroomstatusbydate(" + roomid + ",'" + $("#dt-block-st").val() + "','" + $("#dt-block-end").val() + "');";

            loader.show();

            $.post("content/checkifavalforblock.jsp?query=" + select, {}, function (data) {
                if (data.trim() > 1) {
                    BootstrapDialog.alert("არჩეული თარიღებისთვის შეუძლებელია ნომრის დაბლოკვა");
                    loader.hide();
                } else {
                    var reason = 1;
                    $.post("content/saveblockunblock.jsp?arrdt=" + $("#dt-block-st").val() + "&dep=" + $("#dt-block-end").val() + "&roomid=" + roomid + "&reason=" + reason, {}, function (data) {
                        $.post("content/execute.jsp?query=" + encodeURIComponent(sql), {}, function () {
                            var category = $("#work-workOrderCategory  option:selected").text().trim();
                            var priority = $("#work-workOrderPriority  option:selected").text().trim();
                            var personnel = $("#work-personnel  option:selected").text().trim();
                            var status = $("#work-workOrderStatus  option:selected").text().trim();
                            var room = $("#work-units  option:selected").text().trim();

                            sql = "INSERT INTO workorderlog(" +
                            "workorderlogid, workorderid, room, category, priority, assignedto, status, note, regbyid)" +
                            "VALUES (" +
                            "(SELECT COALESCE(MAX(workorderlogid) + 1,1) FROM workorderlog)," +
                            "(SELECT MAX(workorderid) FROM workorder), " +
                            "N'" + room + "', " +
                            "N'" + category + "', " +
                            "N'" + priority + "', " +
                            "N'" + personnel + "', " +
                            "N'" + status + "', " +
                            "N''," +
                            "N'<%=user.getLoginid()%>');";

                            $.post("content/execute.jsp?query=" + encodeURIComponent(sql), {}, function () {
                                reloadGrid(workOrderGrid.id, workOrderGrid.url);
                                reloadHistory();
                                $("#cancelSave").click();
                                loader.hide();
                            });
                        });
                    });
                }
            });
        } else {
            $.post("content/execute.jsp?query=" + encodeURIComponent(sql), {}, function () {
                var category = $("#work-workOrderCategory  option:selected").text();
                var priority = $("#work-workOrderPriority  option:selected").text();
                var personnel = $("#work-personnel  option:selected").text();
                var status = $("#work-workOrderStatus  option:selected").text();
                var room = $("#work-units  option:selected").text().trim();

                sql = "INSERT INTO workorderlog(" +
                "workorderlogid, workorderid, room, category, priority, assignedto, status, note, regbyid)" +
                "VALUES (" +
                "(SELECT COALESCE(MAX(workorderlogid) + 1,1) FROM workorderlog)," +
                "(SELECT MAX(workorderid) FROM workorder), " +
                "N'" + room + "', " +
                "N'" + category + "', " +
                "N'" + priority + "', " +
                "N'" + personnel + "', " +
                "N'" + status + "', " +
                "N''," +
                "N'<%=user.getLoginid()%>');";

                $.post("content/execute.jsp?query=" + encodeURIComponent(sql), {}, function () {
                    reloadGrid(workOrderGrid.id, workOrderGrid.url);
                    reloadHistory();
                    $("#cancelSave").click();
                    loader.hide();
                });
            });
        }

    }
</script>
<style>
    .work-order-add-maindiv {
        width: 100%;
        margin-top: -10px;
    }

    .header-td {
        height: 30px;
        line-height: 30px;
        width: 100%;
        padding: 0 !important;
        background: white;
    }

    .header-td span {
        margin-left: 10px;
        color: #107fdc;
        font-family: BGMtavr;
        font-size: 12px;
    }

    .td2 {
        width: 285px;
        vertical-align: top;
    }

    .footer-td {
        height: 35px;
        line-height: 35px;
        width: 100%;
        background: #fff;
    }

    .work-table td {
        padding: 0 !important;
    }

    .maintable {
        width: 500px;
        margin-left: 10px;
        margin-top: -35px;
    }

    .maintable td {
        border: 0 !important;
        padding: 3px !important;
    }

    textarea {
        width: 200px;
        min-width: 200px;
        max-width: 200px;
        height: 69px;
        min-height: 69px;
        max-height: 69px;
    }
</style>
<div class="work-order-add-maindiv">
    <table style="width: 100%" class="work-table">
        <tr>
            <td style="">
                <table style="width: 100%; height: 472px;" class="work-table">
                    <tr>
                        <td class="header-td">
                            <span>შესასრულებელი სამუშაოს დამატება</span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table class="maintable">
                                <tr>
                                    <td>
                                        <span>ორდ. #</span>
                                    </td>
                                    <td>
                                        <input type="text" name="work-ordernum" id="work-ordernum"
                                               style="background: whitesmoke;" readonly value="<%=ordNum%>"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>განმარტება</span>
                                    </td>
                                    <td>
                                        <textarea id="work-descr" style="margin-left: 4px;"><%=CodeHelpers.ifIsNullOrEmptyReturnEmptryString(workorderBean.getDescription())%></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>კატეგორია</span>
                                    </td>
                                    <td>
                                        <select class="dropdown col-md-2" id="work-workOrderCategory">
                                            <option value="">-კატეგორია-</option>
                                            <% for (int i = 0; i < workOrderCategory.length; i++) {
                                                String selected = "";
                                                if (workorderBean.getCategory() != null && workorderBean.getCategory().equals(i)) {
                                                    selected = "selected";
                                                } else {
                                                    selected = "";
                                                }
                                            %>
                                            <option value="<%=i%>" <%=selected%> ><%=workOrderCategory[i]%>
                                            </option>
                                            <% } %>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>ოთახი</span>
                                    </td>
                                    <td>
                                        <select class="dropdown col-md-2" id="work-units">
                                            <option value="">-ოთახის #-</option>
                                            <% for (int i = 0; i < rooms.length; i++) {

                                                String selected = "";
                                                if (workorderBean.getRoomid() != null && rooms[i].getRoomid().equals(workorderBean.getRoomid())) {
                                                    selected = "selected";
                                                } else {
                                                    selected = "";
                                                }
                                            %>
                                            <option <%=selected%> room="room" value="<%=rooms[i].getRoomid()%>"
                                                                  roomtypeid="<%=rooms[i].getRoomtypeid()%>"><%=rooms[i].getName()%>
                                            </option>
                                            <% } %>
                                            <% for (int i = 0; i < units.length; i++) {

                                                String selected = "";
                                                if (workorderBean.getHouseunitid() != null && units[i].getHouseunitid().equals(workorderBean.getHouseunitid())) {
                                                    selected = "selected";
                                                } else {
                                                    selected = "";
                                                }

                                            %>
                                            <option <%=selected%>
                                                    value="<%=units[i].getHouseunitid()%>"><%=units[i].getName()%>
                                            </option>
                                            <% } %>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>ბლოკის დასაწყისი</span>
                                    </td>
                                    <td>
                                        <% if (workorderBean.getBlockstart() != null) { %>
                                        <span style="margin-left: 5px;"><%=dt.format(workorderBean.getBlockstart()).trim()%></span>
                                        <% } else { %>
                                        <div class="col-md-2">
                                            <div class="input-append date" id="dt-block-st-div">
                                                <input type="text" class="span2 " id="dt-block-st"
                                                       placeholder=" თარიღიდან"
                                                       style="" value="">
                                                    <span class="add-on"
                                                          style="position:absolute !important; right : -104px  !important;background : none  !important;border: none !important;top: 1px;">
                                                        <i class="glyphicon glyphicon-calendar"></i></span>
                                            </div>
                                        </div>
                                        <%} %>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>ბლოკის დასასრული</span>
                                    </td>
                                    <td>
                                        <% if (workorderBean.getBlockend() != null) { %>
                                        <span style="margin-left: 5px;"><%=dt.format(workorderBean.getBlockend()).trim()%></span>
                                        <% } else { %>
                                        <div class="input-append date" id="dt-block-end-div"
                                             style="position: relative;">
                                            <input type="text" class="span2 " id="dt-block-end" placeholder=" თარიღიდან"
                                                   style="" value="">
                                                <span class="add-on"
                                                      style="position:absolute !important; right : 189px  !important;background : none  !important;border: none !important;top: 1px;">
                                                    <i class="glyphicon glyphicon-calendar"></i></span>
                                        </div>
                                        <%} %>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>პრიორიტეტი</span>
                                    </td>
                                    <td>
                                        <select class="dropdown col-md-2" id="work-workOrderPriority">
                                            <option value="">-პრიორიტეტი-</option>
                                            <% for (int i = 0; i < workOrderPriority.length; i++) {
                                                String selected = "";
                                                if (workorderBean.getPriority() != null && workorderBean.getPriority().equals(i)) {
                                                    selected = "selected";
                                                } else {
                                                    selected = "";
                                                }
                                            %>
                                            <option value="<%=i%>" <%=selected%> ><%=workOrderPriority[i]%>
                                            </option>
                                            <% } %>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>მიმაგრებულია</span>
                                    </td>
                                    <td>
                                        <select class="dropdown col-md-2" id="work-personnel">
                                            <option value="">-აირჩიეთ-</option>
                                            <% for (int i = 0; i < personnelBeans.length; i++) {
                                                String selected = "";
                                                if (workorderBean.getAssignedtoid() != null && workorderBean.getAssignedtoid().equals(personnelBeans[i].getPersonnelid())) {
                                                    selected = "selected";
                                                } else {
                                                    selected = "";
                                                }
                                            %>
                                            <option value="<%=personnelBeans[i].getPersonnelid()%>" <%=selected%> ><%=personnelBeans[i].getFname() + " " + personnelBeans[i].getLname()%>
                                            </option>
                                            <% } %>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>სტატუსი</span>
                                    </td>
                                    <td>
                                        <select class="dropdown col-md-2" id="work-workOrderStatus">
                                            <% for (int i = 0; i < workOrderStatus.length; i++) {
                                                String selected = "";
                                                if (workorderBean.getOrderstatus() != null && workorderBean.getOrderstatus().equals(i)) {
                                                    selected = "selected";
                                                } else {
                                                    selected = "";
                                                }
                                            %>
                                            <option value="<%=i%>" <%=selected%> ><%=workOrderStatus[i]%>
                                            </option>
                                            <% } %>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>დედლაინი</span>
                                    </td>
                                    <td>
                                        <div class="input-append date" id="dt-dedline-div" style="position: relative;">
                                            <input type="text" class="span2 " id="dt-dedline" placeholder=" თარიღიდან"
                                                   style=""
                                                   value="<% if(workorderBean.getDeadline() != null) {%> <%=workorderBean.getDeadline()%> <% } %>">
                                                <span class="add-on"
                                                      style="position:absolute !important; right : 189px  !important;background : none  !important;border: none !important;top: 1px;">
                                                    <i class="glyphicon glyphicon-calendar"></i></span>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="footer-td">
                            <button type="button" class="btn btn-default" id="cancelSave"
                                    onclick="cancelSaveWorkorder()"
                                    style="border: 0; font-weight: bold; float: right; margin: 4px 6px 0 0;">
                                დახურვა
                            </button>
                            <button type="button" class="btn btn-danger" id="saveAgent" onclick="saveWorkOrder()"
                                    style="font-weight: bold; float: right; margin: 3px 5px 0 0;">
                                შენახვა
                            </button>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 10px;">
                &nbsp;
            </td>
            <td class="td2">
                <table style="width: 100%; height: 103px;" class="work-table">
                    <tr>
                        <td class="header-td">
                            <span>შემდეგი რეზერვაცია</span>
                        </td>
                    </tr>
                    <tr>
                        <td>

                        </td>
                    </tr>
                </table>
                <br/>
                <table style="width: 100%; height: 103px;" class="work-table">
                    <tr>
                        <td class="header-td">
                            <span>ისტორია</span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div id="history-table" style="  width: 100%;height: 330px;max-height: 287px;overflow-y: auto; padding: 5px;">

                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>