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
Manager.getInstance().beginTransaction();
try{
    Vector v = (Vector)session.getAttribute("WALKIN_REMARKS");
    if(v == null)   v = new Vector();
    
    if(act.equalsIgnoreCase("del")){
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

        v.addElement((ReasonBean)res);
        msg = "{\"result\":1}";
    }
    session.setAttribute("WALKIN_REMARKS", (Vector)v);
}catch(Exception e){
    e.printStackTrace();
    Manager.getInstance().endTransaction(false);
    msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}";
}
    
%>
<%=msg%>