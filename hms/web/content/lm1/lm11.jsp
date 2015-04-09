<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%
RoomtypeBean[] roomtypes = RoomtypeManager.getInstance().loadByWhere("order by name");
String rtypes = "";
for(int i=0;i<roomtypes.length;i++){
    if(i>0) rtypes += ";";
    rtypes += roomtypes[i].getRoomtypeid() + ":"+roomtypes[i].getName();
}
%>
<script type="text/javascript">
    
    jQuery().ready(function ()
    {
        jQuery("#list11").jqGrid(
            {
                url:'content/lm1/getlm11.jsp',
                datatype: "xml",
                colNames:['მოკლე სახელწოდება','ტარიფის ტიპი','ღამეების რაოდენობა','მაქს. უფროსი','მინიმალური ღამეები','ოთახის ტიპი','სორტირება','შექმნილია','განახლებულია','სტატუსი'],
                colModel:[
                    {name:'nickname',index:'nickname', sortable:true, align:"left", width:100, hidden:true, editable:true, sortable:true, edittype:"text", editoptions:{size:"20"}, editrules:{required:true, edithidden:true}, search:false},
                    {name:'name',index:'name', sortable:true, align:"left", width:200, editable:true, sortable:true, edittype:"text", editoptions:{size:"40"}, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']}, editrules:{required:true}},
                    
                    {name:'numnights',index:'numnights', sortable:true, align:"left", width:20, hidden:true, editable:true, sortable:true, edittype:"text", editoptions:{size:"8"}, editrules:{required:true, edithidden:true, integer:true}, search:false},
                    {name:'maxadolt',index:'maxadolt', sortable:true, align:"left", width:20, hidden:true, editable:true, sortable:true, edittype:"text", editoptions:{size:"8"}, editrules:{required:true, edithidden:true, integer:true}, search:false},
                    {name:'minnight',index:'minnight', sortable:true, align:"left", width:20, hidden:true, editable:true, sortable:true, edittype:"text", editoptions:{size:"8"}, editrules:{required:true, edithidden:true, integer:true}, search:false},
                    
                    {name:'rtype',index:'rtype', sortable:true, align:"center", width:120, editable:true, sortable:true, edittype:"select", editoptions:{value:"<%=rtypes%>",multiple:true,size:"5"}, search: false, editrules:{required:true}},
                    {name:'ord',index:'ord', sortable:true, align:"right", width:80, editable:true, sortable:true, edittype:"text", editoptions:{size:"5"}, search:false, editrules:{required:true, integer:true}},
                    {name:'created',index:'created', sortable:true, align:"right", width:140, editable:false, sortable:true, search:false},
                    {name:'updated',index:'updated', sortable:true, align:"right", width:120, editable:false, sortable:true, search:false},
                    {name:'status',index:'status', sortable:true, align:"center", width:80, editable:true, sortable:true, edittype:"checkbox", editoptions:{value:"აქტიური:გაუქმებული"}, search:false}
                ],
                rowNum: <%=jq_rownum%>,
                height: <%=jq_height%>,
                //width: 600,
                autowidth: true,
                rowList: <%=jq_rowlist%>,
                pager: jQuery('#pager11'),
                sortname: 'ord',
                viewrecords: true,
                sortorder: "desc",
                footerrow : true,
                userDataOnFooter:true,
                editurl:"content/lm1/updlm11.jsp",
                caption:"ტარიფის ტიპები",
                ondblClickRow: function(id, ri, ci) {
                    
                    return;
                }
            })
            .navGrid('#pager11',{edit:true,add:true,del:true,search:true,view:false},
                        {dataheight:300,width:460,closeAfterEdit:true,reloadAfterSubmit:false,afterSubmit:checkStatus}, //  default settings for edit
                        {dataheight:300,width:460,closeAfterAdd:true,reloadAfterSubmit:true,afterSubmit:checkStatus}, //  default settings for add
                        {reloadAfterSubmit:true,afterSubmit:checkStatus},  // delete instead that del:false we need this
                        {multipleSearch:true}, // search options
                        {dataheight:300,width:460,labelswidth:"68%",closeOnEscape:true} /* view parameters*/
                )
            ;
       
    $(".ui-jqgrid-sortable").css('white-space', 'normal');
    $(".ui-jqgrid-sortable").css('height', 'auto');
    
    });


</script>

<table id="list11" width="100%" align="center"></table>
<div id="pager11"></div>
<table id="search" width="100%" align="center"></table>
