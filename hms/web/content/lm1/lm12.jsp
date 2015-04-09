<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%

%>
<script type="text/javascript">
    
    jQuery().ready(function ()
    {
        jQuery("#list12").jqGrid(
            {
                url:'content/lm1/getlm12.jsp',
                datatype: "xml",
                colNames:['მოკლე სახელი','სეზონის სახელი','დასაწყისი','დასასრული','თარიღიდან','თარიღამდე','შექმნილია','განახლებულია','სტატუსი'],
                colModel:[
                    {name:'nickname',index:'nickname', sortable:true, align:"left", width:100, hidden:true, editable:true, sortable:true, edittype:"text", editoptions:{size:"20"}, editrules:{required:true, edithidden:true}, search:false},
                    {name:'name',index:'name', sortable:true, align:"left", width:200, editable:true, sortable:true, edittype:"text", editoptions:{size:"40"}, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']}, editrules:{required:true}},
                    
                    {name:'startdate',index:'startdate', sortable:true, align:"left", width:40, editable:true, sortable:true, edittype:"text", editoptions:{size:"8",dataInit: function(element) {$(element).datepicker(<%=pickerformatmn%>)}}, editrules:{required:true}, search:false},
                    {name:'enddate',index:'enddate', sortable:true, align:"left", width:40, editable:true, sortable:true, edittype:"text", editoptions:{size:"8",dataInit: function(element) {$(element).datepicker(<%=pickerformatmn%>)}}, editrules:{required:true}, search:false},
                    {name:'fromdate',index:'fromdate', sortable:true, align:"left", width:80, editable:true, sortable:true, edittype:"text", editoptions:{size:"8",dataInit: function(element) {$(element).datepicker(<%=pickerformat%>)}}, editrules:{required:true}, search:false},
                    {name:'todate',index:'todate', sortable:true, align:"left", width:80, editable:true, sortable:true, edittype:"text", editoptions:{size:"8",dataInit: function(element) {$(element).datepicker(<%=pickerformat%>)}}, editrules:{required:true}, search:false},
                    
                    {name:'created',index:'created', sortable:true, align:"right", width:140, editable:false, sortable:true, search:false},
                    {name:'updated',index:'updated', sortable:true, align:"right", width:120, editable:false, sortable:true, search:false},
                    {name:'status',index:'status', sortable:true, align:"center", width:80, editable:true, sortable:true, edittype:"checkbox", editoptions:{value:"აქტიური:გაუქმებული"}, search:false}
                ],
                rowNum: <%=jq_rownum%>,
                height: <%=jq_height%>,
                //width: 600,
                autowidth: true,
                rowList: <%=jq_rowlist%>,
                pager: jQuery('#pager12'),
                sortname: 'nickname',
                viewrecords: true,
                sortorder: "desc",
                footerrow : true,
                userDataOnFooter:true,
                editurl:"content/lm1/updlm12.jsp",
                caption:"სეზონები",
                ondblClickRow: function(id, ri, ci) {
                    
                    return;
                }
            })
            .navGrid('#pager12',{edit:true,add:true,del:true,search:true,view:false},
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

<table id="list12" width="100%" align="center"></table>
<div id="pager12"></div>
<table id="search" width="100%" align="center"></table>
