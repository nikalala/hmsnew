<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/xml;charset=utf-8" %>
<%@include file="../includes/initxml.jsp" %>
<rows>
    <% for (int i = 0; i < 10; i++) { %>
    <row id="<%=i%>">
        <cell><%=i+300%></cell>
        <cell><![CDATA[<div class="truncate">2014.05.07</div>]]></cell>
        <cell><![CDATA[<div class="truncate">2014.05.14</div>]]></cell>
        <cell>
            <![CDATA[<div class="truncate">2014.05.07</div>]]>
        </cell>
        <cell>Admin</cell>
        <cell>Clean Up</cell>
        <cell>
            <![CDATA[
      &nbsp;<a onclick="editBlock(<%=i%>)"><i class="fa fa-pencil"></i></a>
      &nbsp;<i onclick="changeRemark(<%=i%>)" class="fa fa-edit"></i>
      ]]>
        </cell>
    </row>
    <% } %>
</rows>