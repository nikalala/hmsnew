<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/xml;charset=utf-8" %>
<%@include file="../includes/initxml.jsp" %>
<rows>
<%
    String rid = (String) request.getParameter("rid");
    String room = "";
    if((String) request.getParameter("roomid") != null){
        room = request.getParameter("roomid");
    }
    TaskBean[] prefs = TaskManager.getInstance().loadByWhere("where reservationid = " + rid);
    if(prefs == null || prefs.length == 0){%>
    </rows>
    <%
        return;
    }
%>
    <% for(int i = 0; i < prefs.length; i++){ %>
        <row id='<%=prefs[i].getTaskid()%>'>
            <cell><![CDATA[<%=prefs[i].getName()%><br/><%=prefs[i].getDuedate()%>]]></cell>
            <cell><![CDATA[<%=departments[prefs[i].getDepid()]%>]]></cell>
            <cell><![CDATA[<%=room%>]]></cell>
            <cell><![CDATA[<%=alerts[prefs[i].getAlertid()]%>]]></cell>
            <cell><![CDATA[<%=taskStatuses[prefs[i].getStid()]%>]]></cell>
            <cell><![CDATA[

            <i onclick="editPref(<%=prefs[i].getTaskid()%>,,'<%=prefs[i].getName()%>')" style="font-size: 15px; cursor:pointer;  margin-left:10px;" class="fa fa-edit"></i>
            <i onclick="removePref(<%=prefs[i].getTaskid()%>)" style="font-size: 15px;  margin-left:10px; cursor:pointer;" class="fa fa-times"></i>

                    ]]></cell>
        </row>
    <% } %>
</rows>
