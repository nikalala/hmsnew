<%@page contentType="text/json; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/meta.jsp"%>
<%
RoomtypeBean[] roomtypes = RoomtypeManager.getInstance().loadByWhere("where active = true and deleted = false order by ord");
SimpleDateFormat ssdd = new SimpleDateFormat("yyyy-MM-dd");
JSONArray js = new JSONArray();
for(int i=0;i<roomtypes.length;i++){
    
    JSONObject obj = new JSONObject();
    obj.put("Id", roomtypes[i].getRoomtypeid().toString());
    obj.put("Name", "<b>"+roomtypes[i].getName()+"<b>");
    js.add((JSONObject)obj);
    RoomBean[] rooms = RoomManager.getInstance().loadByWhere("where active = true and deleted = false and roomtypeid = "+roomtypes[i].getRoomtypeid()+" order by ord");
    for(int j=0;j<rooms.length;j++){
        obj.put("Id", roomtypes[i].getRoomtypeid().toString()+"_"+rooms[j].getRoomid().toString());
        obj.put("Name", rooms[j].getName());
        js.add((JSONObject)obj);
    }
}
//System.out.println(js.toString());
%>
<%=js.toString()%>
