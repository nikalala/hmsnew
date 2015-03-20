<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%
    ReportBean report = ReportManager.getInstance().loadByPrimaryKey(new Integer(request.getParameter("rid")));
    ReportitemBean[] items = ReportitemManager.getInstance().loadByWhere("where reportid = "+report.getReportid()+" and search = true order by idx");
    ReportsearchBean[] filters = ReportsearchManager.getInstance().loadByWhere("where reportid = "+report.getReportid()+" order by name");

    String script = "";
    String params = "&afilter_cnt="+filters.length+"&filter_cnt="+items.length;
    for(int i=0;i<items.length;i++){
        
        String control = "";
        switch(items[i].getFieldtype().intValue()){
                case 0:
                    control = "<input type='text' name='filter_"+items[i].getIdx()+"' id='filter_"+items[i].getIdx()+"' value='' size='20'/>";
                    params += "&filter_"+items[i].getIdx()+"=\"+$('#filter_"+items[i].getIdx()+"').val()+\"";
                    break;
                case 1:
                case 2:
                    control = "<input type='text' name='filter_"+items[i].getIdx()+"_1' id='filter_"+items[i].getIdx()+"_1' value='' size='10'/> - ";
                    control += "<input type='text' name='filter_"+items[i].getIdx()+"_2' id='filter_"+items[i].getIdx()+"_2' value='' size='10'/>";
                    params += "&filter_"+items[i].getIdx()+"_1=\"+$('#filter_"+items[i].getIdx()+"_1').val()+\"";
                    params += "&filter_"+items[i].getIdx()+"_2=\"+$('#filter_"+items[i].getIdx()+"_2').val()+\"";
                    break;
                case 3:
                case 4:
                    control = "<input type='text' readonly='' name='filter_"+items[i].getIdx()+"_1' id='filter_"+items[i].getIdx()+"_1' value='' size='10' maxlength='10'/> - ";
                    control += "<input type='text' readonly='' name='filter_"+items[i].getIdx()+"_2' id='filter_"+items[i].getIdx()+"_2' value='' size='10' maxlength='10'/>";
                    script += "$('#filter_"+items[i].getIdx()+"_1').datepicker("+pickerformat1+");\n$('#filter_"+items[i].getIdx()+"_2').datepicker("+pickerformat1+");\n";
                    params += "&filter_"+items[i].getIdx()+"_1=\"+$('#filter_"+items[i].getIdx()+"_1').val()+\"";
                    params += "&filter_"+items[i].getIdx()+"_2=\"+$('#filter_"+items[i].getIdx()+"_2').val()+\"";
                    break;
                case 5:
                    control = "<input type='text' readonly='' name='filter_"+items[i].getIdx()+"_1' id='filter_"+items[i].getIdx()+"_1' value='' size='10' maxlength='10'/> - ";
                    control += "<input type='text' readonly='' name='filter_"+items[i].getIdx()+"_2' id='filter_"+items[i].getIdx()+"_2' value='' size='10' maxlength='10'/>";
                    script += "$('#filter_"+items[i].getIdx()+"_1').datepicker("+pickerformat1+");\n$('#filter_"+items[i].getIdx()+"_2').datepicker("+pickerformat1+");\n";
                    params += "&filter_"+items[i].getIdx()+"_1=\"+$('#filter_"+items[i].getIdx()+"_1').val()+\"";
                    params += "&filter_"+items[i].getIdx()+"_2=\"+$('#filter_"+items[i].getIdx()+"_2').val()+\"";
                    // წელი თვე
                    break;
                case 6:
                    control = "<input type='text' readonly='' name='filter_"+items[i].getIdx()+"_1' id='filter_"+items[i].getIdx()+"_1' value='' size='10' maxlength='10'/> - ";
                    control += "<input type='text' readonly='' name='filter_"+items[i].getIdx()+"_2' id='filter_"+items[i].getIdx()+"_2' value='' size='10' maxlength='10'/>";
                    script += "$('#filter_"+items[i].getIdx()+"_1').datepicker("+pickerformat1+");\n$('#filter_"+items[i].getIdx()+"_2').datepicker("+pickerformat1+");\n";
                    params += "&filter_"+items[i].getIdx()+"_1=\"+$('#filter_"+items[i].getIdx()+"_1').val()+\"";
                    params += "&filter_"+items[i].getIdx()+"_2=\"+$('#filter_"+items[i].getIdx()+"_2').val()+\"";
                    // თარიღი თვე
                    break;
                default:
                    control = "<input type='text' name='filter_"+items[i].getIdx()+"' id='filter_"+items[i].getIdx()+"' value='' size='20'/>";
            }
        
        %>
        <li>
            <b><%=items[i].getName()%></b>
                <%=control%>
        </li>
        <%
    }
    for(int i=0;i<filters.length;i++){
        
        String control = "";
        switch(filters[i].getType().intValue()){
                case 0:
                    control = "<input type='text' name='afilter_"+filters[i].getReportsearchid()+"' id='afilter_"+filters[i].getReportsearchid()+"' value='' size='20'/>";
                    break;
                case 1:
                case 2:
                    control = "<input type='text' name='afilter_"+filters[i].getReportsearchid()+"_1' id='afilter_"+filters[i].getReportsearchid()+"_1' value='' size='10'/> - ";
                    control += "<input type='text' name='afilter_"+filters[i].getReportsearchid()+"_2' id='afilter_"+filters[i].getReportsearchid()+"_2' value='' size='10'/>";
                    params += "&afilter_"+items[i].getIdx()+"_1=\"+$('#afilter_"+filters[i].getReportsearchid()+"_1').val()+\"";
                    params += "&afilter_"+items[i].getIdx()+"_2=\"+$('#afilter_"+filters[i].getReportsearchid()+"_2').val()+\"";
                    break;
                case 3:
                case 4:
                    control = "<input type='text' readonly='' name='afilter_"+filters[i].getReportsearchid()+"_1' id='afilter_"+filters[i].getReportsearchid()+"_1' value='' size='10' maxlength='10'/> - ";
                    control += "<input type='text' readonly='' name='afilter_"+filters[i].getReportsearchid()+"_2' id='afilter_"+filters[i].getReportsearchid()+"_2' value='' size='10' maxlength='10'/>";
                    script += "$('#afilter_"+filters[i].getReportsearchid()+"_1').datepicker("+pickerformat1+");\n$('#afilter_"+filters[i].getReportsearchid()+"_2').datepicker("+pickerformat1+");\n";
                    params += "&afilter_"+filters[i].getReportsearchid()+"_1=\"+$('#afilter_"+filters[i].getReportsearchid()+"_1').val()+\"";
                    params += "&afilter_"+filters[i].getReportsearchid()+"_2=\"+$('#afilter_"+filters[i].getReportsearchid()+"_2').val()+\"";
                    break;
                case 5:
                    control = "<input type='text' readonly='' name='afilter_"+filters[i].getReportsearchid()+"_1' id='afilter_"+filters[i].getReportsearchid()+"_1' value='' size='10' maxlength='10'/> - ";
                    control += "<input type='text' readonly='' name='afilter_"+filters[i].getReportsearchid()+"_2' id='afilter_"+filters[i].getReportsearchid()+"_2' value='' size='10' maxlength='10'/>";
                    script += "$('#afilter_"+filters[i].getReportsearchid()+"_1').datepicker("+pickerformat1+");\n$('#afilter_"+filters[i].getReportsearchid()+"_2').datepicker("+pickerformat1+");\n";
                    params += "&afilter_"+filters[i].getReportsearchid()+"_1=\"+$('#afilter_"+filters[i].getReportsearchid()+"_1').val()+\"";
                    params += "&afilter_"+filters[i].getReportsearchid()+"_2=\"+$('#afilter_"+filters[i].getReportsearchid()+"_2').val()+\"";
                    // წელი თვე
                    break;
                case 6:
                    control = "<input type='text' readonly='' name='afilter_"+filters[i].getReportsearchid()+"_1' id='afilter_"+filters[i].getReportsearchid()+"_1' value='' size='10' maxlength='10'/> - ";
                    control += "<input type='text' readonly='' name='afilter_"+filters[i].getReportsearchid()+"_2' id='afilter_"+filters[i].getReportsearchid()+"_2' value='' size='10' maxlength='10'/>";
                    script += "$('#afilter_"+filters[i].getReportsearchid()+"_1').datepicker("+pickerformat1+");\n$('#afilter_"+filters[i].getReportsearchid()+"_2').datepicker("+pickerformat1+");\n";
                    params += "&afilter_"+filters[i].getReportsearchid()+"_1=\"+$('#afilter_"+filters[i].getReportsearchid()+"_1').val()+\"";
                    params += "&afilter_"+filters[i].getReportsearchid()+"_2=\"+$('#afilter_"+filters[i].getReportsearchid()+"_2').val()+\"";
                    // თარიღი თვე
                    break;
                default:
                    control = "<input type='text' name='afilter_"+filters[i].getReportsearchid()+"' id='afilter_"+filters[i].getReportsearchid()+"' value='' size='20'/>";
            }
        %>
        <li>
            <b><%=filters[i].getName()%></b>
                <%=control%>
        </li>
        <%
    }
    if(items.length+filters.length > 0){
        //params += "\"";
        %>
        <li>
                <button type="button" onclick="doSearch()" class="btn btn-sm btn-danger navbar-btn" style="cursor: pointer;">ძებნა</button>
        </li>
        <%
    }
    
    System.out.println(params);
    %>

<script>
    <%=script%>
   function doSearch(){ 
       $("#coll-css").collapse("toggle");
       jQuery("#report_<%=report.getReportid()%>").jqGrid().setGridParam({url: "content/reports/getreportlist.jsp?rid=<%=report.getReportid()%><%=params%>"}).trigger("reloadGrid");
   }
</script>
