<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
String id  = request.getParameter("id");
String nickname = request.getParameter("nickname").trim();
String name = request.getParameter("name").trim();
String bank = request.getParameter("bank");
String procesing = request.getParameter("procesing");
String extracharge = request.getParameter("extracharge");
String extraperc = request.getParameter("extraperc");
String extraamount = request.getParameter("extraamount");
String status=request.getParameter("status");
String msg = "";
Manager.getInstance().beginTransaction();
try{
    PaymentmethodBean pb = PaymentmethodManager.getInstance().createPaymentmethodBean();
    String sql0 = "";
    if(id != null){
        sql0 = " and paymentmethodid != "+id;
        pb = PaymentmethodManager.getInstance().loadByPrimaryKey(new Integer(id));
    }
    String sqlchk = "where upper(nickname) = '"+nickname.toUpperCase().replaceAll("'", "''") +"'"+sql0;
    if(PaymentmethodManager.getInstance().countWhere(sqlchk) > 1)
        throw new Exception("ასეთი მოკლე სახელი უკვე არსებობს");
    pb.setNickname(nickname);
    sqlchk = "where upper(name) = '"+name.toUpperCase().replaceAll("'", "''") +"'"+sql0;
    if(PaymentmethodManager.getInstance().countWhere(sqlchk) > 1)
        throw new Exception("ასეთი გადახდის მეთოდი უკვე არსებობს");
    pb.setName(name);
    pb.setBank(false);
    pb.setProcesing(false);
    pb.setExtracharge(false);
    pb.setExtraperc(false);
    pb.setExtraamount(0);
    if(bank != null && bank.equalsIgnoreCase("true")){
        pb.setBank(true);
        if(procesing != null){
            pb.setProcesing(true);
            if(extracharge != null){
                pb.setExtracharge(true);
                if(extraperc != null && extraperc.equalsIgnoreCase("true")){
                    pb.setExtraperc(true);
                }
                try{
                    pb.setExtraamount(new Double(extraamount));
                }catch(Exception ex){
                    throw new Exception("არასწორი ოდენობა");
                }
            }
        }
    }
    
    if(status.equalsIgnoreCase("აქტიური"))   pb.setStatus(true);
    else                                pb.setStatus(false);
    
    pb = PaymentmethodManager.getInstance().save(pb);
    
    ChangelogBean chlog = ChangelogManager.getInstance().createChangelogBean();
    chlog.setChangebyid(user.getPersonellid());
    chlog.setName("PAYMENTMETHOD");
    chlog.setId(pb.getPaymentmethodid());
    chlog = ChangelogManager.getInstance().save(chlog);
    
    Manager.getInstance().endTransaction(true);
}catch(Exception e){
    e.printStackTrace();
    Manager.getInstance().endTransaction(false);
    msg = e.getMessage();
}
%>
<%=msg%>