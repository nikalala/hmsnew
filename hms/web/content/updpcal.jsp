<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet" %>
<%
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
            PcalManager.getInstance().deleteByPrimaryKey(new Integer(sid));
        }catch(Exception e)
        {
            e.printStackTrace();
            throw new Exception("წაშლა შეუძლებელია!");
        }
    } else if(oper.equalsIgnoreCase("edit")){
        sid = request.getParameter("id");
        String name = (request.getParameter("name")).trim();
        Date pdate = dt.parse(request.getParameter("pdate").trim());
        
        if(PcalManager.getInstance().countWhere("where pcalid != "+sid+" and pdate = to_date('"+dt.format(pdate)+"','DD/MM/YYYY')") > 0)
            throw new Exception("ასეთი თარიღი უკვე არსებობს");
        
        PcalBean br = PcalManager.getInstance().loadByPrimaryKey(new Integer(sid));
        br.setName(name);
        br.setPdate(pdate);
        br = PcalManager.getInstance().save(br);
        
        WorkhoursBean[] wh = WorkhoursManager.getInstance().loadByWhere("where wdate = to_date('"+dt.format(pdate)+"','DD/MM/YYYY')");
        for(int i=0;i<wh.length;i++){
            if(HallidayManager.getInstance().countWhere("where to_date('"+dt.format(pdate)+"','DD/MM/YYYY') >= startdate and to_date('"+dt.format(pdate)+"','DD/MM/YYYY') <= enddate and personellid = "+wh[i].getPersonellid()) > 0)
                continue;
            wh[i].setHours(0);
            //PcontractBean[] pc = PcontractManager.getInstance().loadByWhere("where personellid = "+wh[i].getPersonellid()+" and to_date('"+dt.format(pdate)+"','DD/MM/YYYY') >= startdate and to_date('"+dt.format(pdate)+"','DD/MM/YYYY') < enddate");
            //if(pc.length > 0)
            //    wh[i].setHours(pc[0].getHours());
            //else
            //    wh[i].setHours(0);
        }
        wh = WorkhoursManager.getInstance().save(wh);
        
    } else if(oper.equalsIgnoreCase("add")){
        String name = (request.getParameter("name")).trim();
        Date pdate = dt.parse(request.getParameter("pdate").trim());
        
        if(PcalManager.getInstance().countWhere("where pcalid != "+sid+" and pdate = to_date('"+dt.format(pdate)+"','DD/MM/YYYY')") > 0)
            throw new Exception("ასეთი თარიღი უკვე არსებობს");
        
        PcalBean br = PcalManager.getInstance().createPcalBean();
        br.setName(name);
        br.setPdate(pdate);
        br = PcalManager.getInstance().save(br);
        sid = br.getPcalid().toString();
        
        WorkhoursBean[] wh = WorkhoursManager.getInstance().loadByWhere("where wdate = to_date('"+dt.format(pdate)+"','DD/MM/YYYY')");
        for(int i=0;i<wh.length;i++){
            if(HallidayManager.getInstance().countWhere("where to_date('"+dt.format(pdate)+"','DD/MM/YYYY') >= startdate and to_date('"+dt.format(pdate)+"','DD/MM/YYYY') <= enddate and personellid = "+wh[i].getPersonellid()) > 0)
                continue;
            wh[i].setHours(0);
            //PcontractBean[] pc = PcontractManager.getInstance().loadByWhere("where personellid = "+wh[i].getPersonellid()+" and to_date('"+dt.format(pdate)+"','DD/MM/YYYY') >= startdate and to_date('"+dt.format(pdate)+"','DD/MM/YYYY') < enddate");
            //if(pc.length > 0)
            //    wh[i].setHours(pc[0].getHours());
            //else
            //    wh[i].setHours(0);
        }
        wh = WorkhoursManager.getInstance().save(wh);
    }

    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1,\"id\":"+sid+"}";
}catch(Exception e){Manager.getInstance().endTransaction(false);e.printStackTrace();msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}"; e.printStackTrace();}
%>
<%=msg%>
