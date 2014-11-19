<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../../includes/init.jsp"%>
<%

%>
<script>
    $(document).ready(function() {
       
    //$("#nounsettledfolio").hide();
    $("#unsettledfoliotbl").hide();
        
    jQuery('#unsettledfolio').jqGrid(
    {
        url:'content/wizards/nightaudit/content/getna4.jsp',
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
        //viewrecords: true,
        sortorder: 'asc',
        altRows: true,
        altclass: 'altrow',
        //footerrow : true,
        //userDataOnFooter:true,
        gridComplete: function() {
            //var rows = $("#roomstatus").getGridParam("reccount"); 
            //if(rows > 0){
            //    $("#nounsettledfolio").hide();
            //    $("#unsettledfoliotbl").show();
            //} else {
            //    $("#nounsettledfolio").show();
            //    $("#unsettledfoliotbl").hide();
            //}
        }
        })
        .jqGrid('bindKeys')
	//.navButtonAdd('#pager1',{caption:'',buttonicon:'ui-icon-circle-plus',onClickButton: function(){ setInsurance(jQuery('#listcurrency').jqGrid('getGridParam','selrow')); },position:'last'})
	;
	$('.ui-jqgrid-sortable').css('white-space', 'normal');
	$('.ui-jqgrid-sortable').css('height', 'auto');
   
        $("#jqgh_unsettledfolio_reservationid").css('text-align', 'left');
        $("#jqgh_unsettledfolio_guest").css('text-align', 'left');
        $("#jqgh_unsettledfolio_room").css('text-align', 'right');
        $("#jqgh_unsettledfolio_rate").css('text-align', 'right');
        $("#jqgh_unsettledfolio_reservationtype").css('text-align', 'right');
        $("#jqgh_unsettledfolio_bsource").css('text-align', 'right');
        $("#jqgh_unsettledfolio_departure").css('text-align', 'right');
        $("#jqgh_unsettledfolio_total").css('text-align', 'right');
        $("#jqgh_unsettledfolio_deposit").css('text-align', 'right');
        $("#jqgh_unsettledfolio_action").css('text-align', 'right');
        
    });
</script>
<div style="color: red;" id="nounsettledfolio">მიმდინარე თარიღისთვის არ არსებობს დაურეგულირებელი ფოლიო</div>
<div style="position: relative; margin-left: 210px;" id="unsettledfoliotbl">
    <table id="unsettledfolio" width='100%' align='center' style=""></table>
</div>
