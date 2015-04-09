<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%
int cid = Integer.parseInt(request.getParameter("cid"));
String term = request.getParameter("contact_search_name").toUpperCase().trim().replaceAll("'", "''");
String sphone = request.getParameter("contact_search_phone").toUpperCase().trim().replaceAll("'", "''");
String sidno = request.getParameter("contact_search_phone").toUpperCase().trim().replaceAll("'", "''");
String smobile = request.getParameter("contact_search_mobile").toUpperCase().trim().replaceAll("'", "''");

String sql = "where type = "+cid+"";
if(term.length() > 0)   sql += " and upper(name) like '%"+term+"%' or upper(fname) || ' ' || upper(lname) like '%"+term+"%' or upper(lname) || ' ' || upper(fname) like '%"+term+"%'";
if(sphone.length() > 0)   sql += " and upper(phone) like '%"+sphone+"%'";
if(sidno.length() > 0)   sql += " and upper(idn) like '%"+sidno+"%'";
if(smobile.length() > 0)   sql += " and upper(mobile) like '%"+smobile+"%'";
ContragentBean[] contrs = ContragentManager.getInstance().loadByWhere(sql);
%>
<%
                    for(int i=0;i<contrs.length;i++){
                        String guestname = contrs[i].getName();
                        CountryBean country = CountryManager.getInstance().loadByPrimaryKey(contrs[i].getCountryid());
                        String vipstatus = "";
                        String phone = contrs[i].getPhone();
                        if(phone == null)   phone = "";
                        String mobile = contrs[i].getMobile();
                        if(mobile == null)  mobile = "";
                        String idn = contrs[i].getIdn();
                        if(idn == null) idn = "";
                    %>
                    <tr style="cursor: pointer;">
                        <td style="color: #7DA341; font-weight: bold; width: 100px;" onclick="selGuestIn(<%=contrs[i].getContragentid()%>)"><%=guestname%></td>
                        <td style='width: 100px;' onclick="selGuest(<%=contrs[i].getContragentid()%>)"><%=contrs[i].getCity()%></td>
                        <td style='width: 100px;' onclick="selGuest(<%=contrs[i].getContragentid()%>)"><%=country.getName()%></td>
                        <td style='width: 100px;' onclick="selGuest(<%=contrs[i].getContragentid()%>)"><%=vipstatus%></td>
                        <td style='width: 100px;' onclick="selGuest(<%=contrs[i].getContragentid()%>)"><%=phone%></td>
                        <td style='width: 100px;' onclick="selGuest(<%=contrs[i].getContragentid()%>)"><%=mobile%></td>
                        <td style='width: 100px;' onclick="selGuest(<%=contrs[i].getContragentid()%>)"><%=idn%></td>
                    </tr>
                    <%}%>