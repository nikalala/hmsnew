<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%
%>
<script type="text/javascript">
    jQuery().ready(function ()
    {
        jQuery("#list31").jqGrid(
            {
                url:'content/lm3/getlm31.jsp',
                datatype: "xml",
                colNames:['დასახელება','კოდი','ძირითადი ვალუტაა'],
                colModel:[
                    {name:'name',index:'name', editable:true, sortable:false, align:"left", width:200, edittype:"text", editoptions:{size:"30"}, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']}},
                    {name:'code',index:'code', editable:true, sortable:false, align:"left", width:10, edittype:"text", editoptions:{size:"30"}, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']}},
                    {name:'basic',index:'basic', editable:true, sortable:true, align:"center", width:50, edittype:"checkbox", editoptions:{value:"კი:არა"}, stype:"select", searchoptions:{sopt:['eq','ne'], value: "true:კი;false:არა"}, editrules:{}}
                ],
                rowNum:20,
                height: 400,
                width:1000,
                autowidth: false,
                rowList:[20,50,100],
                pager: jQuery('#pager31'),
                sortname: 'code',
                viewrecords: true,
                sortorder: "asc",
                editurl:"content/lm3/updlm31.jsp",
                caption:"ვალუტა",
                subGrid: true, 
                subGridRowExpanded: function(subgrid_id, row_id) {
                    var subgrid_table_id, pager_id;
                    subgrid_table_id = subgrid_id+"_t";
                    pager_id = "p_"+subgrid_table_id;
                    $("#"+subgrid_id).html("<table id='"+subgrid_table_id+"' class='scroll' width='100%'></table><div id='"+pager_id+"' class='scroll'></div>");
                    jQuery("#"+subgrid_table_id).jqGrid(
                        {
                            url:"content/getratelist.jsp?currencyid="+row_id,
                            datatype: "xml",
                            colNames: ['თარიღი','კურსი'],
                            colModel: [
                                {name:'ratedate',index:'ratedate', editable:true, sortable:true, align:"center", width:120, edittype:"text", editoptions:{size: 10, maxlength: 10, dataInit: function(element) {$(element).datepicker(<%=pickerformat%>)}}, searchoptions:{attr: { size: 10, maxlengh: 10 }, dataInit: function(element) {$(element).datepicker({dateFormat: 'dd/mm/yy'})}, sopt:['eq','ne','lt','le','gt','ge']}, editrules:{date: true,required:true}, datefmt:'dd/mm/YYYY'},
                                {name:'value',index:'value', editable:true, sortable:true, align:"right", width:100, edittype:"text", editoptions:{size: "10", maxlength: "10"}, searchoptions:{attr: { size: "10", maxlengh: "10" }, sopt:['eq','ne','lt','le','gt','ge']}, editrules:{number: true,required:true}}
                            ],
                            rowNum:10,
                            pager: pager_id,
                            width:800,
                            sortname: 'ratedate',
                            sortorder: "desc",
                            editurl:"content/updrate.jsp?currencyid="+row_id,
                            height: '100%'
                        })
                        ;
                        jQuery("#"+subgrid_table_id).jqGrid('navGrid',"#"+pager_id,{edit:true,add:true,search:true,del:true},
                            {dataheight:100,width:350,closeAfterEdit:true,reloadAfterSubmit:false,afterSubmit:checkStatus}, //  default settings for edit
                            {dataheight:100,width:350,closeAfterAdd:true,reloadAfterSubmit:true,afterSubmit:checkStatus}, //  default settings for add
                            {dataheight:100,width:350,reloadAfterSubmit:false,afterSubmit:checkStatus},  // delete instead that del:false we need this
                            {multipleSearch:true}, // search options
                            {} /* view parameters*/
                        );
                        }
            })
            .navGrid('#pager31',{edit:true,add:true,del:true,view:false,search:false},
                        {dataheight:100,width:350,closeAfterEdit:true,reloadAfterSubmit:false,afterSubmit:checkStatus}, //  default settings for edit
                        {dataheight:100,width:350,closeAfterAdd:true,reloadAfterSubmit:true,afterSubmit:checkStatus}, //  default settings for add
                        {dataheight:100,width:350,reloadAfterSubmit:false,afterSubmit:checkStatus},  // delete instead that del:false we need this
                        {multipleSearch:true}, // search options
                        {dataheight:100,width:350,labelswidth:"68%",closeOnEscape:true} /* view parameters*/
                )
             ;
    $(".ui-jqgrid-sortable").css('white-space', 'normal');
    $(".ui-jqgrid-sortable").css('height', 'auto');
    
//    jQuery("#list1").sortableRows({ update: function(event, ui) { $.post("content/sortmenu.jsp", { neworder: $("#list1").jqGrid("getDataIDs").join(",") }, function(data){ }); } });
    });


</script>

<table id="list31" width="100%" align="center"></table>
<div id="pager31"></div>
<table id="search" width="100%" align="center"></table>

    