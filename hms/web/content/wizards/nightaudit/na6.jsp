<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../../includes/init.jsp"%>
<%
String msg = "";
Calendar cal = Calendar.getInstance();
cal.setTimeInMillis(lclosedate);
cal.add(Calendar.DATE, 1);
/*
try{
    String sql = "where reservationid in (select reservationid from reservation where arraivaldate::date = to_date('" + df.format(dclosedate) + "','DD/MM/YYYY') and status = 0)";
    ReservationroomBean[] reservs = ReservationroomManager.getInstance().loadByWhere(sql);
    for (int i = 0; i < reservs.length; i++) {
        ReservationBean rb = ReservationManager.getInstance().loadByPrimaryKey(reservs[i].getReservationid());
                double advancedpaymentamount = 0;
                if (rb.getAdvancepaymentamount() != null) {
                    advancedpaymentamount = rb.getAdvancepaymentamount().doubleValue();

                }

                    double balance = getBalance(reservs[i].getReservationroomid());
                    System.out.println("BALANCE > " + balance);

                    double releaseTerm = (getTotalWithExtra(reservs[i].getReservationroomid()) * advancedpaymentamount / 100);
                    System.out.println("RELEASE MONEY > " + releaseTerm);

                    Date releaseDate = rb.getAdvancepaymentdate();
                    System.out.println("RELEASE DATE > " + releaseDate);
                    double deposit = getSum("select sum(amount) from payment where folioid in (select folioid from folio where reservationroomid = " + reservs[i].getReservationroomid() + ")");
                    if (
                            (releaseDate != null &&
                                    deposit >= releaseTerm &&
                                    releaseDate.getTime() == lclosedate) || releaseDate == null
                            ) {
                        throw new Exception("დასარეგულირებელია დაუსრულებელი რეზერვაციები");
                    }
    }

    sql = "where reservationid in ("
            + "select reservationid from reservation where advancepaymentdate::date = to_date('"+df.format(dclosedate)+"','DD/MM/YYYY')"
            + " and status = 0) ";
    if(ReservationroomManager.getInstance().countWhere(sql) > 0)
        throw new Exception("დასარეგულირებელია დასრულებული რეზერვაციები");

    sql = "where roomid is not null and reservationid in ("
            + "select reservationid from reservation where departuredate::date = to_date('"+df.format(dclosedate)+"','DD/MM/YYYY')"
            + ") and getroomstatus(roomid, '"+dflong.format(dclosedate)+"') != 4";
    if(ReservationroomManager.getInstance().countWhere(sql) > 0)
        throw new Exception("დასარეგულირებელია ოთახის სტატუსები");

    sql = "where roomid is not null and itemdate = to_date('"+df.format(dclosedate)+"','DD/MM/YYYY') and done = false";
    if(FolioitemManager.getInstance().countWhere(sql) > 0)
        throw new Exception("დასარეგულირებელია ღამის გადასახადები");
}catch(Exception e){
    msg = e.getMessage();
}
        */
%>
<script>
    $('#newclosedate').datepicker(<%=pickerformat2%>);
</script>
<table width="100%" style="height: 410px;">
    <%--if(msg.length() > 0){%>
    <tr>
        <td>
            <div class="alert alert-danger" role="alert"><b><%=msg%></b></div>
        </td>
    </tr>
    <%} else {--%>
    <tr>
        <td class="tbllabel" align='center'>
            <h2><font color="red">თქვენ ხურავთ თარიღს: <i><%=dt.format(dclosedate)%></i>. დახურვის შემდეგ ცვლილებები ამ თარიღისათვის შეუძლებელი იქნება!</font></h2>
            <p>
            <h1>
            ახალი თარიღი:
            &nbsp;&nbsp;&nbsp;&nbsp;
            <%=dt.format(cal.getTime())%>
            </h1>
        </td>
    </tr>
    <%--
    <tr>
        <td>
            <button type="button" class="btn btn-sx btn-success navbar-btn" onclick="closeDate($('#newclosedate').val())">დღის დახურვა</button>
        </td>
    </tr>
    
    < %--}--%>
</table>
