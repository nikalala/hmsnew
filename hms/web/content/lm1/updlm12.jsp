<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%
SimpleDateFormat sdt0 = new SimpleDateFormat("yyyy-MM-dd");
SimpleDateFormat sdt1 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
SimpleDateFormat sdt2 = new SimpleDateFormat("dd/MM");

String msg = "";

String sid = "0";
String oper = request.getParameter("oper");
Manager.getInstance().beginTransaction();
try{
    if(oper.equalsIgnoreCase("del")){
        sid = request.getParameter("id");
        SeasonManager.getInstance().deleteByPrimaryKey(new Integer(sid));
        ChangelogBean chlog = ChangelogManager.getInstance().createChangelogBean();
        chlog.setChangebyid(user.getPersonellid());
        chlog.setName("SEASON");
        chlog.setId(new Long(sid));
        chlog = ChangelogManager.getInstance().save(chlog);
    } else if(oper.equalsIgnoreCase("edit")){
        sid = request.getParameter("id");
        SeasonBean season = SeasonManager.getInstance().loadByPrimaryKey(new Integer(sid));
        
        String name=request.getParameter("name").trim();
        String nickname=request.getParameter("nickname").trim();
        
        String startdate = request.getParameter("startdate");
        String enddate = request.getParameter("enddate");
        String fromdate = request.getParameter("fromdate");
        String todate = request.getParameter("todate");
        
        String status=request.getParameter("status");
        
        season.setName(name);
        season.setNickname(nickname);
        season.setEnddate(sdt2.parse(enddate));
        season.setStartdate(sdt2.parse(startdate));
        season.setFromdate(dt.parse(fromdate));
        season.setTodate(dt.parse(todate));
        
        if(status.equalsIgnoreCase("აქტიური"))   season.setStatus(true);
        else                                season.setStatus(false);
        
        season = SeasonManager.getInstance().save(season);
                
        ChangelogBean chlog = ChangelogManager.getInstance().createChangelogBean();
        chlog.setChangebyid(user.getPersonellid());
        chlog.setName("SEASON");
        chlog.setId(season.getSeasonid());
        chlog = ChangelogManager.getInstance().save(chlog);
    } else if(oper.equalsIgnoreCase("add")){
        SeasonBean season = SeasonManager.getInstance().createSeasonBean();
        
        String name=request.getParameter("name").trim();
        String nickname=request.getParameter("nickname").trim();
        
        String startdate = request.getParameter("startdate");
        String enddate = request.getParameter("enddate");
        String fromdate = request.getParameter("fromdate");
        String todate = request.getParameter("todate");
        
        String status=request.getParameter("status");
        
        season.setName(name);
        season.setNickname(nickname);
        season.setEnddate(sdt2.parse(enddate));
        season.setStartdate(sdt2.parse(startdate));
        season.setFromdate(dt.parse(fromdate));
        season.setTodate(dt.parse(todate));
        
        if(status.equalsIgnoreCase("აქტიური"))   season.setStatus(true);
        else                                season.setStatus(false);
        
        season = SeasonManager.getInstance().save(season);
                
        ChangelogBean chlog = ChangelogManager.getInstance().createChangelogBean();
        chlog.setChangebyid(user.getPersonellid());
        chlog.setName("SEASON");
        chlog.setId(season.getSeasonid());
        chlog = ChangelogManager.getInstance().save(chlog);
        
        sid = season.getSeasonid().toString();
        
    }

    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1,\"id\":"+sid+"}";
}catch(Exception e){
    Manager.getInstance().endTransaction(false);
    e.printStackTrace();
    msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}"; 
    }
%>
<%=msg%>
