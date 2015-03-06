<%@ page import="org.apache.xmlbeans.impl.xb.ltgfmt.Code" %><?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/xml;charset=utf-8" %>
<%@include file="../includes/initxml.jsp" %>

<%
    String dtfrom = (String) request.getParameter("dtfrom");
    String dtto = (String) request.getParameter("dtto");
    String roomBean = (String) request.getParameter("roomBean");
    String roomType = (String) request.getParameter("roomType");
    String unblock = (String) request.getParameter("unblock");
    String showall = (String) request.getParameter("showall");
    String where = "";

    if (!CodeHelpers.isNullOrEmpty(showall)) {
        where = " where isunblocked = false ";
    } else {
        if (!CodeHelpers.isNullOrEmpty(unblock) && unblock.equals("on")) {
            where += " where isunblocked = true ";
        } else {
            where += " where isunblocked = false ";
        }

        if (!CodeHelpers.isNullOrEmpty(dtfrom) && !CodeHelpers.isNullOrEmpty(dtto)) {
            String filterByRoom = " AND (" + roomBean + " = 0 OR roomid = " + roomBean + ")";
            if (!roomType.equals("0") && roomBean.equals("0")) {
                filterByRoom = " AND roomid IN (SELECT roomid FROM room where roomtypeid = " + roomType + ")";
            }
            where += " AND blockstart::date >= to_date('" + dtfrom + "','dd.mm.yyyy') AND to_date('" + dtto + "','dd.mm.yyyy') >= blockend::date " + filterByRoom;
        }
    }

    VBlockroomBean[] blockList = VBlockroomManager.getInstance().loadByWhere(where);
%>

<rows>
    <% for (int i = 0; i < blockList.length; i++) { %>
    <row id="<%=blockList[i].getBlockroomid()%>">
        <cell><%=blockList[i].getRoom() + " - " + blockList[i].getRoomtype()%></cell>
        <cell><![CDATA[<div class="truncate"><% if (blockList[i].getBlockstart() != null) { %>
                <%=dt.format(blockList[i].getBlockstart())%>
                <% } %></div>]]></cell>
        <cell><![CDATA[<div class="truncate"><% if (blockList[i].getBlockend() != null) { %>
                <%=dt.format(blockList[i].getBlockend())%>
                <% } %></div>]]></cell>
        <cell>
            <![CDATA[<div class="truncate"><%=dt.format(blockList[i].getRegdate())%></div>]]>
        </cell>
        <cell><%=blockList[i].getCreatedby()%></cell>
        <cell><%=blockList[i].getReason()%></cell>
        <cell>
            <![CDATA[
      <% if(!blockList[i].getIsunblocked()){ %>&nbsp;<a onclick="newsWindow1('blockunblock','დაბლოკვა/მოხსნა','roomid=<%=blockList[i].getRoomid()%>&blockroomid=<%=blockList[i].getBlockroomid()%>')"><i class="fa fa-pencil"></i></a><% } %>
      &nbsp;<i onclick="changeRemark(<%=blockList[i].getBlockroomid()%>)" class="fa fa-edit"></i>
      ]]>
        </cell>
    </row>
    <% } %>
</rows>