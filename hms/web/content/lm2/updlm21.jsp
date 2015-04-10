<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
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
        UnitsManager.getInstance().deleteByPrimaryKey(new Integer(sid));
        ChangelogBean chlog = ChangelogManager.getInstance().createChangelogBean();
        chlog.setChangebyid(user.getPersonellid());
        chlog.setName("UNITS");
        chlog.setId(new Long(sid));
        chlog = ChangelogManager.getInstance().save(chlog);
    } else if(oper.equalsIgnoreCase("edit")){
        sid = request.getParameter("id");
        UnitsBean unit = UnitsManager.getInstance().loadByPrimaryKey(new Integer(sid));
        
        String name=request.getParameter("name").trim();
        String status=request.getParameter("status");
        
        unit.setName(name);
        if(status.equalsIgnoreCase("აქტიური"))   unit.setStatus(true);
        else                                unit.setStatus(false);
        
        unit = UnitsManager.getInstance().save(unit);
        
        ChangelogBean chlog = ChangelogManager.getInstance().createChangelogBean();
        chlog.setChangebyid(user.getPersonellid());
        chlog.setName("UNITS");
        chlog.setId(unit.getUnitsid());
        chlog = ChangelogManager.getInstance().save(chlog);
    } else if(oper.equalsIgnoreCase("add")){
        UnitsBean unit = UnitsManager.getInstance().createUnitsBean();
        
        String name=request.getParameter("name").trim();
        String status=request.getParameter("status");
        
        unit.setName(name);
        if(status.equalsIgnoreCase("აქტიური"))   unit.setStatus(true);
        else                                unit.setStatus(false);
        
        unit = UnitsManager.getInstance().save(unit);
        
        ChangelogBean chlog = ChangelogManager.getInstance().createChangelogBean();
        chlog.setChangebyid(user.getPersonellid());
        chlog.setName("UNITS");
        chlog.setId(unit.getUnitsid());
        chlog = ChangelogManager.getInstance().save(chlog);
        
        sid = unit.getUnitsid().toString();
        
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
