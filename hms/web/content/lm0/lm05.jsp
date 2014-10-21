<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%

%>
<script type="text/javascript">
    
    jQuery().ready(function ()
    {
        
        jQuery("#list05").jqGrid(
            {
                url:'content/lm0/getlm05.jsp',
                datatype: "xml",
                colNames:['#','ოთახის სტატუსი','აირჩიეთ ფერი','ფერი'],
                colModel:[
                    {name:'num',index:'num', sortable:false, align:"right", width:60, editable:false, sortable:false},
                    {name:'name',index:'name', sortable:false, align:"left", width:400, editable:true, sortable:true, edittype:"textarea", editoptions:{cols:"40", rows:"3"}},
                    {name:'color',index:'color', sortable:true, align:"center", width:40, hidden:true, editable:true, sortable:true, edittype:"text", editoptions:{ size:"7", maxlength:"7", dataInit : function (elem) { $(elem).miniColors({}); }}, editrules:{edithidden:true}},
                    {name:'colorimg',index:'colorimg', width:80, sortable:false, align:"center", editable:false},
                ],
                rowNum: <%=jq_rownum%>,
                height: <%=jq_height%>,
                width: 600,
                //autowidth: true,
                rowList: <%=jq_rowlist%>,
                pager: jQuery('#pager05'),
                sortname: 'ord',
                viewrecords: true,
                sortorder: "asc",
                editurl:"content/lm0/updlm05.jsp",
                caption:"ოთახის სტატუსის ფერი",
                ondblClickRow: function(id, ri, ci) {
                    
                    return;
                }
            })
            .navGrid('#pager05',{edit:true,add:true,del:true,search:true,view:false},
                        {dataheight:200,width:460,closeAfterEdit:true,reloadAfterSubmit:false,afterSubmit:checkStatus}, //  default settings for edit
                        {dataheight:200,width:460,closeAfterAdd:true,reloadAfterSubmit:true,afterSubmit:checkStatus}, //  default settings for add
                        {reloadAfterSubmit:true,afterSubmit:checkStatus},  // delete instead that del:false we need this
                        {multipleSearch:true}, // search options
                        {dataheight:500,width:460,labelswidth:"68%",closeOnEscape:true} /* view parameters*/
                )
            ;
       
    $(".ui-jqgrid-sortable").css('white-space', 'normal');
    $(".ui-jqgrid-sortable").css('height', 'auto');
    
    });

</script>

<table id="list05" width="100%" align="center"></table>
<div id="pager05"></div>
