<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/xml;charset=utf-8"%>
<%@include file="../includes/initxml.jsp" %>
<%
String where = "where parentid is not null";

String filter =request.getParameter("filters");
if(filter != null && filter.trim().length() > 0)
    {
    filter =  filter.trim();
    
    JSONObject json = (JSONObject) JSONSerializer.toJSON( filter );
    String groupOp = json.getString("groupOp");
    
    JSONArray rules = json.getJSONArray("rules");
    int rulesCount = JSONArray.getDimensions(rules)[0];
    for(int i = 0; i<rulesCount; i++)
        {
        JSONObject rule = rules.getJSONObject(i);
      
        String field = rule.getString("field");
        String oper = rule.getString("op");
        String data = rule.getString("data").replaceAll("'", "''");
        
        String wrest = "";

        if(oper.equals("eq") )
            {
            wrest += " = to_timestamp('"+data+"','DD/MM/YYYY')";
            }
        else if(oper.equals("ne") )
            {
            }
        else if(oper.equals("lt") )
            {
            }
        else if(oper.equals("le") )
            {
            }
        else if(oper.equals("gt") )
            {
            }
        else if(oper.equals("ge") )
            {
            }
        else if(oper.equals("bw") )  wrest += " like '"+data+"%'";
        else if(oper.equals("bn") )  wrest += " not like '"+data+"%'";
        else if(oper.equals("in") )  wrest += " like '%"+data+"%'";
        else if(oper.equals("ni") )  wrest += " not like '%"+data+"%'";
        else if(oper.equals("ew") )  wrest += " like '%"+data+"'";
        else if(oper.equals("en") )  wrest += " not like '%"+data+"'";
        else if(oper.equals("cn") )  wrest += " like '%"+data+"%'";
        else if(oper.equals("nc") )  wrest += " not like '"+data+"'";

        where += " "+groupOp + " "+field +" "+wrest;
        }
    }



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


int count = MenuManager.getInstance().countWhere(where);
int total_pages = 0;
if(count > 0)    total_pages = (int)(count/ilmt);
if(total_pages*ilmt < count)    total_pages++;
if(ipg > total_pages) ipg=total_pages;
int start = ilmt*ipg - ilmt;
if(start < 0)   start = 0;
String limit = "limit "+ilmt+" offset "+start;

String order = "order by order by parentid, ord";

PersonelltypeBean[] ptypes = PersonelltypeManager.getInstance().loadByWhere("order by name");
MenuBean[] menus = MenuManager.getInstance().loadByWhere(where+" "+limit);
%>
<rows>
    <page><%=ipg%></page>
    <total><%=total_pages%></total>
    <records><%=count%></records>
    <%
        for(int i=0;i<menus.length;i++)
            {
            MenuBean parent = MenuManager.getInstance().loadByPrimaryKey(menus[i].getParentid());
            %>
            <row id='<%=menus[i].getMenuid()%>'>
                <cell><![CDATA[<%=parent.getName()%>]]></cell>
                <cell><![CDATA[<%=menus[i].getName()%>]]></cell>
                <%
                for(int j=0;j<ptypes.length;j++){
                    String checked = "";
                    if(PlevelManager.getInstance().countWhere("where read = true and personelltypeid = "+ptypes[j].getPersonelltypeid()+" and menuid = "+menus[i].getMenuid()) > 0)
                        checked = "checked";
                    String chkbox = "<input type='checkbox' class='gText' name='menu_"+ptypes[j].getPersonelltypeid()+"' id='menu_"+ptypes[j].getPersonelltypeid()+"' value='"+menus[i].getMenuid()+"' onclick='chLevel("+ptypes[j].getPersonelltypeid()+","+menus[i].getMenuid()+",this.checked)' "+checked+">";
                %>
                <cell><![CDATA[<%=chkbox%>]]></cell>
                <%}%>
            </row>
            <%
            }
    %>
</rows>
