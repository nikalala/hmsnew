/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.mysoft.hms;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.concurrent.TimeUnit;

/**
 *
 * @author djorj
 */
public class tariff {

    public RoomtypeBean roomtype;
    public DisplaysettingsBean displaysettings;

    public double manualrate;
    public double discnights;
    public double discamount;
    
    public long contragentid;
    
    public int payinforatetype;
    public int ratetypeid;
    public int adult;
    public int child;
    public int roundoff = 0;
    public int disctype;
    public int discplan;
    public int i;
    public int taxid;
    
    public boolean incl = false;
    public boolean notax;
    
    public Calendar calstart = Calendar.getInstance();
    public Calendar calend = Calendar.getInstance();
    
    public double tariff_rate = 0;
    public double tariff_tax =0;
    public double tariff_discount = 0;
    public double tariff_fix = 0;
    public double tariff_neto = 0;
    public double tariff_discount1 = 0;
    
    public double[] tariff_discounts = new double[0];
    public double[] discplans = new double[0];
    public double[] discamounts = new double[0];
    public double[] disctypes = new double[0];
    public double[] discnightss = new double[0];

    public ReservationdiscountBean[] discounts = new ReservationdiscountBean[0];
    
    SimpleDateFormat dt = new SimpleDateFormat("dd/MM/yyyy");
    
