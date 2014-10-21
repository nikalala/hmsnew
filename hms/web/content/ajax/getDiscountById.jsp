<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%
DiscountBean db = DiscountManager.getInstance().loadByPrimaryKey(new Integer(request.getParameter("discountid")));
JSONObject json = new JSONObject();
if(db != null){
    json.put("active",db.getActive().toString());
    json.put("code",db.getCode().toString());
    json.put("extracharge",db.getExtracharge().toString());
    json.put("name",db.getName().toString());
    json.put("open",db.getOpen().toString());
    json.put("perctype",db.getPerctype().toString());
    json.put("regbyid",db.getRegbyid().toString());
    json.put("regdate",db.getRegdate().toString());
    json.put("roomrate",db.getRoomrate().toString());
    json.put("val",db.getVal());
    json.put("id",db.getDiscountid().toString());
} else json.put("error","NO DATA");
%>
<%=json.toString()%>