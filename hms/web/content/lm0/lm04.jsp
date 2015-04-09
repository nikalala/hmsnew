<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%
RoomtypeBean[] roomtypes = RoomtypeManager.getInstance().loadByWhere("order by name");
BedtypeBean[] badtypes = BedtypeManager.getInstance().loadByWhere("order by name");

String rts = "";
String bts = "";

for(int i=0;i<roomtypes.length;i++){
    if(i>0) rts += ";";
    rts += roomtypes[i].getRoomtypeid()+":"+roomtypes[i].getName();
}

for(int i=0;i<badtypes.length;i++){
    if(i>0) bts += ";";
    bts += badtypes[i].getBedtypeid()+":"+badtypes[i].getName();
}

%>
<script type="text/javascript">
    
    function setPics(id)
    {
        //if(id > 0)
        $("#recform").dialog(
            {
                width: 660,
                height: 660,
                show: 'slide',
                resizable: false,
                modal: true,
                draggable: false,
                closeOnEscape: true,
                buttons: { 
                  "დახურვა": function() {
                    $("#recform").dialog("close");
                  }
                },
                open: function(event, ui) { $.post("content/getroompics.jsp", { id: id },function(data){ $("#dpma").html(data); });}

            });
    }

    jQuery().ready(function ()
    {
        
        
        jQuery("#list04").jqGrid(
            {
                url:'content/lm0/getlm04.jsp',
                datatype: "xml",
                colNames:['მოკლე სახელი','ოთახის სახელი','ოთახის ტიპი','საწოლის ტიპი','სორტირება','არა მწეველი','შექმნილია','განახლებულია','სტატუსი'],
                colModel:[
                    {name:'nickname',index:'nickname', sortable:true, align:"left", hidden:true, width:200, editable:true, edittype:"text", editoptions:{size:"40"}, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']}, editrules:{edithidden:true,required:true}},
                    {name:'name',index:'name', sortable:true, align:"left", width:200, editable:true, sortable:true, edittype:"text", editoptions:{size:"40"}, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']}, editrules:{required:true}},
                    {name:'roomtypeid',index:'roomtypeid', sortable:true, align:"left", width:200, editable:true, sortable:true, edittype:"select", editoptions:{value:"<%=rts%>"}, searchoptions:{sopt:['eq','ne']}, editrules:{required:true}},
                    {name:'bedtypeid',index:'bedtypeid', sortable:true, align:"left", hidden:true, width:200, editable:true, sortable:true, edittype:"select", editoptions:{value:"<%=bts%>"}, searchoptions:{sopt:['eq','ne']}, editrules:{edithidden:true,required:true}},
                    {name:'ord',index:'ord', sortable:true, align:"left", width:10, hidden:true, editable:true, sortable:true, edittype:"text", editoptions:{size:"4"}, search:false, editrules:{edithidden:true,required:true}},
                    {name:'smoke',index:'smoke', sortable:true, align:"left", width:10, hidden:true, editable:true, sortable:true, edittype:"checkbox", editoptions:{value:"კი:არა"}, search:false, editrules:{edithidden:true,required:true}},
                    {name:'createdby',index:'createdby', sortable:true, align:"right", width:80, editable:false, sortable:true},
                    {name:'updated',index:'updated', sortable:true, align:"right", width:80, editable:false, sortable:true},
                    {name:'status',index:'status', sortable:true, align:"center", width:80, editable:true, sortable:true, edittype:"checkbox", editoptions:{value:"აქტიური:გაუქმებული"}, search:false}
                ],
                rowNum: <%=jq_rownum%>,
                height: <%=jq_height%>,
                //width: 600,
                autowidth: true,
                rowList: <%=jq_rowlist%>,
                pager: jQuery('#pager04'),
                sortname: 'ord',
                viewrecords: true,
                sortorder: "asc",
                footerrow : true,
                userDataOnFooter:true,
                editurl:"content/lm0/updlm04.jsp",
                caption:"ოთახები",
                ondblClickRow: function(id, ri, ci) {
                    
                    return;
                }
            })
            .navGrid('#pager04',{edit:true,add:true,del:true,search:true,view:false},
                        {dataheight:200,width:460,closeAfterEdit:true,reloadAfterSubmit:false,afterSubmit:checkStatus}, //  default settings for edit
                        {dataheight:200,width:460,closeAfterAdd:true,reloadAfterSubmit:true,afterSubmit:checkStatus}, //  default settings for add
                        {reloadAfterSubmit:true,afterSubmit:checkStatus},  // delete instead that del:false we need this
                        {multipleSearch:true}, // search options
                        {dataheight:200,width:460,labelswidth:"68%",closeOnEscape:true} /* view parameters*/
                )
            .navButtonAdd('#pager04',{caption:"სურათები",    buttonicon:"ui-icon-image", onClickButton: function(){setPics(jQuery('#list1').jqGrid('getGridParam','selrow'));},position:"last"})
            ;
       
    $(".ui-jqgrid-sortable").css('white-space', 'normal');
    $(".ui-jqgrid-sortable").css('height', 'auto');
    
    });

</script>

<table id="list04" width="100%" align="center"></table>
<div id="pager04"></div>
<table id="search" width="100%" align="center"></table>
<div id="recform" title="სურათები"><div id="dpma"></div></div>