<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
String title = "ჯიში";
%>
<script type="text/javascript">
    
    jQuery().ready(function ()
    {
        jQuery("#param1").jqGrid(
            {
                url:'content/getparamlist.jsp?objname=Brade&cols=Bradeid&cols=Name&cols=Code',
                datatype: "xml",
                colNames:['დასახელება','კოდი'],
                colModel:[
                    {name:'name',index:'name', editable:true, align:"left", width:300, edittype:"textarea", editoptions:{cols:"5", rows:"30"}, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']}, editrules: {edithidden:true, required:true}},
                    {name:'code',index:'code', editable:true, align:"left", width:100, edittype:"text", editoptions:{size:"30"}, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']}, editrules: {edithidden:true, required:true}}
                ],
                rowNum:20,
                height: 350,
                width:900,
                autowidth: true,
                rowList:[20,50,100],
                pager: jQuery('#parampager1'),
                sortname: 'name',
                viewrecords: true,
                sortorder: "asc",
                editurl:"content/updparam.jsp",
                caption:"<%=title%>",
                ondblClickRow: function(id, ri, ci) {
                    jQuery("#param1").jqGrid('editGridRow',id,{height:320,width:400,closeAfterEdit:true,reloadAfterSubmit:false,afterSubmit:checkStatus});
                    return;
                }
            })
            .jqGrid('bindKeys')
            .navGrid('#parampager1',{edit:true,add:true,del:true,view:false},
                        {dataheight:320,width:400,closeAfterEdit:true,reloadAfterSubmit:false,afterSubmit:checkStatus}, //  default settings for edit
                        {dataheight:320,width:400,closeAfterAdd:true,reloadAfterSubmit:true,afterSubmit:checkStatus}, //  default settings for add
                        {closeAfterDelete:true,reloadAfterSubmit:true,afterSubmit:checkStatus},  // delete instead that del:false we need this
                        {multipleSearch:true}, // search options
                        {dataheight:320,width:400,labelswidth:"68%",closeOnEscape:true} /* view parameters*/
                )
             ;
    $(".ui-jqgrid-sortable").css('white-space', 'normal');
    $(".ui-jqgrid-sortable").css('height', 'auto');
    });
    
    
</script>

<table id="param1" width="100%" align="center"></table>
<div id="parampager1"></div>
<table id="search" width="100%" align="center"></table>
