<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/xml;charset=utf-8"%>
<%@include file="../../../../includes/initxml.jsp"%>
<%
String sql = "where particular in (5,6) and itemdate = to_date('"+df.format(dclosedate)+"','DD/MM/YYYY') and done = false";
    
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
            String guestname = "";
            String roomname = "";
            if(res.getRoomid() != null){
                RoomBean room = RoomManager.getInstance().loadByPrimaryKey(res.getRoomid());
                //istatus = getRoomStatus(null,room.getRoomid().intValue());
                roomname = room.getName()+" ";
            }
            
            if(folio.getGuestid() != null){
                GuestBean guest = GuestManager.getInstance().loadByPrimaryKey(folio.getGuestid());
                SalutationBean salutation = null;
                if(guest.getSalutationid() != null)
                    salutation = SalutationManager.getInstance().loadByPrimaryKey(guest.getSalutationid());
                if(salutation != null)
                    guestname += salutation.getName()+" ";
                guestname += guest.getFname() + " " + guest.getLname();
            } else {
                ContragentBean contragent = ContragentManager.getInstance().loadByPrimaryKey(folio.getContragentid());
                switch(contragent.getType().intValue()){
                    case 0:
                        if(contragent.getSalutationid() != null){
                            SalutationBean salt = SalutationManager.getInstance().loadByPrimaryKey(contragent.getSalutationid());
                            guestname = salt.getName() + " ";
                        }
                        guestname += contragent.getFname() + " " + contragent.getLname();
                        break;
                    case 1:
                        guestname = contragent.getName();
                        break;
                    case 2:
                        if(contragent.getName() != null)    guestname = contragent.getName();
                        else {
                            if(contragent.getSalutationid() != null){
                                SalutationBean salt = SalutationManager.getInstance().loadByPrimaryKey(contragent.getSalutationid());
                                guestname = salt.getName() + " ";
                            }
                            guestname += contragent.getFname() + " " + contragent.getLname();
                        }
                        break;
                    case 3:
                        guestname = contragent.getName();
                        break;
                    case 4:
                        if(contragent.getSalutationid() != null){
                            SalutationBean salt = SalutationManager.getInstance().loadByPrimaryKey(contragent.getSalutationid());
                            guestname = salt.getName() + " ";
                        }
                        guestname += contragent.getFname() + " " + contragent.getLname();
                        break;
                    case 5:
                        guestname = "WEB";
                        break;
                    default:
                        guestname = "N/A";
                }
            }
            RoomtypeBean roomtype = RoomtypeManager.getInstance().loadByPrimaryKey(res.getRoomtypeid());
            if(roomtype != null)    roomname += roomtype.getCode();
            
            String actions = "";
            actions += "<a href=\"#\" title=\"AMEND STAY\" class=\"btn btn-xs btn-default\"><i class=\"fa fa-remove\"></i></a>";
            
            double koeff = 1;
            String particular = "";
            boolean noroom = false;
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
                case 2:
                    particular = "გადახდა: ";
                    PaymentBean payment = PaymentManager.getInstance().loadByPrimaryKey(items[i].getPaymentid());
                    PaymentmethodBean pmethod = PaymentmethodManager.getInstance().loadByPrimaryKey(payment.getPaymentmethodid());
                    particular += pmethod.getCode();
                    koeff = -1;
                    break;
                case 3:
                    break;
                case 4:
                    DiscountBean discount = DiscountManager.getInstance().loadByPrimaryKey(items[i].getDiscountid());
                    particular = discount.getName();
                    noroom = true;
                    break;
                case 5:
                    ExtrachargeBean extracharge = ExtrachargeManager.getInstance().loadByPrimaryKey(items[i].getExtrachargeid());
                    particular = "<font color='red'>*</font>"+extracharge.getName();
                    break;
                case 6:
                    particular = "ოთახის გადასახადი";
                    break;
                default:
                    
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
