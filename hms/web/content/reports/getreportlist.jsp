<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/xml;charset=utf-8"%>
<%@include file="../../includes/initxml.jsp"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%
SimpleDateFormat tmpfmt = null;
ReportBean report = ReportManager.getInstance().loadByPrimaryKey(new Integer(request.getParameter("rid")));
ReportitemBean[] items = ReportitemManager.getInstance().loadByWhere("where reportid = "+report.getReportid()+" order by idx");

int fcnt = 0;
if(request.getParameter("filter_cnt") != null)
    fcnt = Integer.parseInt(request.getParameter("filter_cnt"));
int acnt = 0;
if(request.getParameter("afilter_cnt") != null)
    acnt = Integer.parseInt(request.getParameter("afilter_cnt"));

String sql = report.getSqlquery();
Hashtable h = new Hashtable();
Connection c = Manager.getInstance().getConnection();
ResultSet rs0 = c.createStatement().executeQuery(sql+" limit 1");
ResultSetMetaData ms0 = rs0.getMetaData();
for(int i=0;i<items.length;i++){
    h.put((Integer)items[i].getIdx(),(String)ms0.getColumnName(i+1));
}
rs0.close();
String sql0 = "";
for(Enumeration e = request.getParameterNames();e.hasMoreElements();){
    String name = (String)e.nextElement();
    String val = request.getParameter(name);
    String[] names = name.split("_");
    if(names.length > 1 && !name.equalsIgnoreCase("filter_cnt") && !name.equalsIgnoreCase("afilter_cnt") && val.trim().length() >0){
        if(names[0].equalsIgnoreCase("filter")){
            int idx = Integer.parseInt(names[1]);
            ReportitemBean[] items0 = ReportitemManager.getInstance().loadByWhere("where reportid = "+report.getReportid()+" and idx = "+idx);
            if(items0.length > 0){
                switch(items0[0].getFieldtype().intValue()){
                    case 0:
                        sql0 += " and "+(String)h.get((Integer)idx)+" like '%"+val.replaceAll("'", "''") +"%' ";
                        break;
                    case 1:
                        if(names[2].equals("1"))
                            sql0 += " and "+(String)h.get((Integer)idx)+" >= "+val +" ";
                        else
                            sql0 += " and "+(String)h.get((Integer)idx)+" <= "+val +" ";
                        break;
                    case 2:
                        if(names[2].equals("1"))
                            sql0 += " and "+(String)h.get((Integer)idx)+" >= "+val +" ";
                        else
                            sql0 += " and "+(String)h.get((Integer)idx)+" <= "+val +" ";
                        break;
                    case 3:
                        if(names[2].equals("1"))
                            sql0 += " and "+(String)h.get((Integer)idx)+"::date >= to_date('"+df.format(dt.parse(val)) +"','DD/MM/YYYY') ";
                        else
                            sql0 += " and "+(String)h.get((Integer)idx)+"::date <= to_date('"+df.format(dt.parse(val)) +"','DD/MM/YYYY') ";
                        break;
                    case 4:
                    case 5:
                    case 6:
                        if(val.length() <= 10)  val += " 00:00";
                        if(names[2].equals("1"))
                            sql0 += " and "+(String)h.get((Integer)idx)+"::date >= to_timestamp('"+dflong.format(dtlong.parse(val)) +"','DD/MM/YYYY HH24:MI') ";
                        else
                            sql0 += " and "+(String)h.get((Integer)idx)+"::date <= to_timestamp('"+dflong.format(dtlong.parse(val)) +"','DD/MM/YYYY HH24:MI') ";
                        break;
                    case 7:
                        if(!val.equals("0")){
                            String[] ss = items0[0].getParam().split(" ");
                            sql0 += " and "+ss[1].replaceAll(",", "")+" = "+val;
                        }
                        break;
                    case 8:
                        if(!val.equals("-1")){
                            sql0 += " and "+items0[0].getParam().trim()+" = "+val;
                        }
                        break;
                    default:
                }
            }
        }
        if(names[0].equalsIgnoreCase("afilter")){
            int idx = Integer.parseInt(names[1]);
            ReportsearchBean item = ReportsearchManager.getInstance().loadByPrimaryKey(idx);
            if(item != null){
                if(item.getType().intValue() == 7){
                    String[] ss = item.getSql().split(" ");
                    if(!val.equals("0"))    sql0 += " and "+ss[1].replaceAll(",", "")+" = "+val;
                } else if(item.getType().intValue() == 8 && !val.equals("-1")){
                    if(!val.equals("-1"))   sql0 += " and "+item.getSql().trim()+" = "+val;
                } else
                    sql0 += item.getSql().replaceAll("FVALUE", val);
            }
        }
    }
}


