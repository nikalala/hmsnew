<%@page pageEncoding="UTF-8" %>
<%@page import="java.util.*" %>
<%@page import="java.text.*" %>
<%@page import="java.net.*" %>
<%@page import="java.io.*" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Timestamp" %>
<%@page import="javax.swing.text.*" %>
<%@page import="javax.swing.text.rtf.*" %>
<%@page import="java.util.regex.Matcher" %>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.poi.*" %>
<%@page import="org.apache.poi.xssf.usermodel.*" %>
<%@page import="org.apache.poi.ss.usermodel.*" %>
<%@page import="org.apache.xmlbeans.*" %>
<%@page import="java.lang.reflect.*" %>
<%@page import="java.net.URL" %>
<%@page import="javax.xml.parsers.DocumentBuilder" %>
<%@page import="javax.xml.parsers.DocumentBuilderFactory" %>
<%@page import="org.w3c.dom.CharacterData" %>
<%@page import="org.w3c.dom.Document" %>
<%@page import="org.w3c.dom.Element" %>
<%@page import="org.w3c.dom.Node" %>
<%@page import="org.w3c.dom.NodeList" %>
<%@page import="java.lang.*" %>
<%@page import="org.apache.commons.lang.*" %>
<%@page import="com.itextpdf.text.*" %>
<%@page import="com.itextpdf.text.pdf.*" %>
<%@page import="com.itextpdf.text.pdf.draw.*" %>
<%@page import="net.sf.json.*" %>
<%@page import="com.mysoft.*" %>
<%@page import="com.mysoft.hms.*" %>
<%@page import="java.util.concurrent.TimeUnit" %>
<jsp:useBean id="user" scope="session" class="com.mysoft.hms.PersonnelBean"/>
<jsp:useBean id="hotel" scope="session" class="com.mysoft.hms.HotelBean"/>
<%!
    String basedir = "";

    public String eReg(String s) {
        String ss = s;
        try {
            if (s == null) ss = "";
            else
                ss = new String(s.getBytes("8859_1"), "UTF-8");
            //ss = ss.replaceAll("\"","&quot;");
        } catch (Exception ign) {
            ss = "";
        }
        return ss;
    }

    public double getSum(String sql) {
        double val = 0;
        Connection c = null;
        try {
            c = Manager.getInstance().getConnection();
            ResultSet rs = c.createStatement().executeQuery(sql);
            if (rs.next()) val = rs.getDouble(1);
            rs.close();
            return val;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            Manager.getInstance().releaseConnection(c);
        }
        return val;
    }

    public double getBalance(Long reservationRoomId) {
        return getTotal(reservationRoomId) - getDeposit(reservationRoomId);
    }

    public double getTotalWithExtra(Long reservationRoomId) {
        return getSum("select sum(amount) from folioitem where particular not in (1,2,5) and folioid in (select folioid from folio where reservationroomid = " + reservationRoomId + ")");
    }

    public double getTotal(Long reservationRoomId) {
        double total = getSum("select sum(amount) from folioitem where particular not in (1,2) and folioid in (select folioid from folio where reservationroomid = " + reservationRoomId + ")");
        return total;
    }

    public double getDeposit(Long reservationRoomId) {
        double deposit = getSum("select sum(amount) from payment where folioid in (select folioid from folio where reservationroomid = " + reservationRoomId + ")");
        return deposit;
    }

    public double[] getSum(String sql, int num) {
        double[] val = new double[num];
        Connection c = null;
        try {
            c = Manager.getInstance().getConnection();
            ResultSet rs = c.createStatement().executeQuery(sql);
            if (rs.next()) {
                for (int i = 0; i < num; i++)
                    val[i] = rs.getDouble(i + 1);
            }
            rs.close();
            return val;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            Manager.getInstance().releaseConnection(c);
        }
        return val;
    }

