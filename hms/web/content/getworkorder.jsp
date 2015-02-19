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
    <cell><%=workorderBeans[i].getRegdate()%></cell>
    <cell><%=workorderBeans[i].getRegdate()%></cell>
    <cell><%=workorderBeans[i].getAssignedtoid()%></cell>
    <cell><%=workorderBeans[i].getDeadline()%></cell>
    <cell><%=workOrderStatus[workorderBeans[i].getOrderstatus()]%></cell>
    <cell>
      <![CDATA[
      &nbsp;<a onclick="editWorkOrder(<%=workorderBeans[i].getWorkorderid()%>)"><i class="fa fa-pencil"></i></a>
      &nbsp;<i class="fa fa-edit"></i>
      &nbsp;<i class="fa fa-print"></i>
      ]]>
    </cell>
  </row>
  <% } %>
</rows>