<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
PersonelltypeBean[] types = PersonelltypeManager.getInstance().loadByWhere("order by name");
String perstypes_edits = "";
String perstypes = "<select><option value=\"0\">   </option>";
for(int i=0;i<types.length;i++){
    if(i > 0)   perstypes_edits += ";";
    perstypes_edits += types[i].getPersonelltypeid()+":"+types[i].getName();
    perstypes += "<option value=\""+types[i].getPersonelltypeid()+"\">"+types[i].getName()+"</option>";
}
perstypes += "</select>";
%>
<script type="text/javascript">
    getPersTypes = function()
    {
        return '<%=perstypes%>';
    }
    
    function getColor(id)
    {
        var color = "";
        $.ajax({
                  type: "POST",
                  url: "content/getcolor.jsp",
                  data: {personellid: id},
                  success: function(data){ color = data;},
                  async: false
                });
        color = color.replace(/\n/gi, "").replace(/ /gi, "");
        return color;
    }
    
    function uploadContract(id,lid)
    {
        window.open('content/upload_contract.jsp?pcontractid='+id+'&listid='+lid,'დოკუმენტის დამატება','scrollbars=yes,resizable=yes,width=400,height=200,left=200,top=200');
    }
    
    function printContract(id)
    {
        window.open('content/view_contract.jsp?pcontractid='+id);
    }
    
    function delContract(id,lid)
    {
        if(confirm("დარწმუნებული ხართ რომ გინდათ ხელშეკრულების ფაილის წაშლა?"))
            {
            $.post("content/del_contract.jsp?pcontractid="+id, { },function(data){ $("#"+lid).trigger("reloadGrid"); });
            }
    }
    
    checkStatus1 = function(response, postdata)
    {
       var retval = true;
       var msg = "";
       var id = 0;
       var json = eval('(' + response.responseText + ')');
       if(json.result == 0)
           {
           msg = json.error;
           retval = false;
           }
       else
           {
           id = json.id;
           jQuery("#list1").trigger("reloadGrid");
           }
       return [retval,msg,id];
    }
    
    jQuery().ready(function ()
    {
        jQuery("#list1").jqGrid(
            {
                url:'content/getpersonelllist.jsp',
                datatype: "xml",
                colNames:['სახელი','გვარი','საათების რაოდენობა','თანამდებობა','რეგ. სახელი','პაროლი','მისამართი','რეგისტრაციის თარიღი','გაუქმება'],
                colModel:[
                    {name:'fname',index:'fname', editable:true, align:"left", width:100, edittype:"text", editoptions:{size:"15"}, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']}, editrules: {edithidden:true, required:true}},
                    {name:'lname',index:'lname', editable:true, align:"left", width:150, edittype:"text", editoptions:{size:"30"}, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']}, editrules: {edithidden:true, required:true}},
                    {name:'phone',index:'phone', editable:true, align:"left", width:100, edittype:"text", editoptions:{size:"15"}, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']}},
                    {name:'personelltypeid',index:'personelltypeid', editable:true, align:"left", width:100, stype:"select", edittype:"select", editoptions:{value:"<%=perstypes_edits%>"},searchoptions:{dataUrl:"content/gettypes.jsp",buildSelect:getPersTypes,sopt:['eq','ne']}},
                    {name:'loginid',index:'loginid', editable:true, align:"left", width:200, edittype:"text", editoptions:{size:"15", maxlength: "15"}, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']}, editrules: {edithidden:true, required:true}},
                    {name:'password',index:'password', editable:true, align:"left", width:200, hidden:true, edittype:"password", editoptions:{size:"15", maxlength: "15"}, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']}, editrules: {edithidden:true, required:true}},
                    {name:'address',index:'address', editable:true, align:"left", width:200, edittype:"textarea", editoptions:{rows:"3",cols:"30"}, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']}},
                    {name:'regdate',index:'regdate', editable:true, align:"left", width:200, editable:false, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']}},
                    {name:'deleted',index:'deleted', editable:true, align:"center", width:200, edittype:"checkbox",editoptions:{value:"დიახ:არა"}, stype:'checkbox'}
                ],
                rowNum:20,
                height: 350,
                width:900,
                autowidth: true,
                rowList:[20,50,100],
                pager: jQuery('#pager1'),
                sortname: 'lname',
                viewrecords: true,
                sortorder: "asc",
                editurl:"content/updpersonell.jsp",
                caption:"პერსონალი",
                ondblClickRow: function(id, ri, ci) {
                    jQuery("#list1").jqGrid('editGridRow',id,{height:320,width:400,closeAfterEdit:true,reloadAfterSubmit:false,afterSubmit:checkStatus});
                    return;
                }
            })
            .jqGrid('bindKeys')
            .navGrid('#pager1',{edit:true,add:true,del:true,view:false},
                        {dataheight:320,width:400,closeAfterEdit:true,reloadAfterSubmit:false,afterSubmit:checkStatus}, //  default settings for edit
                        {dataheight:320,width:400,closeAfterAdd:true,reloadAfterSubmit:true,afterSubmit:checkStatus}, //  default settings for add
                        {closeAfterDelete:true,reloadAfterSubmit:true,afterSubmit:checkStatus},  // delete instead that del:false we need this
                        {multipleSearch:true}, // search options
                        {dataheight:320,width:400,labelswidth:"68%",closeOnEscape:true} /* view parameters*/
                )
             ;
    $(".ui-jqgrid-sortable").css('white-space', 'normal');
    $(".ui-jqgrid-sortable").css('height', 'auto');
    });
    
    
</script>

<table id="list1" width="100%" align="center"></table>
<div id="pager1"></div>
<table id="search" width="100%" align="center"></table>

