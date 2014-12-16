<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/xml;charset=utf-8"%>
<%@include file="../../../../includes/initxml.jsp"%>
<%
String sql = "where roomid is not null and itemdate = to_date('"+df.format(dclosedate)+"','DD/MM/YYYY') and done = false";
    
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
int count = FolioitemManager.getInstance().countWhere(sql);
int total_pages = 0;
if(count > 0)    total_pages = (int)(count/ilmt);
if(total_pages*ilmt < count)    total_pages++;
if(ipg > total_pages) ipg=total_pages;
int start = ilmt*ipg - ilmt;
if(start < 0)   start = 0;
String limit = "limit "+ilmt+" offset "+start;
String order = "order by "+sidx+" "+sord;
System.out.println(sql+" "+order);
FolioitemBean[] items = FolioitemManager.getInstance().loadByWhere(sql+" "+order);
%>
<rows>
	<page><%=ipg%></page>
	<total><%=total_pages%></total>
	<records><%=count%></records>
	<%
        double am = 0;
	for(int i=0;i<items.length;i++){
            FolioBean folio = FolioManager.getInstance().loadByPrimaryKey(items[i].getFolioid());
            ReservationroomBean res = ReservationroomManager.getInstance().loadByPrimaryKey(folio.getReservationroomid());
            GuestBean guest = GuestManager.getInstance().loadByPrimaryKey(folio.getGuestid());
            SalutationBean salutation = SalutationManager.getInstance().loadByPrimaryKey(guest.getSalutationid());
            int istatus = 0;
            String roomname = "";
            if(items[i].getRoomid() != null){
                RoomBean room = RoomManager.getInstance().loadByPrimaryKey(items[i].getRoomid());
                istatus = getRoomStatus(null,room.getRoomid().intValue());
                roomname = room.getName()+" ";
            }
            RoomtypeBean roomtype = RoomtypeManager.getInstance().loadByPrimaryKey(res.getRoomtypeid());
            if(roomtype != null)    roomname += roomtype.getName();
            String guestname = salutation.getName()+" ";
            guestname += guest.getFname() + " " + guest.getLname();
            
            String actions = "";
            actions += "<a href=\"#\" title=\"AMEND STAY\" class=\"btn btn-xs btn-default\"><i class=\"fa fa-remove\"></i></a>";
            
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
            } else {
                noroom = true;
                particular = "დამრგვალება";
            }
            %>
                <%--reservs[i].getReservationroomid()--%>
                <row id='<%=items[i].getFolioitemid()%>'>
                    <cell><![CDATA[<%=roomname%>]]></cell>
                    <cell><![CDATA[<%=guestname%>]]></cell>
                    <cell><![CDATA[<%=folio.getFolioid()%>]]></cell>
                    <cell><![CDATA[<%=particular%>]]></cell>
                    <cell><![CDATA[<%=maincurrency.getCode()%> <%=dc.format(items[i].getAmount().doubleValue()*koeff)%>]]></cell>
                    <%--cell><![CDATA[<%=maincurrency.getCode()%> <%=dc.format(0)%>]]></cell--%>
                </row>
            <%
            }
	%>
</rows>
