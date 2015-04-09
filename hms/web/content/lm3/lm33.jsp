<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%
%>
<script type="text/javascript">
    jQuery().ready(function ()
    {
        jQuery("#list33").jqGrid(
            {
                url:'content/lm3/getlm33.jsp',
                datatype: "xml",
                colNames:['სახელი','მოკლე სახელი','ტარიფი','ფიქსირებული ფასი','პუბლიკაცია ვებზე','სორტირება'],
                colModel:[
                    {name:'name',index:'name', editable:true, sortable:false, align:"left", width:200, edittype:"text", editoptions:{size:"30"}, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']}},
                    {name:'nickname',index:'nickname', editable:true, sortable:false, align:"left", width:150, edittype:"text", editoptions:{size:"30"}, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']}},
                    {name:'rate',index:'rate', editable:true, sortable:false, align:"right", width:20, edittype:"text", editoptions:{size:"20"}, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']}, editrules:{required: true,number:true}},
                    {name:'fixedprice',index:'fixedprice', editable:true, sortable:true, align:"center", width:50, edittype:"checkbox", editoptions:{value:"კი:არა"}, stype:"select", searchoptions:{sopt:['eq','ne'], value: "true:კი;false:არა"}, editrules:{}},
                    {name:'publish',index:'publish', editable:true, sortable:true, align:"center", width:50, edittype:"checkbox", editoptions:{value:"კი:არა"}, stype:"select", searchoptions:{sopt:['eq','ne'], value: "true:კი;false:არა"}, editrules:{}},
                    {name:'ord',index:'ord', editable:true, sortable:false, align:"right", width:10, edittype:"text", editoptions:{size:"20"}, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']}, editrules:{required: true,integer:true}}
                ],
                rowNum:20,
                height: 400,
                width:1000,
                autowidth: true,
                rowList:[20,50,100],
                pager: jQuery('#pager33'),
                sortname: 'ord',
                viewrecords: true,
                sortorder: "asc",
                editurl:"content/lm3/updlm33.jsp",
                caption:"დამატებითიგადასახადები"
            })
            .navGrid('#pager33',{edit:true,add:true,del:true,view:false,search:false},
                        {dataheight:250,width:350,closeAfterEdit:true,reloadAfterSubmit:false,afterSubmit:checkStatus}, //  default settings for edit
                        {dataheight:250,width:350,closeAfterAdd:true,reloadAfterSubmit:true,afterSubmit:checkStatus}, //  default settings for add
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

<table id="list33" width="100%" align="center"></table>
<div id="pager33"></div>
<table id="search" width="100%" align="center"></table>

    