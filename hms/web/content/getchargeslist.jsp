<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/xml;charset=utf-8"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="java.net.*"%>
<%@page import="java.io.*"%>
<%@page import="com.mysoft.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.mysoft.hms.*"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="jxl.*"%>
<%@page import="jxl.write.*"%>
<%@page import="java.lang.*"%>
<%@page import="net.sf.json.*"%>
<%@include file="../includes/meta.jsp" %>
<%

SimpleDateFormat sdt = new SimpleDateFormat("dd/MM/yyyy");
SimpleDateFormat sdt0 = new SimpleDateFormat("dd/MM/yyyy HH:mm");

FolioitemBean[] folios = (FolioitemBean[])session.getAttribute("CHARGES_LIST_WHERE");
if(folios == null)   folios = new FolioitemBean[0];


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

int count = folios.length;
int total_pages = 0;
if(count > 0)    total_pages = (int)(count/ilmt);
if(total_pages*ilmt < count)    total_pages++;
if(ipg > total_pages) ipg=total_pages;
int start = ilmt*ipg - ilmt;
if(start < 0)   start = 0;
String limit = "limit "+ilmt+" offset "+start;

String order = "order by "+sidx+" "+sord+", currencyid";


%>
<rows>
    <page><%=ipg%></page>
    <total><%=total_pages%></total>
    <records><%=count%></records>
    <%
    double tot = 0;
        for(int i=0;i<folios.length;i++)
            {
            String description = "";
            String note = folios[i].getNote();
            double amount = folios[i].getAmount().doubleValue();
            tot += amount;
            if(folios[i].getPayoutid() != null){
                PayoutBean payout = PayoutManager.getInstance().loadByPrimaryKey(folios[i].getPayoutid());
                description = payout.getName();
            }
            String z = "false";
            if(folios[i].getZvoid() != null && folios[i].getZvoid().booleanValue()) z = "true";
            %>
            <row id='<%=i+1%>'>
                <cell><![CDATA[<%=i+1%>]]></cell>
                <cell><![CDATA[<%=folios[i].getRefno()%>]]></cell>
                <cell><![CDATA[<%=description%>]]></cell>
                <cell><![CDATA[<%=note%>]]></cell>
                <cell><![CDATA[<%=dc.format(amount)+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"%>]]></cell>
                <cell><![CDATA[<%=z%>]]></cell>
            </row>
            <%
            }
    %>
    <userdata name="amount"><%=dc.format(tot)%></userdata>
    <userdata name="serno"><![CDATA[არჩეულის ]]></userdata>
    <userdata name="refno"><![CDATA[<a class="btn btn-default" onclick="voidCharges()">წაშლა</a> ]]></userdata>
</rows>
