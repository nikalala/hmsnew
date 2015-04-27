<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
JSONObject js = new JSONObject();
Manager.getInstance().beginTransaction();
try{
    String[] ids = request.getParameter("ids").split(",");
    String ses = request.getParameter("ses");
    FolioitemBean[] folios = (FolioitemBean[])session.getAttribute(ses);
    for(int i=0;i<folios.length;i++){
        for(int j=0;j<ids.length;j++){
            int k = Integer.parseInt(ids[j])-1;
            if(k == i)  {
                boolean vd = false;
                if(folios[i].getZvoid() != null) vd = folios[i].getZvoid().booleanValue();
                folios[i].setZvoid(!vd);
            }
        }
    }
    session.setAttribute(ses, (FolioitemBean[])folios);
    
    Manager.getInstance().endTransaction(true);
    js.put("result",1);
    js.put("id",1);
}catch(Exception e){
    e.printStackTrace();
    Manager.getInstance().endTransaction(false);
    js.put("result",0);
    js.put("error",e.getMessage());
}
    
%>
<%=js.toString()%>
