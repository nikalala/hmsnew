<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%!
String getFullMenuName(MenuBean mn) throws Exception{
    String s = "";
    if(mn.getParentid() != null){
        MenuBean mn0 = MenuManager.getInstance().loadByPrimaryKey(mn.getParentid());
	if(mn.getParentid().intValue() != mn.getMenuid().intValue())
		s = getFullMenuName(mn0) + " -> ";
    }
    s += mn.getName();
    return s;
}
%>
<%
MenuBean[] menu = MenuManager.getInstance().loadByWhere("order by parentid desc, ord");
%>
<select>
    <option value='0'>ძირითადი ჯგუფი</option>
<%for(int i=0;i<menu.length;i++){%>
    <option value='<%=menu[i].getMenuid()%>'><%=getFullMenuName(menu[i])%></option>
<%}%>
</select>
