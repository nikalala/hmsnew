<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%

%>
<script type="text/javascript">
    jQuery().ready(function ()
    {
        jQuery("#list1").jqGrid(
            {
                url:'content/getmenulist.jsp',
                datatype: "xml",
                treeGridModel: 'adjacency',
                treeGrid: true,
                ExpandColumn : 'name',
                colNames:['id','სახელი','ფაილი','#','ჯგუფი'],
                colModel:[
                    {name:'id',index:'id', width:1,hidden:true,key:true},
                    {name:'name',index:'name', editable:true, sortable:false, align:"left", width:200, edittype:"text", editoptions:{size:"30"}},
                    {name:'file',index:'file', editable:true, sortable:false, align:"left", width:200, edittype:"text", editoptions:{size:"30"}},
                    {name:'ord',index:'ord', editable:true, sortable:false, align:"left", width:20, edittype:"text", editoptions:{size:"30"}, editrules: {required:true,integer:true}},
                    {name:'parentid',index:'parentid',hidden:true, editable:true, sortable:false, width:200, edittype:"select", editoptions:{dataUrl:"content/getmenulistselect.jsp"}, editrules: {edithidden:true}}
                ],
                rowNum:20,
                height: 400,
                width:1000,
                autowidth: true,
                rowList:[20,50,100],
                pager: jQuery('#pager1'),
                sortname: 'ord',
                viewrecords: true,
                sortorder: "asc",
                editurl:"content/updmenu.jsp",
                caption:"მენიუ",
                ondblClickRow: function(id, ri, ci) {
                    jQuery("#list1").jqGrid('editGridRow',id,{height:250,width:350,closeAfterEdit:true,reloadAfterSubmit:false,afterSubmit:checkStatus});
                    return;
                }
            })
            .jqGrid('bindKeys')
            .sortableRows({ update: function(event, ui) { $.post("content/sortmenu.jsp", { neworder: $("#list1").jqGrid("getDataIDs").join(",") }, function(data){ }); } })
            .navGrid('#pager1',{edit:true,add:true,del:true,view:false,search:false},
                        {dataheight:250,width:450,closeAfterEdit:true,reloadAfterSubmit:true,afterSubmit:checkStatus},
                        {dataheight:250,width:450,closeAfterAdd:true,reloadAfterSubmit:true,afterSubmit:checkStatus},
                        {dataheight:250,width:450,reloadAfterSubmit:true,afterSubmit:checkStatus},
                        {multipleSearch:true},
                        {dataheight:250,width:450,labelswidth:"68%",closeOnEscape:true} /* view parameters*/
                )
             ;
    $(".ui-jqgrid-sortable").css('white-space', 'normal');
    $(".ui-jqgrid-sortable").css('height', 'auto');
    
    });

</script>

<table id="list1" width="100%" align="center"></table>
<div id="pager1"></div>
<table id="search" width="100%" align="center"></table>

    
