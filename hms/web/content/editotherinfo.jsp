<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
ReservationroomBean rroom = ReservationroomManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("reservationroomid")));
ReservationBean reserv = ReservationManager.getInstance().loadByPrimaryKey(rroom.getReservationid());
String restp = "";
String bsrc = "";
String marketname = "";
String agentname = "";
String companyname = "";
if(reserv.getReservationtypeid() != null){
    ReservationtypeBean restype = ReservationtypeManager.getInstance().loadByPrimaryKey(reserv.getReservationtypeid());
    restp = "<span style=\"color: "+restype.getColor()+"\">"+restype.getName()+"</span>";
}
if(reserv.getBsourceid() != null){
    BsourceBean bs = BsourceManager.getInstance().loadByPrimaryKey(reserv.getBsourceid());
    bsrc = bs.getName();
}
if(reserv.getMarketid() != null){
    MarketBean bs = MarketManager.getInstance().loadByPrimaryKey(reserv.getMarketid());
    marketname = bs.getName();
}
if(reserv.getTaid() != null){
    ContragentBean bs = ContragentManager.getInstance().loadByPrimaryKey(reserv.getTaid());
    agentname = bs.getFname()+" "+bs.getLname();
}
if(reserv.getCompanyid()!= null){
    ContragentBean bs = ContragentManager.getInstance().loadByPrimaryKey(reserv.getCompanyid());
    companyname = bs.getName();
}

BsourceBean[] bsources = BsourceManager.getInstance().loadByWhere("order by name");
MarketBean[] markets = MarketManager.getInstance().loadByWhere("order by name");
ContragentBean[] tas = ContragentManager.getInstance().loadByWhere("where type = 2 order by name");
ContragentBean[] companies = ContragentManager.getInstance().loadByWhere("where type = 1 order by name");
%>
<script>
    
</script>
<input type="hidden" id="action" value="saveotherinfo.jsp?reservationid=<%=reserv.getReservationid()%>"/>
<input type="hidden" id="controls" value="edittransaction_bsourceid,edittransaction_marketid,edittransaction_taid,edittransaction_commissionplan,edittransaction_value,edittransaction_companyid"/>
<input type="hidden" id="callbackurl" value="content/otherinfo.jsp?reservationroomid=<%=rroom.getReservationroomid()%>"/>
<input type="hidden" id="callbackdata" value="otherinfo"/>
<table width="100%" class="table table-borderless">
    <tbody>
        <tr>
            <td><b>ბიზნეს წყარო</b></td>
            <td>
                <select id="edittransaction_bsourceid" style="width: 100px;">
                    <option value="0">-- აირჩიეთ --</option>
                    <%
                    for(int i=0;i<bsources.length;i++){
                        String sel = "";
                        if(reserv.getBsourceid() != null && reserv.getBsourceid().intValue() == bsources[i].getBsourceid().intValue())
                            sel = "selected";
                    %>
                    <option value="<%=bsources[i].getBsourceid()%>" <%=sel%>><%=bsources[i].getName()%></option>
                    <%
                    }
                    %>
                </select>
            </td>
        </tr>
        <tr>
            <td><b>ბაზრის კოდი</b></td>
            <td>
                <select id="edittransaction_marketid" style="width: 100px;">
                    <option value="0">-- აირჩიეთ --</option>
                    <%
                    for(int i=0;i<markets.length;i++){
                        String sel = "";
                        if(reserv.getMarketid() != null && reserv.getMarketid().intValue() == markets[i].getMarketid().intValue())
                            sel = "selected";
                    %>
                    <option value="<%=markets[i].getMarketid()%>" <%=sel%>><%=markets[i].getName()%></option>
                    <%
                    }
                    %>
                </select>
            </td>
        </tr>
        <tr>
            <td><b>ტურ. აგენტი</b></td>
            <td>
                <select id="edittransaction_taid" style="width: 100px;">
                    <option value="0">-- აირჩიეთ --</option>
                    <%
                    for(int i=0;i<tas.length;i++){
                        String sel = "";
                        if(reserv.getTaid() != null && reserv.getTaid().longValue() == tas[i].getContragentid().longValue())
                            sel = "selected";
                    %>
                    <option value="<%=tas[i].getContragentid()%>" <%=sel%>><%=tas[i].getName()%></option>
                    <%
                    }
                    %>
                </select>
            </td>
        </tr>
        <tr>
            <td><b>საკომისიოს გეგმა</b></td>
            <td>
                <select id="edittransaction_commissionplan" style="width: 100px;">
                    <option value="-1">--აირჩიეთ--</option>
                    <%
                    for(int i=0;i<commissionplan.length;i++){
                        String sel = "";
                        if(reserv.getCommissionplan() != null && reserv.getCommissionplan().intValue() == i)
                            sel = "selected";
                    %>
                    <option value="<%=i%>" <%=sel%>><%=commissionplan[i]%></option>
                    <%
                    }
                    %>
                </select>
            </td>
        </tr>
        <tr>
            <td><b>ოდენობა</b></td>
            <td>
                <input class="" size="10" value="<%=(reserv.getCommissionvalue() != null) ? dc.format(reserv.getCommissionvalue().doubleValue()):""%>" type="text" id="edittransaction_value">
            </td>
        </tr>
        <tr>
            <td><b>კომპანია</b></td>
            <td>
                <select id="edittransaction_companyid" style="width: 100px;">
                    <option value="0">-- აირჩიეთ --</option>
                    <%
                    for(int i=0;i<companies.length;i++){
                        String sel = "";
                        if(reserv.getCompanyid() != null && reserv.getCompanyid().longValue() == companies[i].getContragentid().longValue())
                            sel = "selected";
                    %>
                    <option value="<%=companies[i].getContragentid()%>" <%=sel%>><%=companies[i].getName()%></option>
                    <%
                    }
                    %>
                </select>
            </td>
        </tr>
    </tbody>
</table>

