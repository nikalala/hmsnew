<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%

%>
<script type="text/javascript">
    
    jQuery().ready(function ()
    {
        jQuery("#list21").jqGrid(
            {
                url:'content/lm2/getlm21.jsp',
                datatype: "xml",
                colNames:['სახელწოდება','შექმნილია','განახლებულია','სტატუსი'],
                colModel:[
                    {name:'name',index:'name', sortable:true, align:"left", width:200, editable:true, sortable:true, edittype:"text", editoptions:{size:"40"}, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']}, editrules:{required:true}},
                    {name:'created',index:'created', sortable:true, align:"left", width:140, editable:false, sortable:true, search:false},
                    {name:'updated',index:'updated', sortable:true, align:"center", width:120, editable:false, sortable:true, search:false},
                    {name:'status',index:'status', sortable:true, align:"center", width:80, editable:true, sortable:true, edittype:"checkbox", editoptions:{value:"აქტიური:გაუქმებული"}, search:false}
                ],
                rowNum: <%=jq_rownum%>,
                height: <%=jq_height%>,
                //width: 600,
                autowidth: true,
                rowList: <%=jq_rowlist%>,
                pager: jQuery('#pager21'),
                sortname: 'name',
                viewrecords: true,
                sortorder: "asc",
                footerrow : true,
                userDataOnFooter:true,
                editurl:"content/lm2/updlm21.jsp",
                caption:"ერთეულები",
                ondblClickRow: function(id, ri, ci) {
                    
                    return;
                }
            })
            .navGrid('#pager21',{edit:true,add:true,del:true,search:true,view:false},
                        {dataheight:150,width:460,closeAfterEdit:true,reloadAfterSubmit:false,afterSubmit:checkStatus}, //  default settings for edit
                        {dataheight:150,width:460,closeAfterAdd:true,reloadAfterSubmit:true,afterSubmit:checkStatus}, //  default settings for add
                        {reloadAfterSubmit:true,afterSubmit:checkStatus},  // delete instead that del:false we need this
                        {multipleSearch:true}, // search options
                        {dataheight:150,width:460,labelswidth:"68%",closeOnEscape:true} /* view parameters*/
                )
            ;
       
    $(".ui-jqgrid-sortable").css('white-space', 'normal');
    $(".ui-jqgrid-sortable").css('height', 'auto');
    
    });


</script>

<table id="list21" width="100%" align="center"></table>
<div id="pager21"></div>
<table id="search" width="100%" align="center"></table>
