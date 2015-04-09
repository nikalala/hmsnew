<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/xml;charset=utf-8" %>
<%@include file="../includes/initxml.jsp" %>
<%
    VWorkorderBean[] workorderBeans = null;
    String orderstatus =  request.getParameter("orderstatus");
    String wCategory = request.getParameter("workOrderCategory");
    if (!CodeHelpers.isNullOrEmpty(orderstatus) && orderstatus.equals("1")) {
        workorderBeans = VWorkorderManager.getInstance().loadByWhere("where orderstatus = 1");
    } else if (!CodeHelpers.isNullOrEmpty(wCategory)) {
        String where = "where (" + wCategory + " = -1 OR category = " + wCategory + ") ";
        String wunits =  request.getParameter("units");
        String wprio = request.getParameter("workOrderPriority");
        String num = request.getParameter("ordernum");
        String st = request.getParameter("workOrderStatus");
        String personnel = request.getParameter("personnel");
        String compl_work_orders = request.getParameter("compl_work_orders");
        String isroom = request.getParameter("isroom");
        if (!wunits.equals("-1")) {
            where += !CodeHelpers.isNullOrEmpty(isroom) ? " AND roomid = " + wunits : " AND houseunitid = " + wunits;
        }
        if (!wprio.equals("-1")) {
            where += " AND priority = " + wprio;
        }
        if (!CodeHelpers.isNullOrEmpty(num)) {
            where += " AND num = N'" + num + "'";
        }
        if (!st.equals("-1")) {
            where += " AND orderstatus = " + st;
        }
        if (!personnel.equals("-1")) {
            where += " AND assignedtoid = " + personnel;
        }
        if (!personnel.equals("-1")) {
            where += " AND assignedtoid = " + personnel;
        }
        if (!CodeHelpers.isNullOrEmpty(compl_work_orders)) {
            if(compl_work_orders.equals("on")){
                where += " AND orderstatus = 1 ";
            }else{
                where += " AND  orderstatus != 1 ";
            }
        }else{
            where += " AND  orderstatus != 1 ";
        }
        System.out.println(where);
        workorderBeans = VWorkorderManager.getInstance().loadByWhere(where + " ORDER BY workorderid ASC");
    } else {
        String tmp = "where orderstatus != 1 ORDER BY workorderid ASC";
        System.out.println(tmp);
        workorderBeans = VWorkorderManager.getInstance().loadByWhere(tmp);
    }

%>
<rows>
    <% for (int i = 0; i < workorderBeans.length; i++) { %>
    <row id="<%=workorderBeans[i].getWorkorderid()%>">
        <cell><%=workorderBeans[i].getNum()%></cell>
        <cell><![CDATA[<div class="truncate"><%=workorderBeans[i].getDescription()%></div>]]></cell>
        <cell><%=workOrderCategory[workorderBeans[i].getCategory()]%></cell>
        <cell>
            <![CDATA[<div class="truncate"><% if(!CodeHelpers.isNullOrEmpty(workorderBeans[i].getRname())){%>  <%=workorderBeans[i].getRname() + " - " + workorderBeans[i].getCode() %>  <% }else{ %> <%= workorderBeans[i].getHname()%>  <%} %></div>]]></cell>
        <cell><%=workOrderPriority[workorderBeans[i].getPriority()]%></cell>
        <cell><%=dt.format(workorderBeans[i].getRegdate())%></cell>
        <cell><% if (workorderBeans[i].getUpdatedon() != null) { %><%=dt.format(workorderBeans[i].getUpdatedon())%><% } %></cell>
        <cell><![CDATA[<div class="truncate"><%=workorderBeans[i].getAssignedto()%></div>]]></cell>
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