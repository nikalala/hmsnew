<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/xml;charset=utf-8"%>
<%@include file="../../includes/initxml.jsp"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%

ReportBean report = ReportManager.getInstance().loadByPrimaryKey(new Integer(request.getParameter("rid")));
ReportitemBean[] items = ReportitemManager.getInstance().loadByWhere("where reportid = "+report.getReportid()+" order by idx");



String sql = report.getSqlquery();
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
Connection c = Manager.getInstance().getConnection();
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
    rs = c.createStatement().executeQuery(sql);
%>
<rows>
	<page><%=ipg%></page>
	<total><%=total_pages%></total>
	<records><%=count%></records>
	<%
        SimpleDateFormat tmpfmt = null;
	for(int i=0;rs.next();i++){
            %>
                <row id='<%=i%>'>
                    <%
                    for(int j=0;j<items.length;j++){
                        String val = "";
                        switch(items[j].getFieldtype().intValue()){
                            case 0:
                                val = rs.getString(j+1);
                                break;
                            case 1:
                                val = dcint.format(rs.getInt(j+1));
                                break;
                            case 2:
                                val = dc.format(rs.getDouble(j+1));
                                break;
                            case 3:
                                val = dt.format(rs.getDate(j+1));
                                break;
                            case 4:
                                val = dtlong.format(rs.getTimestamp(j+1).getTime());
                                break;
                            case 5:
                                tmpfmt = new SimpleDateFormat(arrdepdateformats[dff]);
                                val = tmpfmt.format(rs.getTimestamp(j+1).getTime());
                                break;
                            case 6:
                                tmpfmt = new SimpleDateFormat(yaermonthdateformats[dff]);
                                val = tmpfmt.format(rs.getTimestamp(j+1).getTime());
                                break;
                            default:
                                val = rs.getString(j+1);
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
                %><userdata name="<%="report_"+report.getReportid()+"_"+i%>"><%=dc.format(0)%></userdata><%
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
