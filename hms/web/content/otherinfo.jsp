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
if(reserv.getBsourceid()!= null){
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
    if(companyname == null) companyname = "";
}

%>
<div class="panel-heading">
    <h3 class="panel-title">
        სხვა ინფორმაცია
        <div class="btn-group pull-right">
            <a href="javascript:newsWindow1('editotherinfo','სხვა ინფორმაციის რედაქტირება','reservationroomid=<%=rroom.getReservationroomid()%>');" class="glyphicon glyphicon-pencil iconblack" style="text-decoration: none;" data-toggle="tooltip" title="სხვა ინფორმაციის რედაქტირება"></a>
        </div>
    </h3>
</div>
<div class="panel-body" style="height:110px;">
    <table width="100%" class="table table-borderless">
        <tbody>
            <tr>
                <td><b>რეზერვაციის ტიპი</b></td>
                <td><%=restp%></td>
            </tr>
            <tr>
                <td><b>ბიზნეს წყარო</b></td>
                <td><%=bsrc%></td>
            </tr>
            <tr>
                <td><b>ბაზრის კოდი</b></td>
                <td><%=marketname%></td>
            </tr>
            <tr>
                <td><b>ტურ. აგენტი</b></td>
                <td><%=agentname%></td>
            </tr>
            <tr>
                <td><b>კომპანია</b></td>
                <td><%=companyname%></td>
            </tr>
        </tbody>
    </table>
</div>