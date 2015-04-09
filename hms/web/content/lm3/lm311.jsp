<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%

%>
<script type="text/javascript">
    jQuery().ready(function ()
    {
        jQuery("#list311").jqGrid(
            {
                url:'content/lm3/getlm311.jsp',
                datatype: "xml",
                colNames:['დასახელება','აირჩიეთ ფერი','ფერი','სტატუსი'],
                colModel:[
                    {name:'name',index:'name', editable:true, sortable:true, align:"left", width:200, edittype:"text", editoptions:{size:"30"}, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']}},
                    {name:'color',index:'color', sortable:true, align:"center", width:40, hidden:true, editable:true, sortable:true, edittype:"text", editoptions:{ size:"7", maxlength:"7", dataInit : function (elem) { $(elem).miniColors({}); }}, editrules:{edithidden:true}},
                    {name:'colorimg',index:'colorimg', width:80, sortable:false, align:"center", editable:false},
                    {name:'approved',index:'approved', editable:true, sortable:true, align:"center", width:50, edittype:"checkbox", editoptions:{value:"კი:არა"}, stype:"select", searchoptions:{sopt:['eq','ne'], value: "true:კი;false:არა"}, editrules:{}}
                ],
                rowNum:<%=jq_rownum%>,
                height: <%=jq_height%>,
                //width:1000,
                autowidth: true,
                rowList:[20,50,100],
                pager: jQuery('#pager311'),
                sortname: 'name',
                viewrecords: true,
                sortorder: "asc",
                editurl:"content/lm3/updlm311.jsp",
                caption:"რეზერვაციის ტიპები"
            })
            .navGrid('#pager311',{edit:true,add:true,del:true,view:false,search:false},
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

<table id="list311" width="100%" align="center"></table>
<div id="pager311"></div>
<table id="search" width="100%" align="center"></table>

    