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
Manager.getInstance().beginTransaction();
try{
    Vector v = (Vector)session.getAttribute("WALKIN_EXTRACHARGES");
    if(v == null)   v = new Vector();
    
    if(act.equalsIgnoreCase("del")){
        v.removeElementAt(Integer.parseInt(request.getParameter("num")));
        msg = "{\"result\":1}";
    } else if(act.equalsIgnoreCase("get")){
        ExtrachargefolioBean efb = (ExtrachargefolioBean)v.elementAt(Integer.parseInt(request.getParameter("num")));
        msg = "{\"result\":1";
        msg += ",\"extrachargeid\":"+efb.getExtrachargeid();
        msg += ",\"adult\":"+efb.getAdult();
        msg += ",\"child\":"+efb.getChild();
        msg += ",\"qty\":"+efb.getQty();
        msg += ",\"chargeapplyrieson\":"+efb.getChargeapplyrieson();
        msg += ",\"postingtype\":"+efb.getPostingtype();
        msg += ",\"rate\":"+dc.format(efb.getRate());
        msg += "}";
    } else if(act.equalsIgnoreCase("edt")){
        int adult = 0;
        int child = 0;
        int qty = 0;

        String eid = request.getParameter("extrachargeid");

        if(eid.equals("0")) throw new Exception("აირჩიეთ სერვისი");
        String[] eids = eid.split("_");
        int extrachargeid = Integer.parseInt(eids[0]);
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
        efb.setExtrachargeid(extrachargeid);
        efb.setAdult(adult);
        efb.setChargeapplyrieson(chargeapplyrieson);
        efb.setChild(child);
        efb.setPostingtype(postingtype);
        efb.setQty(qty);
        efb.setRate(extrachanrgerate);


        v.setElementAt((ExtrachargefolioBean)efb,num);
        msg = "{\"result\":1}";
    } else {
        int adult = 0;
        int child = 0;
        int qty = 0;

        String eid = request.getParameter("extrachargeid");

        if(eid.equals("0")) throw new Exception("აირჩიეთ სერვისი");
        String[] eids = eid.split("_");
        int extrachargeid = Integer.parseInt(eids[0]);
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
        efb.setExtrachargeid(extrachargeid);
        efb.setAdult(adult);
        efb.setChargeapplyrieson(chargeapplyrieson);
        efb.setChild(child);
        efb.setPostingtype(postingtype);
        efb.setQty(qty);
        efb.setRate(extrachanrgerate);


        v.addElement((ExtrachargefolioBean)efb);
        msg = "{\"result\":1}";
    }
    session.setAttribute("WALKIN_EXTRACHARGES", (Vector)v);
}catch(Exception e){
    e.printStackTrace();
    Manager.getInstance().endTransaction(false);
    msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}";
}
    
%>
<%=msg%>