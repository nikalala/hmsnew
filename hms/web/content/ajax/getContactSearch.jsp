<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%
int cid = Integer.parseInt(request.getParameter("cid"));
String term = request.getParameter("contact_search_name").toUpperCase().trim().replaceAll("'", "''");
String sphone = request.getParameter("contact_search_phone").toUpperCase().trim().replaceAll("'", "''");
String sidno = request.getParameter("contact_search_phone").toUpperCase().trim().replaceAll("'", "''");
String smobile = request.getParameter("contact_search_mobile").toUpperCase().trim().replaceAll("'", "''");

String sql = "where guestid > 0";
if(term.length() > 0)   sql += " and upper(fname) || ' ' || upper(lname) like '%"+term+"%' or upper(lname) || ' ' || upper(fname) like '%"+term+"%'";
if(sphone.length() > 0)   sql += " and upper(phone) like '%"+sphone+"%'";
if(sidno.length() > 0)   sql += " and upper(idn) like '%"+sidno+"%'";
if(smobile.length() > 0)   sql += " and upper(mobile) like '%"+smobile+"%'";
GuestBean[] guests = GuestManager.getInstance().loadByWhere(sql);
for(int i=0;i<guests.length;i++){
    String guestname = guests[i].getLname()+" "+guests[i].getFname();
    CountryBean country = CountryManager.getInstance().loadByPrimaryKey(guests[i].getCountryid());
    String vipstatus = "";
    if(guests[i].getVipstatusid() != null){
        VipstatusBean vip = VipstatusManager.getInstance().loadByPrimaryKey(guests[i].getVipstatusid());
        vipstatus = vip.getName();
    }
    String phone = guests[i].getPhone();
    if(phone == null)   phone = "";
    String mobile = guests[i].getMobile();
    if(mobile == null)  mobile = "";
    String idn = guests[i].getIdn();
    if(idn == null) idn = "";
%>
<tr style="cursor: pointer;">
    <td style="color: #7DA341; font-weight: bold; width: 100px;" onclick="selGuestIn(<%=guests[i].getGuestid()%>)"><%=guestname%></td>
    <td style='width: 100px;' onclick="selGuest(<%=guests[i].getGuestid()%>)"><%=guests[i].getCity()%></td>
    <td style='width: 100px;' onclick="selGuest(<%=guests[i].getGuestid()%>)"><%=country.getName()%></td>
    <td style='width: 100px;' onclick="selGuest(<%=guests[i].getGuestid()%>)"><%=vipstatus%></td>
    <td style='width: 100px;' onclick="selGuest(<%=guests[i].getGuestid()%>)"><%=phone%></td>
    <td style='width: 100px;' onclick="selGuest(<%=guests[i].getGuestid()%>)"><%=mobile%></td>
    <td style='width: 100px;' onclick="selGuest(<%=guests[i].getGuestid()%>)"><%=idn%></td>
</tr>
<%}%>
