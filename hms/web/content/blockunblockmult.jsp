<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<%
    RoomBean[] roomBeans = RoomManager.getInstance().loadAll();
%>

<style>

    .datepicker {
        z-index: 100000000 !important;
    }

    .dotted_box {
        border: 1px solid #C8C8C8;
        padding: 7px;
        width: 244px;
    }

    .fieldset {
        float: left;
        margin-bottom: 4px;
        width: 100%;
    }

    .heading {
        background-color: #FFF;
        border-bottom: 1px solid #BEBEBE;
        color: #588903;
        font-family: "BGMtavr";
        font-size: 12px;
        font-weight: bold;
        margin: -4px 0px 7px -5px;
        padding: 6px 5px 5px;
        width: 100%;
    }

    .disp_label2 {
        width: 105px;
    }

    .disp_label1, .disp_label2, .disp_label3, .disp_label4, .disp_label5, .disp_label6, .disp_label7 {
        float: left;
        font-weight: bold;
    }

    .disp_label3 {
        font-weight: normal;
        width: 135px;
    }

    .form_container {
        float: left;
        padding: 7px;
    }
</style>

<script type="text/javascript">

    $(document).ready(function () {
        $('.dropdown').selectpicker();
        $("#curr_table .btn-group").css("width", "143px", "!important");
        $(".currtxt").ForceNumericOnly();
        $("#smbody").next().hide();
        $(".modal-sm").css("width", "580px");
        $('#curr_table .date').datepicker(<%=pickerFormatForDatePickers%>);
        $('#fromdateval, #todateval').val('');
        disableSecondDatePicker();
        addReason();
    });

    $(document).on("change", "#fromdateval", function () {
        var currDate = $(this).val();
        if (!isNullOrEmpty(currDate)) {
            $("#todate").datepicker(<%=pickerFormatForDatePickers%>);
            $("#todate").datepicker("setStartDate", currDate);
            $("#todateval").val(currDate);
        } else {
            $("#todateval").val('');
        }
        disableSecondDatePicker();
    });

    $("#currs").on('change', function () {

    });

    function SaveBlock() {
        var roomids = "";
        $('.checkedrooms').each(function (i, j) {
            if ($(j).prop('checked')) {
                roomids += $(j).attr('id') + ",";
            }
        });
        if(!isNullOrEmpty(roomids)){
            roomids = roomids.substring(0, roomids.trim().lastIndexOf(","));
            var select = "select SUM(1) from roomst where roomid IN ("+roomids+") " +
                    "and to_date('" + $("#fromdateval").val() + "','dd.mm.yyyy') <= statusdate::date AND " +
                    "statusdate::date <= to_date('" + $("#todateval").val() + "','dd.mm.yyyy') AND st NOT IN (7,8);"
            loader.show();
            $.post("content/checkifavalforblock.jsp?query=" + select, {}, function (data) {
                if (data.trim() > 0) {
                    BootstrapDialog.alert("არჩეული თარიღებისთვის შეუძლებელია მონიშნული ნომრების დაბლოკვა!!!");
                } else {
                    var arrdt = $("#fromdateval").val();
                    var dep = $("#todateval").val();
                    var reason = $("#reasondrop").val();
                    if (isNullOrEmpty(dep) || isNullOrEmpty(arrdt) || isNullOrEmpty(reason) || reason === "0" || reason == 0) {
                        BootstrapDialog.alert("შეავსეთ ყველა ველი!!!");
                        return;
                    }
                    $.post("content/saveblockunblock.jsp?arrdt=" + arrdt + "&dep=" + dep + "&roomid=" + roomids + "&reason=" + reason, {}, function (data) {
                        reloadGrid(hsGrid.id, hsGrid.url);
                        $(".closepref").click();
                    });
                }
                loader.hide();
            });
        }else{
            BootstrapDialog.alert("გთხოვთ მონიშნოთ მინიმუმ 1 ოთახი!!!");
        }
    }

    function disableSecondDatePicker() {
        var fcValue = $("#fromdateval").val();
        if (isNullOrEmpty(fcValue)) {
            $("#todate .glyphicon-calendar").css("display", "none");
            $("#todateval").prop("disabled", true);
        } else {
            $("#todateval").prop("disabled", false);
            $("#todate .glyphicon-calendar").css("display", "block");
        }
    }

    function toggleReason(_this) {
        $('#reasonblock').toggle();
        if ($('#reasonblock').is(":visible")) {
            $(_this).find("i").removeClass("fa-plus");
            $(_this).find("i").addClass("fa-minus");
        }
        else {
            $(_this).find("i").addClass("fa-plus");
            $(_this).find("i").removeClass("fa-minus");
        }
    }

    function addReason() {
        loader.show();
        var reason = $("#reasontxt").val();
        if (!isNullOrEmpty(reason)) {
            reason = "?reasonid=" + reason;
        }
        $.post("content/getroomreason.jsp" + reason, {}, function (data) {
            $("#reasondrop").html(data);
            $('#reasondrop').selectpicker("refresh");
            $("#curr_table .btn-group").css("width", "143px", "!important");
            $("#reasontxt").val("");
            $('#reasonblock').hide();
            loader.hide();
        });
    }

