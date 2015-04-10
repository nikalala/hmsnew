<%@page contentType="application/json; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/meta.jsp" %>

<%
SimpleDateFormat sdpg = new SimpleDateFormat("yyyy-MM-dd");
int year = Integer.parseInt(request.getParameter("year"));
int month = Integer.parseInt(request.getParameter("month"))-1;

Calendar scal = Calendar.getInstance();
scal.set(Calendar.YEAR,year);
scal.set(Calendar.MONTH,month);
scal.set(Calendar.DAY_OF_MONTH,1);

Calendar ecal = Calendar.getInstance();
ecal.set(Calendar.YEAR,year);
ecal.set(Calendar.MONTH,month);
ecal.set(Calendar.DAY_OF_MONTH,1);
ecal.add(Calendar.MONTH,1);


JSONArray array = new JSONArray();
if(request.getParameter("act") != null){
    int roomtypeid = Integer.parseInt(request.getParameter("roomtypeid"));
    int ratetypeid = Integer.parseInt(request.getParameter("ratetypeid"));
    String adult = request.getParameter("adult");
    String child = request.getParameter("child");
    String notax = request.getParameter("notax");
    String discountid = request.getParameter("discountid");
    String valuenumbe = request.getParameter("valuenumbe");


System.out.println("discountid = "+discountid);
    int adlt = 0;
    int chlt = 0;
    try{adlt = Integer.parseInt(adult);}catch(Exception ign){}
    try{chlt = Integer.parseInt(child);}catch(Exception ign){}
    DiscountBean disc = null;
    double val = 0;
    try{ 
        disc = DiscountManager.getInstance().loadByPrimaryKey(new Integer(discountid)); 
        val = Double.parseDouble(valuenumbe);
    }catch(Exception ign){}

    JSONObject obj = null;
    Manager.getInstance().beginTransaction();
    try {
        for (int i = 0; scal.before(ecal); i++) {
            Calendar cal = Calendar.getInstance();
            cal.setTimeInMillis(scal.getTimeInMillis());
            scal.add(Calendar.DATE,1);

            RoomBean[] rooms = getAvailableRooms(cal.getTime(),cal.getTime(),roomtypeid);
            if(rooms.length == 0)   continue;

            double drate = 0;
            int day = cal.get(Calendar.DATE);
            int mon = cal.get(Calendar.MONTH);
            String sqlseason = "where seasonid > 0 and active = true and deleted = false"
                    + " and startdate <= to_date('"+dt.format(cal.getTime())+"','DD/MM/YYYY')"
                    + " and enddate >= to_date('"+dt.format(cal.getTime())+"','DD/MM/YYYY')"
                    + " and to_date('2000-' || fmonth::text || '-' || fday::text,'YYYY-MM-DD') <= to_date('2000-"+mon+"-"+day+"','YYYY-MM-DD')"
                    + " and to_date('2000-' || tmonth::text || '-' || tday::text,'YYYY-MM-DD') >= to_date('2000-"+mon+"-"+day+"','YYYY-MM-DD')";
            SeasonBean[] ses = SeasonManager.getInstance().loadByWhere(sqlseason);
            int seasonid = 0;
            if(ses.length > 0)
                seasonid = ses[0].getSeasonid().intValue();
            long cid = 0;
            String sqlrmr = "where ratetypeid = "+ratetypeid+" and roomtypeid = "+roomtypeid+" and seasonid = "+seasonid+" and contragentid = "+cid;
            boolean incl = false;
            RoomrateBean[] rmr = RoomrateManager.getInstance().loadByWhere(sqlrmr);
            if(rmr.length > 0){
                drate = rmr[0].getRate().doubleValue();  //*(baseadult+basechild);
                //rate += rmr[0].getRateadult().doubleValue()*extraadult;
                //rate += rmr[0].getRatechild().doubleValue()*extrachild;
                if(rmr[0].getTax().booleanValue())  incl = true;
                else                                incl = false;
            }
            
            if(disc != null){
                if(disc.getPerctype().booleanValue())   drate = drate - drate*val/100;
                else                                    drate = drate - val;
            }
            
            obj = new JSONObject();
            obj.put("date", sdpg.format(cal.getTime()));
            obj.put("badge", true);
            obj.put("title", String.valueOf(rooms.length));
            obj.put("body", "");
            obj.put("footer", dc.format(drate));
            array.add(obj);
        }
        Manager.getInstance().endTransaction(true);
    } catch (Exception e) {
        e.printStackTrace();
        Manager.getInstance().endTransaction(false);
    }
}
%>
<%=array%>