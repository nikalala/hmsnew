<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%!
String firstUpper(String s) throws Exception{
    return Character.toUpperCase(s.charAt(0)) + s.substring(1);
}
%>
<%
String objname = request.getParameter("objname");
String name = request.getParameter("name");
String where = request.getParameter("where");
String order = request.getParameter("order");
Class cl = Class.forName("com.mysoft.vf."+firstUpper(objname)+"Manager");
Object obj = cl.newInstance();
Method mt = cl.getMethod("loadByWhere",new Class[] {String.class});
Object[] records = (Object[])mt.invoke(obj,new Object[] {where+" order by "+order});



%>
<select>
<%for(int i=0;i<records.length;i++){
    Class cl0 = records[i].getClass();
    mt = cl0.getMethod("get"+firstUpper(name),new Class[] {});
    String val = mt.invoke(records[i]).toString();
    mt = cl0.getMethod("get"+firstUpper(objname)+"id",new Class[] {});
    String id = mt.invoke(records[i]).toString();
%>
    <option value='<%=id%>'><%=val%></option>
<%}%>
</select>
