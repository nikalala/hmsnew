<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%
    ReportBean report = ReportManager.getInstance().loadByPrimaryKey(new Integer(request.getParameter("reportid")));
    
    boolean manual = false;
    String pagename = "";
    int pos = report.getSqlquery().toUpperCase().indexOf("MANUAL:");
    if(pos >= 0){
        pagename = report.getSqlquery().substring(pos+7).trim();
        manual = true;
    }
    
    
    ReportitemBean[] items = ReportitemManager.getInstance().loadByWhere("where reportid = "+report.getReportid()+" order by idx");
    int sindex = 0;
    
    String sortname = "";
    String reportname = report.getDisplayname();
    String tablename = "report_"+report.getReportid();
    String colnames = "";
    String colmodel = "";
    String headers = "";
    for(int i=0;i<items.length;i++){
        if(i > 0)   {
            colnames += ",";
            colmodel += ",\n";
        }
        colnames += "'"+items[i].getName()+"'";
        colmodel += "{width: "+items[i].getWd()+", hidden:false, name:'"+tablename+"_"+i+"', index:'"+tablename+"_"+i+"', align:'"+items[i].getAlign()+"'}";
        headers += "$(\"#jqgh_"+tablename+"_"+tablename+"_"+i+"\").css('text-align', '"+items[i].getAlign()+"');\n";
        if(items[i].getOrdered().booleanValue())
            sortname = tablename+"_"+i;
    }
%>
<link rel="stylesheet" type="text/css" href="css/reports.css">
<script type="text/javascript" src="js/daterangepicker.jQuery.compressed.js"></script>

<script>
/*
    function sper(element,gridname)
    {
        $(element).daterangepicker({< %=dateformats[dff]%>,onChange: function(){$("#"+gridname)[0].triggerToolbar();}});
    }

    function sper(element,gridname,url)
    {
        $(element).daterangepicker({< %=dateformats[dff]%>,onChange: function(){
                jQuery("#"+gridname).jqGrid().setGridParam({
                    url: url+"?_search=true&"+$(element).attr("id")+"="+$(element).val()
                }).trigger("reloadGrid");
            }
        });
    }

    function sper(element,gridname,url,qr)
    {
        $(element).daterangepicker({< %=dateformats[dff]%>,onChange: function(){
                jQuery("#"+gridname).jqGrid().setGridParam({
                    url: url+"?"+qr+"&_search=true&"+$(element).attr("id")+"="+$(element).val()
                }).trigger("reloadGrid");
            }
        });
    }
*/    

$(document).ready(function(){
    
   <%if(manual){%>
        $.post("content/reports/content/<%=pagename%>",{ rid: <%=report.getReportid()%> },function(data){$("#<%=tablename%>").html(data);});
   <%} else {%>
   jQuery('#<%=tablename%>').jqGrid(
    {
        url:'content/reports/getreportlist.jsp?rid=<%=report.getReportid()%>',
        datatype: 'xml',
        colNames:[<%=colnames%>],
        colModel:[<%=colmodel%>],
        rowNum:2000,
        height: 500,
        autowidth: true,
        sortname: '<%=sortname%>',
        viewrecords: true,
        sortorder: 'asc',
        altRows: true,
        footerrow: true,
        userDataOnFooter:true,
        altclass: 'altrow',
        //multiselect: true,
        loadComplete: function() {
            
        }
        })
        .jqGrid('bindKeys')
        //.jqGrid('filterToolbar', { searchOnEnter: true, enableClear: true })
	//.navButtonAdd('#pager1',{caption:'',buttonicon:'ui-icon-circle-plus',onClickButton: function(){ setInsurance(jQuery('#listcurrency').jqGrid('getGridParam','selrow')); },position:'last'})
	;
/*
	$('.ui-jqgrid-sortable').css('white-space', 'normal');
	$('.ui-jqgrid-sortable').css('height', 'auto');
   
        $("#jqgh_listfolio_roomnumber").css('text-align', 'left');
        $("#jqgh_listfolio_itemdate").css('text-align', 'left');
        $("#jqgh_listfolio_number").css('text-align', 'left');
        $("#jqgh_listfolio_type").css('text-align', 'left');
        $("#jqgh_listfolio_descr").css('text-align', 'left');
        $("#jqgh_listfolio_regby").css('text-align', 'left');
        $("#jqgh_listfolio_price").css('text-align', 'right');
*/
        <%=headers%>
        <%}%>
});
</script>
<table width='100%'>
    <thead>
    <tr>
        <td style="border-bottom: 1px solid #000;">
            <b style="font-size: 20px;">Laerton Tbilisi</b>
        </td>
        <td style="border-bottom: 1px solid #000;">
            <b style="float: right; font-size: 22px;"><%=reportname%></b>
        </td>
    </tr>
    <%--tr>
        <td style="border-bottom: 1px solid #000;" colspan="2">
            <b style="font-size: 13px;">Date From: </b> <span></span>
            <b style="font-size: 13px;">to: </b> <span></span>
            <b style="font-size: 13px;">Order By: Room </b>
        </td>
    </tr--%>
    </thead>
    <tbody>
        <tr>
            <td style="border-bottom: 1px solid #000;" colspan="2">
                <table id='<%=tablename%>' width='100%' align='center'></table>
            </td>
        </tr>
    </tbody>
</table>

    
