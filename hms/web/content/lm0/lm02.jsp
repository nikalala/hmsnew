<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%
AmenityBean[] amenities = AmenityManager.getInstance().loadByWhere("where status = true order by name");

String amenities_edits = "";
String amenities_sels = "<select>";
for(int i=0;i<amenities.length;i++){
    if(i > 0){
        amenities_edits += ";";
    }
    amenities_edits += amenities[i].getAmenityid()+":"+amenities[i].getName();
    amenities_sels += "<option value=\""+amenities[i].getAmenityid()+"\">"+amenities[i].getName()+"</option>";
}
amenities_sels = "</select>";
%>
<script type="text/javascript">
    getATypes = function()
    {
        return '<%=amenities_sels%>';
    }

    function setcol(ctrl)
    {
        ctrl.style.backgroundColor=ctrl.options[ctrl.selectedIndex].style.backgroundColor;
        ctrl.style.color=ctrl.options[ctrl.selectedIndex].style.color;
    }
    
    jQuery().ready(function ()
    {
        
        jQuery("#list02").jqGrid(
            {
                url:'content/lm0/getlm02.jsp',
                datatype: "xml",
                colNames:['მოკლე სახელწოდება','ოთახის ტიპი','საბაზო უფროსი','საბაზო ბავშვი','მაქს. უფროსი','მაქს. ბავშვი','პუბლიკაცია ვებ გვერდზე','ფერი','კეთილმოწყობები','სორტირება'],
                colModel:[
                    {name:'nickname',index:'nickname', sortable:true, align:"left", width:200, editable:true, sortable:true, edittype:"text", editoptions:{size:"40"}, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']}, editrules:{required:true}},
                    {name:'name',index:'name', sortable:true, align:"left", width:200, editable:true, sortable:true, edittype:"text", editoptions:{size:"40"}, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']}, editrules:{required:true}},
                    {name:'baseadalt',index:'baseadalt', sortable:true, align:"right", width:80, editable:true, sortable:true, edittype:"text", editoptions:{size:"5"}, search:false, editrules:{required:true,integer:true}},
                    {name:'basechild',index:'basicchild', sortable:true, align:"right", width:80, editable:true, sortable:true, edittype:"text", editoptions:{size:"5"}, search:false, editrules:{required:true,integer:true}},
                    {name:'maxadalt',index:'maxadult', sortable:true, align:"right", width:80, editable:true, sortable:true, edittype:"text", editoptions:{size:"5"}, search:false, editrules:{required:true,integer:true}},
                    {name:'maxchild',index:'minadult', sortable:true, align:"right", width:80, editable:true, sortable:true, edittype:"text", editoptions:{size:"5"}, search:false, editrules:{required:true,integer:true}},
                    {name:'web',index:'web', sortable:true, align:"left", width:80, editable:true, sortable:true, edittype:"checkbox", editoptions:{value:"კი:არა"}, search:false},
//                    {name:'color',index:'color', sortable:true, align:"right", width:80, editable:true, sortable:true, edittype:"text", editoptions:{size:"5",dataInit: function(element) {$(element).click(function() {chooseColor(this);})}}, search:false, editrules:{required:true}},
                    {name:'color',index:'color', sortable:true, align:"center", width:80, editable:true, sortable:true, edittype:"select", editoptions:{dataUrl:"content/selectcolor.jsp", dataInit : function (elem) { setcol(elem); }, dataEvents: [{ type: 'change', data: {  }, fn: function(e) { setcol(this); } }] }, search:false},
                    {name:'amenities',index:'amenities', sortable:true, align:"center", width:120, editable:true, sortable:true, edittype:"select", editoptions:{multiple:true,size:6,value:"<%=amenities_edits%>"}, searchoptions:{buildSelect:getATypes,sopt:['eq','ne']}, editrules:{required:true}},
                    {name:'ord',index:'ord', sortable:true, align:"left", width:10, editable:true, sortable:true, edittype:"text", editoptions:{size:"4"}, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']}, editrules:{required:true}}
                ],
                rowNum: <%=jq_rownum%>,
                height: <%=jq_height%>,
                //width: 600,
                autowidth: true,
                rowList: <%=jq_rowlist%>,
                pager: jQuery('#pager02'),
                sortname: 'ord',
                viewrecords: true,
                sortorder: "asc",
                footerrow : true,
                userDataOnFooter:true,
                editurl:"content/lm0/updlm02.jsp",
                caption:"ოთახის ტიპები",
                ondblClickRow: function(id, ri, ci) {
                    
                    return;
                }
            })
            .navGrid('#pager02',{edit:true,add:true,del:true,search:true,view:false},
                        {dataheight:500,width:460,closeAfterEdit:true,reloadAfterSubmit:false,afterSubmit:checkStatus}, //  default settings for edit
                        {dataheight:500,width:460,closeAfterAdd:true,reloadAfterSubmit:true,afterSubmit:checkStatus}, //  default settings for add
                        {reloadAfterSubmit:true,afterSubmit:checkStatus},  // delete instead that del:false we need this
                        {multipleSearch:true}, // search options
                        {dataheight:500,width:460,labelswidth:"68%",closeOnEscape:true} /* view parameters*/
                )
            ;
       
    $(".ui-jqgrid-sortable").css('white-space', 'normal');
    $(".ui-jqgrid-sortable").css('height', 'auto');
    
    });

</script>

<table id="list02" width="100%" align="center"></table>
<div id="pager02"></div>
<table id="search" width="100%" align="center"></table>
