<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../../includes/init.jsp"%>
<%
Date cldate = dt.parse(request.getParameter("cldate"));

ReservationBean[] ress1 = ReservationManager.getInstance().loadByWhere("where arraivaldate::date = to_date('"+df.format(cldate)+"','DD/MM/YYYY')");

%>
<script>
    $(document).ready(function() {
       
        
    jQuery('#closeday').jqGrid(
    {
        url:'wizards/nightaudit/content/getcloseday.jsp',
        datatype: 'xml',
        colNames:['რეზ. #', 'სტუმარი', 'ოთახი', 'ტარიფი', 'რეზ. ტიპი', 'წყარო','წასვლა','სულ','დეპოზიტი','მოქმედება'],
        colModel:[
            {width: 120, hidden:false, name:'reservationid', index:'reservationid', align:'left'},
            {width: 140, hidden:false, name:'guest', index:'guest', align:'left'},
            {width: 120, hidden:false, name:'room', index:'room', align:'left'},
            {width: 100, hidden:false, name:'rate', index:'rate', align:'right'},
            {width: 100, hidden:false, name:'reservationtype', index:'reservationtype', align:'left'},
            {width: 100, hidden:false, name:'bsource', index:'bsource', align:'left'},
            {width: 100, hidden:false, name:'departure', index:'departure', align:'left'},
            {width: 100, hidden:false, name:'total', index:'total', align:'left'},
            {width: 100, hidden:false, name:'deposit', index:'deposit', align:'left'},
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
   
        $("#jqgh_closeday_reservationid").css('text-align', 'left');
        $("#jqgh_closeday_guest").css('text-align', 'left');
        $("#jqgh_closeday_room").css('text-align', 'right');
        $("#jqgh_closeday_rate").css('text-align', 'right');
        $("#jqgh_closeday_reservationtype").css('text-align', 'right');
        $("#jqgh_closeday_bsource").css('text-align', 'right');
        $("#jqgh_closeday_departure").css('text-align', 'right');
        $("#jqgh_closeday_total").css('text-align', 'right');
        $("#jqgh_closeday_deposit").css('text-align', 'right');
        $("#jqgh_closeday_action").css('text-align', 'right');
        
    });
</script>
<div style="position: relative; margin-left: 210px;">
<table id="closeday" width='100%' align='center' style=""></table>
</div>
