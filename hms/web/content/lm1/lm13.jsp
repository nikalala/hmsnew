<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%

%>
<script type="text/javascript">
    
    jQuery().ready(function ()
    {
        var lastSel = "";
        jQuery("#list13").jqGrid(
            {
                url:'content/lm1/getlm13.jsp',
                datatype: "xml",
                colNames:['N','ოთახის ტიპი','ტარიფის ტიპი','სეზონი','წყარო','ტარიფი','დამატებითი უფროსის ტარიფი','დამატებითი ბავშვის ტარიფი'],
                colModel:[
                    {name:'num',index:'num', sortable:false, align:"right", width:80, editable:false, search:false},
                    {name:'roomtype',index:'roomtype', sortable:true, align:"left", width:200, editable:false, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']}},
                    {name:'tarifftype',index:'tarifftype', sortable:true, align:"left", width:200, editable:false, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']}},
                    {name:'season',index:'season', sortable:true, align:"left", width:200, editable:false, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']}},
                    {name:'sourse',index:'sourse', sortable:true, align:"left", width:200, editable:false, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']}},
                    {name:'amount',index:'amount', sortable:true, align:"right", width:80, editable:true, searchoptions:{sopt:['eq','ne','gt','ge','lt','le']},editrules:{required:true, number:true}},
                    {name:'amountadult',index:'amountadult', sortable:true, align:"right", width:80, editable:true, searchoptions:{sopt:['eq','ne','gt','ge','lt','le']},editrules:{required:true, number:true}},
                    {name:'amountchild',index:'amountchild', sortable:true, align:"right", width:80, editable:true, searchoptions:{sopt:['eq','ne','gt','ge','lt','le']},editrules:{required:true, number:true}}
                ],
                rowNum: 10000,
                height: <%=jq_height%>,
                //width: 600,
                autowidth: true,
                pager: jQuery('#pager13'),
                sortname: 'roomtype',
                viewrecords: true,
                sortorder: "desc",
                footerrow : true,
                userDataOnFooter:true,
                editurl:"content/lm1/updlm13.jsp",
                caption:"ოთახის ტარიფები",
                onSelectRow: function(id){
                    if(id && id!==lastSel){
                        jQuery('#list13').restoreRow(lastSel); 
                        lastSel=id; 
                    }
                    jQuery('#list13').editRow(id, true); 
                },
                ondblClickRow: function(id, ri, ci) {
                    
                    return;
                }
            })
            .navGrid('#pager13',{edit:false,add:false,del:true,search:true,view:false},
                        {dataheight:250,width:460,closeAfterEdit:true,reloadAfterSubmit:false,afterSubmit:checkStatus}, //  default settings for edit
                        {dataheight:250,width:460,closeAfterAdd:true,reloadAfterSubmit:true,afterSubmit:checkStatus}, //  default settings for add
                        {reloadAfterSubmit:true,afterSubmit:checkStatus},  // delete instead that del:false we need this
                        {multipleSearch:true}, // search options
                        {dataheight:300,width:460,labelswidth:"68%",closeOnEscape:true} /* view parameters*/
                )
            ;
       
    $(".ui-jqgrid-sortable").css('white-space', 'normal');
    $(".ui-jqgrid-sortable").css('height', 'auto');
    
    });


</script>

<table id="list13" width="100%" align="center"></table>
<div id="pager13"></div>
<table id="search" width="100%" align="center"></table>