//"select t.reservationid, guestname(t.guestid) as guestname, r.name, 100::double precision, v.arraivaldate, v.departuredate, coalesce(t.adult,0)::text || '/' || coalesce(t.child,0)::text as pax, p.name as rtype, '' as company, l.fname || ' ' || l.lname as user from reservationroom t, reservation v, reservationtype p, room r, personnel l where t.reservationid = v.reservationid and v.reservationtypeid = p.reservationtypeid and t.roomid = r.roomid and v.regbyid = l.personnelid";

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
int count = 10;
int total_pages = 0;
if(count > 0)    total_pages = (int)(count/ilmt);
if(total_pages*ilmt < count)    total_pages++;
if(ipg > total_pages) ipg=total_pages;
int start = ilmt*ipg - ilmt;
if(start < 0)   start = 0;
String limit = "limit "+ilmt+" offset "+start;
//String order = "order by "+sidx+" "+sord;
if(sql.indexOf("where") < 0){
    sql += sql0.replaceFirst("and", "where");
} else sql += sql0;

System.out.println(sql);

try{
    ResultSet rs = null;
    if(sidx.trim().length() > 0){
        String[] ssidx = sidx.split("_");
        int idx = Integer.parseInt(ssidx[ssidx.length-1]);
        rs = c.createStatement().executeQuery(sql+" limit 1");
        ResultSetMetaData ms = rs.getMetaData();
        for(int i=0;i<ms.getColumnCount();i++){
            if(idx == i){
                sidx = ms.getColumnName(i+1);
                break;
            }
        }
        rs.close();
        sql = sql+" order by "+sidx+" "+sord+" "+limit;
    }
    
    //System.out.println(sql);
    
    rs = c.createStatement().executeQuery(sql);
    
    
    double[] tots = new double[items.length];
    int[] cnts = new int[items.length];
%>
<rows>
	<page><%=ipg%></page>
	<total><%=total_pages%></total>
	<records><%=count%></records>
	<%
        
	for(int i=0;rs.next();i++){
            %>
                <row id='<%=i%>'>
                    <%
                    for(int j=0;j<items.length;j++){
                        String val = "";
                        switch(items[j].getFieldtype().intValue()){
                            case 0:
                                val = rs.getString(j+1);
                                cnts[j]++;
                                break;
                            case 1:
                                int vl1 = rs.getInt(j+1);
                                val = dcint.format(vl1);
                                tots[j] += vl1;
                                break;
                            case 2:
                                double vl2 = rs.getDouble(j+1);
                                val = dc.format(vl2);
                                tots[j] += vl2;
                                break;
                            case 3:
                                val = dt.format(rs.getDate(j+1));
                                cnts[j]++;
                                break;
                            case 4:
                                val = dtlong.format(rs.getTimestamp(j+1).getTime());
                                cnts[j]++;
                                break;
                            case 5:
                                tmpfmt = new SimpleDateFormat(arrdepdateformats[dff]);
                                val = tmpfmt.format(rs.getTimestamp(j+1).getTime());
                                cnts[j]++;
                                break;
                            case 6:
                                tmpfmt = new SimpleDateFormat(yaermonthdateformats[dff]);
                                val = tmpfmt.format(rs.getTimestamp(j+1).getTime());
                                cnts[j]++;
                                break;
                            default:
                                val = rs.getString(j+1);
                                cnts[j]++;
                        }
                        %>
                        <cell><![CDATA[<%=val%>]]></cell>
                        <%
                    }
                    %>
                </row>
            <%
            }
        for(int i=0;i<items.length;i++){
            if(items[i].getHassum().booleanValue()){
                String sv = "";
                if(items[i].getFieldtype().intValue() == 1) sv = dcint.format(tots[i]);
                else if(items[i].getFieldtype().intValue() == 2) sv = dc.format(tots[i]);
                else sv = "სულ "+dcint.format(cnts[i])+" "+items[i].getName();
                %><userdata name="<%="report_"+report.getReportid()+"_"+i%>"><%=sv%></userdata><%
            }
        }
	%>
        
</rows>
<%
        rs.close();
}catch(Exception ex){
    ex.printStackTrace();
}finally{
    Manager.getInstance().releaseConnection(c);
}
%>
