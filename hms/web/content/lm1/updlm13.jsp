<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%
SimpleDateFormat sdt0 = new SimpleDateFormat("yyyy-MM-dd");
SimpleDateFormat sdt1 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
SimpleDateFormat sdt2 = new SimpleDateFormat("dd/MM");

String msg = "";

String sid = "0";
String oper = request.getParameter("oper");
Manager.getInstance().beginTransaction();
try{
    if(oper.equalsIgnoreCase("del")){
        sid = request.getParameter("id");
        String[] ids = sid.split("_");
        String sql = "where roomtypeid = "+ids[0]+" and tarifftypeid = "+ids[1];
        if(ids[2].equals("0"))  sql += " and seasonid is null";
        else                    sql += " and seasonid = "+ids[2];
        if(ids[3].equals("0"))  sql += " and sourceid is null";
        else                    sql += " and sourceid = "+ids[3];
        TariffManager.getInstance().deleteByWhere(sql);
        
    } else if(oper.equalsIgnoreCase("edit")){
        sid = request.getParameter("id");
        String[] ids = sid.split("_");
        String sql = "where roomtypeid = "+ids[0]+" and tarifftypeid = "+ids[1];
        if(ids[2].equals("0"))  sql += " and seasonid is null";
        else                    sql += " and seasonid = "+ids[2];
        if(ids[3].equals("0"))  sql += " and sourceid is null";
        else                    sql += " and sourceid = "+ids[3];
        
        TariffBean tariff = TariffManager.getInstance().createTariffBean();
        TariffBean[] stariff = TariffManager.getInstance().loadByWhere(sql);
        if(stariff.length > 0)
            tariff = TariffManager.getInstance().loadByPrimaryKey(stariff[0].getTariffid());
        else {
            tariff.setRoomtypeid(new Integer(ids[0]));
            tariff.setTarifftypeid(new Integer(ids[1]));
            if(!ids[2].equals("0"))  tariff.setSeasonid(new Integer(ids[2]));
            if(!ids[3].equals("0"))  tariff.setSourceid(new Integer(ids[3]));
        }
        
        double amount=Double.parseDouble(request.getParameter("amount"));
        double amountadult=Double.parseDouble(request.getParameter("amountadult"));
        double amountchild=Double.parseDouble(request.getParameter("amountchild"));
        
        tariff.setAmount(amount);
        tariff.setAmountadult(amountadult);
        tariff.setAmountchild(amountchild);
        
        tariff = TariffManager.getInstance().save(tariff);
        
    }

    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1,\"id\":"+sid+"}";
}catch(Exception e){
    Manager.getInstance().endTransaction(false);
    e.printStackTrace();
    msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}"; 
    }
%>
<%=msg%>
