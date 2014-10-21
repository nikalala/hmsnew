<%@page contentType="text/json; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/meta.jsp"%>
<%!
private static java.awt.Color parseStringtoColor(String hexstring){ 
    Integer i = Integer.parseInt(hexstring.substring(1),16); 
    java.awt.Color color = new java.awt.Color(i); 
    return color; 
}

public final static String toHexString(java.awt.Color colour) throws NullPointerException {
  String hexColour = Integer.toHexString(colour.getRGB() & 0xffffff);
  if (hexColour.length() < 6) {
    hexColour = "000000".substring(0, 6 - hexColour.length()) + hexColour;
  }
  return "#" + hexColour;
}
%>
<%
for(Enumeration e=request.getParameterNames();e.hasMoreElements();){
    String dbg = "";
    String name = (String)e.nextElement();
    String[] vals = request.getParameterValues(name);
    dbg += name + " = ";
    for(int i=0;i<vals.length;i++){
        if(i > 0)   dbg += "; ";
        dbg += vals[i];
    }
    //System.out.println(dbg);
}

Calendar cal1 = Calendar.getInstance();
cal1.setTimeInMillis(Long.parseLong(request.getParameter("_dc")));
cal1.set(Calendar.HOUR, 0);
cal1.set(Calendar.MINUTE, 0);
cal1.set(Calendar.MILLISECOND, 0);
Calendar cal2 = Calendar.getInstance();
cal2.setTimeInMillis(cal1.getTimeInMillis());
cal2.add(Calendar.DATE,31);

String sql = "where reservationid in ("
        + "select reservationid from reservation where departuredate >= to_date('"+dtlong.format(cal1.getTime())+"','DD/MM/YYYY HH24:MI')"
        + " or arraivaldate < to_date('"+dtlong.format(cal2.getTime())+"','DD/MM/YYYY HH24:MI')"
        + ") order by reservationroomid";
ReservationroomBean[] resrooms = ReservationroomManager.getInstance().loadByWhere(sql);
SimpleDateFormat ssdd = new SimpleDateFormat("yyyy-MM-dd HH:mm");
JSONArray js = new JSONArray();
for(int i=0;i<resrooms.length;i++){
    RoomBean room = RoomManager.getInstance().loadByPrimaryKey(resrooms[i].getRoomid());
    RoomtypeBean roomtype = RoomtypeManager.getInstance().loadByPrimaryKey(room.getRoomtypeid());
    ReservationBean res = ReservationManager.getInstance().loadByPrimaryKey(resrooms[i].getReservationid());
    GuestBean guest = GuestManager.getInstance().loadByPrimaryKey(resrooms[i].getGuestid());
    SalutationBean slt = SalutationManager.getInstance().loadByPrimaryKey(guest.getSalutationid());
    String statuscolor = "#A9A9A9";
    String color = "#FFFFFF";
    int istatus = getRoomStatus(res.getArraivaldate(),room.getRoomid().intValue());
    if(istatus >= 0){
        StcolorBean[] stcolor = StcolorManager.getInstance().loadByWhere("where active = true and deleted = false and roomstatus = "+istatus);
        if(stcolor.length > 0){
            statuscolor = stcolor[0].getColor();
            java.awt.Color oldColor = parseStringtoColor(statuscolor);
            
            int v = ( oldColor.getRed() + oldColor.getGreen() + oldColor.getBlue() ) / 3 > 0.5 ? 0 : 1;
            java.awt.Color newColor = new java.awt.Color( v, v, v );
            
            //java.awt.Color newColor = new java.awt.Color(255-oldColor.getRed(), 255-oldColor.getGreen(), 255-oldColor.getBlue());
            color = toHexString(newColor);
            color = "#FFFFFF";
        }
    }
    JSONObject obj = new JSONObject();
    obj.put("Id", resrooms[i].getReservationroomid().toString());
    obj.put("ResourceId", roomtype.getRoomtypeid().toString()+"_"+room.getRoomid().toString());
    obj.put("Name", "<b>"+slt.getName()+" "+guest.getFname()+" "+guest.getLname()+"<b>");
    obj.put("StartDate",ssdd.format(res.getArraivaldate()));
    obj.put("EndDate",ssdd.format(res.getDeparturedate()));
    obj.put("Description",roomtype.getName());
    obj.put("ReservedTo",slt.getName()+" "+guest.getFname()+" "+guest.getLname());
    obj.put("Bgcolor",statuscolor);
    obj.put("Color",color);
    js.add((JSONObject)obj);
}
System.out.println(js.toString());
%>
<%=js.toString()%>
