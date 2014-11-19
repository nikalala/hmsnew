<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../../includes/init.jsp"%>
<%
Date cldate = dt.parse(request.getParameter("cldate"));

ReservationBean[] ress1 = ReservationManager.getInstance().loadByWhere("where arraivaldate::date = to_date('"+df.format(cldate)+"','DD/MM/YYYY')");

%>
<script>
    $(document).ready(function() {
       
        
    jQuery('#postcharges').jqGrid(
    {
        url:'wizards/nightaudit/content/getpostcharges.jsp',
        datatype: 'xml',
        colNames:['ოთახი', 'სტუმარი', 'ფოლიო', 'აღწერა', 'მოცულობა', 'Net'],
        colModel:[
            {width: 120, hidden:false, name:'room', index:'room', align:'left'},
            {width: 140, hidden:false, name:'guest', index:'guest', align:'left'},
            {width: 120, hidden:false, name:'folio', index:'folio', align:'left'},
            {width: 100, hidden:false, name:'description', index:'description', align:'right'},
            {width: 100, hidden:false, name:'amount', index:'amount', align:'left'},
            {width: 100, hidden:false, name:'net', index:'net', align:'left'},
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
   
        $("#jqgh_postcharges_room").css('text-align', 'left');
        $("#jqgh_postcharges_guest").css('text-align', 'left');
        $("#jqgh_postcharges_folio").css('text-align', 'right');
        $("#jqgh_postcharges_description").css('text-align', 'right');
        $("#jqgh_postcharges_amount").css('text-align', 'right');
        $("#jqgh_postcharges_net").css('text-align', 'right');
        
    });
</script>
<div style="position: relative; margin-left: 210px;">
<table id="postcharges" width='100%' align='center' style=""></table>
</div>
