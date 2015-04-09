<%@ page language="java" pageEncoding="utf8" %>
<%@include file="../includes/init.jsp" %>

<%

    String wid = (String) request.getParameter("wid");
    if (CodeHelpers.isNullOrEmpty(wid)) {
        return;
    }
    WorkorderlogBean[] logs = WorkorderlogManager.getInstance().loadByWhere("where workorderid = " + wid + " ORDER BY workorderlogid DESC");
    String retVal = "";
    if (logs != null) {
        for (int i = 0; i < logs.length; i++) {
            retVal += "<tr><td style='padding-left: 10px !important; height: 30px;'>";
            if(!CodeHelpers.isNullOrEmpty(logs[i].getNote())){
                retVal += logs[i].getRegbyid() + " (" + logs[i].getRegdate() + ") => შენიშვნა " + logs[i].getNote() + "<br /><br />";
            }else{
                retVal += logs[i].getRegbyid() + " (" + logs[i].getRegdate() + ") => მიბმულია " + logs[i].getAssignedto() + URLDecoder.decode(" => სტატუსი ", "UTF-8") + logs[i].getStatus() +
                " => კატეგორია " + logs[i].getCategory() +
                " => პრიორიტეტი " + logs[i].getPriority();
            }
            retVal += "</td></tr>";
        }
    }
%>
<%=retVal.trim()%>