<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/xml;charset=utf-8"%>
<%@include file="../../includes/initxml.jsp" %>
<%
int ipg = 1;
int ilmt = 10;
String pg = request.getParameter("page");
if(pg != null)  ipg = Integer.parseInt(pg);
String lmt = request.getParameter("rows");
if(lmt != null) ilmt = Integer.parseInt(lmt);
String sidx = request.getParameter("sidx");
if(sidx == null)    sidx = "";
String sord = request.getParameter("sord");
if(sord == null)    sord = "";
//if(isidx == 0) isidx = 1;


int count = RoomstatusManager.getInstance().countAll();
int total_pages = 0;
if(count > 0)    total_pages = (int)(count/ilmt);
if(total_pages*ilmt < count)    total_pages++;
if(ipg > total_pages) ipg=total_pages;
int start = ilmt*ipg - ilmt;
if(start < 0)   start = 0;
String limit = "limit "+ilmt+" offset "+start;

String order = "order by "+sidx+" "+sord+", productroomid";
RoomstatusBean[] statuses = RoomstatusManager.getInstance().loadByWhere("order by name");
%>
<rows>
    <page><%=ipg%></page>
    <total><%=total_pages%></total>
    <records><%=count%></records>
    <%
        for(int i=0;i<statuses.length;i++)
            {
            String clr = "<img src=\"images/blank.gif\" align=\"middle\" width=\"70\" height=\"20\" style=\"background-color: "+statuses[i].getColor()+";\"/>";
    %>
            <row id='<%=statuses[i].getRoomstatusid()%>'>
                <cell><%=String.valueOf(i+1)%></cell>
                <cell><![CDATA[<%=statuses[i].getName()%>]]></cell>
                <cell><![CDATA[<%=statuses[i].getColor()%>]]></cell>
                <cell><![CDATA[<%=clr%>]]></cell>
            </row>
            <%
            }
    %>
</rows>
