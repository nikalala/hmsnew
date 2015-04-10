<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/xml;charset=utf-8"%>
<%@include file="../includes/initxml.jsp"%>
<%
PersonellBean personell = PersonellManager.getInstance().loadByPrimaryKey(new Integer(request.getParameter("personellid")));
String where = "where personellid = "+personell.getPersonellid()+" ";
String listid = request.getParameter("listid");
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

int count = PcontractManager.getInstance().countWhere(where);
int total_pages = 0;
if(count > 0 && ilmt > 0)    total_pages = (int)(count/ilmt);
if(total_pages*ilmt < count)    total_pages++;
if(ipg > total_pages) ipg=total_pages;
int start = ilmt*ipg - ilmt;
if(start < 0)  start = 0;
String limit = "limit "+ilmt+" offset "+start;

String order = "order by "+sidx+" "+sord;  //order by "+sidx+" "+sord;

PcontractBean[] contracts = PcontractManager.getInstance().loadByWhere(where+" "+order+" "+limit);
%>
<rows>
    <page><%=ipg%></page>
    <total><%=total_pages%></total>
    <records><%=count%></records>
    <%
    for(int i=0;i<contracts.length;i++)
        {
        String url1 = "";
        String url2 = "";
        String url3 = "";
        if(contracts[i].getContent() == null){
            url1 = "<span class='ui-icon ui-icon-plus' style='cursor: pointer; text-align: center;' onclick='uploadContract("+contracts[i].getPcontractid()+",\""+listid+"\")'></span>";
        } else {
            url2 = "<span class='ui-icon ui-icon-trash' style='cursor: pointer;' onclick=\"delContract("+contracts[i].getPcontractid()+",'"+listid+"')\"></span>";
            url3 = "<span class='ui-icon ui-icon-print' style='cursor: pointer;' onclick=\"printContract("+contracts[i].getPcontractid()+")\"></span>";
        }
        
        %>
	<row id='<%=contracts[i].getPcontractid()%>'>
            <cell><![CDATA[<%=contracts[i].getNum()%>]]></cell>
            <cell><![CDATA[<%=dt.format(contracts[i].getStartdate())%>]]></cell>
            <cell><![CDATA[<%=dt.format(contracts[i].getEnddate())%>]]></cell>
            <cell><![CDATA[<%=dc.format(contracts[i].getSalary())%>]]></cell>
            <cell><![CDATA[<%=dc.format(contracts[i].getPremium())%>]]></cell>
            <cell><![CDATA[<%=dc.format(contracts[i].getPremium1000())%>]]></cell>
            <cell><![CDATA[<%=dc.format(contracts[i].getHours())%>]]></cell>
            <cell><![CDATA[<%=url1%>]]></cell>
            <cell><![CDATA[<%=url2%>]]></cell>
            <cell><![CDATA[<%=url3%>]]></cell>
	</row>
    <%
        }
    %>
</rows>
