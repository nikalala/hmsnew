<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<style>

    .ui-jqgrid tr.jqgrow td {
        height: 20px !important;
        line-height: 19px !important;
        white-space: normal !important;
    }

    .reserv_status {
        float: right;
        border-left: solid 1px rgba(207, 207, 207, 0.63);
        line-height: 30px;
        margin: 0 10px 0 10px;
        padding-left: 24px;
        position: relative;
        font-weight: bold;
    }

    .status-box {
        height: 12px;
        width: 12px;
        position: absolute;
        top: 11px;
        left: 5px;
    }

    .ui-jqgrid-htable, #list_reservs {
        /*margin: 0 10px 10px 10px !important;*/
    }

    #status_bar {
        -webkit-box-shadow: 0 3px 3px 2px #292929;
        box-shadow: 0 3px 3px 2px #C4C4C4;
        height: 30px;
        margin: 10px;
    }
    #filter_table td {
        vertical-align: middle;
        text-align: left;
        padding: 2px;
    }
    #filter_table input
    {

        border-radius: 2px !important;

    }
</style>
<script type="text/javascript">
    $(document).ready(function () {
        jQuery('#list_reservs').jqGrid(
                {
                    url: 'content/getreservationlist.jsp',
                    datatype: 'xml',
                    colNames: [
                        'რეზ#',
                        'ჩამოსვლა',
                        'წასვლა',
                        'სტუმრის სახელი',
                        'ოთახი',
                        'წყარო',
                        'კომპანია',
                        'ჯამი',
                        'დეპოზიტი',
                        'მომხმარებელი',
                        'რეზ.ტიპი',
                        ''
                    ],
                    colModel: [
                        {width: 50, hidden: false, name: 'reservationroomid', index: 'reservationroomid', align: 'left'},
                        {width: 60, hidden: false, name: 'arraivaldate', index: 'arraivaldate', align: 'left'},
                        {width: 60, hidden: false, name: 'departuredate', index: 'departuredate', align: 'left'},
                        {width: 120, hidden: false, name: 'guest', index: 'guest', align: 'left'},
                        {width: 90, hidden: false, name: 'roomcode', index: 'roomcode', align: 'center'},
                        {width: 90, hidden: false, name: 'bsourcename', index: 'bsourcename', align: 'left'},
                        {width: 85, hidden: false, name: 'companyname', index: 'companyname', align: 'left'},
                        {width: 60, hidden: false, name: 'price', index: 'price', align: 'right'},
                        {width: 80, hidden: false, name: 'paid', index: 'paid', align: 'right'},
                        {width: 110, hidden: false, name: 'user', index: 'user', align: 'center'},
                        {width: 94, hidden: false, name: 'reservationtype', index: 'reservationtype', align: 'center'},
                        {width: 40, hidden: false, name: 'action', index: 'action', align: 'center'}
                    ],
                    loadComplete: function () {
                        //line below removes the title attr rom last child...
                        $("#list_reservs td:last-child").removeAttr("title");
                    },
                    rowNum: 2000,
                    height: 400,
                    autowidth: true,
                    sortname: 'name',
                    viewrecords: true,
                    sortorder: 'asc'
                }).jqGrid('bindKeys');
        //maincurrency.getCode();
        $("#jqgh_list_reservs_reservationroomid").css("text-align", "left");
        $("#jqgh_list_reservs_arraivaldate").css("text-align", "left");
        $("#jqgh_list_reservs_departuredate").css("text-align", "left");
        $("#jqgh_list_reservs_guest").css("text-align", "left");
        $("#jqgh_list_reservs_roomcode").css("text-align", "center");
        $("#jqgh_list_reservs_bsourcename").css("text-align", "left");
        $("#jqgh_list_reservs_companyname").css("text-align", "left");
        $("#jqgh_list_reservs_price").css("text-align", "right");
        $("#jqgh_list_reservs_paid").css("text-align", "right");
        $("#jqgh_list_reservs_user").css("text-align", "center");
        $("#jqgh_list_reservs_reservationtype").css("text-align", "center");
        $("#jqgh_list_reservs_action").css("text-align", "center");


    });
