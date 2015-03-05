<%@ page import="org.apache.xmlbeans.impl.xb.ltgfmt.Code" %><?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/xml;charset=utf-8" %>
<%@include file="../includes/initxml.jsp" %>

<%
    String dtfrom = (String) request.getParameter("dtfrom");
    String dtto = (String) request.getParameter("dtto");
    String roomBean = (String) request.getParameter("roomBean");
    String roomType = (String) request.getParameter("roomType");
    String unblock = (String) request.getParameter("unblock");
    String where = "";

    if(!CodeHelpers.isNullOrEmpty(unblock) && unblock.equals("on")){
        where += "where (" + unblock + " = on OR on = " + unblock + ")";
    }else{
        where += "where 2 = 2";
    }
    if(!CodeHelpers.isNullOrEmpty(dtfrom) && !CodeHelpers.isNullOrEmpty(dtto)){
        where += " AND blockstart::date >= to_date('" + dtfrom + "','dd.mm.yyyy') AND to_date('" + dtto + "','dd.mm.yyyy') <= blockend::date " +
                " AND (" + roomBean + " = 0 OR roomid = " + roomBean + ")";
    }
    System.out.println(where);
    VBlockroomBean[] blockList = VBlockroomManager.getInstance().loadByWhere(where);
%>

<rows>
    <% for (int i = 0; i < blockList.length; i++) { %>
    <row id="<%=blockList[i].getBlockroomid()%>">
        <cell><%=blockList[i].getRoom() + " - " + blockList[i].getRoomtype()%></cell>
        <cell><![CDATA[<div class="truncate"><%=blockList[i].getBlockstart()%></div>]]></cell>
        <cell><![CDATA[<div class="truncate"><%=blockList[i].getBlockend()%></div>]]></cell>
        <cell>
            <![CDATA[<div class="truncate"><%=blockList[i].getBlockend()%></div>]]>
        </cell>
        <cell><%=blockList[i].getCreatedby()%></cell>
        <cell><%=blockList[i].getReason()%></cell>
        <cell>
            <![CDATA[
      &nbsp;<a onclick="editBlock(<%=blockList[i].getBlockroomid()%>)"><i class="fa fa-pencil"></i></a>
      &nbsp;<i onclick="changeRemark(<%=blockList[i].getBlockroomid()%>)" class="fa fa-edit"></i>
      ]]>
        </cell>
    </row>
    <% } %>
</rows>