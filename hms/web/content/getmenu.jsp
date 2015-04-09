<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
MenuBean[] menu = MenuManager.getInstance().loadByWhere("order by parentid, ord");

JSONObject grid = new JSONObject();
grid.element("total", menu.length);
JSONArray js = new JSONArray();
for(int i=0;i<menu.length;i++){
    JSONObject el = new JSONObject();
    el.element("id", menu[i].getMenuid());
    el.element("name", menu[i].getName());
    el.element("file", menu[i].getFile());
    if(menu[i].getParentid() != null){
        el.element("_parentId", menu[i].getParentid());
    }
    js.add(el);
}
grid.element("rows", js);
%>
<%=grid.toString()%>