    public void tariff(){
        try{
            DisplaysettingsBean[] displaysettingss = DisplaysettingsManager.getInstance().loadByWhere("limit 1");
            if(displaysettingss.length > 0){
                this.displaysettings = DisplaysettingsManager.getInstance().loadByPrimaryKey(displaysettingss[0].getDisplaysettingsid());
                this.roundoff = displaysettings.getRoundtype().intValue();
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    public void init(double manualrate,int payinforatetype,long contragentid,int ratetypeid,RoomtypeBean roomtype,int adult,int child, int disctype,boolean notax,Calendar calstart,Calendar calend,int discplan,double discnights,double discamount,int i){
        this.manualrate = manualrate;
        this.discnights = discnights;
        this.discamount = discamount;
        this.contragentid = contragentid;
        this.payinforatetype = payinforatetype;
        this.ratetypeid = ratetypeid;
        this.adult = adult;
        this.child = child;
        this.disctype = disctype;
        this.discplan = discplan;
        this.i = i;
        this.notax = notax;
        this.calstart = (Calendar)calstart.clone();
        this.calend = (Calendar)calend.clone();
        this.roomtype = RoomtypeManager.getInstance().createRoomtypeBean();
        this.roomtype.copy(roomtype);
        try{
            DisplaysettingsBean[] displaysettingss = DisplaysettingsManager.getInstance().loadByWhere("limit 1");
            if(displaysettingss.length > 0){
                this.displaysettings = DisplaysettingsManager.getInstance().loadByPrimaryKey(displaysettingss[0].getDisplaysettingsid());
                this.roundoff = displaysettings.getRoundtype().intValue();
            }
            getTraiffPars();
        }catch(Exception ex){
            ex.printStackTrace();
        }
    }
    
    public void init(long reservationroomid,int day) throws Exception {
        ReservationroomBean rroom = ReservationroomManager.getInstance().loadByPrimaryKey(reservationroomid);
        ReservationBean reserv = ReservationManager.getInstance().loadByPrimaryKey(rroom.getReservationid());
        discounts = ReservationdiscountManager.getInstance().loadByReservationid(reserv.getReservationid());
        this.tariff_discounts = new double[discounts.length];
        this.discplans = new double[discounts.length];
        this.discamounts = new double[discounts.length];
        this.disctypes = new double[discounts.length];
        this.discnightss = new double[discounts.length];
        
        
        this.contragentid = 0;
        if(reserv.getContractcontragentid() != null)    this.contragentid = reserv.getContractcontragentid().longValue();
        this.ratetypeid = rroom.getRatetypeid().intValue();
        this.manualrate = 0;
        if(reserv.getManualrate() != null)  this.manualrate = reserv.getManualrate().doubleValue();
        this.payinforatetype = reserv.getRatetype().intValue();
        this.adult = rroom.getAdult().intValue();
        this.child = rroom.getChild().intValue();
        this.i = day;
        this.notax = reserv.getNotax().booleanValue();
        this.calstart.setTime(reserv.getArraivaldate());
        this.calstart.add(Calendar.DATE, i);
        this.calend.setTime(reserv.getDeparturedate());
        this.roomtype = RoomtypeManager.getInstance().loadByPrimaryKey(rroom.getRoomtypeid());
        
        this.discnights = 0;
        if(reserv.getDiscountnights() != null) this.discnights = reserv.getDiscountnights().intValue();
        this.discplan = 0;
        if(reserv.getPostingtype() != null) this.discplan = reserv.getPostingtype().intValue();
        this.discamount = 0;
        if(reserv.getPostingvalueevery() != null)
            this.discamount = reserv.getPostingvalueevery().doubleValue();
        this.disctype = 0;
        DiscountBean disc = null;
        if(reserv.getDiscountid() != null){
            disc = DiscountManager.getInstance().loadByPrimaryKey(reserv.getDiscountid());
            if(!disc.getPerctype().booleanValue()) disctype = 1;
        }
        
        for(int i=0;i<discounts.length;i++){
            this.discnightss[i] = 0;
            if(discounts[i].getDiscountnights() != null) this.discnightss[i] = discounts[i].getDiscountnights().intValue();
            this.discplans[i] = 0;
            if(discounts[i].getPostingtype() != null) this.discplans[i] = discounts[i].getPostingtype().intValue();
            this.discamounts[i] = 0;
            if(discounts[i].getPostingvalueevery() != null)
                this.discamounts[i] = discounts[i].getPostingvalueevery().doubleValue();
            this.disctypes[i] = 0;
            disc = DiscountManager.getInstance().loadByPrimaryKey(discounts[i].getDiscountid());
            if(!disc.getPerctype().booleanValue()) this.disctypes[i] = 1;
        }
        
        DisplaysettingsBean[] displaysettingss = DisplaysettingsManager.getInstance().loadByWhere("limit 1");
        if(displaysettingss.length > 0){
            this.displaysettings = DisplaysettingsManager.getInstance().loadByPrimaryKey(displaysettingss[0].getDisplaysettingsid());
            this.roundoff = displaysettings.getRoundtype().intValue();
        }
        getTraiffPars();
    }
    
    public static int DayDiff(Calendar d1,Calendar d2){
        long diff = d2.getTimeInMillis() - d1.getTimeInMillis();
        return (int)TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);
    }
    
    public static double roundOff(double val, int prc){
        double[] roundtype = {0,0.1,1,10,100,1000,10000};
        double rf = val;
        if(prc > 0) rf = Math.round(val * roundtype[prc]) / roundtype[prc];
        return rf;
    }
    
    public void getTraiffPars() throws Exception {
        
        if(i == 1){
            String s = "manualrate = "+manualrate
                    + "payinforatetype = "+payinforatetype+"\n"
                    + "contragentid = "+contragentid+"\n"
                    + "ratetypeid = "+ratetypeid+"\n"
                    + "roomtype = "+roomtype+"\n"
                    + "adult = "+adult+"\n"
                    + "child = "+child+"\n"
                    + "disctype = "+disctype+"\n"
                    + "notax = "+notax+"\n"
                    + "calstart = "+dt.format(calstart.getTime())+"\n"
                    + "calend = "+dt.format(calend.getTime())+"\n"
                    + "discplan = "+discplan+"\n"
                    + "discnights = "+discnights+"\n"
                    + "discamount = "+discamount+"\n"
                    + "i = "+i+"";
            //System.out.println(s);
        }
        
        
        double[] ret = new double[5];
        int count = DayDiff(calstart,calend);
        
        int extraadult = adult - roomtype.getBadult().intValue();
        int extrachild = child - roomtype.getBchild().intValue();
        if(extraadult < 0)  extraadult = 0;
        if(extrachild < 0)  extrachild = 0;
        int baseadult = adult - extraadult;
        int basechild = child - extrachild;
        if(baseadult < 0)   baseadult = 0;
        if(basechild < 0)   basechild = 0;

        double rate = 0;
        if(payinforatetype == 2)    rate = manualrate;
        else {
            int day = calstart.get(Calendar.DATE);
            int mon = calstart.get(Calendar.MONTH);
            String sqlseason = "where seasonid > 0 and active = true and deleted = false"
                    + " and startdate <= to_date('"+dt.format(calstart.getTime())+"','DD/MM/YYYY')"
                    + " and enddate >= to_date('"+dt.format(calstart.getTime())+"','DD/MM/YYYY')"
                    + " and to_date('2000-' || (fmonth+1)::text || '-' || fday::text,'YYYY-MM-DD') <= to_date('2000-"+mon+"-"+day+"','YYYY-MM-DD')"
                    + " and to_date('2000-' || (tmonth+1)::text || '-' || tday::text,'YYYY-MM-DD') >= to_date('2000-"+mon+"-"+day+"','YYYY-MM-DD')";
            SeasonBean[] ses = SeasonManager.getInstance().loadByWhere(sqlseason);
            int seasonid = 0;
            if(ses.length > 0)
                seasonid = ses[0].getSeasonid().intValue();
            long cid = 0;
            if(contragentid > 0)    cid = contragentid;
            String sqlrmr = "where ratetypeid = "+ratetypeid+" and roomtypeid = "+roomtype.getRoomtypeid()+" and seasonid = "+seasonid+" and contragentid = "+cid;
            RoomrateBean[] rmr = RoomrateManager.getInstance().loadByWhere(sqlrmr);
            if(rmr.length > 0){
                rate = rmr[0].getRate().doubleValue()*(baseadult+basechild);
                rate += rmr[0].getRateadult().doubleValue()*extraadult;
                rate += rmr[0].getRatechild().doubleValue()*extrachild;
                if(rmr[0].getTax().booleanValue())  incl = true;
                else                                incl = false;
            }  
        }

        boolean dbf = false;
        double taxamount = 0;
        int taxtype = 0;
        //if(!notax)  {
            TaxBean[] taxes = TaxManager.getInstance().loadByWhere("where startfrom <= to_date('"+dt.format(calstart.getTime())+"','DD/MM/YYYY') and active = true and deleted = false");
            dbf = taxes[0].getApplybefore().booleanValue();
            taxtype = taxes[0].getPostingtype().intValue();
            taxamount = taxes[0].getAmount().doubleValue();
            this.taxid = taxes[0].getTaxid().intValue();
        //    }
        double discamt = discamount;
        if(discplan == 0 && discnights != 0 && (i+1)%(discnights+1) != 0) discamt = 0;
        else if(discplan == 2 && i > 0) discamt = 0;
        else if(discplan == 3 && i < count-1) discamt = 0;

        double[] discamts = new double[discamounts.length];
        for(int j=0;j<discamounts.length;j++){
            discamts[j] = discamounts[j];
            if(discplans[j] == 0 && discnightss[j] != 0 && (i+1)%(discnightss[j]+1) != 0) discamts[j] = 0;
            else if(discplans[j] == 2 && i > 0) discamts[j] = 0;
            else if(discplans[j] == 3 && i < count-1) discamts[j] = 0;
        }
        
        double price = 0;
        double tax = 0;
        double discount = 0;
        double fix = 0;
        
        if(dbf){
            if(incl){
                if(taxtype == 0)    price = rate-(rate/(taxamount+100))*taxamount;
                else                price = rate - taxamount;
            } else {
                price = rate;
            }
        } else {
            if(incl){
                if(taxtype == 0)    price = rate - (rate/(taxamount+100))*taxamount;
                else                price = rate - taxamount;
            } else {
                price = rate;
            }
        }
        
        if(disctype == 0)   discount = price*discamt/100;
        else                discount = discamt;
        
        tariff_discount1 = discount;

        for(int j=0;j<discamts.length;j++){
            if(disctypes[j] == 0)
                this.discamounts[j] = price*discamts[j]/100;
            else
                this.discamounts[j] = discamts[j];
            discount += this.discamounts[j];
        }

        if(dbf){

            if(incl){
                if(taxtype == 0)    tax = ((rate-discount)/(taxamount+100))*taxamount;
                else                tax = taxamount;
            } else {
                if(taxtype == 0)    tax = ((rate - discount)*taxamount)/100;
                else                tax = taxamount;
            }
        } else {
            if(incl){
                if(taxtype == 0)    tax = (rate/(taxamount+100))*taxamount;
                else                tax = taxamount;
            } else {
                if(taxtype == 0)    tax = rate*taxamount/100;
                else                tax = taxamount;
            }
        }
        
        
        if(notax)   tax = 0;
        double net = price + tax - discount;
        fix = roundOff(net, roundoff) - net;
        
        tariff_rate = price;
        tariff_tax = tax;
        tariff_discount = discount;
        tariff_fix = fix;
        tariff_neto = net + fix;
        }
    
}
