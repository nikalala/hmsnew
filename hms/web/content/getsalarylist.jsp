<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/xml;charset=utf-8"%>
<%@include file="../includes/initxml.jsp"%>
<%
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
SimpleDateFormat monly = new SimpleDateFormat("MM/yyyy");
int year = Integer.parseInt(request.getParameter("year"));
int month = Integer.parseInt(request.getParameter("month"));
int deptid = Integer.parseInt(request.getParameter("deptid"));
Calendar cal = Calendar.getInstance();
Calendar cal1 = Calendar.getInstance();
cal.set(Calendar.DATE, 1);
cal.set(Calendar.MONTH, month);
cal.set(Calendar.YEAR, year);
cal1.set(Calendar.DATE, 1);
cal1.set(Calendar.MONTH, month);
cal1.set(Calendar.YEAR, year);
cal1.add(Calendar.MONTH, 1);
cal1.add(Calendar.DATE, -1);
Calendar caltemp = Calendar.getInstance();
caltemp.setTimeInMillis(cal.getTimeInMillis());
int maxday = cal.getActualMaximum(Calendar.DATE);
int workdays = 0;
int holldays = PcalManager.getInstance().countWhere("where pdate >= to_date('"+dt.format(cal.getTime())+"','DD/MM/YYYY') and pdate <= to_date('"+dt.format(cal1.getTime())+"','DD/MM/YYYY')");
for(int i=0;i<maxday;i++){
    int wd = caltemp.get(Calendar.DAY_OF_WEEK);
    if(wd == 1 || wd == 7)  holldays++;
    else                    workdays++;
    caltemp.add(Calendar.DATE, 1);
}

workdays -= holldays;

PersonellBean[] pers = PersonellManager.getInstance().loadByWhere("where departamentid = "+deptid+" and deleted = false and code != '' and personellid in (select personellid from pcontract where personellid is not null) order by code, lname, fname");
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

int count = pers.length;
int total_pages = 0;
if(count > 0 && ilmt > 0)    total_pages = (int)(count/ilmt);
if(total_pages*ilmt < count)    total_pages++;
if(ipg > total_pages) ipg=total_pages;
int start = ilmt*ipg - ilmt;
if(start < 0)  start = 0;
String limit = "limit "+ilmt+" offset "+start;

String order = "order by "+sidx+" "+sord;  //order by "+sidx+" "+sord;

