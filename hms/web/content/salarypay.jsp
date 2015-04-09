<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
String gridname = "salary";
String title = "გადახდები";
String ugridname = Character.toUpperCase(gridname.charAt(0)) + gridname.substring(1);

PersonellBean[] personell = PersonellManager.getInstance().loadByWhere("where code is not null and code != '' order by departamentid, code");
String pedits = "";
String psearches = "<select><option value=\"0\">-- ყველა --</option>";
for(int i=0;i<personell.length;i++){
    if(i > 0)   pedits += ";";
    pedits += personell[i].getPersonellid()+":"+personell[i].getFname()+" "+personell[i].getLname();
    psearches += "<option value=\""+personell[i].getPersonellid()+"\">"+personell[i].getFname()+" "+personell[i].getLname()+"</option>";
}
psearches += "</select>";
PaytypeBean[] paytypes = PaytypeManager.getInstance().loadByWhere("order by name");
String edits = "";
String searches = "<select><option value=\"0\">-- ყველა --</option>";
for(int i=0;i<paytypes.length;i++){
    if(i > 0)   edits += ";";
    edits += paytypes[i].getPaytypeid()+":"+paytypes[i].getName();
    searches += "<option value=\""+paytypes[i].getPaytypeid()+"\">"+paytypes[i].getName()+"</option>";
}
searches += "</select>";
%>
<script type="text/javascript">
    
    function printSalaryPayments(id)
    {
            window.open("content/printsalarypayments.jsp"); 
    }
    
    jQuery().ready(function ()
    {
        jQuery("#<%=gridname%>").jqGrid(
            {
                url:'content/getpaylist.jsp',
                datatype: "xml",
                colNames:['კოდი','თანამშრომელი','გადახდის თარიღი','გადახდა თარიღისთვის','დანიშნულება','თანხა','შენიშვნა'],
                colModel:[
                    {name:'code',index:'code', editable:false, align:"left", width:30},
                    {name:'personellid',index:'personellid', editable:true, align:"left", width:100, stype:"select", edittype:"select", editoptions:{value:"<%=pedits%>",style:"width:250px;"},stype:'select',searchoptions:{dataUrl:"content/gettypes.jsp?objname=Personell&cols=Personellid&cols=Fname&cols=Lname&where=where code is not null and code != '' order by departamentid, code",sopt:['eq','ne']}},
                    {name:'paydate',index:'paydate', editable:true, align:"center", width:100,editoptions:{size: 10, maxlengh: 10, dataInit: function(element) {$(element).datepicker(<%=pickerformat%>)}}, editrules: {required:true}, searchoptions:{dataInit: function(element) {sper(element,'<%=gridname%>');}}},
                    {name:'fordate',index:'fordate', editable:true, align:"center", width:100,editoptions:{size: 10, maxlengh: 10, dataInit: function(element) {$(element).datepicker(<%=pickerformat1%>)}}, editrules: {required:true}, searchoptions:{dataInit: function(element) {$(element).datepicker(<%=pickerformat%>).change(function(){$("#<%=gridname%>")[0].triggerToolbar();});}}},
                    {name:'paytypeid',index:'paytypeid', editable:true, align:"left", width:100, stype:"select", edittype:"select", editoptions:{value:"<%=edits%>",style:"width:250px;"},stype:'select',searchoptions:{dataUrl:"content/gettypes.jsp?objname=Paytype&cols=Paytypeid&cols=Name&where=order by name",sopt:['eq','ne']}},
                    {name:"amount",index:"amount",width:100,align:"right",sortable:false, editable: true, edittype:"text", editoptions: {size:10,class:"gTextBtn"},editrules: {number:true, required:true}},
                    {name:'note',index:'note', editable:true, align:"left", width:300, edittype:"textarea", editoptions:{cols:"30", rows:"3"}, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']}, editrules: {edithidden:true, required:false}}
                ],
                rowNum:20,
                height: 350,
                width:600,
                autowidth: true,
                rowList:[20,50,100],
                pager: jQuery('#pager<%=gridname%>'),
                sortname: 'paydate',
                viewrecords: true,
                sortorder: "desc",
                editurl:"content/upd<%=gridname%>.jsp",
                caption:"<%=title%>",
                footerrow : true,
                userDataOnFooter:true,
                ondblClickRow: function(id, ri, ci) {
                    jQuery("#<%=gridname%>").jqGrid('editGridRow',id,{height:320,width:400,closeAfterEdit:true,reloadAfterSubmit:false,afterSubmit:checkStatus});
                    return;
                }
            })
            .jqGrid('bindKeys')
            .jqGrid('filterToolbar', { searchOnEnter: true, enableClear: true })
            .navGrid('#pager<%=gridname%>',{edit:true,add:true,del:true,view:false},
                        {dataheight:300,width:400,closeAfterEdit:true,reloadAfterSubmit:false,afterSubmit:checkStatus}, //  default settings for edit
                        {dataheight:300,width:400,closeAfterAdd:true,reloadAfterSubmit:true,afterSubmit:checkStatus}, //  default settings for add
                        {closeAfterDelete:true,reloadAfterSubmit:true,afterSubmit:checkStatus},  // delete instead that del:false we need this
                        {multipleSearch:true}, // search options
                        {dataheight:300,width:400,labelswidth:"68%",closeOnEscape:true} /* view parameters*/
                )
            .navButtonAdd('#pager<%=gridname%>',{caption:"ბეჭდვა",buttonicon:"ui-icon-print",onClickButton: function(){ printSalaryPayments(); },position:"last"})
             ;
    $(".ui-jqgrid-sortable").css('white-space', 'normal');
    $(".ui-jqgrid-sortable").css('height', 'auto');
    });
    
    
</script>

<table id="<%=gridname%>" width="100%" align="center"></table>
<div id="pager<%=gridname%>"></div>
<table id="search" width="100%" align="center"></table>
