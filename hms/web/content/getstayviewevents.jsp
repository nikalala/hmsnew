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
    System.out.println("dbg = "+dbg);
}
long mss = Long.parseLong(request.getParameter("startdate"));
//System.out.println("mss = "+mss);

Calendar cal1 = Calendar.getInstance();
cal1.setTimeInMillis(mss);
cal1.set(Calendar.HOUR, 0);
cal1.set(Calendar.MINUTE, 0);
cal1.set(Calendar.MILLISECOND, 0);
Calendar cal2 = Calendar.getInstance();
cal2.setTimeInMillis(cal1.getTimeInMillis());
cal2.add(Calendar.DATE,31);
//System.out.println("cal1 =  "+dflong.format(cal1.getTime()));
//System.out.println("cal2 =  "+dflong.format(cal2.getTime()));
String sql = "where roomid is not null and reservationid in ("
        + "select reservationid from reservation where"
        + " departuredate::date >= to_date('"+df.format(cal1.getTime())+"','DD/MM/YYYY')"
        + " and arraivaldate::date < to_date('"+df.format(cal2.getTime())+"','DD/MM/YYYY') and status in (-1,0,4)"
        + " and (status in (-1,4) or reservationtypeid in (select reservationtypeid from reservationtype where confirmed = true))"
        + ") order by reservationroomid";
System.out.println("select * from reservationroom "+sql);
String nroom = "";
ReservationroomBean[] resrooms = ReservationroomManager.getInstance().loadByWhere(sql);
SimpleDateFormat ssdd = new SimpleDateFormat("yyyy-MM-dd HH:mm");
SimpleDateFormat ssdd1 = new SimpleDateFormat("yyyy-MM-dd");
JSONArray js = new JSONArray();
for(int i=0;i<resrooms.length;i++){
    RoomBean room = RoomManager.getInstance().loadByPrimaryKey(resrooms[i].getRoomid());
    RoomtypeBean roomtype = RoomtypeManager.getInstance().loadByPrimaryKey(room.getRoomtypeid());
    ReservationBean res = ReservationManager.getInstance().loadByPrimaryKey(resrooms[i].getReservationid());
    GuestBean guest = GuestManager.getInstance().loadByPrimaryKey(resrooms[i].getGuestid());
    SalutationBean slt = SalutationManager.getInstance().loadByPrimaryKey(guest.getSalutationid());
    String statuscolor = "#A9A9A9";
    String color = "#FFFFFF";
    Calendar cl = Calendar.getInstance();
    if(dclosedate.after(res.getArraivaldate()) && dclosedate.before(res.getDeparturedate()))   cl.setTimeInMillis(cclosedate.getTimeInMillis());
    else if(df.format(dclosedate).equals(df.format(res.getDeparturedate()))) cl.setTime(res.getDeparturedate());
    else cl.setTime(res.getArraivaldate());
    int istatus = getRoomStatus1(cl.getTime(),resrooms[i].getReservationroomid().longValue());
    
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
    obj.put("Status",istatus);
    js.add((JSONObject)obj);
    if(i > 0)   nroom += ",";
    nroom += room.getRoomid().toString();
}

sql = "where blockstart::date < to_date('"+df.format(cal2.getTime())+"','DD/MM/YYYY') and blockend::date >= to_date('"+df.format(cal1.getTime())+"','DD/MM/YYYY')";
//if(nroom.length() > 0)  sql += " and roomid not in ("+nroom+")";
BlockroomBean[] rooms = BlockroomManager.getInstance().loadByWhere(sql);
for(int i=0;i<rooms.length;i++){
    RoomBean room = RoomManager.getInstance().loadByPrimaryKey(rooms[i].getRoomid());
    RoomtypeBean roomtype = RoomtypeManager.getInstance().loadByPrimaryKey(room.getRoomtypeid());
    String statuscolor = "#A9A9A9";
    String color = "#FFFFFF";
    StcolorBean[] stcolor = StcolorManager.getInstance().loadByWhere("where active = true and deleted = false and roomstatus = 5");
    if(stcolor.length > 0){
        statuscolor = stcolor[0].getColor();
        java.awt.Color oldColor = parseStringtoColor(statuscolor);

        int v = ( oldColor.getRed() + oldColor.getGreen() + oldColor.getBlue() ) / 3 > 0.5 ? 0 : 1;
        java.awt.Color newColor = new java.awt.Color( v, v, v );

        //java.awt.Color newColor = new java.awt.Color(255-oldColor.getRed(), 255-oldColor.getGreen(), 255-oldColor.getBlue());
        color = toHexString(newColor);
        color = "#FFFFFF";
    }
    JSONObject obj = new JSONObject();
    obj.put("Id", "-"+rooms[i].getBlockroomid().toString());
    obj.put("ResourceId", roomtype.getRoomtypeid().toString()+"_"+room.getRoomid().toString());
    obj.put("Name", "<b>ბლოკირებული<b>");
    obj.put("StartDate",ssdd.format(rooms[i].getBlockstart()));
    obj.put("EndDate",ssdd1.format(rooms[i].getBlockend())+" 23:59");
    obj.put("Description",roomtype.getName());
    obj.put("ReservedTo","");
    obj.put("Bgcolor",statuscolor);
    obj.put("Color",color);
    obj.put("Status",5);
    js.add((JSONObject)obj);
}

%>
<%=js.toString()%>
