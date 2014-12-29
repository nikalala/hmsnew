<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%
/*
for(Enumeration e=request.getParameterNames();e.hasMoreElements();){
    String name = (String)e.nextElement();
    String val = request.getParameter(name);
    System.out.println(name + " = " + val);
}
*/
String msg = "";
String act = request.getParameter("act");
ReservationroomBean rroom = ReservationroomManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("rid")));
ReservationBean reserv = null;
if(rroom != null)
    reserv = ReservationManager.getInstance().loadByPrimaryKey(rroom.getReservationid());
Manager.getInstance().beginTransaction();
try{
    Vector v = (Vector)session.getAttribute("WALKIN_REMARKS");
    if(v == null)   v = new Vector();
    
    if(act.equalsIgnoreCase("del")){
        ReasonBean res = (ReasonBean)v.elementAt(Integer.parseInt(request.getParameter("num")));
        
        try{ReasonManager.getInstance().deleteByPrimaryKey(res.getReasonid());}catch(Exception ign){}
        
        v.removeElementAt(Integer.parseInt(request.getParameter("num")));
        msg = "{\"result\":1}";
    } else {
        int category = Integer.parseInt(request.getParameter("category"));
        int reasonid = Integer.parseInt(request.getParameter("reasonid"));
        String name = request.getParameter("name").trim();

        if(category < 0)   throw new Exception("აირჩიეთ კატეგორია");
        if(reasonid == 0 && name.length() == 0) throw new Exception("აირჩიეთ ან შეიყვანეთ შენიშვნა");
        
        ReasonBean res = ReasonManager.getInstance().createReasonBean();
        if(reasonid > 0) res = ReasonManager.getInstance().loadByPrimaryKey(reasonid);
        else {
            res.setReasoncategory(category);
            res.setName(name);
        }
        System.out.println("reasonid = "+reasonid);
        res.setRegbyid(user.getPersonnelid());
        res = ReasonManager.getInstance().save(res);
        reasonid = res.getReasonid().intValue();
System.out.println("reasonid = "+reasonid);
        if(reserv != null){
            ReservationreasonBean rb = ReservationreasonManager.getInstance().loadByPrimaryKey(reserv.getReservationid(), reasonid);
            if(rb == null)    {
                rb = ReservationreasonManager.getInstance().createReservationreasonBean();
                rb.setReasonid(reasonid);
                rb.setReservationid(reserv.getReservationid());
                rb = ReservationreasonManager.getInstance().save(rb);
            }
        }
        
        
        v.addElement((ReasonBean)res);
        msg = "{\"result\":1}";
    }
    session.setAttribute("WALKIN_REMARKS", (Vector)v);
    Manager.getInstance().endTransaction(true);
}catch(Exception e){
    e.printStackTrace();
    Manager.getInstance().endTransaction(false);
    msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}";
}
    
%>
<%=msg%>