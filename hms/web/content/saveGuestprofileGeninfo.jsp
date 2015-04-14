<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
String s = "";
for(Enumeration e=request.getParameterNames();e.hasMoreElements();){
    String name = (String)e.nextElement();
    String[] val = request.getParameterValues(name);
    if(val == null) val = new String[0];
    s += name+": ";
    for(int i=0;i<val.length;i++)
        s += val[i]+"; ";
    s += "\n";
}
System.out.println(s);
    
JSONObject obj = new JSONObject();
Manager.getInstance().beginTransaction();
try{
       
    Manager.getInstance().endTransaction(true);
    obj.put("result",1);
}catch(Exception e){
    e.printStackTrace();
    Manager.getInstance().endTransaction(false);
    obj.put("result",0);
    obj.put("error",e.getMessage());
}
%>
<%=obj.toString()%>
