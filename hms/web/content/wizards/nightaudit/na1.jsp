<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../../includes/init.jsp"%>
<%

%>
<script>
    $(document).ready(function() {
       
    $("#nopendingreservations").hide();
    $("#pendingreservationstbl").hide();
    
    jQuery('#pendingreservations').jqGrid(
    {
        url:'content/wizards/nightaudit/content/getna1.jsp',
        datatype: 'xml',
        colNames:['რეზ. #', 'სტუმარი', 'ოთახი', 'ტარიფი', 'რეზ. ტიპი', 'წყარო','წასვლა','სულ','დეპოზიტი','მოქმედება'],
        colModel:[
            {width: 80, hidden:false, name:'reservationid', index:'reservationid', align:'left'},
            {width: 140, hidden:false, name:'guest', index:'guest', align:'left'},
            {width: 80, hidden:false, name:'room', index:'room', align:'right'},
            {width: 100, hidden:false, name:'rate', index:'rate', align:'right'},
            {width: 140, hidden:false, name:'reservationtype', index:'reservationtype', align:'right'},
            {width: 100, hidden:false, name:'bsource', index:'bsource', align:'right'},
            {width: 100, hidden:false, name:'departure', index:'departure', align:'right'},
            {width: 100, hidden:false, name:'total', index:'total', align:'right'},
            {width: 100, hidden:false, name:'deposit', index:'deposit', align:'right'},
            {width: 140, hidden:false, name:'action', index:'action', align:'right'}
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
            var rows = $("#pendingreservations").getGridParam("reccount"); 
            if(rows > 0){
                $("#nopendingreservations").hide();
                $("#pendingreservationstbl").show();
            } else {
                $("#nopendingreservations").show();
                $("#pendingreservationstbl").hide();
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
   
        $("#jqgh_pendingreservations_reservationid").css('text-align', 'left');
        $("#jqgh_pendingreservations_guest").css('text-align', 'left');
        $("#jqgh_pendingreservations_room").css('text-align', 'right');
        $("#jqgh_pendingreservations_rate").css('text-align', 'right');
        $("#jqgh_pendingreservations_reservationtype").css('text-align', 'right');
        $("#jqgh_pendingreservations_bsource").css('text-align', 'right');
        $("#jqgh_pendingreservations_departure").css('text-align', 'right');
        $("#jqgh_pendingreservations_total").css('text-align', 'right');
        $("#jqgh_pendingreservations_deposit").css('text-align', 'right');
        $("#jqgh_pendingreservations_action").css('text-align', 'right');
        
    });
</script>
<style>
.ui-jqgrid .ui-jqgrid-bdiv {
    position: absolute;
    padding-left: 12px !important;
    margin: 0em;
    padding: 0px;
    overflow: auto;
    text-align: left;
}
</style>
<div id="nopendingreservations" style="color: red;">მიმდინარე თარიღისთვის არ არსებობს დაუსრულებელი რეზერვაცია</div>
<div style="position: relative; margin-left: 210px;" id="pendingreservationstbl">
    <table id="pendingreservations" width='100%' align='center' style="" class="" ></table>
</div>
