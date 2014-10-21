<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet" %>
<%
int pid = Integer.parseInt(request.getParameter("pid"));
SimpleDateFormat sdt0 = new SimpleDateFormat("yyyy-MM-dd");
SimpleDateFormat sdt1 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
String msg = "";

String sid = "0";
String oper = request.getParameter("oper");
Manager.getInstance().beginTransaction();
try{
    if(oper.equalsIgnoreCase("del")){
        sid = request.getParameter("id");
        try{
            HallidayManager.getInstance().deleteByPrimaryKey(new Long(sid));
        }catch(Exception e)
        {
            e.printStackTrace();
            throw new Exception("წაშლა შეუძლებელია!");
        }
    } else if(oper.equalsIgnoreCase("edit")){
        sid = request.getParameter("id");
        Date startdate = dt.parse(request.getParameter("startdate"));
        Date enddate = dt.parse(request.getParameter("enddate"));
        int hallidaytypeid = Integer.parseInt(request.getParameter("hallidaytypeid"));
        
        String sqlcheck = "where hallidayid != "+sid+" and personellid = "+pid+" and ("
                + "startdate <= to_date('"+dt.format(enddate)+"','DD/MM/YYYY') and enddate >= to_date('"+dt.format(enddate)+"','DD/MM/YYYY') or "
                + "startdate <= to_date('"+dt.format(startdate)+"','DD/MM/YYYY') and enddate >= to_date('"+dt.format(startdate)+"','DD/MM/YYYY')"
                + ")";
        if(HallidayManager.getInstance().countWhere(sqlcheck) > 0)
            throw new Exception("მოხდა პერიოდის გადაფარვა!");
        
        HallidayBean br = HallidayManager.getInstance().loadByPrimaryKey(new Long(sid));
        br.setPersonellid(pid);
        br.setStartdate(startdate);
        br.setEnddate(enddate);
        br.setHallidaytypeid(hallidaytypeid);
        br = HallidayManager.getInstance().save(br);
        
        WorkhoursBean[] wh = WorkhoursManager.getInstance().loadByWhere("where personellid = "+pid+" and wdate >= to_date('"+dt.format(startdate)+"','DD/MM/YYYY') and wdate <= to_date('"+dt.format(enddate)+"','DD/MM/YYYY')");
        for(int i=0;i<wh.length;i++){
            HallidaytypeBean hl = HallidaytypeManager.getInstance().loadByPrimaryKey(hallidaytypeid);
            PcontractBean[] pc = PcontractManager.getInstance().loadByWhere("where personellid = "+pid+" and enddate >= to_date('"+dt.format(startdate)+"','DD/MM/YYYY') and startdate <= to_date('"+dt.format(enddate)+"','DD/MM/YYYY')");
//            if(pc.length > 0)
//                wh[i].setHours(pc[0].getHours().doubleValue()*hl.getPerc().doubleValue()/100);
//            else
//                wh[i].setHours(0);
        }
        wh = WorkhoursManager.getInstance().save(wh);
    } else if(oper.equalsIgnoreCase("add")){
        Date startdate = dt.parse(request.getParameter("startdate"));
        Date enddate = dt.parse(request.getParameter("enddate"));
        int hallidaytypeid = Integer.parseInt(request.getParameter("hallidaytypeid"));
        
        String sqlcheck = "where personellid = "+pid+" and ("
                + "startdate <= to_date('"+dt.format(enddate)+"','DD/MM/YYYY') and enddate >= to_date('"+dt.format(enddate)+"','DD/MM/YYYY') or "
                + "startdate <= to_date('"+dt.format(startdate)+"','DD/MM/YYYY') and enddate >= to_date('"+dt.format(startdate)+"','DD/MM/YYYY')"
                + ")";
        if(HallidayManager.getInstance().countWhere(sqlcheck) > 0)
            throw new Exception("მოხდა პერიოდის გადაფარვა!");
        
        HallidayBean br = HallidayManager.getInstance().createHallidayBean();
        br.setPersonellid(pid);
        br.setStartdate(startdate);
        br.setEnddate(enddate);
        br.setHallidaytypeid(hallidaytypeid);
        br = HallidayManager.getInstance().save(br);
        sid = br.getHallidayid().toString();
        
        WorkhoursBean[] wh = WorkhoursManager.getInstance().loadByWhere("where personellid = "+pid+" and wdate >= to_date('"+dt.format(startdate)+"','DD/MM/YYYY') and wdate <= to_date('"+dt.format(enddate)+"','DD/MM/YYYY')");
        for(int i=0;i<wh.length;i++){
            HallidaytypeBean hl = HallidaytypeManager.getInstance().loadByPrimaryKey(hallidaytypeid);
            PcontractBean[] pc = PcontractManager.getInstance().loadByWhere("where personellid = "+pid+" and enddate >= to_date('"+dt.format(startdate)+"','DD/MM/YYYY') and startdate <= to_date('"+dt.format(enddate)+"','DD/MM/YYYY')");
//            if(pc.length > 0)
//                wh[i].setHours(pc[0].getHours().doubleValue()*hl.getPerc().doubleValue()/100);
//            else
//                wh[i].setHours(0);
        }
        wh = WorkhoursManager.getInstance().save(wh);
    }

    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1,\"id\":"+sid+"}";
}catch(Exception e){Manager.getInstance().endTransaction(false);e.printStackTrace();msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}"; e.printStackTrace();}
%>
<%=msg%>
