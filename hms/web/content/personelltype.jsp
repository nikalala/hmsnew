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
                url:'content/getpersonelltypelist.jsp',
                datatype: "xml",
                colNames:['თანამდებობა','აღწერა','კოდი'],
                colModel:[
                    {name:'name',index:'name', editable:true, align:"left", width:200, edittype:"text", editoptions:{size:"30"}, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']}},
                    {name:'description',index:'description', editable:true, align:"left", width:200, edittype:"textarea", editoptions:{rows:"3",cols:"30"}, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']}},
                    {name:'code',index:'code', editable:true, align:"left", width:50, edittype:"text", editoptions:{size:"8"}, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']}}
                ],
                rowNum:20,
                height: 400,
                width:1000,
                autowidth: false,
                rowList:[20,50,100],
                pager: jQuery('#pager1'),
                sortname: 'name',
                viewrecords: true,
                sortorder: "asc",
                editurl:"content/updpersonelltype.jsp",
                caption:"თანამდებობა",
                ondblClickRow: function(id, ri, ci) {
                    jQuery("#list1").jqGrid('editGridRow',id,{height:150,width:350,closeAfterEdit:true,reloadAfterSubmit:false,afterSubmit:checkStatus});
                    return;
                }
            })
            .jqGrid('bindKeys')
            .navGrid('#pager1',{edit:true,add:true,del:true,view:false},
                        {dataheight:150,width:350,closeAfterEdit:true,reloadAfterSubmit:false,afterSubmit:checkStatus}, //  default settings for edit
                        {dataheight:150,width:350,closeAfterAdd:true,reloadAfterSubmit:true,afterSubmit:checkStatus}, //  default settings for add
                        {dataheight:150,width:350,reloadAfterSubmit:false,afterSubmit:checkStatus},  // delete instead that del:false we need this
                        {multipleSearch:true}, // search options
                        {dataheight:150,width:350,labelswidth:"68%",closeOnEscape:true} /* view parameters*/
                )
             ;
    $(".ui-jqgrid-sortable").css('white-space', 'normal');
    $(".ui-jqgrid-sortable").css('height', 'auto');
    });
    
</script>

<table id="list1" width="100%" align="center"></table>
<div id="pager1"></div>
<table id="search" width="100%" align="center"></table>
