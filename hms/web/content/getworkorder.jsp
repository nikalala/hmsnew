<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/xml;charset=utf-8" %>
<%@include file="../includes/initxml.jsp" %>
<%
  WorkorderBean[] workorderBeans = WorkorderManager.getInstance().loadByWhere("");

%>
<rows>
<% for(int i = 0; i<workorderBeans.length; i++){ %>
  <row id="<%=workorderBeans[i].getWorkorderid()%>">
    <cell><%=workorderBeans[i].getNum()%></cell>
    <cell><%=workorderBeans[i].getDescription()%></cell>
    <cell><%=workOrderCategory[workorderBeans[i].getCategory()]%></cell>
    <cell><%=workorderBeans[i].getRoomid()%></cell>
    <cell><%=workOrderPriority[workorderBeans[i].getPriority()]%></cell>
    <cell><%=dt.format(workorderBeans[i].getRegdate())%></cell>
    <cell><% if (workorderBeans[i].getUpdatedon() != null) { %><%=dt.format(workorderBeans[i].getUpdatedon())%><% } %></cell>
    <cell><%=workorderBeans[i].getAssignedtoid()%></cell>
    <cell><% if (workorderBeans[i].getDeadline() != null) { %><%=dt.format(workorderBeans[i].getDeadline())%><% } %></cell>
    <cell><%=workOrderStatus[workorderBeans[i].getOrderstatus()]%></cell>
    <cell>
      <![CDATA[
      &nbsp;<a onclick="editWorkOrder(<%=workorderBeans[i].getWorkorderid()%>)"><i class="fa fa-pencil"></i></a>
      &nbsp;<i onclick="changeRemark(<%=workorderBeans[i].getWorkorderid()%>,this)" class="fa fa-edit"></i>
      &nbsp;<i class="fa fa-print"></i>
      ]]>
    </cell>
  </row>
  <% } %>
</rows>