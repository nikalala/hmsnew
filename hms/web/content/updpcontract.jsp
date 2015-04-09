<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
String msg = "";
Manager.getInstance().beginTransaction();
try{
String oper = request.getParameter("oper");
PersonellBean personell = PersonellManager.getInstance().loadByPrimaryKey(new Integer(request.getParameter("personellid")));

int id = 0;

if(oper.equalsIgnoreCase("del"))
    {
    id = Integer.parseInt(request.getParameter("id"));
    PcontractManager.getInstance().deleteByPrimaryKey(id);
    }
else if(oper.equalsIgnoreCase("edit"))
    {
    id = Integer.parseInt(request.getParameter("id"));
    String num = request.getParameter("num").trim();
    Date startdate = dt.parse(request.getParameter("startdate").trim());
    Date enddate = dt.parse(request.getParameter("enddate").trim());
    double salary = Double.parseDouble(request.getParameter("salary").trim());
    double premium = Double.parseDouble(request.getParameter("premium").trim());
    double premium1000 = Double.parseDouble(request.getParameter("premium1000").trim());
    double hours = Double.parseDouble(request.getParameter("hours").trim());
    PcontractBean contract = PcontractManager.getInstance().loadByPrimaryKey(id);
    if(PcontractManager.getInstance().countWhere("where pcontractid != "+id+" and upper(num) = '"+num.toUpperCase()+"'") > 0)
        throw new Exception("ხელშეკრულების ნომერი "+num+" უკვე არსებობს.");
    contract.setNum(num);
    contract.setStartdate(startdate.getTime());
    contract.setEnddate(enddate.getTime());
    contract.setSalary(salary);
    contract.setPremium(premium);
    contract.setPremium1000(premium1000);
    contract.setHours(hours);
    contract = PcontractManager.getInstance().save(contract);
    
    Calendar cal = Calendar.getInstance();
    cal.setTime(startdate);
    Calendar cal1 = Calendar.getInstance();
    cal1.setTime(enddate);
    cal.set(Calendar.DATE, 1);
    cal1.set(Calendar.DATE, 1);
    cal1.add(Calendar.MONTH, 1);
    cal1.add(Calendar.DATE, -1);
    int maxday = cal.getActualMaximum(Calendar.DATE);
    WorkhoursBean[] wh = new WorkhoursBean[maxday];
    for(int i=0;i<maxday;i++){
        wh[i] = WorkhoursManager.getInstance().loadByPrimaryKey(personell.getPersonellid(), cal.getTime());
        if(wh[i] == null){
            wh[i] = WorkhoursManager.getInstance().createWorkhoursBean();
            wh[i].setHours(0);
            wh[i].setPersonellid(personell.getPersonellid());
            wh[i].setWdate(cal.getTime());
            HallidayBean[] hls = HallidayManager.getInstance().loadByWhere("where personellid = "+personell.getPersonellid()+" and startdate <= to_date('"+dt.format(cal.getTime())+"','DD/MM/YYYY') and enddate > to_date('"+dt.format(cal.getTime())+"','DD/MM/YYYY')");
            if(hls.length > 0){
                HallidaytypeBean hl = HallidaytypeManager.getInstance().loadByPrimaryKey(hls[0].getHallidaytypeid().intValue());
                wh[i].setHours(hours*hl.getPerc().doubleValue()/100);
            } else if(PcalManager.getInstance().countWhere("where pdate = to_date('"+dt.format(cal.getTime())+"','DD/MM/YYYY')")>0)
                wh[i].setHours(0);
        }
        cal.add(Calendar.DATE, 1);
    }
    wh = WorkhoursManager.getInstance().save(wh);
    }
else if(oper.equalsIgnoreCase("add"))
    {
    String num = request.getParameter("num").trim();
    Date startdate = dt.parse(request.getParameter("startdate").trim());
    Date enddate = dt.parse(request.getParameter("enddate").trim());
    double salary = Double.parseDouble(request.getParameter("salary").trim());
    double premium = Double.parseDouble(request.getParameter("premium").trim());
    double premium1000 = Double.parseDouble(request.getParameter("premium1000").trim());
    double hours = Double.parseDouble(request.getParameter("hours").trim());
    PcontractBean contract = PcontractManager.getInstance().createPcontractBean();
    if(PcontractManager.getInstance().countWhere("where upper(num) = '"+num.toUpperCase()+"'") > 0)
        throw new Exception("ხელშეკრულების ნომერი "+num+" უკვე არსებობს.");
    contract.setPersonellid(personell.getPersonellid());
    contract.setNum(num);
    contract.setStartdate(startdate.getTime());
    contract.setEnddate(enddate.getTime());
    contract.setSalary(salary);
    contract.setPremium(premium);
    contract.setPremium1000(premium1000);
    contract.setHours(hours);
    contract = PcontractManager.getInstance().save(contract);
    
    Calendar cal = Calendar.getInstance();
    cal.setTime(startdate);
    Calendar cal1 = Calendar.getInstance();
    cal1.setTime(enddate);
    cal.set(Calendar.DATE, 1);
    cal1.set(Calendar.DATE, 1);
    cal1.add(Calendar.MONTH, 1);
    cal1.add(Calendar.DATE, -1);
    int maxday = cal.getActualMaximum(Calendar.DATE);
    WorkhoursBean[] wh = new WorkhoursBean[maxday];
    for(int i=0;i<maxday;i++){
        wh[i] = WorkhoursManager.getInstance().loadByPrimaryKey(personell.getPersonellid(), cal.getTime());
        if(wh[i] == null){
            wh[i] = WorkhoursManager.getInstance().createWorkhoursBean();
            wh[i].setHours(0);
            wh[i].setPersonellid(personell.getPersonellid());
            wh[i].setWdate(cal.getTime());
            HallidayBean[] hls = HallidayManager.getInstance().loadByWhere("where personellid = "+personell.getPersonellid()+" and startdate <= to_date('"+dt.format(cal.getTime())+"','DD/MM/YYYY') and enddate > to_date('"+dt.format(cal.getTime())+"','DD/MM/YYYY')");
            if(hls.length > 0){
                HallidaytypeBean hl = HallidaytypeManager.getInstance().loadByPrimaryKey(hls[0].getHallidaytypeid().intValue());
                wh[i].setHours(hours*hl.getPerc().doubleValue()/100);
            } else if(PcalManager.getInstance().countWhere("where pdate = to_date('"+dt.format(cal.getTime())+"','DD/MM/YYYY')")>0)
                wh[i].setHours(0);
        }
        cal.add(Calendar.DATE, 1);
    }
    wh = WorkhoursManager.getInstance().save(wh);
    id = contract.getPcontractid().intValue();
    }
Manager.getInstance().endTransaction(true);
msg = "{\"result\":1,\"id\":"+id+"}";
}catch(Exception e){Manager.getInstance().endTransaction(false);e.printStackTrace();msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}";}
%>
<%=msg%>
