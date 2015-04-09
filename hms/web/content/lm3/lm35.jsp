<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%
String rtypes = "";
for(int i=0;i<reasoncategory.length;i++){
    if(i>0) rtypes += ";";
    rtypes += String.valueOf(i) + ":"+reasoncategory[i];
}
%>
<script type="text/javascript">
    jQuery().ready(function ()
    {
        jQuery("#list35").jqGrid(
            {
                url:'content/lm3/getlm35.jsp',
                datatype: "xml",
                colNames:['დასახელება','კატეგორია','სტატუსი'],
                colModel:[
                    {name:'name',index:'name', editable:true, sortable:true, align:"left", width:200, edittype:"text", editoptions:{size:"30"}, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']}},
                    {name:'category',index:'category', editable:true, sortable:true, align:"left", width:200, edittype:"select", editoptions:{value:"<%=rtypes%>"}, search: false, editrules:{required:true}},
                    {name:'status',index:'status', sortable:true, align:"center", width:80, editable:true, sortable:true, edittype:"checkbox", editoptions:{value:"აქტიური:გაუქმებული"}, search:false}
                ],
                rowNum:20,
                height: 400,
                width:1000,
                autowidth: false,
                rowList:[20,50,100],
                pager: jQuery('#pager35'),
                sortname: 'name',
                viewrecords: true,
                sortorder: "asc",
                editurl:"content/lm3/updlm35.jsp",
                caption:"მიზეზები"
            })
            .navGrid('#pager35',{edit:true,add:true,del:true,view:false,search:false},
                        {dataheight:120,width:350,closeAfterEdit:true,reloadAfterSubmit:false,afterSubmit:checkStatus}, //  default settings for edit
                        {dataheight:120,width:350,closeAfterAdd:true,reloadAfterSubmit:true,afterSubmit:checkStatus}, //  default settings for add
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

<table id="list35" width="100%" align="center"></table>
<div id="pager35"></div>
<table id="search" width="100%" align="center"></table>

    