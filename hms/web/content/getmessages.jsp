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
    MessageBean[] messages = MessageManager.getInstance().loadByWhere("where reservationid = " + rid);
    GuestBean guestBean = null;
    if(messages == null || messages.length == 0){%>
    </rows>
    <%
        return;
    }
%>
    <% for(int i = 0; i < messages.length; i++){
        GuestBean g = GuestManager.getInstance().loadByPrimaryKey(messages[i].getGuestid());
    %>
        <row id='<%=messages[i].getMessageid()%>'>
            <cell><![CDATA[<%=messages[i].getName()%><br/><%=df3.format(messages[i].getRegdate())%>]]></cell>
            <cell><![CDATA[<%=g.getFname() + " " + g.getLname() %>]]></cell>
            <cell><![CDATA[<%=room%>]]></cell>
            <cell><![CDATA[<%=messageStatuses[messages[i].getStid()]%>]]></cell>
            <cell><![CDATA[

            <i onclick="updateST(<%=messages[i].getMessageid()%>,this)" style="font-size: 15px;  margin-left:10px; cursor:pointer;" class="fa fa-wrench"></i>
            <i onclick="editPref(<%=messages[i].getMessageid()%>,<%=messages[i].getGuestid()%>,'<%=messages[i].getName()%>')" style="font-size: 15px; cursor:pointer;  margin-left:10px;" class="fa fa-edit"></i>
            <i onclick="removePref(<%=messages[i].getMessageid()%>)" style="font-size: 15px;  margin-left:10px; cursor:pointer;" class="fa fa-times"></i>

                    ]]></cell>
        </row>
    <% } %>
</rows>
