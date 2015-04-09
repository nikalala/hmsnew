<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
ReservationroomBean reserv = ReservationroomManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("rid")));
ReservationBean res = ReservationManager.getInstance().loadByPrimaryKey(reserv.getReservationid());
String sql = "where roomrate = true and active = true and deleted = false ";
sql += " and discountid not in (select discountid from reservationdiscount where discountid > 0 and reservationid = "+reserv.getReservationid()+")";
sql += " and discountid not in (select discountid from reservation where discountid > 0 and reservationid = "+reserv.getReservationid()+")";
sql += " order by name";
DiscountBean[] discounts = DiscountManager.getInstance().loadByWhere(sql);
%>
    <option value="0">--აირჩიეთ--</option>
    <%
    for(int i=0;i<discounts.length;i++){
    %>
    <option value="<%=discounts[i].getDiscountid()%>"><%=discounts[i].getName()%></option>
    <%
    }
    %>
