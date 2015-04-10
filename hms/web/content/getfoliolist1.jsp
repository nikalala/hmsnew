<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/xml;charset=utf-8"%>
<%@include file="../includes/initxml.jsp"%>
<%
boolean itemize = new java.lang.Boolean(request.getParameter("itemize"));
boolean hideunposted = new java.lang.Boolean(request.getParameter("hideunposted"));
boolean hidevoid = new java.lang.Boolean(request.getParameter("hidevoid"));

FolioBean folio = FolioManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("folioid")));
if(request.getParameter("guestid") != null && !request.getParameter("guestid").equals("0")){
    SharerBean[] sh = SharerManager.getInstance().loadByWhere("where reservationroomid = "+request.getParameter("reservationroomid")+" and guestid = "+request.getParameter("guestid"));
    if(sh.length > 0){
       FolioBean[] fols = FolioManager.getInstance().loadByWhere("where reservationroomid = "+request.getParameter("reservationroomid")+" and guestid = "+request.getParameter("guestid"));
       if(fols.length > 0)
           folio = FolioManager.getInstance().loadByPrimaryKey(fols[0].getFolioid());
    }
}
if(folio == null){
    %>
<rows>
	<page>1</page>
	<total>1</total>
	<records>0</records>
</rows>
<%
}else{
    String sql = "where folioid = "+folio.getFolioid()+" and (particular != 5 or done = true) ";
    if(hideunposted)
        sql += " and done = true ";
    if(hidevoid)
        sql += " and zvoid = false ";
    sql += " order by itemdate, reservationroomid, (case when particular = 6 then 1 when particular = -1 then 2 when particular = 0 then 3 when particular = 1 then 4 when particular = 2 then 5 when particular = 4 then 6 when particular = 5 then 7 else 8 end)";

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
    String[][] ss = new String[items.length][12];
    int n = 0;
    for(int i=0;i<items.length;i++){
        double koeff = 1;
        String particular = "";
        boolean noroom = false;

        ReservationroomBean rroom = ReservationroomManager.getInstance().loadByPrimaryKey(items[i].getReservationroomid());
        RoomtypeBean rtp = RoomtypeManager.getInstance().loadByPrimaryKey(rroom.getRoomtypeid());

        String roomname = rtp.getCode();
        if(rroom.getRoomid() != null){
            RoomBean room = RoomManager.getInstance().loadByPrimaryKey(rroom.getRoomid());
            roomname = " - "+room.getName();
        }



        int z = 1;
        if(items[i].getZvoid().booleanValue()) z = 0;
        if(items[i].getRoomid() != null){
            RoomBean room = RoomManager.getInstance().loadByPrimaryKey(items[i].getRoomid());
            rtp = RoomtypeManager.getInstance().loadByPrimaryKey(room.getRoomtypeid());
            //roomname = rtp.getCode() + " - "+room.getName();
            roomname = room.getName();
        }
        switch(items[i].getParticular().intValue()){
            case -1:
                TaxBean tax = TaxManager.getInstance().loadByPrimaryKey(items[i].getTaxid());
                particular = tax.getName() + " " + dc.format(tax.getAmount().doubleValue());
                if(tax.getPostingtype().intValue() == 0)    particular += "%";
                noroom = true;
                break;
            case 0:
                noroom = true;
                particular = "დამრგვალება";
                break;
            case 1:
                PaymentBean payment = PaymentManager.getInstance().loadByPrimaryKey(items[i].getPaymentid());
                PaymentmethodBean pmethod = PaymentmethodManager.getInstance().loadByPrimaryKey(payment.getPaymentmethodid());
                particular = pmethod.getCode();
                koeff = -1;
                break;
            case 2:
                payment = PaymentManager.getInstance().loadByPrimaryKey(items[i].getPaymentid());
                pmethod = PaymentmethodManager.getInstance().loadByPrimaryKey(payment.getPaymentmethodid());
                particular = pmethod.getCode();
                koeff = -1;
                break;
            case 3:
                payment = PaymentManager.getInstance().loadByPrimaryKey(items[i].getPaymentid());
                if(payment != null){
                    if(payment.getPaymentmethodid() == null){
                        ContragentBean contragent = ContragentManager.getInstance().loadByPrimaryKey(payment.getContracgentid());
                        if(contragent.getName() != null && contragent.getName().trim().length() > 0)
                            particular = contragent.getName();
                        else
                            particular = contragent.getFname()+" "+contragent.getLname();
                        if(items[i].getNote() != null && items[i].getNote().trim().length() > 0)    particular += items[i].getNote();
                    } else {
                        pmethod = PaymentmethodManager.getInstance().loadByPrimaryKey(payment.getPaymentmethodid());
                        particular = pmethod.getCode();
                    }
                    koeff = -1;
                }
                break;
            case 4:
                DiscountBean discount = DiscountManager.getInstance().loadByPrimaryKey(items[i].getDiscountid());
                particular = discount.getName();
                noroom = true;
                break;
            case 5:
                ExtrachargeBean extracharge = ExtrachargeManager.getInstance().loadByPrimaryKey(items[i].getExtrachargeid());
                particular = extracharge.getName();
                if(items[i].getOrdermainid() != null)   particular = "კვება";
                if(items[i].getManual().booleanValue() == false)
                    particular = "<font color='red'>*</font>"+particular;
                break;
            case 6:
                particular = "ოთახის გადასახადი";
                if(items[i].getRoomoper() != null){
                    particular = accounts[items[i].getRoomoper()];
                }
                break;
            default:
                break;
        }

        if(items[i].getManual().booleanValue())
            noroom = false;
        PersonnelBean regby = PersonnelManager.getInstance().loadByPrimaryKey(items[i].getRegbyid());
        int st = 0;
        String sact = "";
        if(!noroom && z > 0){
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
        ss[n][1] = roomname;
        ss[n][2] = dt.format(items[i].getItemdate());
        ss[n][3] = (items[i].getRefno() != null) ? items[i].getRefno():items[i].getFolioitemid().toString();
        ss[n][4] = particular;
        ss[n][5] = note;
        ss[n][6] = regby.getFname()+" "+regby.getLname();
        ss[n][7] = sact;
        ss[n][8] = maincurrency.getCode();
        ss[n][9] = dc.format(amt*koeff);
        ss[n][10] = String.valueOf(st);
        ss[n][11] = String.valueOf(z);
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
                    for(int j=1;j<12;j++){
                        %><cell><![CDATA[<%=ss[i][j]%>]]></cell><%
                    }
                    %>
                </row>
            <%
            }
	%>
</rows>
<%}%>