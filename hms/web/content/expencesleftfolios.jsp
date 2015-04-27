<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
    String startdate = df.format(dclosedate);
    String enddate = df.format(dclosedate);
    String cname = request.getParameter("cname");
    if(cname == null)   cname = "";
    String vnum = request.getParameter("vnum");
    if(vnum == null)   vnum = "";
    
    if(request.getParameter("startdate") != null) startdate = df.format(dt.parse(request.getParameter("startdate")));
    if(request.getParameter("enddate") != null) enddate = df.format(dt.parse(request.getParameter("enddate")));
    
    String sql = "where folioid in (select folioid from folioitem where itemdate >= to_date('"+startdate+"','DD/MM/YYYY') and itemdate <= to_date('"+enddate+"','DD/MM/YYYY')) and expence = true ";
    if(cname.trim().length() > 0) sql += " and case when guestid is not null then upper(guestname(guestid)) like '%"+cname.trim().toUpperCase().replaceAll("'", "''") +"%' else upper(contragentname(contragentid)) like '%"+cname.trim().toUpperCase().replaceAll("'", "''") +"%' end";
    if(vnum.trim().length() > 0) sql += " and upper(refno) like '%"+vnum.trim().toUpperCase().replaceAll("'", "''") +"%'";
    sql += " order by num";
    
System.out.println(sql);
    
    FolioBean[] folios = FolioManager.getInstance().loadByWhere(sql);
    
%>
<table class="table table-striped">
    <tbody>
        <%for(int i=0;i<folios.length;i++){
            String name = "";
            if(folios[i].getGuestid() != null)          name = getGuestName(folios[i].getGuestid().longValue());
            if(folios[i].getContragentid() != null)     name = getContragentName(folios[i].getContragentid().longValue());
        %>
        <tr>
            <td><%=folios[i].getNum()%></td>
            <td><%=name%></td>
            <td style="text-align: center;"><i class="fa fa-print" onclick="printExpFolio(<%=folios[i].getFolioid()%>)"></i></td>
            <td style="text-align: center;"><i class="fa fa-pencil" style="color: #febd04;" onclick="editExpFolio(<%=folios[i].getFolioid()%>)"></i></td>
            <td style="text-align: center;"><i class="fa fa-trash-o" style="color: red;" onclick="delExpFolio(<%=folios[i].getFolioid()%>)"></i></td>
        </tr>
        <%}%>
    </tbody>
</table>