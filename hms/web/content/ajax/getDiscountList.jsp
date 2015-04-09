<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%
ReservationroomBean reserv = ReservationroomManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("rid")));
ReservationBean res = ReservationManager.getInstance().loadByPrimaryKey(reserv.getReservationid());
ReservationdiscountBean[] discounts = ReservationdiscountManager.getInstance().loadByReservationid(res.getReservationid());
if(discounts.length>0 || res.getDiscountid() != null){
%>
<table class="scrollwk table table-condensed table-hover table-striped" width="100%">
<thead>
    <tr>
        <th nowrap align="left" style="width: 200px; padding-left: 0px;">&nbsp;&nbsp;დამატებულია</th>
        <th nowrap align="left" style="width: 300px; padding-left: 5px;">&nbsp;&nbsp;ტიპი</th>
        <th nowrap align="left" style="width: 300px; padding-left: 5px;">&nbsp;&nbsp;წესი</th>
        <th nowrap align="left" style="width: 80px; padding-left: 5px;">&nbsp;&nbsp;ოდენობა</th>
        <th nowrap align="left" style="width: 250px; padding-left: 10px;">&nbsp;&nbsp;მოქმედებს</th>
        <th nowrap align="left" style="width: 250px; padding-left: 5px;">&nbsp;&nbsp;მომხმარებელი</th>
        <th nowrap align="right" style="width: 60px; padding-left: 5px;">&nbsp;&nbsp;მოქმედება</th>
    </tr>
</thead>
<tbody id="setdiscount_extracharges_body">
<%if(res.getDiscountid() != null){
    PersonnelBean pers = PersonnelManager.getInstance().loadByPrimaryKey(res.getRegbyid());
    DiscountBean disc = DiscountManager.getInstance().loadByPrimaryKey(res.getDiscountid());
    String rule = "";
    switch(res.getPostingtype().intValue()){
        case 0:
            rule = "ყოველი "+res.getDiscountnights()+" ღამის შემდეგ";
            break;
        default:
            rule = discountplan[res.getPostingtype().intValue()];
    }
    String suff = maincurrency.getCode();
    if(disc.getPerctype().booleanValue())
        suff = "%";
%>
<tr id="" style="font-weight: normal !important;">
    <td style="width: 200px;">
        <%=dt.format(res.getRegdate())%>
    </td>
    <td style="width: 300px;">
        <%=disc.getName()%>
    </td>
    <td style="width: 300px;">
        <%=rule%>
    </td>
    <td style="width: 80px; text-align: right;">
        <%=(res.getPostingvalueevery() != null) ? dc.format(res.getPostingvalueevery()):dc.format(disc.getVal())%>&nbsp;<%=suff%>
    </td>
    <td style="width: 250px; text-align: left;">
        მომდევნო; წარსული
    </td>
    <td style="width: 250px; text-align: right;">
        <%=pers.getFname()%> <%=pers.getLname()%>
    </td>
    <td style="width: 60px; text-align: right;">
        <form class="form-inline" role="form">
        <div class="form-group">
        <div class="input-group">
        <div class="input-group-addon glyphicon glyphicon-remove" style="color: red; cursor: pointer;" onclick="delDiscount(<%=res.getReservationid()%>)"></div>
        </div>
        </div>
        </form>
    </td>
</tr>
<%
}
String olds = "";
for(int i=0;i<discounts.length;i++){
    PersonnelBean pers = PersonnelManager.getInstance().loadByPrimaryKey(discounts[i].getRegbyid());
    DiscountBean disc = DiscountManager.getInstance().loadByPrimaryKey(discounts[i].getDiscountid());
    String opts = "";
    if(discounts[i].getAuditeddays().booleanValue())
        opts += "მომდევნო";
    if(discounts[i].getAuditeddays().booleanValue()){
        if(opts.length() > 0)   opts += "; ";
        opts += "წარსული";
    }
    String rule = "";
    switch(discounts[i].getPostingtype().intValue()){
        case 0:
            rule = "ყოველი "+discounts[i].getDiscountnights()+" ღამის შემდეგ";
            break;
        default:
            rule = discountplan[discounts[i].getPostingtype().intValue()];
    }
    String suff = maincurrency.getCode();
    if(disc.getPerctype().booleanValue())
        suff = "%";
%>
<tr id="" style="font-weight: normal !important;">
    <td style="width: 200px;">
        <%=dt.format(discounts[i].getRegdate())%>
    </td>
    <td style="width: 300px;">
        <%=disc.getName()%>
    </td>
    <td style="width: 300px;">
        <%=rule%>
    </td>
    <td style="width: 80px; text-align: right;">
        <%=(discounts[i].getPostingvalueevery() != null) ? dc.format(discounts[i].getPostingvalueevery()):dc.format(disc.getVal())%>&nbsp;<%=suff%>
    </td>
    <td style="width: 250px; text-align: left;">
        <%=opts%>
    </td>
    <td style="width: 250px; text-align: right;">
        <%=pers.getFname()%> <%=pers.getLname()%>
    </td>
    <td style="width: 60px; text-align: right;">
        <form class="form-inline" role="form">
        <div class="form-group">
        <div class="input-group">
        <div class="input-group-addon glyphicon glyphicon-remove" style="color: red; cursor: pointer;" onclick="delDiscount1(<%=discounts[i].getReservationdiscountid()%>)"></div>
        </div>
        </div>
        </form>
    </td>
</tr>
<%}%>
</tbody>
</table>
<%
}
%>