/*
String getMenu(String menuname, MenuBean[] menu, int ptp) throws Exception {
    String s = "<div class=\"navbar navbar-inverse\" role=\"navigation\">\n"
            + "<div class=\"container-fluid\">\n"
            + "<div class=\"navbar-header\">\n"
            + "<button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\".navbar-collapse\">\n"
            + "<span class=\"sr-only\">Toggle navigation</span>\n"
            + "<span class=\"icon-bar\"></span>\n"
            + "<span class=\"icon-bar\"></span>\n"
            + "<span class=\"icon-bar\"></span>\n"
            + "</button>\n"
            + "<a class=\"navbar-brand\" href=\"#\">"+menuname+"</a>\n"
            + "</div>\n"
            + "<div class=\"navbar-collapse collapse\">\n"
            + "<ul class=\"nav navbar-nav\">\n";
    for(int i=0;i<menu.length;i++){
        s += getMenu(menu[i],ptp);
    }
    s += "</ul>\n"
            + "<ul class=\"nav navbar-nav navbar-right\">\n"
            + "<li class=\"dropdown\">\n"
            + "<a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\"><span class=\"glyphicon glyphicon-user\"></span></a>\n"
            + "<ul class=\"dropdown-menu\">\n"
            + "<li><a href=\"javascript:getBody('content/userparam.jsp')\">პარამეტრები</a></li>\n"
            + "<li class=\"divider\"></li>\n"
            + "<li><a href=\"index.jsp?logout=1\">გამოსვლა</a></li>\n"
            + "</ul>\n"
            + "</li>\n"
            + "</ul>\n"
            + "</div>\n"
            + "</div>\n"
            + "</div>\n";
    return s;
}


String getMenu(MenuBean menu,int ptp) throws Exception{
    MenuBean[] submenu = MenuManager.getInstance().loadByWhere("where menuid in (select menuid from plevel where personelltypeid = "+ptp+") and parentid = "+menu.getMenuid()+" order by ord");
    String linkname = "#mb"+menu.getMenuid();
    if(menu.getFile() != null && menu.getFile().trim().length() > 0){
        File fl = new File(basedir+"content/"+menu.getFile().trim()+".jsp");
        if(fl.exists())
            linkname = "javascript:getBody('"+menu.getFile().trim()+"');";
        else
            linkname = "javascript:getBody('construction');";
    }
    String s = "";
    if(submenu.length > 0)
        s += "<li class=\"dropdown\">\n"
                + "<a href=\""+linkname+"\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">"+menu.getName()+" <b class=\"caret\"></b></a>\n"
                + "<ul class=\"dropdown-menu\">\n";
    else
        s += "<li>\n<a href=\""+linkname+"\">"+menu.getName()+"</a>\n";
    for(int i=0;i<submenu.length;i++){
        s += getMenu(submenu[i],ptp);
    }
    if(submenu.length > 0)
        s += "</ul>\n";
    s += "</li>\n";
    return s;
}

String[] getRoomStatus(Date dt,long rid) throws Exception {
    String[] s = {"გაურკვეველი","#000000"};
    int statusid = 0;
    if(dt == null){
        statusid = (int)getSum("select getroomstatus("+rid+")");
    } else {
        SimpleDateFormat dtlong = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        statusid = (int)getSum("select getroomstatus("+rid+",'"+dtlong.format(new Date())+"')");
    }
    StatustypeBean st = StatustypeManager.getInstance().loadByPrimaryKey(statusid);
    s[0] = st.getName();
    s[1] = st.getColor();
System.out.println(rid+" = "+statusid);
    return s;
}
*/

    int getRoomStatus(Date dt, int rid) throws Exception {
        int n = -1;
        SimpleDateFormat dtlong = new SimpleDateFormat("dd/MM/yyyy HH:mm");
        //SimpleDateFormat dtshort = new SimpleDateFormat("dd/MM/yyyy");
        //String sql = "where roomid = "+rid+" and statusdate <= ";
        //if(dt != null)  sql += "to_timestamp('"+dtlong.format(dt)+"','DD/MM/YYYY HH24:MI')";
        //else            sql += "now()";
        //sql += " order by statusdate desc limit 1";
        String sql = "select getroomstatus(" + rid + ",";
        if (dt == null) dt = new Date();
        sql += "'" + dtlong.format(dt) + "')";
        //RoomstBean[] statuses = RoomstManager.getInstance().loadByWhere(sql);
        //if(statuses.length > 0)
        //    n = statuses[0].getSt().intValue();
        n = (int) getSum(sql);
        return n;
    }

    int DayDiff(Calendar d1, Calendar d2) {
        long diff = d2.getTimeInMillis() - d1.getTimeInMillis();
        return (int) TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);
    }

    double getTax(double amt, double discount, int days, boolean included, boolean dtype) throws Exception {
        double taxval = amt;

        TaxBean[] taxes = TaxManager.getInstance().loadByWhere("where startfrom <= now()::date and active = true and deleted = false order by taxid");
        for (int i = 0; i < taxes.length; i++) {
            if (taxes[i].getExemptafter().intValue() == 0 || taxes[i].getExemptafter().intValue() < days) {
                double tax = taxes[i].getAmount().doubleValue();
                if (included) {
                    if (!taxes[i].getApplybefore().booleanValue()) {
                        if (dtype) amt -= amt * discount / 100;
                        else amt -= discount;
                    }
                    taxval = amt - amt * 100 / (100 + tax);
                } else {
                    if (!taxes[i].getApplybefore().booleanValue()) {
                        if (dtype) amt -= amt * discount / 100;
                        else amt -= discount;
                    }
                    if (taxes[i].getPostingtype().intValue() == 1)
                        taxval = tax;
                    else if (taxes[i].getPostingtype().intValue() == 0)
                        taxval = amt * tax / 100;
                    //if(taxes[i].getApplybefore().booleanValue()){
                    //    if(dtype)   amt -= amt*discount/100;
                    //    else        amt -= discount;
                    //}
                    //taxval = amt - taxval;
                }
            }
        }

        return taxval;
    }

    double getDiscount(DiscountBean disc, double roomrate, int discplan, int i, int discnights, Calendar calstart, Calendar calend, double discamount, boolean included, boolean dtype) throws Exception {
        double discount = 0;
        double ttax = 0;
        double amt = roomrate;
        TaxBean[] taxes = TaxManager.getInstance().loadByWhere("where applybefore = true and startfrom <= now()::date order by taxid");
        for (int j = 0; j < taxes.length; j++) {
            double taxval = 0;
            if (taxes[j].getExemptafter().intValue() == 0 || taxes[j].getExemptafter().intValue() < i) {
                double tax = taxes[j].getAmount().doubleValue();
                if (included) {
                    taxval = amt - amt * 100 / (100 + tax);
                } else {
                    if (taxes[j].getPostingtype().intValue() == 1)
                        taxval = tax;
                    else if (taxes[j].getPostingtype().intValue() == 0)
                        taxval = amt * tax / 100;
                }
            }
            ttax += taxval;
        }
        roomrate -= ttax;
        if (disc != null && disc.getRoomrate().booleanValue()) {
            if (discplan == 0) {
                if (discnights > i) {
                    if (disc.getPerctype().booleanValue())
                        discount = roomrate * discamount / 100;
                    else
                        discount = discamount;
                } else discount = 0;
            } else if (discplan == 1) {
                if (disc.getPerctype().booleanValue())
                    discount = roomrate * discamount / 100;
                else
                    discount = discamount;
            } else if (discplan == 2) {
                if (i == 0) {
                    if (disc.getPerctype().booleanValue())
                        discount = roomrate * discamount / 100;
                    else
                        discount = discamount;
                }
            } else if (discplan == 3) {
                Calendar caltmp = Calendar.getInstance();
                caltmp.setTimeInMillis(calstart.getTimeInMillis());
                caltmp.add(Calendar.DATE, 1);
                if (!caltmp.before(calend)) {
                    if (disc.getPerctype().booleanValue())
                        discount = roomrate * discamount / 100;
                    else
                        discount = discamount;
                }
            }
        }
        return discount;
    }

    double getDiscount(DiscountBean disc, double roomrate, int discplan, int i, int discnights, Calendar calstart, Calendar calend, double discamount) throws Exception {
        double discount = 0;

        if (disc != null && disc.getRoomrate().booleanValue()) {
            if (discplan == 0) {
                if (discnights > i) {
                    if (disc.getPerctype().booleanValue())
                        discount = roomrate * discamount / 100;
                    else
                        discount = discamount;
                } else discount = 0;
            } else if (discplan == 1) {
                if (disc.getPerctype().booleanValue())
                    discount = roomrate * discamount / 100;
                else
                    discount = discamount;
            } else if (discplan == 2) {
                if (i == 0) {
                    if (disc.getPerctype().booleanValue())
                        discount = roomrate * discamount / 100;
                    else
                        discount = discamount;
                }
            } else if (discplan == 3) {
                Calendar caltmp = Calendar.getInstance();
                caltmp.setTimeInMillis(calstart.getTimeInMillis());
                caltmp.add(Calendar.DATE, 1);
                if (!caltmp.before(calend)) {
                    if (disc.getPerctype().booleanValue())
                        discount = roomrate * discamount / 100;
                    else
                        discount = discamount;
                }
            }
        }
        return discount;
    }

    double[] getRoomrateForStay(long reservationroomid) throws Exception {
        double[] rates = new double[5];
        SimpleDateFormat dt = new SimpleDateFormat("dd/MM/yyyy");
        ReservationroomBean rroom = ReservationroomManager.getInstance().loadByPrimaryKey(reservationroomid);
        ReservationBean reserv = ReservationManager.getInstance().loadByPrimaryKey(rroom.getReservationid());
        GuestBean guest = GuestManager.getInstance().loadByPrimaryKey(rroom.getGuestid());
        //RoomBean room = RoomManager.getInstance().loadByPrimaryKey(rroom.getRoomid());
        RoomtypeBean roomtype = RoomtypeManager.getInstance().loadByPrimaryKey(rroom.getRoomtypeid());
        DiscountBean disc = null;
        if (reserv.getDiscountid() != null)
            disc = DiscountManager.getInstance().loadByPrimaryKey(reserv.getDiscountid());
        double discamount = 0;
        if (reserv.getPostingvalueevery() != null)
            discamount = reserv.getPostingvalueevery().doubleValue();
        int adult = rroom.getAdult().intValue();
        int child = rroom.getChild().intValue();
        int extraadult = adult - roomtype.getBadult().intValue();
        int extrachild = child - roomtype.getBchild().intValue();
        if (extraadult < 0) extraadult = 0;
        if (extrachild < 0) extrachild = 0;
        int baseadult = adult - extraadult;
        int basechild = child - extrachild;
        if (baseadult < 0) baseadult = 0;
        if (basechild < 0) basechild = 0;
        Calendar calstart = Calendar.getInstance();
        Calendar calend = Calendar.getInstance();
        calend.add(Calendar.DATE, 1);
        calstart.setTime(reserv.getArraivaldate());
        calend.setTime(reserv.getDeparturedate());
        for (int i = 0; calstart.before(calend); i++) {
            double roomrate = 0;
            double discount = 0;
            double fix = 0;
            boolean incl = false;
            if (reserv.getRatetype().intValue() == 2) roomrate = reserv.getManualrate().doubleValue();
            else {
                int day = calstart.get(Calendar.DATE);
                int mon = calstart.get(Calendar.MONTH);
                String sqlseason = "where seasonid > 0 and active = true and deleted = false"
                        + " and startdate <= to_date('" + dt.format(calstart.getTime()) + "','DD/MM/YYYY')"
                        + " and enddate >= to_date('" + dt.format(calstart.getTime()) + "','DD/MM/YYYY')"
                        + " and to_date('2000-' || fmonth::text || '-' || fday::text,'YYYY-MM-DD') <= to_date('2000-" + mon + "-" + day + "','YYYY-MM-DD')"
                        + " and to_date('2000-' || tmonth::text || '-' || tday::text,'YYYY-MM-DD') >= to_date('2000-" + mon + "-" + day + "','YYYY-MM-DD')";
                SeasonBean[] ses = SeasonManager.getInstance().loadByWhere(sqlseason);
                int seasonid = 0;
                if (ses.length > 0)
                    seasonid = ses[0].getSeasonid().intValue();
                long cid = 0;
                if (guest.getContragentid() != null) cid = guest.getContragentid().intValue();
                String sqlrmr = "where ratetypeid = " + rroom.getRatetypeid() + " and roomtypeid = " + rroom.getRoomtypeid() + " and seasonid = " + seasonid + " and contragentid = " + cid;
                RoomrateBean[] rmr = RoomrateManager.getInstance().loadByWhere(sqlrmr);
                if (rmr.length > 0) {
                    roomrate = rmr[0].getRate().doubleValue() * (baseadult + basechild);
                    roomrate += rmr[0].getRateadult().doubleValue() * extraadult;
                    roomrate += rmr[0].getRatechild().doubleValue() * extrachild;
                    if (rmr[0].getTax().booleanValue()) incl = true;
                    else incl = false;
                }
            }
            boolean perctype = true;
            if (disc != null && disc.getRoomrate().booleanValue()) {
                if (reserv.getPostingtype() != null && reserv.getPostingtype().intValue() == 0) {
                    if (reserv.getDiscountnights() != null && reserv.getDiscountnights().intValue() > i) {
                        if (disc.getPerctype().booleanValue())
                            discount = roomrate * discamount / 100;
                        else
                            discount = discamount;
                    } else discount = 0;
                } else if (reserv.getPostingtype() != null && reserv.getPostingtype().intValue() == 1) {
                    if (disc.getPerctype().booleanValue())
                        discount = roomrate * discamount / 100;
                    else
                        discount = discamount;
                } else if (reserv.getPostingtype() != null && reserv.getPostingtype().intValue() == 2) {
                    if (i == 0) {
                        if (disc.getPerctype().booleanValue())
                            discount = roomrate * discamount / 100;
                        else
                            discount = discamount;
                    }
                } else if (reserv.getPostingtype() != null && reserv.getPostingtype().intValue() == 3) {
                    Calendar caltmp = Calendar.getInstance();
                    caltmp.setTimeInMillis(calstart.getTimeInMillis());
                    caltmp.add(Calendar.DATE, 1);
                    if (!caltmp.before(calend)) {
                        if (disc.getPerctype().booleanValue())
                            discount = roomrate * discamount / 100;
                        else
                            discount = discamount;
                    }
                }
                perctype = disc.getPerctype().booleanValue();
            }
            double tax = 0;
            if (!reserv.getNotax().booleanValue()) tax = getTax(roomrate, discount, i + 1, incl, perctype);
            if (incl) roomrate -= getTax(roomrate, discount, i + 1, true, perctype);
            double neto = roomrate + tax - discount + fix;
            rates[0] += neto;
            rates[1] += roomrate;
            rates[2] += tax;
            rates[3] += discount;
            rates[4] += fix;
            calstart.add(Calendar.DATE, 1);
        }
        return rates;
    }

    double getRoomrate(int payinforatetype, Double manualrate, Long lcontragentid, String dateformats2, Calendar calstart, int roomtypeid, int adult, int child, int ratetypeid) throws Exception {
        long contragentid = 0;
        if (lcontragentid != null) contragentid = lcontragentid;
        RoomtypeBean roomtype = RoomtypeManager.getInstance().loadByPrimaryKey(roomtypeid);
        int extraadult = adult - roomtype.getBadult().intValue();
        int extrachild = child - roomtype.getBchild().intValue();
        if (extraadult < 0) extraadult = 0;
        if (extrachild < 0) extrachild = 0;
        int baseadult = adult - extraadult;
        int basechild = child - extrachild;
        if (baseadult < 0) baseadult = 0;
        if (basechild < 0) basechild = 0;
        SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
        double roomrate = 0;
        if (payinforatetype == 2) roomrate = manualrate;
        else {
            int day = calstart.get(Calendar.DATE);
            int mon = calstart.get(Calendar.MONTH);
            String sqlseason = "where seasonid > 0 and active = true and deleted = false"
                    + " and startdate <= to_date('" + dt.format(calstart.getTime()) + "','DD/MM/YYYY')"
                    + " and enddate >= to_date('" + dt.format(calstart.getTime()) + "','DD/MM/YYYY')"
                    + " and to_date('2000-' || fmonth::text || '-' || fday::text,'YYYY-MM-DD') <= to_date('2000-" + mon + "-" + day + "','YYYY-MM-DD')"
                    + " and to_date('2000-' || tmonth::text || '-' || tday::text,'YYYY-MM-DD') >= to_date('2000-" + mon + "-" + day + "','YYYY-MM-DD')";
            SeasonBean[] ses = SeasonManager.getInstance().loadByWhere(sqlseason);
            int seasonid = 0;
            if (ses.length > 0)
                seasonid = ses[0].getSeasonid().intValue();
            long cid = 0;
            if (contragentid > 0) cid = contragentid;
            String sqlrmr = "where ratetypeid = " + ratetypeid + " and roomtypeid = " + roomtypeid + " and seasonid = " + seasonid + " and contragentid = " + cid;
            RoomrateBean[] rmr = RoomrateManager.getInstance().loadByWhere(sqlrmr);
            if (rmr.length > 0) {
                roomrate = rmr[0].getRate().doubleValue() * (baseadult + basechild);
                roomrate += rmr[0].getRateadult().doubleValue() * extraadult;
                roomrate += rmr[0].getRatechild().doubleValue() * extrachild;
//            if(rmr[0].getTax().booleanValue())  incl = true;
//            else                                incl = false;
            }
        }
        return roomrate;
    }

    boolean getRoomtaxincl(int payinforatetype, Long lcontragentid, String dateformats2, Calendar calstart, int roomtypeid, int ratetypeid) throws Exception {
        boolean incl = false;
        long contragentid = 0;
        if (lcontragentid != null) contragentid = lcontragentid;

        SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
        if (payinforatetype != 2) {
            int day = calstart.get(Calendar.DATE);
            int mon = calstart.get(Calendar.MONTH);
            String sqlseason = "where seasonid > 0 and active = true and deleted = false"
                    + " and startdate <= to_date('" + dt.format(calstart.getTime()) + "','DD/MM/YYYY')"
                    + " and enddate >= to_date('" + dt.format(calstart.getTime()) + "','DD/MM/YYYY')"
                    + " and to_date('2000-' || fmonth::text || '-' || fday::text,'YYYY-MM-DD') <= to_date('2000-" + mon + "-" + day + "','YYYY-MM-DD')"
                    + " and to_date('2000-' || tmonth::text || '-' || tday::text,'YYYY-MM-DD') >= to_date('2000-" + mon + "-" + day + "','YYYY-MM-DD')";
            SeasonBean[] ses = SeasonManager.getInstance().loadByWhere(sqlseason);
            int seasonid = 0;
            if (ses.length > 0)
                seasonid = ses[0].getSeasonid().intValue();
            long cid = 0;
            if (contragentid > 0) cid = contragentid;
            String sqlrmr = "where ratetypeid = " + ratetypeid + " and roomtypeid = " + roomtypeid + " and seasonid = " + seasonid + " and contragentid = " + cid;
            RoomrateBean[] rmr = RoomrateManager.getInstance().loadByWhere(sqlrmr);
            if (rmr.length > 0) {
                if (rmr[0].getTax().booleanValue()) incl = true;
                else incl = false;
            }
        }
        return incl;
    }

    void saveFolio(ReservationBean res, ReservationroomBean resroom, String dateformats2, Vector extracharges, int type, PersonnelBean user) throws Exception {
        if ((type == 0 || type == 3) && res.getCompanyid() == null) throw new Exception("აირჩიეთ კომპანია");
        // main folio
        CheckinreservationsettingsBean[] checkinsettings = CheckinreservationsettingsManager.getInstance().loadByWhere("limit 1");
        FolioBean folio = FolioManager.getInstance().createFolioBean();
        if (type == 0 || type == 3) {
            if (res.getCompanyid() != null && res.getCompanyid().longValue() > 0)
                folio.setContragentid(res.getCompanyid());
            else
                folio.setGuestid(resroom.getGuestid());
        } else if (type == 1) folio.setGuestid(resroom.getGuestid());
        else if (type == 2) folio.setGuestid(resroom.getGuestid());
        folio.setRegbyid(user.getPersonnelid());
        folio.setReservationroomid(resroom.getReservationroomid());
        folio.setStatus(0);
        folio.setNum("");
        folio = FolioManager.getInstance().save(folio);
        folio.setNum(folio.getFolioid().toString());
        folio = FolioManager.getInstance().save(folio);

        FolioBean folio1 = null;
        if (type == 3 && res.getCompanyid() != null && res.getCompanyid().longValue() > 0) {
            folio1 = FolioManager.getInstance().createFolioBean();
            folio1.setGuestid(resroom.getGuestid());
            folio1.setRegbyid(user.getPersonnelid());
            folio1.setReservationroomid(resroom.getReservationroomid());
            folio1.setStatus(0);
            folio1.setNum("");
            folio1 = FolioManager.getInstance().save(folio1);
            folio1.setNum(folio1.getFolioid().toString());
            folio1 = FolioManager.getInstance().save(folio1);
        }

        Calendar c1 = Calendar.getInstance();
        Calendar c2 = Calendar.getInstance();
        Calendar c3 = Calendar.getInstance();
        Calendar cstart = Calendar.getInstance();
        Calendar cendd = Calendar.getInstance();
        c1.setTime(res.getArraivaldate());
        c2.setTime(res.getDeparturedate());
        cstart.setTime(res.getArraivaldate());
        cendd.setTime(res.getDeparturedate());
        //if(checkinsettings.length > 0){
        //    if(!checkinsettings[0].getHours24())
        //        c2.add(Calendar.DATE, 1);
        //}
        for (int i = 0; c1.before(c2); i++) {
            tariff trf = new tariff();
            trf.init(resroom.getReservationroomid(), i);

            c3.setTimeInMillis(c1.getTimeInMillis());
            c3.add(Calendar.DATE, 1);
            double amount = trf.tariff_rate;

            // roomcharges
            FolioitemBean fb = FolioitemManager.getInstance().createFolioitemBean();
            fb.setFolioid(folio.getFolioid());
            fb.setItemdate(c1.getTime());
            fb.setRegbyid(user.getPersonnelid());
            fb.setRoomid(resroom.getRoomid());
            fb.setAmount(amount);
            fb.setDone(false);
            fb = FolioitemManager.getInstance().save(fb);

            // discount
            double discamount = 0;
            DiscountBean disc = null;
            if (res.getDiscountid() != null) {
                discamount = trf.tariff_discount;
                fb = FolioitemManager.getInstance().createFolioitemBean();
                fb.setFolioid(folio.getFolioid());
                fb.setItemdate(c1.getTime());
                fb.setRegbyid(user.getPersonnelid());
                fb.setDiscountid(res.getDiscountid());
                fb.setAmount((-1) * discamount);
                fb.setDone(false);
                fb = FolioitemManager.getInstance().save(fb);
            }

            if (!trf.notax) {
                fb = FolioitemManager.getInstance().createFolioitemBean();
                fb.setFolioid(folio.getFolioid());
                fb.setItemdate(c1.getTime());
                fb.setRegbyid(user.getPersonnelid());
                fb.setTaxid(trf.taxid);
                fb.setAmount(trf.tariff_tax);
                fb.setDone(false);
                fb = FolioitemManager.getInstance().save(fb);
            }

            for (int j = 0; j < extracharges.size(); j++) {
                ExtrachargefolioBean ec = (ExtrachargefolioBean) extracharges.elementAt(j);

                if (ec.getPostingtype().intValue() == 0 && i > 0 && c3.before(c2)) continue;
                if (ec.getPostingtype().intValue() == 2 && i == 0) continue;
                if (ec.getPostingtype().intValue() == 3 && (i == 0 || c3.equals(c2))) continue;
                if (ec.getPostingtype().intValue() == 4 && c3.equals(c2)) continue;
                if (ec.getPostingtype().intValue() == 5 && i > 0) continue;
                if (ec.getPostingtype().intValue() == 6 && c3.equals(c2)) continue;

                double ecamount = ec.getRate().doubleValue();
                if (ec.getChargeapplyrieson().intValue() == 0) ecamount *= ec.getAdult().intValue();
                else if (ec.getChargeapplyrieson().intValue() == 1) ecamount *= ec.getChild().intValue();
                else if (ec.getChargeapplyrieson().intValue() == 3)
                    ecamount = ecamount * ec.getAdult().intValue() + ecamount * ec.getChild().intValue();
                else if (ec.getChargeapplyrieson().intValue() == 4) ecamount *= ec.getQty().intValue();
                fb = FolioitemManager.getInstance().createFolioitemBean();
                if (folio1 != null) fb.setFolioid(folio1.getFolioid());
                else fb.setFolioid(folio.getFolioid());
                fb.setItemdate(c1.getTime());
                fb.setRegbyid(user.getPersonnelid());
                fb.setExtrachargeid(ec.getExtrachargeid());
                fb.setAmount(ecamount);
                fb.setDone(false);
                fb = FolioitemManager.getInstance().save(fb);
                ec.setFolioitemid(fb.getFolioitemid());
                ec = ExtrachargefolioManager.getInstance().save(ec);
            }

            c1.add(Calendar.DATE, 1);
        }
    }

    double roundOff(double val, int prc) {
        double[] roundtype = {0, 0.1, 1, 10, 100, 1000, 10000};
        double rf = val;
        if(prc > 0) rf = Math.round(val * roundtype[prc]) / roundtype[prc];
        return rf;
    }

    double[] getTraiffPars(double manualrate, int payinforatetype, long contragentid, int ratetypeid, RoomtypeBean roomtype, int adult, int child, int roundoff, int disctype, boolean notax, Calendar calstart, Calendar calend, int discplan, double discnights, double discamount, int i) throws Exception {
        SimpleDateFormat dt = new SimpleDateFormat("dd/MM/yyyy");
        double[] ret = new double[5];
        int count = DayDiff(calstart, calend);
        boolean incl = false;
        int extraadult = adult - roomtype.getBadult().intValue();
        int extrachild = child - roomtype.getBchild().intValue();
        if (extraadult < 0) extraadult = 0;
        if (extrachild < 0) extrachild = 0;
        int baseadult = adult - extraadult;
        int basechild = child - extrachild;
        if (baseadult < 0) baseadult = 0;
        if (basechild < 0) basechild = 0;

        double rate = 0;
        if (payinforatetype == 2) rate = manualrate;
        else {
            int day = calstart.get(Calendar.DATE);
            int mon = calstart.get(Calendar.MONTH);
            String sqlseason = "where seasonid > 0 and active = true and deleted = false"
                    + " and startdate <= to_date('" + dt.format(calstart.getTime()) + "','DD/MM/YYYY')"
                    + " and enddate >= to_date('" + dt.format(calstart.getTime()) + "','DD/MM/YYYY')"
                    + " and to_date('2000-' || fmonth::text || '-' || fday::text,'YYYY-MM-DD') <= to_date('2000-" + mon + "-" + day + "','YYYY-MM-DD')"
                    + " and to_date('2000-' || tmonth::text || '-' || tday::text,'YYYY-MM-DD') >= to_date('2000-" + mon + "-" + day + "','YYYY-MM-DD')";
            SeasonBean[] ses = SeasonManager.getInstance().loadByWhere(sqlseason);
            int seasonid = 0;
            if (ses.length > 0)
                seasonid = ses[0].getSeasonid().intValue();
            long cid = 0;
            if (contragentid > 0) cid = contragentid;
            String sqlrmr = "where ratetypeid = " + ratetypeid + " and roomtypeid = " + roomtype.getRoomtypeid() + " and seasonid = " + seasonid + " and contragentid = " + cid;
            RoomrateBean[] rmr = RoomrateManager.getInstance().loadByWhere(sqlrmr);
            if (rmr.length > 0) {
                rate = rmr[0].getRate().doubleValue() * (baseadult + basechild);
                rate += rmr[0].getRateadult().doubleValue() * extraadult;
                rate += rmr[0].getRatechild().doubleValue() * extrachild;
                if (rmr[0].getTax().booleanValue()) incl = true;
                else incl = false;
            }
        }

        boolean dbf = false;
        double taxamount = 0;
        int taxtype = 0;
        if (!notax) {
            TaxBean[] taxes = TaxManager.getInstance().loadByWhere("where startfrom <= to_date('" + dt.format(calstart.getTime()) + "','DD/MM/YYYY') and active = true and deleted = false");
            dbf = taxes[0].getApplybefore().booleanValue();
            taxtype = taxes[0].getPostingtype().intValue();
            taxamount = taxes[0].getAmount().doubleValue();
        }
        System.out.println("discplan = " + discplan + "; discnights = " + String.valueOf((i + 1) % discnights));
        double discamt = discamount;
        if (discplan == 0 && discnights != 0 && (i + 1) % (discnights + 1) != 0) discamt = 0;
        else if (discplan == 2 && i > 0) discamt = 0;
        else if (discplan == 3 && i < count - 1) discamt = 0;


        double price = 0;
        double tax = 0;
        double discount = 0;
        double fix = 0;

        if (dbf) {

            if (incl) {
                if (taxtype == 0) {
                    price = rate - (rate / (taxamount + 100)) * taxamount;
                    if (disctype == 0) {
                        tax = ((rate - (rate * discamt / 100)) / (taxamount + 100)) * taxamount;
                        discount = price * discamt / 100;
                    } else {
                        tax = ((rate - discamt) / (taxamount + 100)) * taxamount;
                        discount = discamt;
                    }
                } else {
                    price = rate - taxamount;
                    if (disctype == 0)
                        discount = rate * discamt / 100;
                    else
                        discount = discamt;
                    tax = taxamount;
                }
            } else {
                price = rate;
                if (taxtype == 0) {
                    if (disctype == 0) {
                        tax = (rate - (rate * discamt / 100)) * taxamount / 100;
                        discount = rate * discamt / 100;
                    } else {
                        tax = ((rate - discamt) * taxamount) / 100;
                        discount = discamt;
                    }
                } else {
                    tax = taxamount;
                    if (disctype == 0)
                        discount = rate * discamt / 100;
                    else
                        discount = discamt;
                }
            }
        } else {
            if (incl) {
                if (taxtype == 0) {
                    price = rate - (rate / (taxamount + 100)) * taxamount;
                    tax = (rate / (taxamount + 100)) * taxamount;
                    if (disctype == 0)
                        discount = rate * discamt / 100;
                    else
                        discount = discamt;
                } else {
                    price = rate - taxamount;
                    tax = taxamount;
                    if (disctype == 0)
                        discount = rate * discamt / 100;
                    else
                        discount = discamt;
                }
            } else {
                price = rate;
                if (taxtype == 0) {
                    tax = rate * taxamount / 100;
                    if (disctype == 0)
                        discount = rate * discamt / 100;
                    else
                        discount = discamt;
                } else {
                    tax = taxamount;
                    if (disctype == 0)
                        discount = rate * discamt / 100;
                    else
                        discount = discamt;
                }
            }
        }
        double net = price + tax - discount;
        fix = roundOff(net, roundoff) - net;
        ret[0] = price;
        ret[1] = tax;
        ret[2] = discount;
        ret[3] = fix;
        ret[4] = net + fix;
        return ret;
    }
