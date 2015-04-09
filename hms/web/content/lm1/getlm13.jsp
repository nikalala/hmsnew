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
SimpleDateFormat sdt1 = new SimpleDateFormat("dd/MM");

String where = " ";

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

String xmlout = "";

RoomtypeBean[] roomtypes = RoomtypeManager.getInstance().loadByWhere("order by name");
TarifftypeBean[] tarifftypes = TarifftypeManager.getInstance().loadByWhere("where status = true order by name");
SeasonBean[] seasons = SeasonManager.getInstance().loadByWhere("where status = true order by name");
AgentBean[] agents = AgentManager.getInstance().loadByWhere("order by name, lname, fname");

int n = 1;
for(int i=0;i<roomtypes.length;i++){
    for(int j=0;j<tarifftypes.length;j++){
        xmlout += "<row id='"+roomtypes[i].getRoomtypeid()+"_"+tarifftypes[j].getTarifftypeid()+"_0_0'>\n";
        xmlout += "<cell>"+n+"</cell>\n";
        xmlout += "<cell><![CDATA["+roomtypes[i].getName()+"]]></cell>\n";
        xmlout += "<cell><![CDATA["+tarifftypes[j].getName()+"]]></cell>\n";
        
        xmlout += "<cell><![CDATA[არცერთი]]></cell>\n";
        xmlout += "<cell><![CDATA[არცერთი]]></cell>\n";
        
        TariffBean[] tariff = TariffManager.getInstance().loadByWhere("where roomtypeid = "+roomtypes[i].getRoomtypeid()+" and tarifftypeid = "+tarifftypes[j].getTarifftypeid()+" and seasonid is null and sourceid is null");
        if(tariff.length > 0){
            xmlout += "<cell>"+dc.format(tariff[0].getAmount().doubleValue())+"</cell>\n";
            xmlout += "<cell>"+dc.format(tariff[0].getAmountadult().doubleValue())+"</cell>\n";
            xmlout += "<cell>"+dc.format(tariff[0].getAmountchild().doubleValue())+"</cell>\n";
        } else {
            xmlout += "<cell>0.00</cell>\n";
            xmlout += "<cell>0.00</cell>\n";
            xmlout += "<cell>0.00</cell>\n";
        }
        xmlout += "</row>\n";
        n++;
        
        for(int k=0;k<seasons.length;k++){
            xmlout += "<row id='"+roomtypes[i].getRoomtypeid()+"_"+tarifftypes[j].getTarifftypeid()+"_"+seasons[k].getSeasonid()+"_0'>\n";
            xmlout += "<cell>"+n+"</cell>\n";
            xmlout += "<cell><![CDATA["+roomtypes[i].getName()+"]]></cell>\n";
            xmlout += "<cell><![CDATA["+tarifftypes[j].getName()+"]]></cell>\n";
            xmlout += "<cell><![CDATA["+seasons[k].getName()+"]]></cell>\n";

            xmlout += "<cell><![CDATA[არცერთი]]></cell>\n";

            tariff = TariffManager.getInstance().loadByWhere("where roomtypeid = "+roomtypes[i].getRoomtypeid()+" and tarifftypeid = "+tarifftypes[j].getTarifftypeid()+" and seasonid = "+seasons[k].getSeasonid()+" and sourceid is null");
            if(tariff.length > 0){
                xmlout += "<cell>"+dc.format(tariff[0].getAmount().doubleValue())+"</cell>\n";
                xmlout += "<cell>"+dc.format(tariff[0].getAmountadult().doubleValue())+"</cell>\n";
                xmlout += "<cell>"+dc.format(tariff[0].getAmountchild().doubleValue())+"</cell>\n";
            } else {
                xmlout += "<cell>0.00</cell>\n";
                xmlout += "<cell>0.00</cell>\n";
                xmlout += "<cell>0.00</cell>\n";
            }
            xmlout += "</row>\n";
            n++;
            
            for(int l=0;l<agents.length;l++){
                String aname = agents[l].getName();
                if(!agents[l].getType().booleanValue())
                    aname = agents[l].getLname()+" "+agents[l].getFname();
                xmlout += "<row id='"+roomtypes[i].getRoomtypeid()+"_"+tarifftypes[j].getTarifftypeid()+"_"+seasons[k].getSeasonid()+"_"+agents[l].getAgentid()+"'>\n";
                xmlout += "<cell>"+n+"</cell>\n";
                xmlout += "<cell><![CDATA["+roomtypes[i].getName()+"]]></cell>\n";
                xmlout += "<cell><![CDATA["+tarifftypes[j].getName()+"]]></cell>\n";
                xmlout += "<cell><![CDATA["+seasons[k].getName()+"]]></cell>\n";
                xmlout += "<cell><![CDATA["+aname+"]]></cell>\n";

                tariff = TariffManager.getInstance().loadByWhere("where roomtypeid = "+roomtypes[i].getRoomtypeid()+" and tarifftypeid = "+tarifftypes[j].getTarifftypeid()+" and seasonid = "+seasons[k].getSeasonid()+" and sourceid = "+agents[l].getAgentid());
                if(tariff.length > 0){
                    xmlout += "<cell>"+dc.format(tariff[0].getAmount().doubleValue())+"</cell>\n";
                    xmlout += "<cell>"+dc.format(tariff[0].getAmountadult().doubleValue())+"</cell>\n";
                    xmlout += "<cell>"+dc.format(tariff[0].getAmountchild().doubleValue())+"</cell>\n";
                } else {
                    xmlout += "<cell>0.00</cell>\n";
                    xmlout += "<cell>0.00</cell>\n";
                    xmlout += "<cell>0.00</cell>\n";
                }
                xmlout += "</row>\n";
                n++;
            }
            
        }
    }
}

int count = n;
int total_pages = 0;
if(count > 0)    total_pages = (int)(count/ilmt);
if(total_pages*ilmt < count)    total_pages++;
if(ipg > total_pages) ipg=total_pages;
int start = ilmt*ipg - ilmt;
if(start < 0)   start = 0;
String limit = "limit "+ilmt+" offset "+start;

String order = "order by "+sidx+", t.tarifftypeid "+sord;




%>
<rows>
    <page><%=ipg%></page>
    <total><%=total_pages%></total>
    <records><%=count%></records>
    <%=xmlout%>
</rows>
