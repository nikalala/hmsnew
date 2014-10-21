<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%
String selectadult = "";
String selectcild = "";
String selectroom = "<option value=\"0\">--აირჩიეთ--</option>";
String selectratetype = "";

RoomtypeBean roomtype = RoomtypeManager.getInstance().loadByPrimaryKey(new Integer(request.getParameter("roomtypeid")));
if(roomtype != null){
    RoomBean[] rooms = RoomManager.getInstance().loadByWhere("where roomtypeid = "+roomtype.getRoomtypeid()+" order by name");
    RatetypeBean[] ratetypes = RatetypeManager.getInstance().loadByWhere("where ratetypeid in (select ratetypeid from ratetyperoomtype where roomtypeid = "+roomtype.getRoomtypeid()+") order by ord");

    for(int i=0;i<=roomtype.getMadult().intValue();i++){
        String sel = "";
        if(i == roomtype.getBadult().intValue())
            sel = "selected";
        selectadult += "<option value=\""+i+"\" "+sel+">"+i+"</option>";
    }

    for(int i=0;i<=roomtype.getMchild().intValue();i++){
        String sel = "";
        if(i == roomtype.getBadult().intValue())
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