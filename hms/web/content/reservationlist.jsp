<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<style>

.ui-jqgrid tr.jqgrow td {
    height: 20px !important;
    line-height: 19px !important;
    white-space: normal !important;
}

</style>
<script type="text/javascript">
    $(document).ready(function () {
        jQuery('#list_reservs').jqGrid(
                {
                    url:'content/getreservationlist.jsp',
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
                        {width: 80, hidden: false, name: 'arraivaldate', index: 'arraivaldate', align: 'left'},
                        {width: 65, hidden: false, name: 'departuredate', index: 'departuredate', align: 'left'},
                        {width: 120, hidden: false, name: 'guest', index: 'guest', align: 'left'},
                        {width: 100, hidden: false, name: 'roomcode', index: 'roomcode', align: 'center'},
                        {width: 100, hidden: false, name: 'bsourcename', index: 'bsourcename', align: 'left'},
                        {width: 85, hidden: false, name: 'companyname', index: 'companyname', align: 'left'},
                        {width: 80, hidden: false, name: 'price', index: 'price', align: 'right'},
                        {width: 80, hidden: false, name: 'paid', index: 'paid', align: 'right'},
                        {width: 110, hidden: false, name: 'user', index: 'user', align: 'center'},
                        {width: 94, hidden: false, name: 'reservationtype', index: 'reservationtype', align: 'center'},
                        {width: 60, hidden: false, name: 'action', index: 'action', align: 'center'}
                    ],
                    loadComplete: function() {
                        //line below removes the title attr rom last child...
                        $("#list_reservs td:last-child").removeAttr( "title" );
                    },
                    rowNum: 2000,
                    height: 400,
                    autowidth: true,
                    sortname: 'name',
                    viewrecords: true,
                    sortorder: 'asc'
                }).jqGrid('bindKeys');
        //maincurrency.getCode();
        $("#jqgh_list_reservs_reservationroomid").css("text-align","left");
        $("#jqgh_list_reservs_arraivaldate").css("text-align","left");
        $("#jqgh_list_reservs_departuredate").css("text-align","left");
        $("#jqgh_list_reservs_guest").css("text-align","left");
        $("#jqgh_list_reservs_roomcode").css("text-align","center");
        $("#jqgh_list_reservs_bsourcename").css("text-align","left");
        $("#jqgh_list_reservs_companyname").css("text-align","left");
        $("#jqgh_list_reservs_price").css("text-align","right");
        $("#jqgh_list_reservs_paid").css("text-align","right");
        $("#jqgh_list_reservs_user").css("text-align","center");
        $("#jqgh_list_reservs_reservationtype").css("text-align","center");
        $("#jqgh_list_reservs_action").css("text-align","center");


    });
</script>

<table id='list_reservs' class="table-striped table-hover" width='100%' align='center'></table>