</script>
<table id="curr_table">
    <tr>
        <td>
            <ul class="form_container">
                <li class="col3" style="width: 280px; float: left;">
                    <div class="fieldset" style="width: 50px;">
                        <span class="label_sm disp_label1">ოთახი</span>
                    </div>
                    <div style="width: 147px; height: 80px;  max-height: 80px;  min-height: 80px;  overflow-y: auto;  border: solid 1px #E0E0E0;  margin-left: 73px;">
                        <table>
                            <% for (int i = 0; i < roomBeans.length; i++) { %>
                            <%="<tr><td><input type='checkbox' id='" + roomBeans[i].getRoomid() + "' class='checkedrooms'></td><td>&nbsp;</td><td>" + roomBeans[i].getName() + "</td></tr>"%>
                            <% } %>
                        </table>
                    </div>
                    <table style="  width: 100%;  border-spacing: 5px;  border-collapse: separate;">
                        <tr>
                            <td>
                                <span class="label_sm disp_label1">დან</span>&nbsp;
                            </td>
                            <td>
                                <div class="input-append date" id="fromdate">
                                    <input type="text" class="span2 " value="" id="fromdateval" placeholder=" თარიღი"
                                           style="height: 27px;">
                                    <span class="add-on"
                                          style="background : none  !important;border: none !important;margin-left: -30px;">
                                        <i class="glyphicon glyphicon-calendar"></i>
                                    </span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span class="label_sm disp_label1">მდე</span>&nbsp;
                            </td>
                            <td>
                                <div class="input-append date" id="todate">
                                    <input type="text" class="span2 " value="" id="todateval" placeholder=" თარიღი"
                                           style="height: 27px;">
                                    <span class="add-on"
                                          style="background : none  !important;border: none !important;margin-left: -30px;">
                                        <i class="glyphicon glyphicon-calendar"></i>
                                    </span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span id="ctl0_popup_lblReason" class="label_sm disp_label1">მიზეზი</span>&nbsp;
                            </td>
                            <td style="position: relative;">
                                <select id="reasondrop" class="dropdown" style="width:96px;">

                                </select>

                                <div style="position: absolute;right: 39px; top: 8px; cursor:pointer;"
                                     onclick="toggleReason(this)"><i class="fa fa-plus"></i></div>
                                <div id="reasonblock" style="display: none;">
                                    <br/>
                                    <textarea id="reasontxt" placeholder="შეიყვანეთ მიზეზი"></textarea><br/><br/>
                                    <button type="button" class="btn btn-default" id="dismissreason"
                                            onclick="$('#reasonblock').hide();">
                                        დახურვა
                                    </button>
                                    <button type="button" class="btn btn-primary" onclick="addReason()">შენახვა</button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span id="ctl0_popup_lblNote" class="label_sm disp_label1">შენიშვნა</span>
                            </td>
                        </tr>
                    </table>
                </li>
                <li class="col1 dotted_box" style="float: left;  width: 259px;">
                    <p class="fieldset">
                    </p>

                    <h1 class="heading">შემდეგი რეზერვაცია</h1>

                    <p></p>

                    <p class="fieldset">
                        <span id="ctl0_popup_lblResNo" class="label_sm disp_label2">რეზ. #</span>
                        <span id="ctl0_popup_lblRes_Val" class="label_display disp_label3">-</span>
                    </p>

                    <p class="fieldset">
                        <span id="ctl0_popup_lblNextGuest" class="label_sm disp_label2">სტუმარი</span>
                        <span id="ctl0_popup_lblGuest_Val" class="label_display disp_label3">-</span>
                    </p>

                    <p class="fieldset">
                        <span id="ctl0_popup_lblNextArrival" class="label_sm disp_label2">მიღება:</span>
                        <span id="ctl0_popup_lblArrival_Val" class="label_display disp_label3">-</span>
                    </p>

                    <p class="fieldset">
                        <span id="ctl0_popup_lblNextDeparture" class="label_sm disp_label2">გაწერა</span>
                        <span id="ctl0_popup_lblDeparture_Val" class="label_display disp_label3">-</span>
                    </p>

                    <p class="fieldset">
                        <span id="ctl0_popup_lblReservationGuarantee" class="label_sm disp_label2">გარანტია</span>
                        <span id="ctl0_popup_lblResGua_Val" class="label_display disp_label3">-</span>
                    </p>
                </li>
            </ul>
        </td>
    </tr>
    <tr>
        <td>
            <div class="modal-footer">
                <button type="button" class="btn btn-default closepref" id="dismissbutton" data-dismiss="modal"
                        onclick="this.click();">
                    დახურვა
                </button>
                <button type="button" class="btn btn-primary" onclick="SaveBlock()">შენახვა</button>
            </div>
        </td>
    </tr>
</table>
