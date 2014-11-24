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
        RoomBean room = RoomManager.getInstance().loadByPrimaryKey(rroom.getRoomid());
        
        this.discnights = 0;
        if(reserv.getDiscountnights() != null) this.discnights = reserv.getDiscountnights().intValue();
        this.contragentid = 0;
        if(reserv.getContractcontragentid() != null)    this.contragentid = reserv.getContractcontragentid().longValue();
        this.ratetypeid = rroom.getRatetypeid().intValue();
        
        this.discplan = 0;
        if(reserv.getPostingtype() != null) this.discplan = reserv.getPostingtype().intValue();
        this.manualrate = 0;
        if(reserv.getManualrate() != null)  this.manualrate = reserv.getManualrate().doubleValue();
        this.discamount = 0;
        if(reserv.getPostingvalueevery() != null)
            this.discamount = reserv.getPostingvalueevery().doubleValue();
        this.payinforatetype = reserv.getRatetype().intValue();
        this.adult = rroom.getAdult().intValue();
        this.child = rroom.getChild().intValue();
        this.i = day;
        this.notax = reserv.getNotax().booleanValue();
        this.calstart.setTime(reserv.getArraivaldate());
        this.calstart.add(Calendar.DATE, i);
        this.calend.setTime(reserv.getDeparturedate());
        this.roomtype = RoomtypeManager.getInstance().loadByPrimaryKey(rroom.getRoomtypeid());
        
        this.disctype = 0;
        DiscountBean disc = null;
        if(reserv.getDiscountid() != null){
            disc = DiscountManager.getInstance().loadByPrimaryKey(reserv.getDiscountid());
            if(!disc.getPerctype().booleanValue()) disctype = 1;
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
            System.out.println(s);
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
                    + " and to_date('2000-' || fmonth::text || '-' || fday::text,'YYYY-MM-DD') <= to_date('2000-"+mon+"-"+day+"','YYYY-MM-DD')"
                    + " and to_date('2000-' || tmonth::text || '-' || tday::text,'YYYY-MM-DD') >= to_date('2000-"+mon+"-"+day+"','YYYY-MM-DD')";
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



        double price = 0;
        double tax = 0;
        double discount = 0;
        double fix = 0;

        if(dbf){

            if(incl){
                if(taxtype == 0){
                    price = rate-(rate/(taxamount+100))*taxamount;
                    if(disctype == 0){
                        tax = ((rate-(rate*discamt/100))/(taxamount+100))*taxamount;
                        discount = price*discamt/100;
                    } else {
                        tax = ((rate-discamt)/(taxamount+100))*taxamount;
                        discount = discamt;
                    }
                } else {
                    price = rate - taxamount;
                    if(disctype == 0)
                        discount = rate*discamt/100;
                    else
                        discount = discamt;
                    tax = taxamount;
                }
            } else {
                price = rate;
                if(taxtype == 0){
                    if(disctype == 0){
                        tax = (rate - (rate*discamt/100))*taxamount/100;
                        discount = rate*discamt/100;
                    } else {
                        tax = ((rate - discamt)*taxamount)/100;
                        discount = discamt;
                    }
                } else {
                    tax = taxamount;
                    if(disctype == 0)
                        discount = rate*discamt/100;
                    else
                        discount = discamt;
                }
            }
        } else {
            if(incl){
                if(taxtype == 0){
                    price = rate - (rate/(taxamount+100))*taxamount;
                    tax = (rate/(taxamount+100))*taxamount;
                    if(disctype == 0)
                        discount = rate*discamt/100;
                    else
                        discount = discamt;
                } else {
                    price = rate - taxamount;
                    tax = taxamount;
                    if(disctype == 0)
                        discount = rate*discamt/100;
                    else
                        discount = discamt;
                }
            } else {
                price = rate;
                if(taxtype == 0){
                    tax = rate*taxamount/100;
                    if(disctype == 0)
                        discount = rate*discamt/100;
                    else
                        discount = discamt;
                } else {
                    tax = taxamount;
                    if(disctype == 0)
                        discount = rate*discamt/100;
                    else
                        discount = discamt;
                }
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
