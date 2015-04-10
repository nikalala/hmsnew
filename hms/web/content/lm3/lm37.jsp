<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%
String rtypes = "";
for(int i=0;i<discounttype.length;i++){
    if(i>0) rtypes += ";";
    rtypes += String.valueOf(i) + ":"+discounttype[i];
}
%>
<script type="text/javascript">
    jQuery().ready(function ()
    {
        jQuery("#list37").jqGrid(
            {
                url:'content/lm3/getlm37.jsp',
                datatype: "xml",
                colNames:['დასახელება','მოკლე სახელი','ტიპი','ღია ფასდაკლება','ოდენობა','თანამცხოვრები','დამ. გადასახადები'],
                colModel:[
                    {name:'name',index:'name', editable:true, sortable:true, align:"left", width:200, edittype:"text", editoptions:{size:"30"}, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']},editrules:{required:true}},
                    {name:'nickname',index:'nickname', editable:true, sortable:true, align:"left", width:200, edittype:"text", editoptions:{size:"30"}, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']},editrules:{required:true}},
                    {name:'discounttype',index:'discounttype', editable:true, sortable:true, align:"left", width:200, edittype:"select", editoptions:{value:"<%=rtypes%>"}, search: false, editrules:{required:true}},
                    {name:'opendiscount',index:'opendiscount', sortable:true, align:"center", width:80, editable:true, sortable:true, edittype:"checkbox", editoptions:{value:"კი:არა"}, search:false},
                    {name:'amount',index:'amount', editable:true, sortable:true, align:"right", width:120, edittype:"text", editoptions:{size:"20"}, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']},editrules:{number:true,required:true}},
                    {name:'sharer',index:'sharer', sortable:true, align:"center", width:80, editable:true, sortable:true, edittype:"checkbox", editoptions:{value:"კი:არა"}, search:false},
                    {name:'extracharge',index:'extracharge', sortable:true, align:"center", width:80, editable:true, sortable:true, edittype:"checkbox", editoptions:{value:"კი:არა"}, search:false}
                ],
                rowNum:20,
                height: 400,
                width:1000,
                autowidth: false,
                rowList:[20,50,100],
                pager: jQuery('#pager37'),
                sortname: 'name',
                viewrecords: true,
                sortorder: "asc",
                editurl:"content/lm3/updlm37.jsp",
                caption:"ფასდაკლება"
            })
            .navGrid('#pager37',{edit:true,add:true,del:true,view:false,search:false},
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

<table id="list37" width="100%" align="center"></table>
<div id="pager37"></div>
<table id="search" width="100%" align="center"></table>

    