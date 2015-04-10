<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%

for(Enumeration e=request.getParameterNames();e.hasMoreElements();){
    String name = (String)e.nextElement();
    String val = request.getParameter(name);
    System.out.println(name + " = " + val);
}

String msg = "";
Manager.getInstance().beginTransaction();
try{
    long id = 0;
    
    int bsourceid = Integer.parseInt(request.getParameter("edittransaction_bsourceid"));
    int marketid = Integer.parseInt(request.getParameter("edittransaction_marketid"));
    long taid = Long.parseLong(request.getParameter("edittransaction_taid"));
    int commplan = Integer.parseInt(request.getParameter("edittransaction_commissionplan"));
    String svalue = request.getParameter("edittransaction_value").trim();
    long companyid = Long.parseLong(request.getParameter("edittransaction_companyid"));
    
    ReservationBean reserv = ReservationManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("reservationid")));
    if(bsourceid > 0)   reserv.setBsourceid(bsourceid);
    if(marketid > 0)   reserv.setMarketid(marketid);
    if(taid > 0)   reserv.setTaid(taid);
    if(commplan >= 0)   reserv.setCommissionplan(commplan);
    if(companyid > 0)   reserv.setCompanyid(companyid);
    if(svalue.length() > 0){
        try{
            reserv.setCommissionvalue(new Double(svalue));
        }catch(Exception e){ throw new Exception("ოდენობა არასწორია"); }
    }
    
    
    
    reserv = ReservationManager.getInstance().save(reserv);
    
    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1,\"id\":"+id+"}";
}catch(Exception e){
    e.printStackTrace();
    Manager.getInstance().endTransaction(false);
    msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}";
}
    
%>
<%=msg%>
