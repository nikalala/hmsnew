<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
String gridname = "pcal";
String title = "დასვენების დღეები";
String ugridname = Character.toUpperCase(gridname.charAt(0)) + gridname.substring(1);

SuppliertypeBean[] suppliertypes = SuppliertypeManager.getInstance().loadByWhere("order by name desc");
String edits = "";
String searches = "";
for(int i=0;i<suppliertypes.length;i++){
    if(i > 0)   edits += ";";
    edits += suppliertypes[i].getSuppliertypeid()+":"+suppliertypes[i].getName();
    searches += "<option value=\""+suppliertypes[i].getSuppliertypeid()+"\">"+suppliertypes[i].getName()+"</option>";
}
searches += "</select>";
%>
<script type="text/javascript">
    
    getSearches = function()
    {
        return '<%=searches%>';
    }
    
    jQuery().ready(function ()
    {
        jQuery("#<%=gridname%>").jqGrid(
            {
                url:'content/getparamlist.jsp?objname=<%=ugridname%>&cols=<%=ugridname%>id&cols=Pdate&cols=Name',
                datatype: "xml",
                colNames:['თარიღი','სახელი'],
                colModel:[
                    {name:"pdate",index:"pdate",width:100,align:"center",sortable:true, editable: true, edittype: 'text', datefmt: 'dd/mm/yyyy', editrules: {date: true, required: true}, editoptions: {size: 10, maxlengh: 10, dataInit: function(element) {$(element).datepicker(<%=pickerformat1%>)}}},
                    {name:'name',index:'name', editable:true, align:"left", width:200, edittype:"textarea", editoptions:{cols:"30",rows:"3"}, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']}, editrules: {edithidden:true, required:true}}
                ],
                rowNum:20,
                height: 350,
                width:600,
                autowidth: false,
                rowList:[20,50,100],
                pager: jQuery('#pager<%=gridname%>'),
                sortname: 'name',
                viewrecords: true,
                sortorder: "asc",
                editurl:"content/upd<%=gridname%>.jsp",
                caption:"<%=title%>",
                ondblClickRow: function(id, ri, ci) {
                    jQuery("#<%=gridname%>").jqGrid('editGridRow',id,{height:320,width:400,closeAfterEdit:true,reloadAfterSubmit:false,afterSubmit:checkStatus});
                    return;
                }
            })
            .jqGrid('bindKeys')
            .navGrid('#pager<%=gridname%>',{edit:true,add:true,del:true,view:false},
                        {dataheight:300,width:400,closeAfterEdit:true,reloadAfterSubmit:false,afterSubmit:checkStatus}, //  default settings for edit
                        {dataheight:300,width:400,closeAfterAdd:true,reloadAfterSubmit:true,afterSubmit:checkStatus}, //  default settings for add
                        {closeAfterDelete:true,reloadAfterSubmit:true,afterSubmit:checkStatus},  // delete instead that del:false we need this
                        {multipleSearch:true}, // search options
                        {dataheight:300,width:400,labelswidth:"68%",closeOnEscape:true} /* view parameters*/
                )
             ;
    $(".ui-jqgrid-sortable").css('white-space', 'normal');
    $(".ui-jqgrid-sortable").css('height', 'auto');
    });
    
    
</script>

<table id="<%=gridname%>" width="100%" align="center"></table>
<div id="pager<%=gridname%>"></div>
<table id="search" width="100%" align="center"></table>
