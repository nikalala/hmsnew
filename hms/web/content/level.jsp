<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
PersonelltypeBean[] ptypes = PersonelltypeManager.getInstance().loadByWhere("order by name");
String colnames = "";
String colmodels = "";
for(int i=0;i<ptypes.length;i++){
    colnames += ",'"+ptypes[i].getName()+"'";
    colmodels += ",\n{name:'ptp_"+ptypes[i].getPersonelltypeid()+"',index:'ptp_"+ptypes[i].getPersonelltypeid()+"', editable:false, sortable:false, align:'center', width:50}";
}
%>
<script type="text/javascript">
    jQuery().ready(function ()
    {
        jQuery("#list1").jqGrid(
            {
                url:'content/getlevellist.jsp',
                datatype: "xml",
                colNames:['მენიუ','ქვემენიუ'<%=colnames%>],
                colModel:[
                    {name:'name',index:'name', editable:false, sortable:false, align:"left", width:100},
                    {name:'sname',index:'sname', editable:false, sortable:false, align:"left", width:100}<%=colmodels%>
                ],
                rowNum:20,
                height: 460,
                width:800,
                autowidth: true,
                rowList:[50,100,150],
                pager: jQuery('#pager1'),
                sortname: 'ord',
                viewrecords: true,
                sortorder: "asc",
                caption:"დონეები"
            })
            .jqGrid('bindKeys')
            .navGrid('#pager1',{edit:false,add:false,del:false,view:false,search:false},
                        {}, //  default settings for edit
                        {}, //  default settings for add
                        {},  // delete instead that del:false we need this
                        {}, // search options
                        {} /* view parameters*/
                )
             ;
    $(".ui-jqgrid-sortable").css('white-space', 'normal');
    $(".ui-jqgrid-sortable").css('height', 'auto');
    
    });

function chLevel(pid,mid,st)
{
    $.post("content/updlevel.jsp", { pid: pid, mid: mid, st: st }, function(data){ });
}
</script>

<table id="list1" width="100%" align="center"></table>
<div id="pager1"></div>
<table id="search" width="100%" align="center"></table>
