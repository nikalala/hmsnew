<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../../includes/init.jsp"%>
<%

%>
<script>
    $(document).ready(function() {
       
    $("#norelasereservations").hide();
    $("#relasereservationstbl").hide();
        
    jQuery('#relasereservations').jqGrid(
    {
        url:'content/wizards/nightaudit/content/getna2.jsp',
        datatype: 'xml',
        colNames:['რეზ. #', 'სტუმარი', 'ოთახი', 'ტარიფი', 'რეზ. ტიპი', 'რელიზი', 'წასვლა','სულ','დეპოზიტი','მოქმედება'],
        colModel:[
            {width: 120, hidden:false, name:'reservationid', index:'reservationid', align:'left'},
            {width: 140, hidden:false, name:'guest', index:'guest', align:'left'},
            {width: 120, hidden:false, name:'room', index:'room', align:'left'},
            {width: 100, hidden:false, name:'rate', index:'rate', align:'right'},
            {width: 100, hidden:false, name:'reservationtype', index:'reservationtype', align:'left'},
            {width: 100, hidden:false, name:'relesedate', index:'relesedate', align:'right'},
            {width: 100, hidden:false, name:'departure', index:'departure', align:'left'},
            {width: 100, hidden:false, name:'total', index:'total', align:'left'},
            {width: 100, hidden:false, name:'deposit', index:'deposit', align:'left'},
            {width: 100, hidden:false, name:'action', index:'action', align:'left'}
        ],
        rowNum:2000,
        height: 200,
        width: 960,
        autowidth: false,
        sortname: 'reservationroomid',
        //viewrecords: true,
        sortorder: 'asc',
        altRows: true,
        altclass: 'altrow',
        gridComplete: function() {
            var rows = $("#relasereservations").getGridParam("reccount"); 
            if(rows > 0){
                $("#norelasereservations").hide();
                $("#relasereservationstbl").show();
            } else {
                $("#norelasereservations").show();
                $("#relasereservationstbl").hide();
            }
        }
        //footerrow : true,
        //userDataOnFooter:true
        })
        .jqGrid('bindKeys')
	//.navButtonAdd('#pager1',{caption:'',buttonicon:'ui-icon-circle-plus',onClickButton: function(){ setInsurance(jQuery('#listcurrency').jqGrid('getGridParam','selrow')); },position:'last'})
	;
	$('.ui-jqgrid-sortable').css('white-space', 'normal');
	$('.ui-jqgrid-sortable').css('height', 'auto');
   
        $("#jqgh_relasereservations_reservationid").css('text-align', 'left');
        $("#jqgh_relasereservations_guest").css('text-align', 'left');
        $("#jqgh_relasereservations_room").css('text-align', 'right');
        $("#jqgh_relasereservations_rate").css('text-align', 'right');
        $("#jqgh_relasereservations_reservationtype").css('text-align', 'right');
        $("#jqgh_relasereservations_bsource").css('text-align', 'right');
        $("#jqgh_relasereservations_departure").css('text-align', 'right');
        $("#jqgh_relasereservations_total").css('text-align', 'right');
        $("#jqgh_relasereservations_deposit").css('text-align', 'right');
        $("#jqgh_relasereservations_action").css('text-align', 'right');
        
    });
</script>
<div id="norelasereservations" style="color: red !important;">მიმდინარე თარიღისთვის არ არსებობს დასრულებელი რეზერვაცია</div>
<div style="position: relative; margin-left: 210px;" id="relasereservationstbl">
    
    <table id="relasereservations" width='100%' align='center' style=""></table>
</div>
