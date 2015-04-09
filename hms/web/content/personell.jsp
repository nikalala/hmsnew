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

DepartamentBean[] deps = DepartamentManager.getInstance().loadByWhere("order by name");
String deps_edits = "";
String depts = "<select><option value=\"0\">   </option>";
for(int i=0;i<deps.length;i++){
    if(i > 0)   deps_edits += ";";
    deps_edits += deps[i].getDepartamentid()+":"+deps[i].getName();
    depts += "<option value=\""+deps[i].getDepartamentid()+"\">"+deps[i].getName()+"</option>";
}
depts += "</select>";
%>
<script type="text/javascript">
    getPersTypes = function()
    {
        return '<%=perstypes%>';
    }
    
    getDepTypes = function()
    {
        return '<%=depts%>';
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
    
    function setCompany(id){
        if(id > 0){
            $("#scompany").dialog(
                {
                    width: 600,
                    height: 600,
                    show: 'slide',
                    resizable: true,
                    modal: true,
                    draggable: true,
                    closeOnEscape: true,
                    title: "აირჩიეთ კომპანიები",
                    buttons: {
                    "შენახვა": function() { 
                        var attr = "";
                        $('.scompany').each(function(i, obj) {
                            attr += "&cid="+$(obj).attr("id")+"_";
                            var vl = $(obj).val();
                            if(vl.length == 0)  vl = 0;
                            if(isNaN(vl)) {alert("არასწორი პროცენტი"); return false;}
                            else          attr += vl;
                        });
                        $.post("content/scompany.jsp?act=save&id="+id+attr, { },function(data){
                            if(data.result == 0){
                                $("#scompany_err").html(data.error);
                            } else $("#scompany").dialog("close");
                        },"json");
                        
                        },
                    "დახურვა": function() { $("#scompany").dialog("close"); }
                    },
                    open: function(event, ui) { 
                        $.post("content/scompany.jsp", { id: id},function(data){$("#scompany").html(data);});
                    }

                });
        } else alert("აირჩიეთ ჩანაწერი");
    }
    
    function setHalliday(id){
        if(id > 0){
            $("#shalliday").dialog(
                {
                    width: 500,
                    height: 490,
                    show: 'slide',
                    resizable: true,
                    modal: true,
                    draggable: true,
                    closeOnEscape: true,
                    title: "გაცდენები",
                    buttons: {
                    "დახურვა": function() { $("#shalliday").dialog("close"); }
                    },
                    open: function(event, ui) { 
                        $.post("content/askhall.jsp", {id: id},function(data){$("#shalliday").html(data);});
                    }

                });
        } else alert("აირჩიეთ ჩანაწერი");
    }
    
    jQuery().ready(function ()
    {
        jQuery("#list1").jqGrid(
            {
                url:'content/getpersonelllist.jsp',
                datatype: "xml",
                colNames:['კოდი','სახელი','გვარი','ტელეფონი','განყოფილება','თანამდებობა','რეგ. სახელი','პაროლი','მისამართი','რეგისტრაციის თარიღი','გაუქმება'],
                colModel:[
                    {align:'left', editable:true, editoptions:{size:4, maxlength:3}, editrules:{required: true}, edittype:'text', hidden:false, index:'code', name:'code', width:20},
                    {name:'fname',index:'fname', editable:true, align:"left", width:100, edittype:"text", editoptions:{size:"15"}, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']}, editrules: {edithidden:true, required:true}},
                    {name:'lname',index:'lname', editable:true, align:"left", width:150, edittype:"text", editoptions:{size:"30"}, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']}, editrules: {edithidden:true, required:true}},
                    {name:'phone',index:'phone', editable:true, align:"left", width:100, edittype:"text", editoptions:{size:"15"}, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']}},
                    {name:'departamentid',index:'departamentid', editable:true, align:"left", width:100, stype:"select", edittype:"select", editoptions:{value:"<%=deps_edits%>"},searchoptions:{dataUrl:"content/gettypes.jsp",buildSelect:getDepTypes,sopt:['eq','ne']}},
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
                },
                subGrid: true,
                gridComplete: function() {
                    var rowData = $("#list1").getDataIDs();

                    for (var i = 0; i < rowData.length; i++) 
                    {
                        $("#list1").jqGrid('setRowData', rowData[i], false, {color:getColor(rowData[i])});
                    }
                },
                subGridRowExpanded: function(subgrid_id, row_id) {
                   var subgrid_table_id, pager_id;
                   subgrid_table_id = subgrid_id+"_t";
                   pager_id = "p_"+subgrid_table_id;
                   jQuery("#"+subgrid_id).html("<table id='"+subgrid_table_id+"' class='scroll'></table><div id='"+pager_id+"' class='scroll'></div>");
                   jQuery("#"+subgrid_table_id).jqGrid({
                      url:"content/getpcontracts.jsp?personellid="+row_id+"&listid="+subgrid_table_id,
                      datatype: "xml",
                      colNames: ['ხელშეკრულების ნომერი','ხელშეკრულების დასაწყისი', 'ხელშეკრულების დასასრული', 'ხელფასი','პრემია','პრემია 1000 ბ.','სამუშაო საათები', '','',''],
                      colModel: [
                        {name:"num",index:"num",width:100,sortable:true, editable: true,editrules: {required: true}, editoptions:{size:"10"}},
                        {name:"startdate",index:"startdate",width:100,align:"center",sortable:true, editable: true, edittype: 'text', datefmt: 'dd/mm/yyyy', editrules: {date: true, required: true}, editoptions: {size: 10, maxlengh: 10, dataInit: function(element) {$(element).datepicker(<%=pickerformat1%>)}}},
                        {name:"enddate",index:"enddate",width:100,align:"center",sortable:true, editable: true, edittype: 'text', datefmt: 'dd/mm/yyyy', editrules: {date: true, required: true}, editoptions: {size: 10, maxlengh: 10, dataInit: function(element) {$(element).datepicker(<%=pickerformat1%>)}}},
                        {name:"salary",index:"salary",width:100,align:"right",sortable:true, editable: true,editrules: {number: true, required: true}, editoptions:{size:"10",maxlength:"10"}},
                        {name:"premium",index:"premium",width:100,align:"right",sortable:true, editable: true,editrules: {number: true, required: true}, editoptions:{size:"10",maxlength:"10"}},
                        {name:"premium1000",index:"premium1000",width:100,align:"right",sortable:true, editable: true,editrules: {number: true, required: true}, editoptions:{size:"10",maxlength:"10"}},
                        {name:"hours",index:"hours",width:60,align:"right",sortable:true, editable: true,editrules: {number: true, required: true}, editoptions:{size:"5",maxlength:"5"}},
                        {name:"add",index:"add",width:5,align:"center",sortable:false,editable: false},
                        {name:"edt",index:"edt",width:5,align:"center",sortable:false,editable: false},
                        {name:"del",index:"del",width:5,align:"center",sortable:false,editable: false}
                      ],
                      height: '100%',
                      rowNum: 100,
                      sortname: 'enddate',
                      sortorder: 'asc',
                      autowidth: true,
                      editurl:"content/updpcontract.jsp?personellid="+row_id,
                      rowList: [],
                      pgbuttons: false,
                      pgtext: null,
                      viewrecords: false,
                      pager: pager_id
                   }).jqGrid('bindKeys');
                   jQuery("#"+subgrid_table_id).jqGrid('navGrid',"#"+pager_id,{edit:false,add:true,del:true,search:false},
                            {height:300,width:450,reloadAfterSubmit:true,afterSubmit:checkStatus1}, //  default settings for edit
                            {height:300,width:450,reloadAfterSubmit:true,closeAfterAdd : true,afterSubmit:checkStatus1}, //  default settings for add
                            {afterSubmit:checkStatus1},  // delete instead that del:false we need this
                            {}, // search options
                            {} /* view parameters*/
                        )
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
            .navButtonAdd('#pager1',{caption:"კომპანიები",buttonicon:"ui-icon-flag",onClickButton: function(){ setCompany(jQuery('#list1').jqGrid('getGridParam','selrow')); },position:"last"})
            //.navButtonAdd('#pager1',{caption:"დაზღვევა",buttonicon:"ui-icon-circle-plus",onClickButton: function(){ setInsurance(jQuery('#list1').jqGrid('getGridParam','selrow')); },position:"last"})
            .navButtonAdd('#pager1',{caption:"გაცდენები",buttonicon:"ui-icon-image",onClickButton: function(){ setHalliday(jQuery('#list1').jqGrid('getGridParam','selrow')); },position:"last"})
             ;
    $(".ui-jqgrid-sortable").css('white-space', 'normal');
    $(".ui-jqgrid-sortable").css('height', 'auto');
    });
    
    
</script>

<table id="list1" width="100%" align="center"></table>
<div id="pager1"></div>
<table id="search" width="100%" align="center"></table>
<table align="left">
    <tr>
        <td align="left" valign="top" class="gText" colspan="2"><b>ლეგენდა</b></td>
    </tr>
    <tr>
        <td align="right" valign="top" class="gText" colspan="1"><b><font color="black">შავი</font></b></td>
        <td align="left" valign="top" class="gText" colspan="1">ხელშეკრულება არ არსებობს</td>
    </tr>
    <tr>
        <td align="right" valign="top" class="gText" colspan="1"><b><font color="green">მწვანე</font></b></td>
        <td align="left" valign="top" class="gText" colspan="1">ხელშეკრულება ძალაშია</td>
    </tr>
    <tr>
        <td align="right" valign="top" class="gText" colspan="1"><b><font color="gray">ნაცრისფერი</font></b></td>
        <td align="left" valign="top" class="gText" colspan="1">ხელშეკრულებას ვადა გაუვიდა</td>
    </tr>
    <tr>
        <td align="right" valign="top" class="gText" colspan="1"><b><font color="red">წითელი</font></b></td>
        <td align="left" valign="top" class="gText" colspan="1">ხელშეკრულებას 1 თვეზე ადრე გასდის ვადა</td>
    </tr>
</table>
<div id="scompany" title=""></div>
<div id="shalliday" title=""></div>