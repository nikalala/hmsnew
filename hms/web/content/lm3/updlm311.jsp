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
        ReservationtypeManager.getInstance().deleteByPrimaryKey(new Integer(sid));
        ChangelogBean chlog = ChangelogManager.getInstance().createChangelogBean();
        chlog.setChangebyid(user.getPersonellid());
        chlog.setName("RESERVATIONTYPE");
        chlog.setId(new Long(sid));
        chlog = ChangelogManager.getInstance().save(chlog);
    } else if(oper.equalsIgnoreCase("edit")){
        sid = request.getParameter("id");
        ReservationtypeBean reservationtype = ReservationtypeManager.getInstance().loadByPrimaryKey(new Integer(sid));
        
        String name=request.getParameter("name").trim();
        String status=request.getParameter("approved");
        String color = request.getParameter("color");
        
        reservationtype.setName(name);
        if(status.equalsIgnoreCase("აქტიური"))   reservationtype.setApproved(true);
        else                                reservationtype.setApproved(false);
        reservationtype.setColor(color);
        
        reservationtype = ReservationtypeManager.getInstance().save(reservationtype);
        
        ChangelogBean chlog = ChangelogManager.getInstance().createChangelogBean();
        chlog.setChangebyid(user.getPersonellid());
        chlog.setName("RESERVATIONTAYPE");
        chlog.setId(reservationtype.getReservationtypeid());
        chlog = ChangelogManager.getInstance().save(chlog);
    } else if(oper.equalsIgnoreCase("add")){
        ReservationtypeBean reservationtype = ReservationtypeManager.getInstance().createReservationtypeBean();
        
        String name=request.getParameter("name").trim();
        String status=request.getParameter("approved");
        String color = request.getParameter("color");
        
        reservationtype.setName(name);
        if(status.equalsIgnoreCase("აქტიური"))   reservationtype.setApproved(true);
        else                                reservationtype.setApproved(false);
        reservationtype.setColor(color);
        
        reservationtype = ReservationtypeManager.getInstance().save(reservationtype);
        
        ChangelogBean chlog = ChangelogManager.getInstance().createChangelogBean();
        chlog.setChangebyid(user.getPersonellid());
        chlog.setName("RESERVATIONTAYPE");
        chlog.setId(reservationtype.getReservationtypeid());
        chlog = ChangelogManager.getInstance().save(chlog);
        
        sid = reservationtype.getReservationtypeid().toString();
        
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
