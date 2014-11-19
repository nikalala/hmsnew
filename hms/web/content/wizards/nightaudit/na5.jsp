<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../../includes/init.jsp"%>
<%

%>
<script>
    $(document).ready(function() {
       
    $("#nopostcharges").hide();
    $("#postchargestbl").hide();
        
    jQuery('#postcharges').jqGrid(
    {
        url:'content/wizards/nightaudit/content/getna4.jsp',
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
        sortname: 'folioitemid',
        //viewrecords: true,
        sortorder: 'asc',
        altRows: true,
        altclass: 'altrow',
        multiple: true,
        //footerrow : true,
        //userDataOnFooter:true,
        gridComplete: function() {
            var rows = $("#postcharges").getGridParam("reccount"); 
            if(rows > 0){
                $("#nopostcharges").hide();
                $("#postchargestbl").show();
            } else {
                $("#nopostcharges").show();
                $("#postchargestbl").hide();
            }
        }
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
<div id="nopostcharges" style="color: red;">მიმდინარე თარიღისთვის არ არსებობს დაუსრულებელი რეზერვაცია</div>
<div style="position: relative; margin-left: 210px;" id="postchargestbl">
<table id="postcharges" width='100%' align='center' style=""></table>
</div>
