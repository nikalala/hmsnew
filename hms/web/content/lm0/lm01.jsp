<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%
String atypes = "<select>";
String atypese = "";
for(int i=0;i<amenitytypes.length;i++){
    atypes += "<option value=\""+i+"\">"+amenitytypes[i]+"</option>";
    if(i>0) atypese += ";";
    atypese += i+":"+amenitytypes[i];
}
atypes += "</select>";
%>
<script type="text/javascript">
    getATypes = function()
    {
        return '<%=atypes%>';
    }
    
    jQuery().ready(function ()
    {
        jQuery("#list01").jqGrid(
            {
                url:'content/lm0/getlm01.jsp',
                datatype: "xml",
                colNames:['სახელწოდება','ტიპი','სორტირება','შექმნილია','განახლებულია','სტატუსი'],
                colModel:[
                    {name:'name',index:'name', sortable:true, align:"left", width:200, editable:true, sortable:true, edittype:"text", editoptions:{size:"40"}, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']}, editrules:{required:true}},
                    {name:'type',index:'type', sortable:true, align:"center", width:120, editable:true, sortable:true, edittype:"select", editoptions:{value:"<%=atypese%>"}, searchoptions:{buildSelect:getATypes,sopt:['eq','ne']}, editrules:{required:true,integer:true}},
                    {name:'ord',index:'ord', sortable:true, align:"right", width:80, editable:true, sortable:true, edittype:"text", editoptions:{size:"5"}, search:false, editrules:{required:true}},
                    {name:'created',index:'created', sortable:true, align:"left", width:140, editable:false, sortable:true, search:false},
                    {name:'updated',index:'updated', sortable:true, align:"center", width:120, editable:false, sortable:true, search:false},
                    {name:'status',index:'status', sortable:true, align:"center", width:80, editable:true, sortable:true, edittype:"checkbox", editoptions:{value:"აქტიური:გაუქმებული"}, search:false}
                ],
                rowNum: <%=jq_rownum%>,
                height: <%=jq_height%>,
                //width: 600,
                autowidth: true,
                rowList: <%=jq_rowlist%>,
                pager: jQuery('#pager01'),
                sortname: 'ord',
                viewrecords: true,
                sortorder: "desc",
                footerrow : true,
                userDataOnFooter:true,
                editurl:"content/lm0/updlm01.jsp",
                caption:"კეთილმოწყობები",
                ondblClickRow: function(id, ri, ci) {
                    
                    return;
                }
            })
            .navGrid('#pager01',{edit:true,add:true,del:true,search:true,view:false},
                        {dataheight:150,width:460,closeAfterEdit:true,reloadAfterSubmit:false,afterSubmit:checkStatus}, //  default settings for edit
                        {dataheight:150,width:460,closeAfterAdd:true,reloadAfterSubmit:true,afterSubmit:checkStatus}, //  default settings for add
                        {reloadAfterSubmit:true,afterSubmit:checkStatus},  // delete instead that del:false we need this
                        {multipleSearch:true}, // search options
                        {dataheight:200,width:460,labelswidth:"68%",closeOnEscape:true} /* view parameters*/
                )
            ;
       
    $(".ui-jqgrid-sortable").css('white-space', 'normal');
    $(".ui-jqgrid-sortable").css('height', 'auto');
    
    });


</script>

<table id="list01" width="100%" align="center"></table>
<div id="pager01"></div>
<table id="search" width="100%" align="center"></table>
