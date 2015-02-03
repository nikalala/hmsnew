<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%
String selectadult = "";
String selectcild = "";
String selectroom = "<option value=\"0\">--აირჩიეთ--</option>";
String selectratetype = "";
ReservationtypeBean rtp = ReservationtypeManager.getInstance().loadByPrimaryKey(new Integer(request.getParameter("rtp")));
Date arrdate = dt.parse(request.getParameter("arrivaldate"));
Date arrtime = dtime.parse(request.getParameter("arrivaltime"));
Date depdate = dt.parse(request.getParameter("departuredate"));
Date deptime = dtime.parse(request.getParameter("departuretime"));
String adt = df.format(arrdate)+" "+dftime.format(arrtime);
String ddt = df.format(depdate)+" "+dftime.format(deptime);
RoomtypeBean roomtype = RoomtypeManager.getInstance().loadByPrimaryKey(new Integer(request.getParameter("roomtypeid")));
if(roomtype != null){
    
    String sqlrooms = "where roomid not in "
        + "(select roomid from roomst where "
        + "statusdate <= to_timestamp('"+adt+"','DD/MM/YYYY HH24:MI') and "
        + "st in (1,5) "
        + "order by statusdate desc, regdate desc limit 1) and "
        + "roomid not in (select s.roomid from reservation r, reservationroom s where "
        + "r.reservationid = s.reservationid and "
        + "r.arraivaldate <= to_timestamp('"+ddt+"','DD/MM/YYYY HH24:MI') and "
        + "r.departuredate >= to_timestamp('"+adt+"','DD/MM/YYYY HH24:MI') and s.roomid is not null) and "
        + "roomtypeid = "+roomtype.getRoomtypeid()+" order by name";
    sqlrooms = "where "
            + "roomtypeid = "+roomtype.getRoomtypeid()+" "
            + "and roomid not in (select roomid from roomst where roomid is not null and statusdate <= to_timestamp('"+adt+"','DD/MM/YYYY HH24:MI') and st in (0,1,2,5,6) order by statusdate desc, regdate desc limit 1) "
            + "and roomid not in (select roomid from roomst where roomid is not null and statusdate::date >= (to_timestamp('"+adt+"','DD/MM/YYYY HH24:MI')+interval '1' day)::date and statusdate::date <= (to_timestamp('"+ddt+"','DD/MM/YYYY HH24:MI')-interval '1' day)::date and st in (0,1,2,5,6)) "
            + "and roomid not in (select roomid from roomst where roomid is not null and statusdate >= to_timestamp('"+ddt+"','DD/MM/YYYY HH24:MI') and st in (0,1,2,5,6) order by statusdate desc, regdate desc limit 1) "
            + " order by name";

System.out.println(sqlrooms);
    RoomBean[] rooms = getAvailableRooms(dflong.parse(adt), dflong.parse(ddt), roomtype.getRoomtypeid().intValue());   //RoomManager.getInstance().loadByWhere("where roomtypeid = "+roomtype.getRoomtypeid());
    if(rtp.getConfirmed().booleanValue())
            rooms = getAvailableRooms(dflong.parse(adt),dflong.parse(ddt),roomtype.getRoomtypeid().intValue()); // RoomManager.getInstance().loadByWhere(sqlrooms);
    RatetypeBean[] ratetypes = RatetypeManager.getInstance().loadByWhere("where ratetypeid in (select ratetypeid from ratetyperoomtype where roomtypeid = "+roomtype.getRoomtypeid()+") order by ord");

    for(int i=0;i<=roomtype.getMadult().intValue();i++){
        String sel = "";
        if(i == roomtype.getBadult().intValue())
            sel = "selected";
        selectadult += "<option value=\""+i+"\" "+sel+">"+i+"</option>";
    }

    for(int i=0;i<=roomtype.getMchild().intValue();i++){
        String sel = "";
        if(i == roomtype.getBchild().intValue())
            sel = "selected";
        selectcild += "<option value=\""+i+"\" "+sel+">"+i+"</option>";
    }

    for(int i=0;i<rooms.length;i++){
        selectroom += "<option value=\""+rooms[i].getRoomid()+"\">"+rooms[i].getName()+"</option>";
    }

    for(int i=0;i<ratetypes.length;i++){
        selectratetype += "<option value=\""+ratetypes[i].getRatetypeid()+"\">"+ratetypes[i].getName()+"</option>";
    }
}

JSONObject json = new JSONObject();
json.put("selectroom", selectroom);
json.put("selectratetype", selectratetype);
json.put("selectadult", selectadult);
json.put("selectcild", selectcild);
%>
<%=json.toString()%>