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

<style>
        .sidebar-nav {
  background-color: #f9f9f9;
  border: solid 1px #eee;
  margin: 0;
  padding: 0;
  font-size: .9em;
  margin-bottom: 40px;
}
.sidebar-nav li {
  padding: 0;
  list-style: none;
}
.sidebar-nav li a > i {
  margin: 2px 5px 0 0;
  font-size: 1.1em;
  color: #999;
}
.sidebar-nav li a {
  display: block;
  padding: 5px 15px;
  color: #333;
  text-decoration: none;
  border-left: solid 3px #333;
  background-color: #f3f3f3;
}
.sidebar-nav > li > a:after {
  font-family: 'FontAwesome';
  content: "\f0b0";
  font-size: 1.2em;
  float: left;
}
.sidebar-nav > li > a.collapsed:after {
  content: "\f0b0";
  color: #1955A8;
}
.sidebar-nav li a.collapsed {
  background-color: transparent;
  border-left: solid 3px #0099da;
}
.sidebar-nav li a:hover,
.sidebar-nav li a:focus,
.sidebar-nav li a:active {
  border-color: #333;
  background-color: #f3f3f3;
}
.menu-submenu li a {
  border-color: #ddd;
  padding-left: 35px;
  background-color: transparent;
}
.menu-submenu li.active a {
  border-color: #333;
  background-color: #f3f3f3;
}
.menu-submenu li:last-child a {
  border-bottom: solid 1px #eee;
}
.bootstrap-select li a {
    border: none;
}
</style>
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
        <td style="border-bottom: 1px solid #000; background: white;" colspan="2">
            <ul class="sidebar-nav" style="margin-bottom: 0;">
                <li>
                    <a id="collcss" data-toggle="collapse" href="#coll-css" class=""><i class="fa fa-filter fa-2x" style="visibility: hidden;"></i><b style="color: red; font-size: 13px; font-family: BGMtavr;"> <%=reportname%></b></a>
                    <ul id="coll-css" class="menu-submenu list-unstyled collapse in">
                        <jsp:include page="getfilters.jsp">
                            <jsp:param name="rid" value="<%=report.getReportid()%>"/>
                        </jsp:include> 
                    </ul>
                </li>
            </ul>
        </td>
    </tr>
    </thead>
    <tbody>
        <tr>
            <td style="border-bottom: 1px solid #000;" colspan="2">
                <table id='<%=tablename%>' width='100%' align='center'></table>
            </td>
        </tr>
    </tbody>
</table>

    
