<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%
JSONObject js = new JSONObject();
//Manager.getInstance().beginTransaction();
try{
    RoomBean room = RoomManager.getInstance().loadByPrimaryKey(new Integer(request.getParameter("id")));
    String sql = "where departuredate::date >= to_date('"+df.format(dclosedate)+"','DD/MM/YYYY') and "
            + "status <= 0 and "
            + "reservationid in (select reservationid from reservationroom where roomid = "+room.getRoomid()+") "
            + "order by departuredate asc";
    ReservationBean[] rs = ReservationManager.getInstance().loadByWhere(sql);
    if(rs.length == 0)
        throw new Exception("შეტყობინება ამ ოთახზე არ ფიქსირდება");
    //Manager.getInstance().endTransaction(true);
    js.put("rid",rs[0].getReservationid());
    js.put("result", 1);
}catch(Exception e){
    e.printStackTrace();
    //Manager.getInstance().endTransaction(false);
    js.put("result", 0);
    js.put("error", e.getMessage());
}
%>
<%=js.toString()%>