%>
<%
    String mand = "<font color=\"RED\">*</font>";

    basedir = session.getServletContext().getRealPath("/");

    Manager.getInstance().setJdbcDriver(getServletContext().getInitParameter("driver"));
    Manager.getInstance().setJdbcUrl(getServletContext().getInitParameter("url"));
    Manager.getInstance().setJdbcUsername(getServletContext().getInitParameter("user"));
    Manager.getInstance().setJdbcPassword(getServletContext().getInitParameter("pass"));

    DecimalFormatSymbols dfs = new DecimalFormatSymbols(Locale.US);

    SimpleDateFormat dtsmall = new SimpleDateFormat("dd/MM/yy");
    SimpleDateFormat dt = new SimpleDateFormat("dd/MM/yyyy");
    SimpleDateFormat dnika = new SimpleDateFormat("dd-MM-yyyy");
    SimpleDateFormat dnikaday = new SimpleDateFormat("dd-MM");

    SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
    SimpleDateFormat dflong = new SimpleDateFormat("dd/MM/yyyy HH:mm");
    SimpleDateFormat sdf0 = new SimpleDateFormat("yyyy/MM/dd");
    SimpleDateFormat dtlong = new SimpleDateFormat("dd/MM/yyyy HH:mm");
    SimpleDateFormat dtlongs = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    SimpleDateFormat dtime = new SimpleDateFormat("HH:mm");
    SimpleDateFormat defcal = new SimpleDateFormat("[yyyy,MM,dd]");

    java.text.NumberFormat dc = new DecimalFormat("0.00", dfs);
    java.text.NumberFormat dcc = new DecimalFormat("0.0000", dfs);
    java.text.NumberFormat dcl = new DecimalFormat("#,##0.00", dfs);
    java.text.NumberFormat dcint = new DecimalFormat("0");
    java.text.NumberFormat dc1 = new DecimalFormat("0.0");
    java.text.NumberFormat dclkb = new DecimalFormat("#,##0", dfs);
    java.text.NumberFormat dclong = new DecimalFormat("#,##0.0000", dfs);

    CurrencyBean[] currencies = CurrencyManager.getInstance().loadByWhere("order by basic desc, code");
    CurrencyBean maincurrency = CurrencyManager.getInstance().loadByPrimaryKey(currencies[0].getCurrencyid());

    int tbrows = 5;
    int tbcols = 5;

    int gridx = 5;
    int gridy = 5;
    int width = 50;
    int height = 50;
    double padding = 0.5;

    String[] months = {"იანვარი", "თებერვალი", "მარტი", "აპრილი", "მაისი", "ივნისი", "ივლისი", "აგვისტო", "სექტემბერი", "ოქტომბერი", "ნოემბერი", "დეკემბერი"};

    String[] amenitytype = {"ოთახი", "სასტუმრო", "ორივე"};
    String[] contragenttype = {"ოთახის მფლობელი", "კომპანია", "ტურისტული აგენტი", "მომწოდებელი", "სტუმარი", "web"};
    String[] commissionplan = {"% ყველა ღამეზე", "ფიქსირებული თანხა თითოეულ ღამეზე", "ფიქსირებული თანხა თითოეულ დარჩენაზე"};
    String[] rate = {"ჩვეულებრივი", "სპეციალური", "შეთანხმებული"};
    String[] roominventory = {"ჩვეულებრივი", "შეთანხმებული"};
    String[] documentnumbering = {"ავტომატური საერთო", "ავტომატური შიდა", "ხელით"};
    String[] chargeapplieson = {"თვითოეულ უფროსზე", "თვითოეულ ბავშვზე", "თვითოეულ ინსტანციაზე", "თვითოეულ პერსონაზე", "რაოდენობის მიხედვით"};
    String[] extrachargepostingtype = {"მიღება-გაწერის დროს", "ყოველდღე", "ყოველდღე გარდა მიღებისა", "ყოველდღე გარდა მიღება-გაწერისას", "ყოველდღე გარდა გაწერისა", "მხოლოდ მიღებისას", "მხოლოდ გაწერისას"};
    String[] foliostatus = {"რეზერვირებული", "გაუქმებული", "არ მოსვლა", "მიღებული", "წასული", "უარყოფილი"};
    String[] pax = {"უფროსი", "ბავშვი"};
    String[] gender = {"კაცი", "ქალი", "სხვა"};
    String[] paymentmode = {"ნაღდი", "კრედიტი"};
    String[] paymentmethod0 = {"ნაღდი", "ბანკი"};
    String[] ratetype = {"ჩვეულებრივი", "სპეციალური", "ხელით"};
    String[] billto = {"კომპანია", "ჯგუფის ხელმძღვანელი", "სტუმარი", "ოთახი და გადასახადები კომპანიას, დანარჩენი სტუმარს"};
    String[] reservationpostingtype = {"ყოველი", "ყოველ ღამე", "მხოლოდ ბოლო ღამე"};
    String[] taxpostingtype = {"ფიქსირებული პროცენტი", "ფიქსირებული თანხა"};
    String[] discountplan = {"ყველა", "ყოველ ღამე", "მხოლოდ პირველი ღამე", "მხოლოდ ბოლო ღამე"};
    String[] hotelstar = {"უვარსკვლავო", "*", "**", "***", "****", "***** და მეტი"};
    String[] roomstatus = {"დადასტურებული რეზერვაცია", "მცხოვრები", "ვადაგადაცილებული", "წამსვლელი", "გაწერილი", "დაბლოკილი", "დღიური გამოყენება", "დაუდასტურებელი რეზერვაცია", "თავისუფალი"};
    String[] accounts = {"შემოსავალი გაუქმებიდან", "დღიური გამოყენების თანხა", "გვიან გაწერის თანხა", "ადრე მიღების თანხა", "არ გამოცხადების თანხა", "ოთახის ღირებულება"};
    String[] taxaccountnames = {"ოთახი", "გაუქმება", "არ გამოცხადება", "ადრე მიღება", "გვიან გაწერა", "დღიური გამოყენება", "ტურისტული აგენტის საკომისიო"};
    String[] reservationstatus = {"აქტიური", "გაუქმებული", "არ გამოცხადებული", "წაშლილი"};
    String[] roundtype = {"ხელით", "-10 &lt;-&gt; 10", "-1 &lt;-&gt; 1", "-0.5 &lt;-&gt; 0.5", "-0.05 &lt;-&gt; 0.05", "-0.005 &lt;-&gt; 0.005", "-0.0005 &lt;-&gt; 0.0005"};
    String[] timeformats = {"hh:mm:ss a", "HH:mm:ss"};
    String[] timeformats1 = {"hh:mm a", "HH:mm"};
    String[] dateformats = {"dd.MM.yyyy", "dd/MM/yyyy", "dd-MM-yyyy", "dd.MM.yy", "dd/MM/yy", "dd-MM-yy", "MM.dd.yyyy", "MM/dd/yyyy", "MM-dd-yyyy", "MM.dd.yy", "MM/dd/yy", "MM-dd-yy"};
    String[] dateformats1 = {"dd.mm.yyyy", "dd/mm/yyyy", "dd-mm-yyyy", "dd.mm.yy", "dd/mm/yy", "dd-mm-yy", "mm.dd.yyyy", "mm/dd/yyyy", "mm-dd-yyyy", "mm.dd.yy", "mm/dd/yy", "mm-dd-yy"};
    String[] dateformats2 = {"DD.MM.YYYY", "DD/MM/YYYY", "DD-MM-YYYY", "DD.MM.YY", "DD/MM/YY", "DD-MM-YY", "MM.DD.YYYY", "MM/DD/YYYY", "MM-DD-YYYY", "MM.DD.YY", "MM/DD/YY", "MM-DD-YY"};
    String[] arrdepdateformats = {"dd.MM", "dd/MM", "dd-MM", "MM.dd", "MM/dd", "MM-dd"};
    String[] timezones = TimeZone.getAvailableIDs();
    String[] reasoncategory = {"ოთახის დაბლოკვა", "რეზერვაციის გაუქმება", "სტუმრის მიღება", "სტუმრის გაწერა", "ფოლიოს ტრანზაქცია", "სტუმრის ფოლიო",
            "დალაგება", "არ გამოცხადებული რეზერვაცია", "პაკეტი", "პრომო აქცია", "რეზერვაცია", "ოთახის გადატანის შეჩერება", "მიღების წაშლა", "რეზერვაციის წაშლა", "ნედლეულის ჩამოწერა", "კერძის ჩამოწერა", "შავი სიის მიზეზი"};
    String[] folioactiontype = {"შესწორება", "ბანკი", "ნაღდი", "კონტრაქტორი", "ფასდაკლება", "მომსახურება", "ოთახის გადასახადი", "გადატანა"};
