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
    PreferenceBean[] prefs = PreferenceManager.getInstance().loadByWhere("where reservationid = " + rid);
    if(prefs == null || prefs.length == 0){%>
    </rows>
    <%
        return;
    }
    PreferencetypeBean pt = PreferencetypeManager.getInstance().loadByPrimaryKey(prefs[0].getPreferencetypeid());

%>
    <% for(int i = 0; i < prefs.length; i++){ %>
        <row id='<%=prefs[i].getPreferenceid()%>'>
            <cell><![CDATA[<%=prefs[i].getName()%>]]></cell>
            <cell><![CDATA[<%=room%>]]></cell>
            <cell><![CDATA[<%=pt.getName()%>]]></cell>
            <cell><![CDATA[

            <i onclick="editPref(<%=prefs[i].getPreferenceid()%>,<%=pt.getPreferencetypeid()%>,'<%=prefs[i].getName()%>')" style="font-size: 15px; cursor:pointer;  margin-left:10px;" class="fa fa-edit"></i>
            <i onclick="removePref(<%=prefs[i].getPreferenceid()%>)" style="font-size: 15px;  margin-left:10px; cursor:pointer;" class="fa fa-times"></i>

                    ]]></cell>
        </row>
    <% } %>
</rows>
