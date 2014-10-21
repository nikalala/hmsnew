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
<%@include file="../../includes/meta.jsp" %>
<%
SimpleDateFormat sdt = new SimpleDateFormat("dd/MM/yyyy");
SimpleDateFormat sdt0 = new SimpleDateFormat("dd/MM/yyyy HH:mm");

String where = "";

String filter =request.getParameter("filters");
if(filter != null && filter.trim().length() > 0)
    {
    filter =  eReg(filter).trim();
    
    JSONObject json = (JSONObject) JSONSerializer.toJSON( filter );
    String groupOp = json.getString("groupOp");
    
    JSONArray rules = json.getJSONArray("rules");
    int rulesCount = JSONArray.getDimensions(rules)[0];
    for(int i = 0; i<rulesCount; i++)
        {
        JSONObject rule = rules.getJSONObject(i);
      
        String field = rule.getString("field");
        String oper = rule.getString("op");
        String data = rule.getString("data").replaceAll("'", "''");
        
        String wrest = "";

        if(oper.equals("eq") )
            {
            wrest += " = to_timestamp('"+data+"','DD/MM/YYYY')";
            }
        else if(oper.equals("ne") )
            {
            }
        else if(oper.equals("lt") )
            {
            }
        else if(oper.equals("le") )
            {
            }
        else if(oper.equals("gt") )
            {
            }
        else if(oper.equals("ge") )
            {
            }
        else if(oper.equals("bw") )  wrest += " like '"+data+"%'";
        else if(oper.equals("bn") )  wrest += " not like '"+data+"%'";
        else if(oper.equals("in") )  wrest += " like '%"+data+"%'";
        else if(oper.equals("ni") )  wrest += " not like '%"+data+"%'";
        else if(oper.equals("ew") )  wrest += " like '%"+data+"'";
        else if(oper.equals("en") )  wrest += " not like '%"+data+"'";
        else if(oper.equals("cn") )  wrest += " like '%"+data+"%'";
        else if(oper.equals("nc") )  wrest += " not like '"+data+"'";

        where += " "+groupOp + " "+field +" "+wrest;
        }
    }



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


int count = PaymentmethodManager.getInstance().countWhere(where);
int total_pages = 0;
if(count > 0)    total_pages = (int)(count/ilmt);
if(total_pages*ilmt < count)    total_pages++;
if(ipg > total_pages) ipg=total_pages;
int start = ilmt*ipg - ilmt;
if(start < 0)   start = 0;
String limit = "limit "+ilmt+" offset "+start;

String order = "order by "+sidx+", paymentmethodid "+sord;

PaymentmethodBean[] methods = PaymentmethodManager.getInstance().loadByWhere(where+" "+order+" "+limit);
%>
<rows>
    <page><%=ipg%></page>
    <total><%=total_pages%></total>
    <records><%=count%></records>
    <%
        for(int i=0;i<methods.length;i++)
            {
            String status = "გაუქმებული";
            if(methods[i].getStatus().booleanValue())
                status = "აქტიური";
            
            ChangelogBean[] chlog = ChangelogManager.getInstance().loadByWhere("where name = 'PAYMENTMETHOD' and id = "+methods[i].getPaymentmethodid()+" order by changedate asc limit 1");
            PersonellBean createdby = PersonellManager.getInstance().loadByPrimaryKey(chlog[0].getChangebyid());
            chlog = ChangelogManager.getInstance().loadByWhere("where name = 'PAYMENTMETHOD' and id = "+methods[i].getPaymentmethodid()+" order by changedate desc limit 1");
            String chdate = dtlong.format(chlog[0].getChangedate().getTime());
            
            %>
            <row id='<%=methods[i].getPaymentmethodid()%>'>
                <cell><![CDATA[<%=methods[i].getName()%>]]></cell>
                <cell><![CDATA[<%=methods[i].getNickname()%>]]></cell>
                <cell><![CDATA[<%=createdby.getLname()%> <%=createdby.getFname()%>]]></cell>
                <cell><![CDATA[<%=chdate%>]]></cell>
                <cell><![CDATA[<%=status%>]]></cell>
            </row>
            <%
            }
    %>
</rows>