</script>

<div id="status_bar" width='100%' align='center' style="height: 146px;font-weight: bold;">

    <table width="100%" id="filter_table" style="margin-left: 10px; color: #8A8A8A;">
        <tr>
            <td colspan="8">&nbsp;</td>
        </tr>
        <tr>
            <td><input class="form-control" type="text" id="reservNumb" placeholder=" ქვითრის #"/></td>
            <td rowspan="2" style="vertical-align: bottom; text-align: right;">ოთახი</td>
            <td colspan="2"><input class="form-control" type="text" id="firstlast" placeholder=" სახელი გვარი"/></td>
            <td style="text-align: right;">ჩამოსვლა</td>
            <td><input class="form-control" type="text" id="arrival_dateFrom" placeholder=" თარიღიდან" /></td>
            <td><input class="form-control" type="text" id="reserv_dateTo" placeholder=" თარიღამდე"/></td>
            <td rowspan="4">&nbsp;</td>
            <td>
                <button type="button" class="btn btn-danger" id="search_reserve_filer" style="width: 69px;">ძებნა</button>
            </td>
        </tr>
        <tr>
            <td><input class="form-control" type="text" id="checkNumb" placeholder=" რეზერვაციის #"/></td>
            <td><select name="reserv_type3" class="form-control dropdown" id="roomNumb">
            </select></td>
            <td><select name="reserv_type4" class="form-control dropdown" id="roomType">
            </select></td>
            <td style="text-align: right;">რეზერვაცია</td>
            <td><input class="form-control" type="text"  id="reserv_dateFrom" placeholder=" თარიღიდან"/></td>
            <td>
                <input class="form-control" type="text" id="arrival_dateTo" placeholder=" თარიღამდე"/></td>
            <td>
                <button type="button" class="btn btn-default" id="cancel_reserve_filer" data-dismiss="modal" style="width: 69px;">გაუქმება</button>
            </td>
        </tr>
        <tr>
            <td><input class="form-control" type="text" placeholder=" გაუქმების #"id="cancelNumb"/></td>
            <td style="text-align: right;">წყარო</td>
            <td colspan="2"><input class="form-control" type="text" id="txtSource"/></td>
            <td style="text-align: right;">ტიპი</td>
            <td>
                <select name="reserv_type" class="form-control dropdown" id="reserv_type">
                </select></td>
            <td><select name="reserv_type2" class="form-control dropdown" id="reserv_type2">
            </select></td>
            <td rowspan="2">
                <button type="button" class="btn btn-danger" id="create_group_reserve_filer" style="width: 69px;white-space: normal !important;">ჯგუფის შექმნა</button>
            </td>
        </tr>
        <tr>
            <td colspan="2"><input type="checkbox" name="showMrooms" id="showMrooms"/>
                აჩვენე მიუკუთვნილებელი ნომერი
            </td>
            <td colspan="2"><input type="checkbox" name="showIncomplOrders" id="showIncomplOrders"/>
                აჩვენე ჩავარდნილი/დაუსრულებელი ვებ ჯავშნები
            </td>
            <td colspan="3">&nbsp;</td>
        </tr>
    </table>

</div>

<div id="status_bar" width='100%' align='center'>
    <div class="reserv_status">
        <div class="status-box" style="background-color: red;"></div>
        წაშლილი
    </div>
    <div class="reserv_status">
        <div class="status-box" style="background-color: rgb(236, 13, 174);"></div>
        არ გამოცხადებული
    </div>
    <div class="reserv_status">
        <div class="status-box" style="background-color: rgb(24, 57, 190);"></div>
        გაუქმებული
    </div>
    <div class="reserv_status">
        <div class="status-box" style="background-color: rgb(77, 190, 24);"></div>
        აქტიური
    </div>
</div>

<table id='list_reservs' class="table-striped table-hover" width='100%' align='center'></table>
