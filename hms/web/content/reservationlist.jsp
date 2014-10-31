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
        background: #FFF;
    }
    #filter_table td {
        vertical-align: middle;
        text-align: left;
        padding: 2px;
        font-size: 11px;
    }
    #filter_table input
    {

        border-radius: 2px !important;

    }

    .input-append .add-on:last-child, .input-append .btn:last-child, .input-append .btn-group:last-child > .dropdown-toggle {
        -webkit-border-radius: 0 4px 4px 0;
        -moz-border-radius: 0 4px 4px 0;
        border-radius: 0 4px 4px 0;
    }
    .input-append .add-on, .input-append .btn, .input-append .btn-group {
        margin-left: -1px;
    }
    .input-append .add-on, .input-prepend .add-on, .input-append .btn, .input-prepend .btn, .input-append .btn-group > .dropdown-toggle, .input-prepend .btn-group > .dropdown-toggle {
        vertical-align: top;
        -webkit-border-radius: 0;
        -moz-border-radius: 0;
        border-radius: 0;
    }
    .input-append .add-on, .input-prepend .add-on {
        display: inline-block;
        width: auto;
        height: 26px;
        min-width: 16px;
        padding: 4px 5px;
        font-size: 14px;
        font-weight: normal;
        line-height: 20px;
        text-align: center;
        text-shadow: 0 1px 0 #ffffff;
        background-color: #eeeeee;
        border: 1px solid #ccc;
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

        $('.date').datepicker(<%=pickerformat2%>);
        $('.dropdown').selectpicker();
    });
</script>

<div id="status_bar" width='100%' align='center' style="height: 146px;font-weight: bold;">


    <div class="col-md-16">
        <input class="col-md-2" type="text" id="checkNumb" placeholder=" რეზერვაციის #" />
        <input class="col-md-4" type="text" id="firstlast" placeholder=" სახელი გვარი"/>
        <span class="col-md-2">ჩამოსვლა</span>
        <div class="input-append date col-md-3">
            <input type="text" class="span2 " id="arrival_dateFrom" placeholder=" თარიღიდან" style="float: left;width: 83%;">
            <span class="add-on" style="float: left;"><i class="glyphicon glyphicon-calendar"></i></span>
        </div>
        <div class="input-append date col-md-3">
            <input type="text" class="span2 " id="arrival_dateTo" placeholder=" თარიღამდე" style="float: left;width: 83%;">
            <span class="add-on" style="float: left;"><i class="glyphicon glyphicon-calendar"></i></span>
        </div>
        <button type="button" class="btn btn-danger col-md-2" id="search_reserve_filer" style="width: 69px;">ძებნა</button>
    </div>

    <div class="col-md-16">
        <input class="col-md-2" type="text" id="reservNumb" placeholder=" ქვითრის #" />
        <span class="col-md-1">ოთახი</span>
        <select class="dropdown col-md-2">
            <option>Mustard</option>
            <option>Ketchup</option>
            <option>Relish</option>
            <option>Mustard</option>
            <option>Ketchup</option>
        </select>
        <select class="dropdown col-md-2">
            <option>Mustard</option>
            <option>Ketchup</option>
            <option>Relish</option>
            <option>Mustard</option>
            <option>Ketchup</option>
        </select>
        <span class="col-md-1">რეზერვაცია</span>
        <div class="input-append date col-md-3">
            <input type="text" class="span2 " id="reserv_dateFrom" placeholder=" თარიღიდან">
            <span class="add-on" style="float: left;"><i class="glyphicon glyphicon-calendar"></i></span>
        </div>
        <div class="input-append date col-md-3">
            <input type="text" class="span2" id="reserv_dateTo" placeholder=" თარიღამდე">
            <span class="add-on" style="float: left;"><i class="glyphicon glyphicon-calendar"></i></span>
        </div>
        <button type="button" class="btn btn-default col-md-2" id="cancel_reserve_filer" data-dismiss="modal">გაუქმება</button>
    </div>

    <%--<div class="col-md-16">--%>
        <%--<input class="form-control" type="text" placeholder=" გაუქმების #" id="cancelNumb" />--%>
        <%--<span>წყარო</span>--%>
        <%--<input class="form-control" type="text" id="txtSource"/>--%>
        <%--<span>ტიპი</span>--%>
        <%--<select class="dropdown">--%>
            <%--<option>Mustard</option>--%>
            <%--<option>Ketchup</option>--%>
            <%--<option>Relish</option>--%>
        <%--</select>--%>
        <%--<select class="dropdown">--%>
            <%--<option>Mustard</option>--%>
            <%--<option>Ketchup</option>--%>
            <%--<option>Relish</option>--%>
        <%--</select>--%>
        <%--<button type="button" class="btn btn-danger" id="create_group_reserve_filer" style="white-space: normal !important;">ჯგუფის შექმნა</button>--%>
    <%--</div>--%>







            <%--<input type="checkbox" name="showMrooms" id="showMrooms" style="color: #818181;font-weight: normal;"/>--%>
                <%--აჩვენე მიუკუთვნილებელი ნომერი--%>
            <%--<input type="checkbox" name="showIncomplOrders" id="showIncomplOrders" style="color: #818181;font-weight: normal;"/>--%>
                <%--აჩვენე ჩავარდნილი/დაუსრულებელი ვებ ჯავშნები--%>
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
