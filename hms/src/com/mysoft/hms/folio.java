/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.mysoft.hms;

import java.sql.Connection;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Vector;
import java.util.concurrent.TimeUnit;

/**
 *
 * @author djorj
 */
public class folio {
    public long folioid;
    public String err = "";
    
    public FolioBean folio;
    public FolioitemBean[] items;
    
    private SimpleDateFormat dt = new SimpleDateFormat("dd/MM/yyyy");
    
    int DayDiff(Calendar d1,Calendar d2)
    {
        long diff = d2.getTimeInMillis() - d1.getTimeInMillis();
        return (int)TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);
    }
    
    double roundOff(double val, int prc)
    {
        double[] roundtype = {0,0.1,1,10,100,1000,10000};
        double rf = val;
        if(prc > 0) rf = Math.round(val * roundtype[prc]) / roundtype[prc];
        return rf;
    }
    
    public void folio()
    {
        folio = FolioManager.getInstance().createFolioBean();
        items = new FolioitemBean[0];
    }
    
    public void folio(long folioid)
    {
        try{
            this.folioid = folioid;
            folio = FolioManager.getInstance().loadByPrimaryKey(folioid);
            items = FolioitemManager.getInstance().loadByWhere("where folioid = "+folioid+" order by itemdate");
        }catch(Exception e){
            err = e.getMessage();
        }
    }
    
    public double getSum(String sql)
    {
        double val = 0;
        Connection c = null;
        try 
        {
        c = Manager.getInstance().getConnection();
        ResultSet rs = c.createStatement().executeQuery(sql);
        if(rs.next())   val = rs.getDouble(1);
        rs.close();
        return val;
        }
        catch(Exception e){e.printStackTrace();}
        finally
        {
        Manager.getInstance().releaseConnection(c);
        }
        return val;
    }

    public double[] getSum(String sql,int num)
    {
        double[] val = new double[num];
        Connection c = null;
        try
        {
        c = Manager.getInstance().getConnection();
        ResultSet rs = c.createStatement().executeQuery(sql);
        if(rs.next())
            {
            for(int i=0;i<num;i++)
                val[i] = rs.getDouble(i+1);
            }
        rs.close();
        return val;
        }
        catch(Exception e){e.printStackTrace();}
        finally
        {
        Manager.getInstance().releaseConnection(c);
        }
        return val;
    }
    
    public void changeFolio(FolioitemBean[] folioitems, PersonnelBean user, int roomid) throws Exception {
        folio = FolioManager.getInstance().loadByPrimaryKey(folioitems[0].getFolioid());
        ReservationroomBean resroom = ReservationroomManager.getInstance().loadByPrimaryKey(folio.getReservationroomid());
        ReservationBean res = ReservationManager.getInstance().loadByPrimaryKey(resroom.getReservationid());
        int prc = 0;
        DisplaysettingsBean[] displaysettings = DisplaysettingsManager.getInstance().loadByWhere("limit 1");
        if(displaysettings.length > 0)
            prc = displaysettings[0].getRoundtype().intValue();
        Calendar c1 = Calendar.getInstance();
        Calendar c2 = Calendar.getInstance();
        c1.setTime(res.getArraivaldate());
        c2.setTime(folioitems[0].getItemdate());
        int daynum = DayDiff(c1, c2);
        for(int i=0;i<folioitems.length;i++){
            c1.setTime(folioitems[i].getItemdate());
            if(c1.after(c2)){
                daynum++;
                c2.setTime(folioitems[i].getItemdate());
            }
            tariff trf = new tariff();
            trf.init(resroom.getReservationroomid(),daynum);

            folioitems[i].setRegbyid(user.getPersonnelid());
            double amount = trf.tariff_rate;
            double price = amount;
            switch(folioitems[i].getParticular().intValue()){
                case -1:
                    if(!trf.notax){
                        folioitems[i].setTaxid(trf.taxid);
                        folioitems[i].setAmount(trf.tariff_tax);
                        price += trf.tariff_tax;
                    } else {
                        folioitems[i].setZvoid(true);
                    }
                    break;
                case 0:
                    folioitems[i].setAmount(roundOff(price,prc)-price);
                    break;
                case 4:
                    double discamount = trf.tariff_discount;
                    folioitems[i].setDiscountid(res.getDiscountid());
                    folioitems[i].setAmount((-1)*discamount);
                    price -= discamount;
                    break;
                case 5:
                    break;
                case 6:
                    folioitems[i].setRoomid(roomid);
                    folioitems[i].setAmount(amount);
                    break;
            }
        }
        folioitems = FolioitemManager.getInstance().save(folioitems);
    }
    
    public void reSetFolio(ReservationBean res, PersonnelBean user) throws Exception
    {
        ReservationroomBean[] resrooms = ReservationroomManager.getInstance().loadByReservationid(res.getReservationid());
        FolioBean[] folios = FolioManager.getInstance().loadByWhere("where reservationroomid = "+resrooms[0].getReservationroomid());
        if(folios.length > 0)
            folio = FolioManager.getInstance().loadByPrimaryKey(folios[0].getFolioid());
        else
            throw new Exception("არასწორი რეზერვაცია");
        
        CheckinreservationsettingsBean[] checkinsettings = CheckinreservationsettingsManager.getInstance().loadByWhere("limit 1");
        folioid = folio.getFolioid().longValue();
        
        FolioitemManager.getInstance().deleteByWhere("where folioid = "+folioid+" and particular not in (1,2,3,5) and done = false");
        
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
        int cnt = DayDiff(c1, c2);
        for(int i=0;c1.before(c2);i++){
            tariff trf = new tariff();
            trf.init(folio.getReservationroomid(),i);
            
            //PaymentBean[] paid1 = PaymentManager.getInstance().loadByWhere("where paymentmethodid = 1 and folioid = "+folioid+" and paydate = to_date('"+dt.format(c1.getTime())+"','DD/MM/YYYY')");
            //PaymentBean[] paid2 = PaymentManager.getInstance().loadByWhere("where paymentmethodid > 1 and folioid = "+folioid+" and paydate = to_date('"+dt.format(c1.getTime())+"','DD/MM/YYYY')");

            c3.setTimeInMillis(c1.getTimeInMillis());
            c3.add(Calendar.DATE, 1);
            double amount = trf.tariff_rate;

            // roomcharges
            FolioitemBean fb = FolioitemManager.getInstance().createFolioitemBean();
            fb.setFolioid(folio.getFolioid());
            fb.setItemdate(c1.getTime());
            fb.setRegbyid(user.getPersonnelid());
            fb.setRoomid(resrooms[0].getRoomid());
            fb.setAmount(amount);
            fb.setDone(false);
            fb.setParticular(6);
            fb = FolioitemManager.getInstance().save(fb);

            double price = amount;
            // discount
            double discamount = 0;
            DiscountBean disc = null;
            if(res.getDiscountid() != null){
                discamount = trf.tariff_discount;
                fb = FolioitemManager.getInstance().createFolioitemBean();
                fb.setFolioid(folio.getFolioid());
                fb.setItemdate(c1.getTime());
                fb.setRegbyid(user.getPersonnelid());
                fb.setDiscountid(res.getDiscountid());
                fb.setAmount((-1)*discamount);
                fb.setDone(false);
                fb.setParticular(4);
                fb = FolioitemManager.getInstance().save(fb);
                price -= discamount;
            }

            if(!trf.notax){
                fb = FolioitemManager.getInstance().createFolioitemBean();
                fb.setFolioid(folio.getFolioid());
                fb.setItemdate(c1.getTime());
                fb.setRegbyid(user.getPersonnelid());
                fb.setTaxid(trf.taxid);
                fb.setAmount(trf.tariff_tax);
                fb.setDone(false);
                fb.setParticular(-1);
                fb = FolioitemManager.getInstance().save(fb);
                price += trf.tariff_tax;
            }

            // roundoff
            int prc = 0;
            DisplaysettingsBean[] displaysettings = DisplaysettingsManager.getInstance().loadByWhere("limit 1");
            if(displaysettings.length > 0)
                prc = displaysettings[0].getRoundtype().intValue();
            fb = FolioitemManager.getInstance().createFolioitemBean();
            fb.setFolioid(folio.getFolioid());
            fb.setItemdate(c1.getTime());
            fb.setRegbyid(user.getPersonnelid());
            fb.setAmount(roundOff(price,prc)-price);
            fb.setDone(false);
            fb.setParticular(0);
            fb = FolioitemManager.getInstance().save(fb);
            
            c1.add(Calendar.DATE, 1);
        }
        items = FolioitemManager.getInstance().loadByWhere("where folioid = "+folioid+" order by itemdate");
    }
    
    public void setFolio(ReservationBean res, ReservationroomBean resroom, PaymentBean pm, String dateformats2, Vector extracharges,int type,PersonnelBean user) throws Exception
    {
        if((type == 0 || type == 3) && res.getCompanyid() == null)  throw new Exception("აირჩიეთ კომპანია");
        // main folio
        CheckinreservationsettingsBean[] checkinsettings = CheckinreservationsettingsManager.getInstance().loadByWhere("limit 1");
        if(folio == null)
            folio = FolioManager.getInstance().createFolioBean();
        if(type == 0 || type == 3)   folio.setContragentid(res.getCompanyid());
        else if(type == 1)   folio.setGuestid(resroom.getGuestid());
        else if(type == 2)   folio.setGuestid(resroom.getGuestid());
        folio.setRegbyid(user.getPersonnelid());
        folio.setReservationroomid(resroom.getReservationroomid());
        folio.setStatus(0);
        folio.setNum("");
        folio = FolioManager.getInstance().save(folio);
        folio.setNum(folio.getFolioid().toString());
        folio = FolioManager.getInstance().save(folio);
        
        folioid = folio.getFolioid().longValue();
        
        if(pm != null && pm.getAmount() != null){
            pm.setFolioid(folioid);
            pm = PaymentManager.getInstance().save(pm);
        }

        FolioBean folio1 = null;
        if(type == 3){
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
        int cnt = DayDiff(c1, c2);
        for(int i=0;c1.before(c2);i++){
            tariff trf = new tariff();
            trf.init(resroom.getReservationroomid(),i);
            
            PaymentBean[] paid1 = PaymentManager.getInstance().loadByWhere("where paymentmethodid = 1 and folioid = "+folioid+" and paydate = to_date('"+dt.format(c1.getTime())+"','DD/MM/YYYY')");
            PaymentBean[] paid2 = PaymentManager.getInstance().loadByWhere("where paymentmethodid > 1 and folioid = "+folioid+" and paydate = to_date('"+dt.format(c1.getTime())+"','DD/MM/YYYY')");

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
            fb.setParticular(6);
            fb = FolioitemManager.getInstance().save(fb);

            double price = amount;
            // discount
            double discamount = 0;
            DiscountBean disc = null;
            if(res.getDiscountid() != null){
                discamount = trf.tariff_discount;
                fb = FolioitemManager.getInstance().createFolioitemBean();
                fb.setFolioid(folio.getFolioid());
                fb.setItemdate(c1.getTime());
                fb.setRegbyid(user.getPersonnelid());
                fb.setDiscountid(res.getDiscountid());
                fb.setAmount((-1)*discamount);
                fb.setDone(false);
                fb.setParticular(4);
                fb = FolioitemManager.getInstance().save(fb);
                price -= discamount;
            }

            if(!trf.notax){
                fb = FolioitemManager.getInstance().createFolioitemBean();
                fb.setFolioid(folio.getFolioid());
                fb.setItemdate(c1.getTime());
                fb.setRegbyid(user.getPersonnelid());
                fb.setTaxid(trf.taxid);
                fb.setAmount(trf.tariff_tax);
                fb.setDone(false);
                fb.setParticular(-1);
                fb = FolioitemManager.getInstance().save(fb);
                price += trf.tariff_tax;
            }

            for(int j=0;j<extracharges.size();j++){
                ExtrachargefolioBean ec = (ExtrachargefolioBean)extracharges.elementAt(j);

                if(ec.getPostingtype().intValue() == 0 && i > 0 && c3.before(c2))   continue;
                if(ec.getPostingtype().intValue() == 2 && i == 0)   continue;
                if(ec.getPostingtype().intValue() == 3 && (i == 0 || c3.equals(c2)))   continue;
                if(ec.getPostingtype().intValue() == 4 && c3.equals(c2))   continue;
                if(ec.getPostingtype().intValue() == 5 && i > 0)   continue;
                if(ec.getPostingtype().intValue() == 6 && c3.equals(c2))   continue;

                double ecamount = ec.getRate().doubleValue();
                if(ec.getChargeapplyrieson().intValue() == 0)   ecamount *= ec.getAdult().intValue();
                else if(ec.getChargeapplyrieson().intValue() == 1)   ecamount *= ec.getChild().intValue();
                else if(ec.getChargeapplyrieson().intValue() == 3)   ecamount = ecamount*ec.getAdult().intValue()+ecamount*ec.getChild().intValue();
                else if(ec.getChargeapplyrieson().intValue() == 4)   ecamount *= ec.getQty().intValue();
                fb = FolioitemManager.getInstance().createFolioitemBean();
                if(folio1 != null)  fb.setFolioid(folio1.getFolioid());
                else  fb.setFolioid(folio.getFolioid());
                fb.setItemdate(c1.getTime());
                fb.setRegbyid(user.getPersonnelid());
                fb.setExtrachargeid(ec.getExtrachargeid());
                fb.setAmount(ecamount);
                fb.setDone(false);
                fb.setParticular(5);
                fb = FolioitemManager.getInstance().save(fb);
                ec.setFolioitemid(fb.getFolioitemid());
                ec = ExtrachargefolioManager.getInstance().save(ec);
                price += ecamount;
            }
            
            // roundoff
            int prc = 0;
            DisplaysettingsBean[] displaysettings = DisplaysettingsManager.getInstance().loadByWhere("limit 1");
            if(displaysettings.length > 0)
                prc = displaysettings[0].getRoundtype().intValue();
            fb = FolioitemManager.getInstance().createFolioitemBean();
            fb.setFolioid(folio.getFolioid());
            fb.setItemdate(c1.getTime());
            fb.setRegbyid(user.getPersonnelid());
            fb.setAmount(roundOff(price,prc)-price);
            fb.setDone(false);
            fb.setParticular(0);
            fb = FolioitemManager.getInstance().save(fb);
            
            // payment
            if(paid1.length > 0){
                fb = FolioitemManager.getInstance().createFolioitemBean();
                fb.setFolioid(folio.getFolioid());
                fb.setItemdate(c1.getTime());
                fb.setRegbyid(user.getPersonnelid());
                fb.setAmount(paid1[0].getAmount());
                fb.setDone(false);
                fb.setPaymentid(paid1[0].getPaymentid());
                fb.setParticular(2);
                fb = FolioitemManager.getInstance().save(fb);
            }
            if(paid2.length > 0){
                fb = FolioitemManager.getInstance().createFolioitemBean();
                fb.setFolioid(folio.getFolioid());
                fb.setItemdate(c1.getTime());
                fb.setRegbyid(user.getPersonnelid());
                fb.setAmount(paid2[0].getAmount());
                fb.setDone(false);
                fb.setPaymentid(paid2[0].getPaymentid());
                fb.setParticular(1);
                fb = FolioitemManager.getInstance().save(fb);
            }

            c1.add(Calendar.DATE, 1);
        }
        items = FolioitemManager.getInstance().loadByWhere("where folioid = "+folioid+" order by itemdate");
    }
}
