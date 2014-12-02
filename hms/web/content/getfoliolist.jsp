<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/xml;charset=utf-8"%>
<%@include file="../includes/initxml.jsp"%>
<%
boolean itemize = new java.lang.Boolean(request.getParameter("itemize"));
FolioBean folio = FolioManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("folioid")));
ReservationroomBean rroom = ReservationroomManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("reservationroomid")));
ReservationBean reserv = ReservationManager.getInstance().loadByPrimaryKey(rroom.getReservationid());
RoomBean room = RoomManager.getInstance().loadByPrimaryKey(rroom.getRoomid());
long bid = 0;
if(reserv.getBillto() == 0) bid = reserv.getCompanyid().longValue();
//if(reserv.getBillto() == 1) bid = rroom.getGuestid().longValue();
//if(reserv.getBillto() == 2) bid = rroom.getGuestid().longValue();
//if(reserv.getBillto() == 3) bid = rroom.getGuestid().longValue();
String sql = "where folioid = "+folio.getFolioid();
/*
        + "(select folioid from folio where "
        + "reservationroomid = "+rroom.getReservationroomid()+" and ";
if(bid > 0)
        sql += "contragentid = "+bid+" and ";
sql += "guestid = "+rroom.getGuestid()+") ";
*/
sql += " order by itemdate, roomid, taxid";

System.out.println(sql);

FolioitemBean[] items = FolioitemManager.getInstance().loadByWhere(sql);

int ipg = 1;
int ilmt = 10;
String pg = request.getParameter("page");
if(pg != null)  ipg = Integer.parseInt(pg);
String lmt = request.getParameter("rows");
if(lmt != null) ilmt = Integer.parseInt(lmt);
String sidx = request.getParameter("sidx");
if(sidx == null)    sidx = "";
String sord = request.getParameter("sord");
if(sord == null)    sord = "";
int count = items.length;
int total_pages = 0;
if(count > 0)    total_pages = (int)(count/ilmt);
if(total_pages*ilmt < count)    total_pages++;
if(ipg > total_pages) ipg=total_pages;
int start = ilmt*ipg - ilmt;
if(start < 0)   start = 0;
String limit = "limit "+ilmt+" offset "+start;
String order = "order by "+sidx+" "+sord;
String[][] ss = new String[items.length][11];
int n = 0;
for(int i=0;i<items.length;i++){
    double koeff = 1;
    String particular = "";
    boolean noroom = false;
    if(items[i].getRoomid() != null)    {
        particular = "ოთახის გადასახადი";
    }
    else if(items[i].getTaxid() != null){
        TaxBean tax = TaxManager.getInstance().loadByPrimaryKey(items[i].getTaxid());
        particular = tax.getName() + " " + dc.format(tax.getAmount().doubleValue());
        if(tax.getPostingtype().intValue() == 0)    particular += "%";
        noroom = true;
    } else if(items[i].getDiscountid() != null){
        DiscountBean discount = DiscountManager.getInstance().loadByPrimaryKey(items[i].getDiscountid());
        particular = discount.getName();
        noroom = true;
    } else if(items[i].getExtrachargeid() != null){
        ExtrachargeBean extracharge = ExtrachargeManager.getInstance().loadByPrimaryKey(items[i].getExtrachargeid());
        particular = extracharge.getName();
    } else if(items[i].getOrdermainid() != null){
        particular = "კვება";
    } else if(items[i].getPaymentid() != null){
        particular = "გადახდა: ";
        PaymentBean payment = PaymentManager.getInstance().loadByPrimaryKey(items[i].getPaymentid());
        PaymentmethodBean pmethod = PaymentmethodManager.getInstance().loadByPrimaryKey(payment.getPaymentmethodid());
        particular += pmethod.getCode();
        koeff = -1;
    } else if(items[i].getParticular().intValue() == 6){
        noroom = false;
        particular = accounts[items[i].getRoomoper()];
    } else {
        noroom = true;
        particular = "დამრგვალება";
    }
    if(items[i].getManual().booleanValue())
        noroom = false;
    PersonnelBean regby = PersonnelManager.getInstance().loadByPrimaryKey(items[i].getRegbyid());
    int st = 0;
    String sact = "";
    if(!noroom){
        sact = "<span onclick=\"editFolioAction("+items[i].getFolioitemid()+")\" style=\"cursor: pointer;\" class=\"glyphicon glyphicon-pencil\" data-toggle=\"tooltip\" title=\"ტარიფის ოპერაცია\"></span>";
        if(items[i].getPaymentid() != null)
            sact += "<span onclick=\"printFolioAction("+items[i].getFolioitemid()+")\" style=\"padding-left: 5px; cursor: pointer;\" class=\"glyphicon glyphicon-print\" data-toggle=\"tooltip\" title=\"ბეჭდვა\"></span>";
        st = 1;
    }
    String note = items[i].getNote();
    double amt = items[i].getAmount();
    if(!itemize){
        if(noroom && n > 0){
            double am = Double.parseDouble(ss[n-1][9])+amt;
            ss[n-1][9] = dc.format(am*koeff);
            continue;
        }
    }
    ss[n][0] = items[i].getFolioitemid().toString();
    ss[n][1] = room.getName();
    ss[n][2] = dt.format(items[i].getItemdate());
    ss[n][3] = (items[i].getRefno() != null) ? items[i].getRefno():items[i].getFolioitemid().toString();
    ss[n][4] = particular;
    ss[n][5] = note;
    ss[n][6] = regby.getFname()+" "+regby.getLname();
    ss[n][7] = sact;
    ss[n][8] = maincurrency.getCode();
    ss[n][9] = dc.format(amt*koeff);
    ss[n][10] = String.valueOf(st);
    //System.out.println(i+" = "+n+" = "+amt);
    n++;
    }
n--;
%>
<rows>
	<page><%=ipg%></page>
	<total><%=total_pages%></total>
	<records><%=count%></records>
	<%
        double am = 0;
	for(int i=0;i<=n;i++){
            
            %>
                <row id='<%=ss[i][0]%>'>
                    <%
                    for(int j=1;j<11;j++){
                        %><cell><![CDATA[<%=ss[i][j]%>]]></cell><%
                    }
                    %>
                </row>
            <%
            }
	%>
</rows>