//                                  0           1       2       3               4           5               6                   7

//                                              8
    int[] reasoncategory_walkin = {2, 3, 5, 6, 8, 9, 10, 12};

    int dff = 0;
    int tff = 0;
    DisplaysettingsBean[] displaysettings = DisplaysettingsManager.getInstance().loadByWhere("limit 1");
    if (displaysettings.length > 0) {
        dff = displaysettings[0].getDateformat().intValue();
        tff = displaysettings[0].getTimeformat().intValue();
    }

    String jschs = "";
    CheckinreservationsettingsBean checkinsettings = null;
    CheckinreservationsettingsBean[] checkinsettingss = CheckinreservationsettingsManager.getInstance().loadByWhere("limit 1");
    if (checkinsettingss.length > 0) {
        checkinsettings = CheckinreservationsettingsManager.getInstance().loadByPrimaryKey(checkinsettingss[0].getCheckinreservationsettingsid());
        JSONObject obj = new JSONObject();
        obj.put("Hours24", (Boolean) checkinsettings.getHours24());
        obj.put("Checkintime", (String) dtime.format(checkinsettings.getCheckintime()));
        obj.put("Checkouttime", (String) dtime.format(checkinsettings.getCheckouttime()));
        obj.put("Autopostdayuse", (Boolean) checkinsettings.getAutopostdayuse());
        obj.put("Graceperioddayuse", (Double) checkinsettings.getGraceperioddayuse());
        obj.put("Dayusecharge", (Double) checkinsettings.getDayusecharge());
        obj.put("Autopostforlatecheckout", (Boolean) checkinsettings.getAutopostforlatecheckout());
        obj.put("Graceperiodlate", (Double) checkinsettings.getGraceperiodlate());
        obj.put("Latecheckoutcharge", (Double) checkinsettings.getLatecheckoutcharge());
        obj.put("Autopostearly", (Boolean) checkinsettings.getAutopostearly());
        obj.put("Graceperiodearly", (Double) checkinsettings.getGraceperiodearly());
        obj.put("Earlycheckoutcahrge", (Double) checkinsettings.getEarlycheckoutcahrge());
        obj.put("Postcancellationfee", (Integer) checkinsettings.getPostcancellationfee());
        obj.put("Amountcancell", (Double) checkinsettings.getAmountcancell());
        obj.put("Totalchargecancell", (Boolean) checkinsettings.getTotalchargecancell());
        obj.put("Beyond", (Integer) checkinsettings.getBeyond());
        obj.put("Within", (Integer) checkinsettings.getWithin());
        obj.put("Postnoshowfee", (Integer) checkinsettings.getPostnoshowfee());
        obj.put("Amountnoshow", (Double) checkinsettings.getAmountnoshow());
        obj.put("Totalchargenoshow", (Boolean) checkinsettings.getTotalchargenoshow());
        obj.put("Finstartmonth", (Integer) checkinsettings.getFinstartmonth());
        obj.put("Finstartday", (Integer) checkinsettings.getFinstartday());
        obj.put("Finendmonth", (Integer) checkinsettings.getFinendmonth());
        obj.put("Finendday", (Integer) checkinsettings.getFinendday());
        obj.put("Guestnamereserv", (Boolean) checkinsettings.getGuestnamereserv());
        obj.put("Guestnamewalkin", (Boolean) checkinsettings.getGuestnamewalkin());
        obj.put("Guestidnreserv", (Boolean) checkinsettings.getGuestidnreserv());
        obj.put("Guestidnwalkin", (Boolean) checkinsettings.getGuestidnwalkin());
        obj.put("Marketcodereserv", (Boolean) checkinsettings.getMarketcodereserv());
        obj.put("Marketcodewalkin", (Boolean) checkinsettings.getMarketcodewalkin());
        obj.put("Paymenttypereserv", (Boolean) checkinsettings.getPaymenttypereserv());
        obj.put("Paymenttypewalkin", (Boolean) checkinsettings.getPaymenttypewalkin());
        obj.put("Tareserv", (Boolean) checkinsettings.getTareserv());
        obj.put("Tawalkin", (Boolean) checkinsettings.getTawalkin());
        obj.put("Companyreserv", (Boolean) checkinsettings.getCompanyreserv());
        obj.put("Companywalkin", (Boolean) checkinsettings.getCompanywalkin());
        obj.put("Bsourcereserv", (Boolean) checkinsettings.getBsourcereserv());
        obj.put("Bsourcewalkin", (Boolean) checkinsettings.getBsourcewalkin());
        obj.put("Nationalityreserv", (Boolean) checkinsettings.getNationalityreserv());
        obj.put("Nationalitywalkin", (Boolean) checkinsettings.getNationalitywalkin());
        obj.put("Addressreserv", (Boolean) checkinsettings.getAddressreserv());
        obj.put("Addresswalkin", (Boolean) checkinsettings.getAddresswalkin());
        obj.put("Emailreservationvoucher", (Boolean) checkinsettings.getEmailreservationvoucher());
        obj.put("Overbooking", (Boolean) checkinsettings.getOverbooking());
        obj.put("Frontratemoderegular", (Boolean) checkinsettings.getFrontratemoderegular());
        obj.put("Nightauditdirty", (Boolean) checkinsettings.getNightauditdirty());
        obj.put("Baseoccupancy", (Boolean) checkinsettings.getBaseoccupancy());
        obj.put("Sendreviewtoall", (Boolean) checkinsettings.getSendreviewtoall());
        obj.put("Regbyid", (Integer) checkinsettings.getRegbyid());

        jschs = obj.toString();
    }

    ClosedateBean closedate = ClosedateManager.getInstance().createClosedateBean();
    ClosedateBean[] bclosedate = ClosedateManager.getInstance().loadByWhere("order by cldate desc limit 1");
    if (bclosedate.length == 0) {
        String fdt = "01/01/2014";
        ReservationBean[] reservs = ReservationManager.getInstance().loadByWhere("order by arraivaldate asc");
        if (reservs.length > 0)
            fdt = df.format(reservs[0].getArraivaldate());
        closedate.setCldate(df.parse(fdt));
        closedate.setRegbyid(user.getPersonnelid());
        if (user != null && user.getPersonnelid() != null) {
            closedate = ClosedateManager.getInstance().save(closedate);
        }
    } else closedate = ClosedateManager.getInstance().loadByPrimaryKey(bclosedate[0].getClosedateid());

    long lclosedate = closedate.getCldate().getTime();
    Date dclosedate = closedate.getCldate();

    dt = new SimpleDateFormat(dateformats[dff]);
    dtime = new SimpleDateFormat(timeformats1[tff]);
    dtlong = new SimpleDateFormat(dateformats[dff] + " " + timeformats1[tff]);

    SimpleDateFormat btdt = new SimpleDateFormat("yyyy-M-d");
    String btnow = btdt.format(new Date());
    String pickerformat = "{autoclose: true, format: '" + dateformats1[dff] + "', weekStart: 1, endDate: new Date(" + lclosedate + "), autoclose: true, language: 'ka', todayHighlight: true, allowEmpty: false}";
    String pickerformat1 = "{autoclose: true, format: '" + dateformats1[dff] + "', weekStart: 1, autoclose: true, language: 'ka', todayHighlight: true, allowEmpty: false}";
    String pickerFormatForDatePickers = "{autoclose: true, format: '" + dateformats1[dff] + "', weekStart: 1, startDate: new Date(" + lclosedate + "), autoclose: true, language: 'ka', todayHighlight: true, allowEmpty: false}";
    String pickerformat2 = "{autoclose: true, format: '" + dateformats1[dff] + "', weekStart: 1, startDate: new Date(" + lclosedate + "), language: 'ka', todayHighlight: true, allowEmpty: false}";
    String rpickerformat = "presetRanges: [" +
            "        {text: 'დღეს', dateStart: 'today', dateEnd: 'today' }," +
            "        {text: 'ბოლო 7 დღე', dateStart: 'today-7days', dateEnd: 'today' }," +
            "        {text: 'თვის დასაწყისისდან', dateStart: function(){ return Date.parse('today').moveToFirstDayOfMonth();  }, dateEnd: 'today' }," +
            "        {text: 'წლის დასაწყისისდან', dateStart: function(){ var x= Date.parse('today'); x.setMonth(0); x.setDate(1); return x; }, dateEnd: 'today' }," +
            "        {text: 'წინა თვე', dateStart: function(){ return Date.parse('1 month ago').moveToFirstDayOfMonth();  }, dateEnd: function(){ return Date.parse('1 month ago').moveToLastDayOfMonth();  } }," +
            "        {text: 'ხვალ', dateStart: 'Tomorrow', dateEnd: 'Tomorrow' }," +
            "        {text: 'ბოლო 30 დღე', dateStart: 'Today-30', dateEnd: 'Today' }," +
            "	 {text: 'შემდეგი 30 დღე', dateStart: 'Today', dateEnd: 'Today+30' }" +
            "    ]," +
            "    presets: {" +
            "        specificDate: 'კონკრეტული თარიღი'," +
            "	allDatesBefore: 'თარიღამდე'," +
            "	allDatesAfter: 'თარიღის შემდეგ'," +
            "	dateRange: 'პერიოდი'" +
            "    }," +
            "    dateFormat: 'dd/mm/yy'," +
            "    rangeStartTitle: 'საწყისი თარიღი'," +
            "    rangeEndTitle: 'საბოლოო თარიღი'," +
            "    nextLinkText: 'შემდეგი'," +
            "    prevLinkText: 'წინა'," +
            "    doneButtonText: 'არჩევა'," +
            "    datepickerOptions: " + pickerformat1;
%>