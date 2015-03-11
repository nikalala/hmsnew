<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/xml;charset=utf-8"%>
<%@include file="../includes/initxml.jsp"%>
<%
SimpleDateFormat dt01 = new SimpleDateFormat("dd/MM/yyyy");
String arrdate = request.getParameter("arrdate");
String depdate = request.getParameter("depdate");
int ratetypeid = Integer.parseInt(request.getParameter("ratetypeid"));
RoomtypeBean roomtype = RoomtypeManager.getInstance().loadByPrimaryKey(new Integer(request.getParameter("roomtypeid")));
RatetypeBean rratetype = RatetypeManager.getInstance().loadByPrimaryKey(ratetypeid);
int payinforatetype = Integer.parseInt(request.getParameter("payinforatetype"));
long contragentid = Integer.parseInt(request.getParameter("contragentid"));
double manualrate = Double.parseDouble(request.getParameter("manualrate"));
int adult = Integer.parseInt(request.getParameter("adult"));
int child = Integer.parseInt(request.getParameter("child"));
int disctid = Integer.parseInt(request.getParameter("discountid"));
int discplan = Integer.parseInt(request.getParameter("discountplan"));
double discnights = Double.parseDouble(request.getParameter("discountnights"));
double discamount = Double.parseDouble(request.getParameter("discount"));


boolean notax = new Boolean(request.getParameter("notax"));

DiscountBean disc = null;
int disctype = 0;
if(disctid > 0){
    disc = DiscountManager.getInstance().loadByPrimaryKey(disctid);
    if(!disc.getPerctype().booleanValue()) disctype = 1;
} else discamount = 0;


Calendar calstart = Calendar.getInstance();
Calendar calend = Calendar.getInstance();
calend.add(Calendar.DATE,1);
calstart.setTime(dt01.parse(arrdate));
calend.setTime(dt01.parse(depdate));
//
//SeasonBean[] seasons = SeasonManager.getInstance().loadByWhere(sqlseason);

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
int count = DayDiff(calstart,calend);
int total_pages = 0;
if(count > 0)    total_pages = (int)(count/ilmt);
if(total_pages*ilmt < count)    total_pages++;
if(ipg > total_pages) ipg=total_pages;
int start = ilmt*ipg - ilmt;
if(start < 0)   start = 0;
String limit = "limit "+ilmt+" offset "+start;
String order = "order by "+sidx+" "+sord;

int n = 0;

System.out.println("count = "+count);

double troomrate = 0;
double ttax = 0;
double tdiscount = 0;
double tfix = 0;
double tneto = 0;
%>
<rows>
	<page><%=ipg%></page>
	<total><%=total_pages%></total>
	<records><%=count%></records>
<%
for(int i=0;calstart.before(calend);i++){
    tariff trf = new tariff();
    trf.init(manualrate,payinforatetype,contragentid,ratetypeid,roomtype,adult,child,disctype,notax,calstart,calend,discplan,discnights,discamount,i);
    double roomrate = trf.tariff_rate;
    double tax = trf.tariff_tax;
    double discount = trf.tariff_discount;
    double fix = trf.tariff_fix;
    double neto = trf.tariff_neto;
    
    troomrate += roomrate;
    ttax += tax;
    tdiscount += discount;
    tfix += fix;
    tneto += neto;
%>
    <row id='<%=i%>'>
        <cell><![CDATA[<%=dt.format(calstart.getTime())%>]]></cell>
        <cell><![CDATA[<%=rratetype.getName()%>]]></cell>
        <cell><![CDATA[<%=dc.format(roomrate)%>]]></cell>
        <cell><![CDATA[<%=dc.format(tax)%>]]></cell>
        <cell><![CDATA[<%=dc.format(discount)%>]]></cell>
        <cell><![CDATA[<%=dc.format(fix)%>]]></cell>
        <cell><![CDATA[<%=dc.format(neto)%>]]></cell>
    </row>
<%

    calstart.add(Calendar.DATE, 1);
}
%>
        <userdata name="price"><%=dc.format(troomrate)%></userdata>
        <userdata name="tax"><%=dc.format(ttax)%></userdata>
        <userdata name="discount"><%=dc.format(tdiscount)%></userdata>
        <userdata name="fix"><%=dc.format(tfix)%></userdata>
        <userdata name="neto"><%=dc.format(tneto)%></userdata>
</rows>


