<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%
/*
for(Enumeration e=request.getParameterNames();e.hasMoreElements();){
    String name = (String)e.nextElement();
    String val = request.getParameter(name);
    System.out.println(name + " = " + val);
}
*/
String msg = "";
String act = request.getParameter("act");
if(act == null) act = "";
boolean save = false;
if(request.getParameter("save") != null && request.getParameter("save").equalsIgnoreCase("true"))
    save = true;
long folioid = 0;
if(request.getParameter("folioid") != null)
    folioid = Long.parseLong(request.getParameter("folioid"));
long rid = 0;
Manager.getInstance().beginTransaction();
try{
    Vector v = (Vector)session.getAttribute("WALKIN_EXTRACHARGES");
    if(v == null)   v = new Vector();
    
    if(act.equalsIgnoreCase("del")){
        int n = Integer.parseInt(request.getParameter("num"));
        ExtrachargefolioBean efb = (ExtrachargefolioBean)v.elementAt(n);
        if(efb.getFolioitemid() > 0){
            FolioitemBean fi = FolioitemManager.getInstance().loadByPrimaryKey(efb.getFolioitemid());
            ExtrachargefolioManager.getInstance().deleteByWhere("where extrachargeid = "+efb.getExtrachargeid()+" and folioitemid in (select folioitemid from folioitem where folioid = "+fi.getFolioid()+")");
        }
        v.removeElementAt(n);
        msg = "{\"result\":1}";
    } else if(act.equalsIgnoreCase("get")){
        ExtrachargefolioBean efb = (ExtrachargefolioBean)v.elementAt(Integer.parseInt(request.getParameter("num")));
        FolioitemBean fi = FolioitemManager.getInstance().loadByPrimaryKey(efb.getFolioitemid());
        msg = "{\"result\":1";
        msg += ",\"extrachargeid\":"+efb.getExtrachargeid();
        msg += ",\"adult\":"+efb.getAdult();
        msg += ",\"child\":"+efb.getChild();
        msg += ",\"qty\":"+efb.getQty();
        msg += ",\"chargeapplyrieson\":"+efb.getChargeapplyrieson();
        msg += ",\"postingtype\":"+efb.getPostingtype();
        msg += ",\"rate\":"+dc.format(efb.getRate());
        msg += ",\"folioid\":"+fi.getFolioid();
        msg += "}";
    } else if(act.equalsIgnoreCase("edt")){
        int adult = 0;
        int child = 0;
        int qty = 0;

        String eid = request.getParameter("extrachargeid");

        if(eid.equals("0")) throw new Exception("აირჩიეთ სერვისი");
        //String[] eids = eid.split("_");
        int extrachargeid = Integer.parseInt(eid);
        String srate = request.getParameter("rate");
        int postingtype = Integer.parseInt(request.getParameter("postingtype"));
        int chargeapplyrieson = Integer.parseInt(request.getParameter("chargeapplyrieson"));
        String sadult = request.getParameter("adult");
        String schild = request.getParameter("child");
        String sadult1 = request.getParameter("adult1");
        String schild1 = request.getParameter("child1");
        String sqty = request.getParameter("qty");
        double extrachanrgerate = 0;
        if(extrachargeid == 0)  throw new Exception("აირჩიეთ სერვისი");
        try{ extrachanrgerate = Double.parseDouble(srate); }catch(Exception ex){ throw new Exception("აირჩიეთ ტარიფი"); }
        if(postingtype < 0)  throw new Exception("აირჩიეთ სერვისის ტიპი");
        if(chargeapplyrieson < 0)  throw new Exception("აირჩიეთ წესი");
        if(chargeapplyrieson == 0){
            try{ adult = Integer.parseInt(sadult); }catch(Exception ex){ throw new Exception("უფროსების არასწორი რაოდენობა"); }
        }
        if(chargeapplyrieson == 1){
            try{ child = Integer.parseInt(schild); }catch(Exception ex){ throw new Exception("ბავშვების არასწორი რაოდენობა"); }
        }
        if(chargeapplyrieson == 3){
            try{ adult = Integer.parseInt(sadult1); }catch(Exception ex){ throw new Exception("უფროსების არასწორი რაოდენობა"); }
            try{ child = Integer.parseInt(schild1); }catch(Exception ex){ throw new Exception("ბავშვების არასწორი რაოდენობა"); }
        }
        if(chargeapplyrieson == 4){
            try{ qty = Integer.parseInt(sqty); }catch(Exception ex){ throw new Exception("არასწორი რაოდენობა"); }
        }
        int num = Integer.parseInt(request.getParameter("num"));
        ExtrachargefolioBean efb = (ExtrachargefolioBean)v.elementAt(num);
        
        long ofolioid = 0;
        if(efb.getFolioitemid() != null){
            FolioitemBean folioitem = FolioitemManager.getInstance().loadByPrimaryKey(efb.getFolioitemid());
            ofolioid = folioitem.getFolioid().longValue();
        }

        if(folioid == 0 && ofolioid == 0){
            efb.setExtrachargeid(extrachargeid);
            efb.setAdult(adult);
            efb.setChargeapplyrieson(chargeapplyrieson);
            efb.setChild(child);
            efb.setPostingtype(postingtype);
            efb.setQty(qty);
            efb.setRate(extrachanrgerate);
        } else {

            FolioBean folio = FolioManager.getInstance().loadByPrimaryKey(folioid);
            ReservationroomBean rr = ReservationroomManager.getInstance().loadByPrimaryKey(folio.getReservationroomid());
            ReservationBean res = ReservationManager.getInstance().loadByPrimaryKey(rr.getReservationid());
            rid = rr.getReservationroomid().longValue();
            
            FolioBean[] fls = FolioManager.getInstance().loadByWhere("where reservationroomid = "+folio.getReservationroomid()+" and folioid in (select folioid from folioitem where folioid > 0 and particular = 6)");
            long fisid = fls[0].getFolioid().longValue();
            
            
            String fisql = "";
            Calendar lastday = Calendar.getInstance();
            lastday.setTime(res.getDeparturedate());
            lastday.add(Calendar.DATE,-1);
            switch(postingtype){
                case 0:
                    fisql = "where itemdate >= to_date('"+df.format(dclosedate)+"','DD/MM/YYYY') and particular = 6 and folioid = "+fisid+" and (itemdate = to_date('"+df.format(res.getArraivaldate().getTime())+"','DD/MM/YYYY') or itemdate = to_date('"+df.format(lastday.getTime())+"','DD/MM/YYYY')) order by itemdate";
                    break;
                case 1:
                    fisql = "where itemdate >= to_date('"+df.format(dclosedate)+"','DD/MM/YYYY') and particular = 6 and folioid = "+fisid+" order by itemdate";
                    break;
                case 2: 
                    fisql = "where itemdate >= to_date('"+df.format(dclosedate)+"','DD/MM/YYYY') and particular = 6 and folioid = "+fisid+" and itemdate != to_date('"+df.format(res.getArraivaldate().getTime())+"','DD/MM/YYYY') order by itemdate";
                    break;
                case 3: 
                    fisql = "where itemdate >= to_date('"+df.format(dclosedate)+"','DD/MM/YYYY') and particular = 6 and folioid = "+fisid+" and itemdate != to_date('"+df.format(res.getArraivaldate().getTime())+"','DD/MM/YYYY') and itemdate != to_date('"+df.format(lastday.getTime())+"','DD/MM/YYYY') order by itemdate";
                    break;
                case 4:
                    fisql = "where itemdate >= to_date('"+df.format(dclosedate)+"','DD/MM/YYYY') and particular = 6 and folioid = "+fisid+" and itemdate != to_date('"+df.format(lastday.getTime())+"','DD/MM/YYYY') order by itemdate";
                    break;
                case 5: 
                    fisql = "where itemdate >= to_date('"+df.format(dclosedate)+"','DD/MM/YYYY') and particular = 6 and folioid = "+fisid+" and itemdate = to_date('"+df.format(res.getArraivaldate().getTime())+"','DD/MM/YYYY') order by itemdate";
                    break;
                case 6: 
                    fisql = "where itemdate >= to_date('"+df.format(dclosedate)+"','DD/MM/YYYY') and particular = 6 and folioid = "+fisid+" and itemdate = to_date('"+df.format(lastday.getTime())+"','DD/MM/YYYY') order by itemdate";
                    break;
                default:
                    fisql = "where folioitemid = 0";
            }

            double rate0 = extrachanrgerate;
            switch(chargeapplyrieson){
                case 0:
                    rate0 *= adult;
                    break;
                case 1:
                    rate0 *= child;
                    break;
                case 2:
                    
                    break;
                case 3:
                    rate0 *= (adult+child);
                    break;
                case 4:
                    rate0 *= qty;
                    break;
            }

            FolioitemBean[] fis = FolioitemManager.getInstance().loadByWhere(fisql);
            ExtrachargefolioManager.getInstance().deleteByWhere("where extrachargeid = "+efb.getExtrachargeid()+" and folioitemid in (select folioitemid from folioitem where folioid = "+ofolioid+" and done = false)");
            FoliologManager.getInstance().deleteByWhere("where folioitemid in (select folioitemid from folioitem where extrachargeid = "+efb.getExtrachargeid()+" and folioid = "+ofolioid+" and done = false)");
            FolioitemManager.getInstance().deleteByWhere("where extrachargeid = "+efb.getExtrachargeid()+" and folioid = "+ofolioid+" and done = false");
            if(ExtrachargefolioManager.getInstance().countWhere("where extrachargeid != "+efb.getExtrachargeid()+" and extrachargeid = "+extrachargeid+" and folioitemid in (select folioitemid from folioitem where done = false and folioid in (select folioid from folio where reservationroomid = "+rr.getReservationroomid()+"))") > 0)
                throw new Exception("ასეთი სერვისი უკვე არსებობს!");
            for(int i=0;i<fis.length;i++){
                FolioitemBean fb = FolioitemManager.getInstance().createFolioitemBean();
                fb.setFolioid(folioid);
                fb.setItemdate(fis[i].getItemdate());
                fb.setRegbyid(user.getPersonnelid());
                fb.setExtrachargeid(extrachargeid);
                fb.setAmount(rate0);
                fb.setDone(false);
                fb.setParticular(5);
                fb = FolioitemManager.getInstance().save(fb);

                
                ExtrachargefolioBean ex = ExtrachargefolioManager.getInstance().createExtrachargefolioBean();
                ex.setExtrachargeid(extrachargeid);
                ex.setAdult(adult);
                ex.setChargeapplyrieson(chargeapplyrieson);
                ex.setChild(child);
                ex.setPostingtype(postingtype);
                ex.setQty(qty);
                ex.setRate(extrachanrgerate);
                ex.setFolioitemid(fb.getFolioitemid());
                v.addElement((ExtrachargefolioBean)ex);
                if(save)        ex = ExtrachargefolioManager.getInstance().save(ex);
            }
        }
        
        msg = "{\"result\":1}";
        session.setAttribute("WALKIN_EXTRACHARGES", (Vector)v);

    } else {
        int adult = 0;
        int child = 0;
        int qty = 0;

        String eid = request.getParameter("extrachargeid");

        if(eid.equals("0")) throw new Exception("აირჩიეთ სერვისი");
        //String[] eids = eid.split("_");
        int extrachargeid = Integer.parseInt(eid);
        String srate = request.getParameter("rate");
        int postingtype = Integer.parseInt(request.getParameter("postingtype"));
        int chargeapplyrieson = Integer.parseInt(request.getParameter("chargeapplyrieson"));
        String sadult = request.getParameter("adult");
        String schild = request.getParameter("child");
        String sadult1 = request.getParameter("adult1");
        String schild1 = request.getParameter("child1");
        String sqty = request.getParameter("qty");
        double extrachanrgerate = 0;
        if(extrachargeid == 0)  throw new Exception("აირჩიეთ სერვისი");
        try{ extrachanrgerate = Double.parseDouble(srate); }catch(Exception ex){ throw new Exception("აირჩიეთ ტარიფი"); }
        if(postingtype < 0)  throw new Exception("აირჩიეთ სერვისის ტიპი");
        if(chargeapplyrieson < 0)  throw new Exception("აირჩიეთ წესი");
        if(chargeapplyrieson == 0){
            try{ adult = Integer.parseInt(sadult); }catch(Exception ex){ throw new Exception("უფროსების არასწორი რაოდენობა"); }
        }
        if(chargeapplyrieson == 1){
            try{ child = Integer.parseInt(schild); }catch(Exception ex){ throw new Exception("ბავშვების არასწორი რაოდენობა"); }
        }
        if(chargeapplyrieson == 3){
            try{ adult = Integer.parseInt(sadult1); }catch(Exception ex){ throw new Exception("უფროსების არასწორი რაოდენობა"); }
            try{ child = Integer.parseInt(schild1); }catch(Exception ex){ throw new Exception("ბავშვების არასწორი რაოდენობა"); }
        }
        if(chargeapplyrieson == 4){
            try{ qty = Integer.parseInt(sqty); }catch(Exception ex){ throw new Exception("არასწორი რაოდენობა"); }
        }

        ExtrachargefolioBean efb = ExtrachargefolioManager.getInstance().createExtrachargefolioBean();
        
        if(folioid == 0){
            efb.setExtrachargeid(extrachargeid);
            efb.setAdult(adult);
            efb.setChargeapplyrieson(chargeapplyrieson);
            efb.setChild(child);
            efb.setPostingtype(postingtype);
            efb.setQty(qty);
            efb.setRate(extrachanrgerate);
        } else {

            FolioBean folio = FolioManager.getInstance().loadByPrimaryKey(folioid);
            ReservationroomBean rr = ReservationroomManager.getInstance().loadByPrimaryKey(folio.getReservationroomid());
            ReservationBean res = ReservationManager.getInstance().loadByPrimaryKey(rr.getReservationid());
            rid = rr.getReservationroomid().longValue();
            if(ExtrachargefolioManager.getInstance().countWhere("where extrachargeid = "+extrachargeid+" and folioitemid in (select folioitemid from folioitem where folioid in (select folioid from folio where reservationroomid = "+rr.getReservationroomid()+"))") > 0)
                throw new Exception("ასეთი სერვისი უკვე არსებობს!");
            
            FolioBean[] fls = FolioManager.getInstance().loadByWhere("where reservationroomid = "+folio.getReservationroomid()+" and folioid in (select folioid from folioitem where folioid > 0 and particular = 6)");
            long fisid = fls[0].getFolioid().longValue();
            
            Calendar lastday = Calendar.getInstance();
            lastday.setTime(res.getDeparturedate());
            lastday.add(Calendar.DATE,-1);
            String fisql = "";
            switch(postingtype){
                case 0:
                    fisql = "where particular = 6 and folioid = "+fisid+" and (itemdate = to_date('"+df.format(res.getArraivaldate().getTime())+"','DD/MM/YYYY') or itemdate = to_date('"+df.format(lastday.getTime())+"','DD/MM/YYYY')) order by itemdate";
                    break;
                case 1:
                    fisql = "where particular = 6 and folioid = "+fisid+" order by itemdate";
                    break;
                case 2: 
                    fisql = "where particular = 6 and folioid = "+fisid+" and itemdate != to_date('"+df.format(res.getArraivaldate().getTime())+"','DD/MM/YYYY') order by itemdate";
                    break;
                case 3: 
                    fisql = "where particular = 6 and folioid = "+fisid+" and itemdate != to_date('"+df.format(res.getArraivaldate().getTime())+"','DD/MM/YYYY') and itemdate != to_date('"+df.format(lastday.getTime())+"','DD/MM/YYYY') order by itemdate";
                    break;
                case 4:
                    fisql = "where particular = 6 and folioid = "+fisid+" and itemdate != to_date('"+df.format(lastday.getTime())+"','DD/MM/YYYY') order by itemdate";
                    break;
                case 5: 
                    fisql = "where particular = 6 and folioid = "+fisid+" and itemdate = to_date('"+df.format(res.getArraivaldate().getTime())+"','DD/MM/YYYY') order by itemdate";
                    break;
                case 6: 
                    fisql = "where particular = 6 and folioid = "+fisid+" and itemdate = to_date('"+df.format(lastday.getTime())+"','DD/MM/YYYY') order by itemdate";
                    break;
                default:
                    fisql = "where folioitemid = 0";
            }
            double rate0 = extrachanrgerate;
            switch(chargeapplyrieson){
                case 0:
                    rate0 *= adult;
                    break;
                case 1:
                    rate0 *= child;
                    break;
                case 2:
                    
                    break;
                case 3:
                    rate0 *= (adult+child);
                    break;
                case 4:
                    rate0 *= qty;
                    break;
            }
            FolioitemBean[] fis = FolioitemManager.getInstance().loadByWhere(fisql);
            for(int i=0;i<fis.length;i++){
                FolioitemBean fb = FolioitemManager.getInstance().createFolioitemBean();
                fb.setFolioid(folioid);
                fb.setItemdate(fis[i].getItemdate());
                fb.setRegbyid(user.getPersonnelid());
                fb.setExtrachargeid(extrachargeid);
                fb.setAmount(rate0);
                fb.setDone(false);
                fb.setParticular(5);
                fb = FolioitemManager.getInstance().save(fb);
                
                ExtrachargefolioBean ex = ExtrachargefolioManager.getInstance().createExtrachargefolioBean();
                ex.setExtrachargeid(extrachargeid);
                ex.setAdult(adult);
                ex.setChargeapplyrieson(chargeapplyrieson);
                ex.setChild(child);
                ex.setPostingtype(postingtype);
                ex.setQty(qty);
                ex.setRate(extrachanrgerate);
                ex.setFolioitemid(fb.getFolioitemid());
                v.addElement((ExtrachargefolioBean)ex);
                if(save)        ex = ExtrachargefolioManager.getInstance().save(ex);
            }
        }
        
        msg = "{\"result\":1}";
    }
    
    if(folioid > 0){
        v = new Vector();
        ExtrachargefolioBean[] exbs = ExtrachargefolioManager.getInstance().loadByWhere("where folioitemid in (select folioitemid from folioitem where folioid in (select folioid from folio where reservationroomid = "+rid+")) order by extrachargeid");
        for(int i=0;i<exbs.length;i++)
            v.addElement((ExtrachargefolioBean)exbs[i]);
    }
    session.setAttribute("WALKIN_EXTRACHARGES", (Vector)v);
    
    Manager.getInstance().endTransaction(true);
    
}catch(Exception e){
    e.printStackTrace();
    Manager.getInstance().endTransaction(false);
    msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}";
}
    
%>
<%=msg%>