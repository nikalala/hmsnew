<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<style>
.bootstrap-select:not([class*="col-"]):not([class*="form-control"]):not(.input-group-btn) {
    width: calc(100% - 120px);
}
input {
    width: calc(50% - 65px);
}
</style>
<%
    ReportBean report = ReportManager.getInstance().loadByPrimaryKey(new Integer(request.getParameter("rid")));
    ReportitemBean[] items = ReportitemManager.getInstance().loadByWhere("where reportid = "+report.getReportid()+" and search = true order by idx");
    ReportsearchBean[] filters = ReportsearchManager.getInstance().loadByWhere("where reportid = "+report.getReportid()+" order by name");

    Connection con = Manager.getInstance().getConnection();
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
                case 7:
                    if(items[i].getParam().trim().length() > 0){
                        control = "<select name='filter_"+items[i].getIdx()+"' id='filter_"+items[i].getIdx()+"'>\n<option value='0'>-- აირჩიეთ --</option>\n";
                        ResultSet rs7 = con.createStatement().executeQuery(items[i].getParam());
                        while(rs7.next()){
                            control += "<option value='"+rs7.getString(1)+"'>"+rs7.getString(2)+"</option>\n";
                        }
                        rs7.close();
                        control += "</select>";
                        params += "&filter_"+items[i].getIdx()+"=\"+$('#filter_"+items[i].getIdx()+"').val()+\"";
                    }
                    // სია ბაზიდან
                    break;
                case 8:
                    if(items[i].getParam().trim().length() > 0){
                        String[] pr = globalvars.get(items[i].getParam().trim());
                        control = "<select name='filter_"+items[i].getIdx()+"' id='filter_"+items[i].getIdx()+"'>\n<option value='-1'>-- აირჩიეთ --</option>\n";
                        for(int j=0;j<pr.length;j++){
                            control += "<option value='"+j+"'>"+pr[j]+"</option>\n";
                        }
                        control += "</select>";
                        params += "&filter_"+items[i].getIdx()+"=\"+$('#filter_"+items[i].getIdx()+"').val()+\"";
                    }
                    // სია ცვლადიდან
                    break;
                case 9:
                    // სია ბაზიდან Multi
                    break;
                case 10:
                    // სია ცვლადიდან Multi
                    break;
                case 11:
                    // სია ბაზიდან Radio
                    break;
                case 12:
                    // სია ცვლადიდან Radio
                    break;
                case 13:
                    // ერთი თარიღი
                    break;
                case 14:
                    // Radio
                    break;
                case 15:
                    // Checkbox
                    break;
                default:
                    control = "<input type='text' name='filter_"+items[i].getIdx()+"' id='filter_"+items[i].getIdx()+"' value='' size='20'/>";
            }
        
        %>
        <div class="col-md-4" style="padding: 5px;">
                <b class="pull-left" style="width: 100px;"><%=items[i].getName()%></b>
                    <%=control%>
        </div>
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
                case 7:
                    if(filters[i].getSql().trim().length() > 0){
                        control = "<select name='afilter_"+filters[i].getReportsearchid()+"' id='afilter_"+filters[i].getReportsearchid()+"'>\n<option value='0'>-- აირჩიეთ --</option>\n";
                        ResultSet rs7 = con.createStatement().executeQuery(filters[i].getSql());
                        while(rs7.next()){
                            control += "<option value='"+rs7.getString(1)+"'>"+rs7.getString(2)+"</option>\n";
                        }
                        rs7.close();
                        control += "</select>";
                        params += "&afilter_"+filters[i].getReportsearchid()+"=\"+$('#afilter_"+filters[i].getReportsearchid()+"').val()+\"";
                    }
                    // სია ბაზიდან
                    break;
                case 8:
                    if(filters[i].getSql().trim().length() > 0){
                        String[] pr = globalvars.get(filters[i].getSql().trim());
                        control = "<select name='afilter_"+filters[i].getReportsearchid()+"' id='afilter_"+filters[i].getReportsearchid()+"'>\n<option value='-1'>-- აირჩიეთ --</option>\n";
                        for(int j=0;j<pr.length;j++){
                            control += "<option value='"+j+"'>"+pr[j]+"</option>\n";
                        }
                        control += "</select>";
                        params += "&afilter_"+filters[i].getReportsearchid()+"=\"+$('#afilter_"+filters[i].getReportsearchid()+"').val()+\"";
                    }
                    // სია ცვლადიდან
                    break;
                default:
                    control = "<input type='text' name='afilter_"+filters[i].getReportsearchid()+"' id='afilter_"+filters[i].getReportsearchid()+"' value='' size='20'/>";
            }
        %>
        <div class="col-md-4" style="padding: 5px;">
                <b class="pull-left" style="width: 100px;"><%=filters[i].getName()%></b>
                <%=control%>
        </div>
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
    Manager.getInstance().releaseConnection(con);
    %>

<script>
    <%=script%>
   function doSearch(){ 
       $("#coll-css").collapse("toggle");
       jQuery("#report_<%=report.getReportid()%>").jqGrid().setGridParam({url: "content/reports/getreportlist.jsp?rid=<%=report.getReportid()%><%=params%>"}).trigger("reloadGrid");
   }
</script>
<script>
    $('select').selectpicker();
</script>
