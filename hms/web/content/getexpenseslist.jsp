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
int cnt = 200;
SimpleDateFormat sdt = new SimpleDateFormat("dd/MM/yyyy");
SimpleDateFormat sdt0 = new SimpleDateFormat("dd/MM/yyyy HH:mm");

String where = "";

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


int count = cnt;
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
        for(int i=0;i<cnt;i++)
            {
            
            %>
            <row id='<%=i%>'>
                <cell><![CDATA[<%="ასლფჰგჯკლსჰფგჰჯკლგ"%>]]></cell>
                <cell><![CDATA[<%="ასლფჰგჯკლსჰფგჰჯკლგ"%>]]></cell>
                <cell><![CDATA[<%="ასლფჰგჯკლსჰფგჰჯკლგ"%>]]></cell>
                <cell><![CDATA[<%="ასლფჰგჯკლსჰფგჰჯკლგ"%>]]></cell>
                <cell><![CDATA[<%="100.00"%>]]></cell>
            </row>
            <%
            }
    %>
    <userdata name="amount">2000.00</userdata>
</rows>
