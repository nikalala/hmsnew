<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/xml;charset=utf-8"%>
<%@include file="../includes/initxml.jsp" %>
<%!
String displayNode(int parentid,int level) throws Exception{
    String s = "";
    String where = "parentid is null";
    if(parentid > 0){
        where = "parentid = "+parentid;
    }
    
    MenuBean[] menu = MenuManager.getInstance().loadByWhere("WHERE "+where+" order by ord");
    for(int i=0;i<menu.length;i++){
        String pid = "NULL";
        int pd = 0;
        if(menu[i].getParentid() != null){
            pid = menu[i].getParentid().toString();
            pd = menu[i].getParentid().intValue();
        }
        String add = "<span class=\"ui-icon ui-icon-plus\" style=\"display:inline-block\" onclick=\"addLeaf("+menu[i].getMenuid()+")\">";
        String leaf = "true";
        if(MenuManager.getInstance().countWhere("where menuid = "+menu[i].getMenuid()+" and menuid in (select parentid from menu where parentid is not null)") > 0){
            leaf = "false";
            add = "&nbsp;";
        }
        s += "<row>\n";
        s += "<cell>"+menu[i].getMenuid()+"</cell>\n";
        s += "<cell>"+menu[i].getName()+"</cell>\n";
        s += "<cell>"+menu[i].getFile()+"</cell>\n";
        s += "<cell>"+menu[i].getOrd()+"</cell>\n";
        s += "<cell>"+pd+"</cell>\n";
        s += "<cell>"+level+"</cell>\n";
        s += "<cell><![CDATA["+pid+"]]></cell>\n";
        s += "<cell>"+leaf+"</cell>\n";
        s += "<cell>false</cell>\n";
        s += "</row>\n";
        s += displayNode(menu[i].getMenuid().intValue(),level+1);
    }
    
    return s;
}
        
%>
<%
//MenuBean[] leafs = MenuManager.getInstance().loadByWhere("where menuid in (SELECT t1.menuid FROM menu AS t1 LEFT JOIN menu as t2 ON t1.menuid = t2.parentid WHERE t2.menuid IS NULL) order by menuid");




int ipg = 1;
int ilmt = 10;
String pg = request.getParameter("page");
if(pg != null)  ipg = Integer.parseInt(pg);
String lmt = request.getParameter("rows");
if(lmt != null) ilmt = Integer.parseInt(lmt);
String sidx = request.getParameter("sidx");
if(sidx == null)    sidx = "";
String sord = request.getParameter("sord");
if(sord == null)    sord = "";
//if(isidx == 0) isidx = 1;


int count = MenuManager.getInstance().countWhere("where parentid is null");
int total_pages = 0;
if(count > 0)    total_pages = (int)(count/ilmt);
if(total_pages*ilmt < count)    total_pages++;
if(ipg > total_pages) ipg=total_pages;
int start = ilmt*ipg - ilmt;
if(start < 0)   start = 0;
String limit = "limit "+ilmt+" offset "+start;

String order = "order by "+sidx+", menuid "+sord;

%>
<rows>
    <page><%=ipg%></page>
    <total><%=total_pages%></total>
    <records><%=count%></records>
    <%=displayNode(0,0)%>
</rows>
