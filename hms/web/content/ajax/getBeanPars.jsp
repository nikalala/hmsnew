<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%

String objname = request.getParameter("objname");
String id = request.getParameter("id");

String functionname = "loadByPrimaryKey";

Class cl = Class.forName("com.mysoft."+objname+"Manager");

Class typename = null;
Object o = null;
Method[] mts = cl.getDeclaredMethods();
for(int i=0;i<mts.length;i++){
    if(mts[i].getName().equalsIgnoreCase(functionname)){
        Class<?>[] params = mts[i].getParameterTypes();
        if(params.length == 1){
            typename = Class.forName(params[0].getName());
            Constructor cn = typename.getConstructor(new Class[] {String.class});
            o = cn.newInstance(id);
        }
        break;
    }
}

JSONObject jobj = new JSONObject();

Object obj = cl.newInstance();
Method mt = cl.getMethod(functionname,new Class[] {typename});
Object record = (Object)mt.invoke(obj,new Object[] { o });

if(record != null){
    Field[] fields = record.getClass().getDeclaredFields();
    for(Field field : fields){
        field.setAccessible(true);
        final Object fieldObj = field.get(record);
        final String value;
        if(fieldObj != null && field.getName().indexOf("_is") < 0 )  jobj.put(field.getName(),fieldObj);
    }
} else {
    jobj.put("error","NO DATA");
}

%>
<%=jobj.toString()%>
