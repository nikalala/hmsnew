<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%
Vector v = (Vector)session.getAttribute("WALKIN_EXTRACHARGES");
if(v == null)   v = new Vector();
System.out.println("v2.size() = "+v.size());
if(v.size()>0){
%>
<table class="scrollwk table table-condensed table-hover table-striped" width="100%">
<thead>
    <tr>
        <th nowrap align="left" style="width: 200px; padding-left: 0px;">&nbsp;&nbsp;დასახელება</th>
        <th nowrap align="left" style="width: 250px; padding-left: 1px;">&nbsp;&nbsp;წესი</th>
        <th nowrap align="left" style="width: 250px; padding-left: 40px;">&nbsp;&nbsp;ტიპი</th>
        <th nowrap align="left" style="width: 110px; padding-left: 150px;">&nbsp;&nbsp;ტარიფი</th>
        <th nowrap align="left" style="width: 110px; padding-left: 10px;">&nbsp;&nbsp;რაოდ. უ/ბ</th>
        <th nowrap align="right" style="width: 200px; padding-left: 30px;">&nbsp;&nbsp;მოქმედება</th>
    </tr>
</thead>
<tbody id="walkin_extracharges_body">
<%
for(int i=0;i<v.size();i++){
    ExtrachargefolioBean efb = (ExtrachargefolioBean)v.elementAt(i);
    ExtrachargeBean extracharge = ExtrachargeManager.getInstance().loadByPrimaryKey(efb.getExtrachargeid());
    String qt = "";
    if(efb.getChargeapplyrieson().intValue() == 0) qt = efb.getAdult().toString();
    if(efb.getChargeapplyrieson().intValue() == 1) qt = efb.getChild().toString();
    if(efb.getChargeapplyrieson().intValue() == 3) qt = efb.getAdult().toString()+"/"+efb.getChild().toString();
    if(efb.getChargeapplyrieson().intValue() == 4) qt = efb.getQty().toString();
%>
<tr id="" style="font-weight: normal !important;">
    <td style="width: 200px;">
        <%=extracharge.getName()%>
    </td>
    <td style="width: 250px;">
        <%=extrachargepostingtype[efb.getPostingtype()]%>
    </td>
    <td style="width: 250px;">
        <%=chargeapplieson[efb.getChargeapplyrieson()]%>
    </td>
    <td style="width: 110px; text-align: right;">
        <%=dc.format(efb.getRate().doubleValue())%>
    </td>
    <td style="width: 110px; text-align: right;">
        <%=qt%>
    </td>
    <td style="width: 200px; text-align: right;">
        <form class="form-inline" role="form">
        <div class="form-group">
        <div class="input-group">
        <div class="input-group-addon glyphicon glyphicon-pencil" style="color: green; cursor: pointer;" onclick="editExtracharge(<%=i%>)"></div>
        <div class="input-group-addon glyphicon glyphicon-remove" style="color: red; cursor: pointer;" onclick="delExtracharge(<%=i%>)"></div>
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
