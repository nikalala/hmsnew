<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%
TemplatecategoryBean[] cats = TemplatecategoryManager.getInstance().loadByWhere("order by name");
String rtypes = "";
for(int i=0;i<cats.length;i++){
    if(i>0) rtypes += ";";
    rtypes += cats[i].getTemplatecategoryid() + ":"+cats[i].getName();
}
%>
<script type="text/javascript">
    
    function editContent(id)
    {
    if(id > 0)
        {
            var title = "შაბლონის შინაარსი";
            popupwin("content/editor.jsp?id="+id, title, "scrollbars=yes,resizable=yes,modal=yes,width=800,height=500,left=40,top=40");
        }
    }
    
    jQuery().ready(function ()
    {
        jQuery("#list39").jqGrid(
            {
                url:'content/lm3/getlm39.jsp',
                datatype: "xml",
                colNames:['დასახელება','კატეგორია','შექმნილია','განახლებულია','შენიშვნა','სტატუსი'],
                colModel:[
                    {name:'name',index:'name', editable:true, sortable:true, align:"left", width:200, edittype:"text", editoptions:{size:"30"}, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']}},
                    {name:'templatecategoryid',index:'templatecategoryid', editable:true, sortable:true, align:"left", width:200, edittype:"select", editoptions:{value:"<%=rtypes%>"}, search: false, editrules:{required:true}},
                    {name:'created',index:'created', sortable:true, align:"left", width:140, editable:false, sortable:true, search:false},
                    {name:'updated',index:'updated', sortable:true, align:"center", width:120, editable:false, sortable:true, search:false},
                    {name:'note',index:'note', editable:true, sortable:true, align:"left", width:200, edittype:"textarea", editoptions:{cols:"40",rows:"3"}, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']}},
                    {name:'status',index:'status', sortable:true, align:"center", width:80, editable:true, sortable:true, edittype:"checkbox", editoptions:{value:"აქტიური:გაუქმებული"}, search:false}
                ],
                rowNum: <%=jq_rownum%>,
                height: <%=jq_height%>,
                //width:1000,
                autowidth: true,
                rowList: <%=jq_rowlist%>,
                pager: jQuery('#pager39'),
                sortname: 'name',
                viewrecords: true,
                sortorder: "asc",
                editurl:"content/lm3/updlm39.jsp",
                caption:"მიზეზები"
            })
            .navGrid('#pager39',{edit:true,add:true,del:true,view:false,search:false},
                        {dataheight:300,width:400,closeAfterEdit:true,reloadAfterSubmit:false,afterSubmit:checkStatus}, //  default settings for edit
                        {dataheight:300,width:400,closeAfterAdd:true,reloadAfterSubmit:true,afterSubmit:checkStatus}, //  default settings for add
                        {reloadAfterSubmit:true,afterSubmit:checkStatus},  // delete instead that del:false we need this
                        {multipleSearch:true}, // search options
                        {dataheight:300,width:400,labelswidth:"68%",closeOnEscape:true} /* view parameters*/
                )
            .navButtonAdd('#pager39',{
               caption:"შინაარსი",
               buttonicon:"ui-icon-document",
               onClickButton: function(){
                   editContent(jQuery('#list39').jqGrid('getGridParam','selrow'));
               },
               position:"last"}
               )
             ;
    $(".ui-jqgrid-sortable").css('white-space', 'normal');
    $(".ui-jqgrid-sortable").css('height', 'auto');
    
    });


</script>

<table id="list39" width="100%" align="center"></table>
<div id="pager39"></div>
<table id="search" width="100%" align="center"></table>

    