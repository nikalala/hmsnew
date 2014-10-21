<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
SimpleDateFormat dt01 = new SimpleDateFormat("dd/MM/yyyy");
String arrdate = request.getParameter("arrdate");
String depdate = request.getParameter("depdate");
int ratetypeid = Integer.parseInt(request.getParameter("ratetypeid"));
int roomtypeid = Integer.parseInt(request.getParameter("roomtypeid"));
int payinforatetype = -1;
if(request.getParameter("payinforatetype") != null && !request.getParameter("payinforatetype").equalsIgnoreCase("undefined"))
    payinforatetype = Integer.parseInt(request.getParameter("payinforatetype"));
long contragentid = 0;
if(request.getParameter("contragentid") != null && !request.getParameter("contragentid").equalsIgnoreCase("undefined"))
    contragentid = Integer.parseInt(request.getParameter("contragentid"));
double manualrate = 0;
if(request.getParameter("manualrate") != null && !request.getParameter("manualrate").equalsIgnoreCase("undefined") && request.getParameter("manualrate").trim().length() > 0)
    manualrate = Double.parseDouble(request.getParameter("manualrate"));
int adult = Integer.parseInt(request.getParameter("adult"));
int child = Integer.parseInt(request.getParameter("child"));

int disctid = 0;
if(request.getParameter("discountid") != null && !request.getParameter("discountid").equalsIgnoreCase("undefined"))
    disctid = Integer.parseInt(request.getParameter("discountid"));
int discplan = -1;
if(request.getParameter("discountplan") != null && !request.getParameter("discountplan").equalsIgnoreCase("undefined"))
    discplan = Integer.parseInt(request.getParameter("discountplan"));
double discnights = 0;
if(request.getParameter("discountnights") != null){
    try{discnights = Double.parseDouble(request.getParameter("discountnights"));}catch(Exception ex){}
}
double discamount = 0;
if(request.getParameter("discount") != null){
    try{discamount = Double.parseDouble(request.getParameter("discount"));}catch(Exception ex){}
}

boolean notax = new Boolean(request.getParameter("tax"));

String url = "arrdate="+dt01.format(dt.parse(arrdate))+
        "&depdate="+dt01.format(dt.parse(depdate))+
        "&ratetypeid="+ratetypeid+
        "&roomtypeid="+roomtypeid+
        "&payinforatetype="+payinforatetype+
        "&contragentid="+contragentid+
        "&manualrate="+manualrate+
        "&adult="+adult+
        "&child="+child+
        "&discountid="+disctid+
        "&discountplan="+discplan+
        "&discountnights="+discnights+
        "&discount="+discamount+
        "&notax="+notax;

%>
<style>
.altrow {
        background-color: #F9F9F9;
    }
.ui-jqgrid tr.ui-row-ltr td {
        border-right-style: none !important;
        border-left-style: none !important;
        border-bottom-color: #DDDDDD !important;
    }
    
    tr.footrow-ltr td {
        border-right-style: none !important;
        border-left-style: none !important;
    }
    
    .ui-jqgrid {
        background-color: #F6F6F6;
    }
</style>
<script>
    $(document).ready(function() {
        $("#mediummodalsave").remove();
        
    jQuery('#ratetable').jqGrid(
    {
        url:'content/getratetable.jsp?<%=url%>',
        datatype: 'xml',
        colNames:['თარიღი', 'ტარიფის ტიპი', 'ფასი გადასახადებამდე', 'გადასახადი', 'ფასდაკლება', 'შესწორება','ნეტო ფასი'],
        colModel:[
            {width: 120, hidden:false, name:'roomdate', index:'roomdate', align:'left'},
            {width: 140, hidden:false, name:'type', index:'type', align:'left'},
            {width: 120, hidden:false, name:'price', index:'price', align:'right'},
            {width: 100, hidden:false, name:'tax', index:'tax', align:'right'},
            {width: 100, hidden:false, name:'discount', index:'discount', align:'right'},
            {width: 100, hidden:false, name:'fix', index:'fix', align:'right'},
            {width: 100, hidden:false, name:'neto', index:'neto', align:'right'}
        ],
        rowNum:2000,
        height: 300,
        autowidth: false,
        sortname: 'roomdate',
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
   
        $("#jqgh_ratetable_roomdate").css('text-align', 'left');
        $("#jqgh_ratetable_type").css('text-align', 'left');
        $("#jqgh_ratetable_price").css('text-align', 'right');
        $("#jqgh_ratetable_tax").css('text-align', 'right');
        $("#jqgh_ratetable_fix").css('text-align', 'right');
        $("#jqgh_ratetable_neto").css('text-align', 'right');
        
    });
</script>
<table id='ratetable' width='100%' align='center'></table>
