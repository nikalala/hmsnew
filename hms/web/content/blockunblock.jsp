<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<%
    request.setCharacterEncoding("UTF-8");
    String param = (String) request.getParameter("roomid");
    String roomid = "";
    if (!CodeHelpers.isNullOrEmpty(param)) {
        roomid = param;
    }
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
    });

    $("#currs").on('change', function () {

    });
    addReason();
    function addReason() {
        loader.show();
        var reason = $("#reasontxt").val();
        if(!isNullOrEmpty(reason)){ reason = "?reasonid="+reason;  }
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
                    <div class="fieldset">
                        <span class="label_sm disp_label1">ოთახი</span>
                        <span class="label_display">&nbsp;-&nbsp;</span>
                        <span class="label_display"><%=roomid%></span>
                    </div>
                    <table style="  width: 100%;  border-spacing: 5px;  border-collapse: separate;">
                        <tr>
                            <td>
                                <span class="label_sm disp_label1">დან</span>&nbsp;
                            </td>
                            <td>
                                <div class="input-append date" id="fromdate">
                                    <input type="text" class="span2 " value="" id="fromdateval" placeholder=" თარიღი" style="height: 27px;">
                                    <span class="add-on" style="background : none  !important;border: none !important;margin-left: -30px;">
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
                                    <input type="text" class="span2 " value="" id="todateval" placeholder=" თარიღი" style="height: 27px;">
                                    <span class="add-on" style="background : none  !important;border: none !important;margin-left: -30px;">
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
                                <div style="position: absolute;right: 39px; top: 8px; cursor:pointer;" onclick="$('#reasonblock').show();"><i class="fa fa-plus"></i></div>
                                <div id="reasonblock" style="display: none;">
                                    <br />
                                    <textarea id="reasontxt" placeholder="შეიყვანეთ მიზეზი"></textarea><br /><br />
                                    <button type="button" class="btn btn-default" id="dismissreason" onclick="$('#reasonblock').hide();">
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
                <button type="button" class="btn btn-default" id="dismissbutton" data-dismiss="modal"
                        onclick="this.click();">
                    დახურვა
                </button>
                <button type="button" class="btn btn-primary" onclick="SaveCurr()">შენახვა</button>
            </div>
        </td>
    </tr>
</table>
