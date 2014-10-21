<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%

ReservationconditionalratesBean rest = ReservationconditionalratesManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("rid")));
ReservationBean reserv = ReservationManager.getInstance().loadByPrimaryKey(rest.getReservationid());

if(reserv.getTariffsid())


Date staydate = rest.getStaydate();
Calendar cal = Calendar.getInstance();
cal.setTime(staydate);
RoomBean room = RoomManager.getInstance().loadByPrimaryKey(rest.getRoomid());

TarifftypeBean tarifftype = TarifftypeManager.getInstance().loadByPrimaryKey(rest.getTarifftypeid());

String sessql = "where "
        + "to_date(to_char(fromdate,'DD-MM') || '-"+cal.get(Calendar.YEAR)+") <= to_date('"+dnika.format(staydate)+"','DD-MM-YYYY') and "
        + "to_date(to_char(todate,'DD-MM') || '-"+cal.get(Calendar.YEAR)+") >= to_date('"+dnika.format(staydate)+"','DD-MM-YYYY') and "
        + "startdate <= to_date('"+dnika.format(staydate)+"','DD-MM-YYYY') and "
        + "enddate <= to_date('"+dnika.format(staydate)+"','DD-MM-YYYY') "
        + "order by startdate limit 1";

SeasonBean[] ses = SeasonManager.getInstance().loadByWhere(sessql);

String sql = "where roomtypeid = "+room.getRoomtypeid()+" and "
        + "tarifftypeid = "+tarifftype.getTarifftypeid();
if(reserv.getTariffsidcontractid() != null){
    SourcemixBean smx = SourcemixManager.getInstance().loadByPrimaryKey(reserv.getTariffsidcontractid());
    CategoryBean cat = CategoryManager.getInstance().loadByPrimaryKey(smx.getCategoryid());
    SourceBean[] src = SourceManager.getInstance().loadByCategoryid(cat.getCategoryid());
    if(src.length > 0)
        sql += " and sourceid = "+src[0].getSourceid();
}


        + "(sourceid is null or sourceid = "+re+")";

%>