//double totbottles = getSum("select sum(p.boxcnt*t.boxcnt) from plist v, readyproduct p, plistitem t, contract c where v.contractid = c.contractid and v.plistid = t.plistid and t.readyproductid = p.readyproductid and c.contractdate >= to_date('"+dt.format(cal.getTime())+"','DD/MM/YYYY') and c.contractdate <= to_date('"+dt.format(cal1.getTime())+"','DD/MM/YYYY')");
double totbottles = getSum("select sum(bottlecnt) from payment where paydate >= to_date('"+dt.format(cal.getTime())+"','DD/MM/YYYY') and paydate <= to_date('"+dt.format(cal1.getTime())+"','DD/MM/YYYY')");
%>
<rows>
    <page><%=ipg%></page>
    <total><%=total_pages%></total>
    <records><%=count%></records>
    <%
    for(int i=0;i<pers.length;i++)
        {
            String hsql = "select "
                    + "case when enddate > to_date('"+dt.format(cal1.getTime())+"','DD/MM/YYYY') then to_date('"+dt.format(cal1.getTime())+"','DD/MM/YYYY') else enddate end - "
                    + "case when startdate < to_date('"+dt.format(cal.getTime())+"','DD/MM/YYYY') then to_date('"+dt.format(cal.getTime())+"','DD/MM/YYYY') else startdate end "
                    + "from halliday where hallidaytypeid = 1 and personellid = "+pers[i].getPersonellid();
            PersonelltypeBean ptp = PersonelltypeManager.getInstance().loadByPrimaryKey(pers[i].getPersonelltypeid());
            DepartamentBean dp = DepartamentManager.getInstance().loadByPrimaryKey(pers[i].getDepartamentid());
            
            double salary = 0;
            double premium = 0;
            double add1000 = 0;
            double wsalary = 0;
            double wpremium = 0;
            double add1 = 0;
            double addperc = 0;
            double add2 = 0;
            double payprem = 0;
            double holliday = getSum(hsql)*0;
            double cpremium = 0;
            double insurance = getSum("select sum(amount) from salary where personellid = "+pers[i].getPersonellid()+" and paytypeid = 4 and to_char(fordate,'MM/YYYY') = '"+monly.format(cal.getTime())+"'");
            double avance = getSum("select sum(amount) from salary where personellid = "+pers[i].getPersonellid()+" and paytypeid = 2 and to_char(fordate,'MM/YYYY') = '"+monly.format(cal.getTime())+"'");
            double total1 = 0;
            double tax = 0;
            double hand = 0;
            double tothours = getSum("select sum(hours) from workhours where personellid = "+pers[i].getPersonellid()+" and wdate >= to_date('"+dt.format(cal.getTime())+"','DD/MM/YYYY') and wdate <= to_date('"+dt.format(cal1.getTime())+"','DD/MM/YYYY')");
            PcontractBean[] contract = PcontractManager.getInstance().loadByWhere("where personellid = "+pers[i].getPersonellid()+" and startdate <= to_date('"+dt.format(cal.getTime())+"','DD/MM/YYYY') and enddate >= to_date('"+dt.format(cal.getTime())+"','DD/MM/YYYY')");
            if(contract.length > 0){
                salary = contract[0].getSalary().doubleValue();
                premium = contract[0].getPremium().doubleValue();
                add1000 = contract[0].getPremium1000().doubleValue();
                double sthours = contract[0].getHours().doubleValue()*workdays;
                add2 = totbottles*add1000/1000;
                double perhour = 0;
                payprem = 0;
                PcompanyBean[] pcomps = PcompanyManager.getInstance().loadByPersonellid(pers[i].getPersonellid());
                for(int j=0;j<pcomps.length;j++){
                    double sumpaid = getSum("select sum(amount) from payment where customerid = "+pcomps[j].getCustomerid()+" and paydate >= to_date('"+dt.format(cal.getTime())+"','DD/MM/YYYY') and paydate <= to_date('"+dt.format(cal1.getTime())+"','DD/MM/YYYY')");
                    payprem += sumpaid * pcomps[j].getPerc()/100;
                }
                if(sthours > 0) perhour = salary/sthours;
                if(sthours <= tothours){
                    wsalary = salary;
                    wpremium = premium;
                    //add1 = perhour * (tothours - sthours);
                    if(salary > 0)  addperc = add1*100/salary;
                }
                else if(sthours > 0){
                    wsalary = salary*tothours/sthours;
                    wpremium = premium*tothours/sthours;
                    add2 = add2*tothours/sthours;
                    payprem = payprem*tothours/sthours;
                }
                
                double doubledays = getSum("select sum(hours) from workhours where personellid = "+pers[i].getPersonellid()+" and EXTRACT(DOW FROM wdate::TIMESTAMP) = 6 and wdate >= to_date('"+dt.format(cal.getTime())+"','DD/MM/YYYY') and wdate <= to_date('"+dt.format(cal1.getTime())+"','DD/MM/YYYY')");
                
                ExtrahoursBean eb = ExtrahoursManager.getInstance().loadByPrimaryKey(year, month, pers[i].getPersonellid());
                if(eb != null)
                    add1 = salary/sthours*(doubledays*2 + eb.getAmount().doubleValue()*1.2);

                
                
                PpremiumBean pp = PpremiumManager.getInstance().loadByPrimaryKey(pers[i].getPersonellid(), cal.get(Calendar.YEAR), cal.get(Calendar.MONTH));
                if(pp != null && pp.getPremium().booleanValue()){}else{
                    if(sthours <= tothours)
                        cpremium = premium;
                    else if(sthours > 0)    cpremium = premium*tothours/sthours;
                    
                }
                //total1 = wsalary + add1 + add2 + cpremium + payprem + wpremium;
                total1 = wsalary + wpremium + add2 + payprem + add1 + holliday;
                tax = total1*0.2;
                hand = total1 - tax - insurance - avance;
            }
            
        %>
	<row id='<%=pers[i].getPersonellid()%>'>
            <cell><![CDATA[<%=dp.getCode()+"-"+pers[i].getCode()%>]]></cell>
            <cell><![CDATA[<%=pers[i].getLname()%>]]></cell>
            <cell><![CDATA[<%=pers[i].getFname()%>]]></cell>
            <cell><![CDATA[<%=ptp.getName()%>]]></cell>
            <cell><![CDATA[<%=dc.format(wsalary)%>]]></cell>
            <cell><![CDATA[<%=dc.format(wpremium)%>]]></cell>
            <cell><![CDATA[<%=dc.format(add2)%>]]></cell>
            <cell><![CDATA[<%=dc.format(payprem)%>]]></cell>
            <cell><![CDATA[<%=dc.format(add1)%>]]></cell>
            <cell><![CDATA[<%=dc.format(holliday)%>]]></cell>
            <cell><![CDATA[<%=dc.format(total1)%>]]></cell>
            <cell><![CDATA[<%=dc.format(insurance)%>]]></cell>
            <cell><![CDATA[<%=dc.format(avance)%>]]></cell>
            <cell><![CDATA[<%=dc.format(total1)%>]]></cell>
            <cell><![CDATA[<%=dc.format(tax)%>]]></cell>
            <cell><![CDATA[<%=dc.format(hand)%>]]></cell>
v	</row>
    <%
        }
    %>
</rows>
