<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../../includes/init.jsp"%>
<%
Date cldate = dt.parse(request.getParameter("cldate"));

ReservationBean[] ress1 = ReservationManager.getInstance().loadByWhere("where arraivaldate::date = to_date('"+df.format(cldate)+"','DD/MM/YYYY')");

%>
<script>
    $(document).ready(function() {
       
        
    jQuery('#roomstatus').jqGrid(
    {
        url:'wizards/nightaudit/content/getroomstatus.jsp',
        datatype: 'xml',
        colNames:['ოთახი', 'სტუმარი', 'ჩამოსვლა', 'წასვლა', 'სულ', 'ბალანსი','სტატუსი','მოქმედება'],
        colModel:[
            {width: 120, hidden:false, name:'room', index:'room', align:'left'},
            {width: 140, hidden:false, name:'guest', index:'guest', align:'left'},
            {width: 120, hidden:false, name:'arrival', index:'arrival', align:'left'},
            {width: 100, hidden:false, name:'departure', index:'departure', align:'right'},
            {width: 100, hidden:false, name:'total', index:'total', align:'left'},
            {width: 100, hidden:false, name:'balance', index:'balance', align:'left'},
            {width: 100, hidden:false, name:'status', index:'status', align:'left'},
            {width: 100, hidden:false, name:'action', index:'action', align:'left'}
        ],
        rowNum:2000,
        height: 200,
        width: 960,
        autowidth: false,
        sortname: 'reservationid',
        viewrecords: true,
        sortorder: 'asc',
        altRows: true,
        altclass: 'altrow',
        footerrow : true,
        userDataOnFooter:true
        })
        .jqGrid('bindKeys')
	//.navButtonAdd('#pager1',{caption:'',buttonicon:'ui-icon-circle-plus',onClickButton: function(){ setInsurance(jQuery('#listcurrency').jqGrid('getGridParam','selrow')); },position:'last'})
	;
	$('.ui-jqgrid-sortable').css('white-space', 'normal');
	$('.ui-jqgrid-sortable').css('height', 'auto');
   
        $("#jqgh_roomstatus_room").css('text-align', 'left');
        $("#jqgh_roomstatus_guest").css('text-align', 'left');
        $("#jqgh_roomstatus_arrival").css('text-align', 'right');
        $("#jqgh_roomstatus_departure").css('text-align', 'right');
        $("#jqgh_roomstatus_total").css('text-align', 'right');
        $("#jqgh_roomstatus_balance").css('text-align', 'right');
        $("#jqgh_roomstatus_status").css('text-align', 'right');
        $("#jqgh_roomstatus_action").css('text-align', 'right');
        
    });
</script>
<div style="position: relative; margin-left: 210px;">
<table id="roomstatus" width='100%' align='center' style=""></table>
</div>
