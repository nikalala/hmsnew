<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%

%>
<script type="text/javascript">
    jQuery().ready(function ()
    {
        jQuery("#list314").jqGrid(
            {
                url:'content/lm3/getlm314.jsp',
                datatype: "xml",
                colNames:['დასახელება','მოკლე დასახელება','სტატუსი'],
                colModel:[
                    {name:'name',index:'name', editable:true, sortable:true, align:"left", width:200, edittype:"text", editoptions:{size:"30"}, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']}},
                    {name:'nickname',index:'nickname', editable:true, sortable:true, align:"left", width:200, edittype:"text", editoptions:{size:"30"}, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']}},
                    {name:'status',index:'status', sortable:true, align:"center", width:80, editable:true, sortable:true, edittype:"checkbox", editoptions:{value:"აქტიური:გაუქმებული"}, search:false}
                ],
                rowNum:20,
                height: 400,
                width:1000,
                autowidth: false,
                rowList:[20,50,100],
                pager: jQuery('#pager314'),
                sortname: 'name',
                viewrecords: true,
                sortorder: "asc",
                editurl:"content/lm3/updlm314.jsp",
                caption:"ბიზნესის წყარო"
            })
            .navGrid('#pager314',{edit:true,add:true,del:true,view:false,search:false},
                        {dataheight:100,width:350,closeAfterEdit:true,reloadAfterSubmit:false,afterSubmit:checkStatus}, //  default settings for edit
                        {dataheight:100,width:350,closeAfterAdd:true,reloadAfterSubmit:true,afterSubmit:checkStatus}, //  default settings for add
                        {reloadAfterSubmit:true,afterSubmit:checkStatus},  // delete instead that del:false we need this
                        {multipleSearch:true}, // search options
                        {dataheight:300,width:350,labelswidth:"68%",closeOnEscape:true} /* view parameters*/
                )
             ;
    $(".ui-jqgrid-sortable").css('white-space', 'normal');
    $(".ui-jqgrid-sortable").css('height', 'auto');
    
//    jQuery("#list1").sortableRows({ update: function(event, ui) { $.post("content/sortmenu.jsp", { neworder: $("#list1").jqGrid("getDataIDs").join(",") }, function(data){ }); } });
    });


</script>

<table id="list314" width="100%" align="center"></table>
<div id="pager314"></div>
<table id="search" width="100%" align="center"></table>

    