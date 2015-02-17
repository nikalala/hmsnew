<%@page contentType="application/pdf"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/meta.jsp"%>
<%!
class TableHeader extends PdfPageEventHelper {
        /** The header text. */
        String header;
        /** The template with the total number of pages. */
        PdfTemplate total;
 
        /**
         * Allows us to change the content of the header.
         * @param header The new header String
         */
        public void setHeader(String header) {
            this.header = header;
        }
 
        /**
         * Creates the PdfTemplate that will hold the total number of pages.
         * @see com.itextpdf.text.pdf.PdfPageEventHelper#onOpenDocument(
         *      com.itextpdf.text.pdf.PdfWriter, com.itextpdf.text.Document)
         */
        public void onOpenDocument(PdfWriter writer, Document document) {
            total = writer.getDirectContent().createTemplate(30, 16);
        }
 
        /**
         * Adds a header to every page
         * @see com.itextpdf.text.pdf.PdfPageEventHelper#onEndPage(
         *      com.itextpdf.text.pdf.PdfWriter, com.itextpdf.text.Document)
         */
        public void onEndPage(PdfWriter writer, Document document) {
            PdfPTable table = new PdfPTable(3);
            try {
                table.setWidths(new int[]{24, 24, 2});
                table.setTotalWidth(527);
                table.setLockedWidth(true);
                table.getDefaultCell().setFixedHeight(20);
                table.getDefaultCell().setBorder(com.itextpdf.text.Rectangle.BOTTOM);
                table.addCell(header);
                table.getDefaultCell().setHorizontalAlignment(com.itextpdf.text.Element.ALIGN_RIGHT);
                table.addCell(String.format("Page %d of", writer.getPageNumber()));
                PdfPCell cell = new PdfPCell(com.itextpdf.text.Image.getInstance(total));
                cell.setBorder(com.itextpdf.text.Rectangle.BOTTOM);
                table.addCell(cell);
                table.writeSelectedRows(0, -1, 34, 803, writer.getDirectContent());
            }
            catch(com.itextpdf.text.DocumentException de) {
                throw new com.itextpdf.text.ExceptionConverter(de);
            }
        }
 
        /**
         * Fills out the total number of pages before the document is closed.
         * @see com.itextpdf.text.pdf.PdfPageEventHelper#onCloseDocument(
         *      com.itextpdf.text.pdf.PdfWriter, com.itextpdf.text.Document)
         */
        public void onCloseDocument(PdfWriter writer, Document document) {
            ColumnText.showTextAligned(total, com.itextpdf.text.Element.ALIGN_LEFT,
                    new com.itextpdf.text.Phrase(String.valueOf(writer.getPageNumber() - 1)),
                    2, 2, 0);
        }
    }

public String Num2Text(double val)
   {
       if(val <= 0.0001)             return "ნული";
       if(val >= 1.0E33)    return "1.0E33";
       String[] smore = 
       {
           "ათასი", "მილიონი", "მილიარდი", "ტრილიონი", "კვადრილიონი", "კვინტილიონი", "სეკსტილიონი", "სეპტილიონი", "ოქტილიონი", "ნონილიონი", "დეცილიონი"
       };

       DecimalFormat nmf = new DecimalFormat("#,##0.00");

       String sval = nmf.format(val);

        String[] sv1 = sval.split("\\.");
        String[] sv2 = sv1[0].split(",");

        String ss = "";

        for(int i=0;i<sv2.length;i++)
        {
            double d = Double.parseDouble(sv2[i]);
            if(d == 0 && i == sv2.length-1 && ss.length() > 0) ss = ss.substring(0,ss.length()-1) + "ი";
            if(d == 0)  continue;
            ss += get1000(d);
            if(i < sv2.length-1)    ss += " " + smore[sv2.length-i-2].substring(0,smore[sv2.length-i-2].length()-1) + " ";
        }
        return ss;
   }
   
   public String get1000(double val)
   {
       DecimalFormat nmf = new DecimalFormat("#,##0.00");
       String[] s10 = 
       {
           "ერთი","ორი","სამი","ოთხი","ხუთი","ექვსი","შვიდი","რვა","ცხრა","ათი",
           "თერთმეტი","თორმეტი","ცამეტი","თოთხმეტი","თხუთმეტი","თექვსმეტი","ჩვიდმეტი","თვრამეტი","ცხრამეტი"
       };

       String[] s100 = 
       {
           "ოცი","ორმოცი","სამოცი","ოთხმოცი"
       };

       String[] s1000 = 
       {
           "ასი","ორასი","სამასი","ოთხასი","ხუთასი","ექვსასი","შვიდასი","რვაასი","ცხრაასი"
       };

       String sval = nmf.format(val);
   
       String[] sv1 = sval.split("\\.");
       String snum = sv1[0];

       String ss = "";
       int n = 0;
       int nn = 0;
       if(snum.length() == 3)
       {
           int m = Integer.parseInt(snum.substring(0,1));
           ss = s1000[m-1].substring(0,s1000[m-1].length()-1);
           if(Integer.parseInt(snum.substring(1))>0)   ss += " ";
           n = Integer.parseInt(snum.substring(1))/20-1;
           if(n >= 0)   ss += s100[n].substring(0,s100[n].length()-1);
           nn = Integer.parseInt(snum.substring(1)) - 20*(n+1);
           if(nn > 0 && n >=0) ss += "და";
           if(nn > 0)   ss += s10[nn-1];
           else          ss += "ი";
       }
       else if(snum.length() == 2)
       {
           n = Integer.parseInt(snum)/20-1;
           if(n >= 0)   ss += s100[n].substring(0,s100[n].length()-1);
           nn = Integer.parseInt(snum) - 20*(n+1);
           if(nn > 0 && n >=0) ss += "და";
           if(nn > 0)   ss += s10[nn-1];
           else          ss += "ი";
       }
       else if(snum.length() == 1)
       {
           if(Integer.parseInt(snum) > 0)   ss += s10[Integer.parseInt(snum)-1];
           else                                            ss = "ნული";
       }
       return ss;
   }
   
public static void addImage(PdfStamper stamper,AcroFields form,String field,String fieldValue){
    try{
        
        java.util.List<AcroFields.FieldPosition> photograph = form.getFieldPositions(field);
        if(photograph!=null && photograph.size()>0){
        com.itextpdf.text.Rectangle rect= photograph.get(0).position;
        //if(StringUtils.isNotBlank(fieldValue)){
        com.itextpdf.text.Image img = com.itextpdf.text.Image.getInstance(fieldValue);
        //img.scaleToFit(rect.getWidth(), rect.getHeight());
        float scaler = 6.23f;
        img.scalePercent(scaler);
        //img.setBorder(2);
        img.setAbsolutePosition(
        photograph.get(0).position.getLeft() + (rect.getWidth() - img.getScaledWidth() )
        , photograph.get(0).position.getTop() - (rect.getHeight()));
        PdfContentByte cb = stamper.getOverContent((int)photograph.get(0).page);
        //cb.addImage(img);
        //}
        }
    }catch(Exception e){
        e.printStackTrace();
    }
}

public static PdfPTable getHeaderTable(int x, int y, com.itextpdf.text.Font font) {
        PdfPTable table = new PdfPTable(1);
        table.setTotalWidth(527);
        table.setLockedWidth(true);
        PdfPCell cell = new PdfPCell(new com.itextpdf.text.Phrase(new com.itextpdf.text.Chunk(String.format("%d of %d", x, y),font)));
        cell.setFixedHeight(20);
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setHorizontalAlignment(com.itextpdf.text.Phrase.ALIGN_RIGHT);
        table.addCell(cell);
        return table;
    }
%>
<%
String language = "en";
String fontname = "arial.ttf";
//if(language.equalsIgnoreCase("ka"))
    fontname = "sylfaen.ttf";
    
FolioBean folio = FolioManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("id")));
ReservationroomBean rroom = ReservationroomManager.getInstance().loadByPrimaryKey(folio.getReservationroomid());
RoomtypeBean rtp = RoomtypeManager.getInstance().loadByPrimaryKey(rroom.getRoomtypeid());
ReservationBean reserv = ReservationManager.getInstance().loadByPrimaryKey(rroom.getReservationid());
String roomname = rtp.getCode();
if(rroom.getRoomid() != null){
    RoomBean room = RoomManager.getInstance().loadByPrimaryKey(rroom.getRoomid());
    roomname = " - "+room.getName();
}
String guestname = "";
GuestBean guest = GuestManager.getInstance().loadByPrimaryKey(rroom.getGuestid());
SalutationBean slt = SalutationManager.getInstance().loadByPrimaryKey(guest.getSalutationid());
guestname = slt.getName()+" "+guest.getFname()+" "+guest.getLname();

String taname = "";
String companyname = "";
if(reserv.getTaid() != null){
    ContragentBean bs = ContragentManager.getInstance().loadByPrimaryKey(reserv.getTaid());
    taname = bs.getFname()+" "+bs.getLname();
}
if(reserv.getCompanyid()!= null){
    ContragentBean bs = ContragentManager.getInstance().loadByPrimaryKey(reserv.getCompanyid());
    companyname = bs.getName();
    if(companyname == null) companyname = "";
}

String pmethodname = "";
if(reserv.getPaymentmethodid() != null){
    PaymentmethodBean pm = PaymentmethodManager.getInstance().loadByPrimaryKey(reserv.getPaymentmethodid());
    pmethodname = pm.getName();
}

String nationality = "";
if(guest.getNationalityid() != null){
    NationalityBean nat = NationalityManager.getInstance().loadByPrimaryKey(guest.getNationalityid());
    nationality = nat.getName();
}

int child = rroom.getChild().intValue();
int adult = rroom.getAdult().intValue();
int tpax = child+adult;

RoomtypeBean roomtype = RoomtypeManager.getInstance().loadByPrimaryKey(rroom.getRoomtypeid());
String sroom = roomtype.getCode();
if(rroom.getRoomid() != null){
    RoomBean room = RoomManager.getInstance().loadByPrimaryKey(rroom.getRoomid());
    sroom = room.getName()+" "+sroom;
}

Calendar calarr = Calendar.getInstance();
calarr.setTime(reserv.getArraivaldate());
Calendar caldep = Calendar.getInstance();
caldep.setTime(reserv.getDeparturedate());
int days = DayDiff(calarr,caldep)+1;

String sql = "where folioid = "+folio.getFolioid();
sql += " and amount != 0 order by itemdate, (case when particular = 6 then 1 when particular = -1 then 2 when particular = 0 then 3 when particular = 1 then 4 when particular = 2 then 5 when particular = 4 then 6 when particular = 5 then 7 else 8 end)";
FolioitemBean[] items = FolioitemManager.getInstance().loadByWhere(sql);

double drate = 0;
if(items.length > 0)
    drate = items[0].getAmount().doubleValue();

RatetypeBean rttype = RatetypeManager.getInstance().loadByPrimaryKey(rroom.getRatetypeid());

String sbillto = "";
if(folio.getGuestid() != null){
    GuestBean gs = GuestManager.getInstance().loadByPrimaryKey(folio.getGuestid());
    SalutationBean sl = SalutationManager.getInstance().loadByPrimaryKey(gs.getSalutationid());
    sbillto = sl.getName()+" "+gs.getFname()+" "+gs.getLname();
} else if(folio.getContragentid() != null) {
    ContragentBean contr = ContragentManager.getInstance().loadByPrimaryKey(folio.getContragentid());
    sbillto = contr.getName();
}

CountryBean hotelcountry = CountryManager.getInstance().loadByPrimaryKey(hotel.getCountryid());

PersonnelBean reserveduser = PersonnelManager.getInstance().loadByPrimaryKey(reserv.getRegbyid());

String[] names = {
    "foliono",
    "reservationnumber",
    "date+time",
    "guestname",
    "travelagentline1",
    "companyname",
    "Paymentmethod",
    "nationality",
    "pax",
    "adalt",
    "child",
    "grcardno",
    "roomtype+number",
    "totalnights",
    "Arrivaldate",
    "departuredate",
    "Arrivaltime",
    "departuretime",
    "dailyrate",
    "currencysign",
    "ratetype",
    "Billto",
    "hoteladdress+zip",
    "hotelcity+country",
    "hotelaweb",
    "hotelfacebook",
    "hotelphome",
    "hotelemail",
    "Reserveduser",
    "checkinuser",
    "checkoutuser",
    "currentpage",
    "totalpage"
};

String[] values = {
    folio.getFolioid().toString(), 
    rroom.getReservationid().toString(), 
    dtlong.format(new Date()), 
    guestname, 
    taname, 
    companyname, 
    pmethodname, 
    nationality, 
    ""+tpax, 
    ""+adult, 
    ""+child,
    rroom.getReservationroomid().toString(),
    sroom,
    ""+days,
    dt.format(calarr.getTime()),
    dt.format(caldep.getTime()),
    dtime.format(calarr.getTime()),
    dtime.format(caldep.getTime()),
    dc.format(drate),
    maincurrency.getCode(),
    rttype.getName(),
    sbillto,
    hotel.getAddress1(),
    hotel.getZip()+", "+hotel.getCity(),    // + ", " + hotelcountry.getName(),
    hotel.getUrl(),
    hotel.getFax(),
    hotel.getPhone(),
    hotel.getEmail(),
    reserveduser.getFname()+" "+reserveduser.getLname(),
    reserveduser.getFname()+" "+reserveduser.getLname(),
    reserveduser.getFname()+" "+reserveduser.getLname(),
    "1",
    "1"
};

String[] headers = {"Date","Ref.No.","Description","Charges","Payment","Balance"};

String basedir = session.getServletContext().getRealPath("/");

float tinysize = 6;
float smallsize = 8;
float bigsize = 10;
float biggersize = 12;
float logosize = 16;

BaseFont utf = BaseFont.createFont(basedir+"/"+fontname, BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
com.itextpdf.text.Font biggerboldfont = new com.itextpdf.text.Font(utf, biggersize,com.itextpdf.text.Font.BOLD);

com.itextpdf.text.Font tfont = new com.itextpdf.text.Font(utf, tinysize);
com.itextpdf.text.Font tbfont = new com.itextpdf.text.Font(utf, tinysize,com.itextpdf.text.Font.BOLD);
com.itextpdf.text.Font font = new com.itextpdf.text.Font(utf, smallsize, com.itextpdf.text.Font.NORMAL,BaseColor.BLACK);
com.itextpdf.text.Font redfont = new com.itextpdf.text.Font(utf, smallsize,com.itextpdf.text.Font.NORMAL,BaseColor.RED);
com.itextpdf.text.Font wfont = new com.itextpdf.text.Font(utf, smallsize,com.itextpdf.text.Font.NORMAL,BaseColor.WHITE);
com.itextpdf.text.Font ifont = new com.itextpdf.text.Font(utf, smallsize,com.itextpdf.text.Font.ITALIC);
com.itextpdf.text.Font bfont = new com.itextpdf.text.Font(utf, smallsize,com.itextpdf.text.Font.BOLD);
com.itextpdf.text.Font bigfont = new com.itextpdf.text.Font(utf, bigsize);
com.itextpdf.text.Font bigbfont = new com.itextpdf.text.Font(utf, bigsize,com.itextpdf.text.Font.BOLD);
com.itextpdf.text.Font biggerfont = new com.itextpdf.text.Font(utf, biggersize);
com.itextpdf.text.Font logofont = new com.itextpdf.text.Font(utf, logosize, com.itextpdf.text.Font.BOLD, BaseColor.LIGHT_GRAY);

com.itextpdf.text.Font boldulfont = new com.itextpdf.text.Font(utf, bigsize, com.itextpdf.text.Font.BOLD | com.itextpdf.text.Font.UNDERLINE);

com.itextpdf.text.Font certfont = new com.itextpdf.text.Font(utf, bigsize,com.itextpdf.text.Font.BOLD,BaseColor.BLUE);
com.itextpdf.text.Font isofont = new com.itextpdf.text.Font(utf, bigsize,com.itextpdf.text.Font.BOLD,BaseColor.RED);
com.itextpdf.text.Font titlefont = new com.itextpdf.text.Font(utf, bigsize,com.itextpdf.text.Font.BOLD,BaseColor.BLACK);
com.itextpdf.text.Font pfont = new com.itextpdf.text.Font(utf, bigsize,com.itextpdf.text.Font.NORMAL,BaseColor.BLACK);

com.itextpdf.text.Chunk tab1 = new com.itextpdf.text.Chunk(new VerticalPositionMark(), 8, false);
com.itextpdf.text.Chunk tab2 = new com.itextpdf.text.Chunk(new VerticalPositionMark(), 4, false);

File fl = File.createTempFile("inv_", ".pdf", new File("/tmp"));
FileOutputStream fo = new FileOutputStream(fl);

PdfReader pdfTemplate = new PdfReader(basedir+"/templates/folioInvoice1.pdf");

PdfStamper stamper = new PdfStamper(pdfTemplate, fo);
stamper.setFormFlattening(true);

AcroFields form1 = stamper.getAcroFields();

PushbuttonField ad = form1.getNewPushbuttonFromField("hotellogo");
ad.setLayout(PushbuttonField.LAYOUT_ICON_ONLY);
ad.setProportionalIcon(true);
ad.setImage(com.itextpdf.text.Image.getInstance(basedir+"/logos/logo1.png"));
form1.replacePushbuttonField("hotellogo", ad.getField());
addImage(stamper,form1,"hotellogo",basedir+"/logos/logo1.png");
        
for(int i=0;i<names.length;i++){
    form1.setFieldProperty(names[i], "textfont", utf, null);
    form1.setField(names[i], values[i]);
}

stamper.close();
pdfTemplate.close();
fo.close();

pdfTemplate = new PdfReader(fl.getAbsolutePath());
ByteArrayOutputStream oout = new ByteArrayOutputStream();
stamper = new PdfStamper(pdfTemplate, oout);
stamper.setFormFlattening(true);
PdfImportedPage tpage = stamper.getImportedPage(pdfTemplate, 1);

float[] wds0 = {15.7f,13.2f,31.1f,13f,14f,12f};
int[] aligns = {
    com.itextpdf.text.Phrase.ALIGN_LEFT,
    com.itextpdf.text.Phrase.ALIGN_LEFT,
    com.itextpdf.text.Phrase.ALIGN_LEFT,
    com.itextpdf.text.Phrase.ALIGN_RIGHT,
    com.itextpdf.text.Phrase.ALIGN_RIGHT,
    com.itextpdf.text.Phrase.ALIGN_RIGHT
};

long datelong = 0;
if(items.length > 0)
    datelong = items[0].getItemdate().getTime();
double bal = 0;
double total = 0;
int maxrows = 22;
int cr = 0;
int pg = 1;
PdfPTable table = null;
double[] tots = new double[3];

for(int i=0;i<items.length;i++){
    
    if(cr == 0){
        table = new PdfPTable(wds0.length);
        table.setWidths(wds0);
        table.setTotalWidth(550);
        table.setLockedWidth(true);
        table.getDefaultCell().setFixedHeight(15);
        //table.getDefaultCell().setBorder(Rectangle.BOTTOM);
        for(int j=0;j<headers.length;j++){
            PdfPCell cell = new PdfPCell(new com.itextpdf.text.Phrase(new com.itextpdf.text.Chunk("  "+headers[j],bigbfont)));
            cell.setBorder(Rectangle.BOTTOM);
            cell.setHorizontalAlignment(aligns[j]);
            cell.setPaddingBottom(4);
            table.addCell(cell);
        }

    }
    
    
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
            pmethod = PaymentmethodManager.getInstance().loadByPrimaryKey(payment.getPaymentmethodid());
            particular = pmethod.getCode();
            koeff = -1;
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
    
    double amt = items[i].getAmount();
    double charges = 0;
    double payment = 0;
    double balance = 0;
    if(koeff < 0) payment = amt*koeff;
    else          charges = amt*koeff;
    balance = amt*koeff;
    bal += balance;
    total += balance;
    
    PdfPCell cell = null;
    
    String refno = (items[i].getRefno() != null) ? items[i].getRefno():items[i].getFolioitemid().toString();
    
    //System.out.println(i+" = "+n+" = "+amt);
    cell = new PdfPCell(new com.itextpdf.text.Phrase(new com.itextpdf.text.Chunk(dt.format(items[i].getItemdate()),font)));
    cell.setBorder(Rectangle.NO_BORDER);
    //cell.setBorderColorTop(new BaseColor(0, 0, 0));
    //cell.setBorderColorBottom(new BaseColor(0, 0, 0));
    //cell.setBorderColorLeft(new BaseColor(255, 255, 255));
    //cell.setBorderColorRight(new BaseColor(255, 255, 255));
    //cell.setBorderWidthTop(2f);
    cell.setHorizontalAlignment(com.itextpdf.text.Phrase.ALIGN_LEFT);
    cell.setPaddingBottom(2);
    table.addCell(cell);
    
    cell = new PdfPCell(new com.itextpdf.text.Phrase(new com.itextpdf.text.Chunk(refno,font)));
    //cell.setBorderColorTop(new BaseColor(0, 0, 0));
    //cell.setBorderColorBottom(new BaseColor(0, 0, 0));
    //cell.setBorderColorLeft(new BaseColor(255, 255, 255));
    //cell.setBorderColorRight(new BaseColor(255, 255, 255));
    //cell.setBorderWidthTop(2f);
    cell.setBorder(Rectangle.NO_BORDER);
    cell.setHorizontalAlignment(com.itextpdf.text.Phrase.ALIGN_LEFT);
    cell.setPaddingBottom(2);
    table.addCell(cell);
    
    cell = new PdfPCell(new com.itextpdf.text.Phrase(new com.itextpdf.text.Chunk(particular,font)));
    //cell.setBorderColorTop(new BaseColor(0, 0, 0));
    //cell.setBorderColorBottom(new BaseColor(0, 0, 0));
    //cell.setBorderColorLeft(new BaseColor(255, 255, 255));
    //cell.setBorderColorRight(new BaseColor(255, 255, 255));
    //cell.setBorderWidthTop(2f);
    cell.setBorder(Rectangle.NO_BORDER);
    cell.setHorizontalAlignment(com.itextpdf.text.Phrase.ALIGN_LEFT);
    cell.setPaddingBottom(2);
    table.addCell(cell);
    
    cell = new PdfPCell(new com.itextpdf.text.Phrase(new com.itextpdf.text.Chunk(dc.format(charges),font)));
    //cell.setBorderColorTop(new BaseColor(0, 0, 0));
    //cell.setBorderColorBottom(new BaseColor(0, 0, 0));
    //cell.setBorderColorLeft(new BaseColor(255, 255, 255));
    //cell.setBorderColorRight(new BaseColor(255, 255, 255));
    //cell.setBorderWidthTop(2f);
    cell.setBorder(Rectangle.NO_BORDER);
    cell.setHorizontalAlignment(com.itextpdf.text.Phrase.ALIGN_RIGHT);
    cell.setPaddingBottom(2);
    table.addCell(cell);
    
    cell = new PdfPCell(new com.itextpdf.text.Phrase(new com.itextpdf.text.Chunk(dc.format(payment),font)));
    //cell.setBorderColorTop(new BaseColor(0, 0, 0));
    //cell.setBorderColorBottom(new BaseColor(0, 0, 0));
    //cell.setBorderColorLeft(new BaseColor(255, 255, 255));
    //cell.setBorderColorRight(new BaseColor(255, 255, 255));
    //cell.setBorderWidthTop(2f);
    cell.setBorder(Rectangle.NO_BORDER);
    cell.setHorizontalAlignment(com.itextpdf.text.Phrase.ALIGN_RIGHT);
    cell.setPaddingBottom(2);
    table.addCell(cell);

    cell = new PdfPCell(new com.itextpdf.text.Phrase(new com.itextpdf.text.Chunk(dc.format(balance),font)));
    //cell.setBorderColorTop(new BaseColor(0, 0, 0));
    //cell.setBorderColorBottom(new BaseColor(0, 0, 0));
    //cell.setBorderColorLeft(new BaseColor(255, 255, 255));
    //cell.setBorderColorRight(new BaseColor(255, 255, 255));
    //cell.setBorderWidthTop(2f);
    cell.setBorder(Rectangle.NO_BORDER);
    cell.setHorizontalAlignment(com.itextpdf.text.Phrase.ALIGN_RIGHT);
    cell.setPaddingBottom(2);
    table.addCell(cell);
    cr++;
    
    tots[0] += charges;
    tots[1] += payment;
    tots[2] += balance;
    
    if((items.length > (i+1) && items[i+1].getItemdate().getTime() != datelong) || items.length == (i+1)){
        if(items.length > (i+1))   datelong = items[i+1].getItemdate().getTime();
        //pmt = 0;
        //chr = 0;
        cell = new PdfPCell(new com.itextpdf.text.Phrase(new com.itextpdf.text.Chunk("",bfont)));
        //cell.setBorderColorTop(new BaseColor(0, 0, 0));
        //cell.setBorderColorBottom(new BaseColor(0, 0, 0));
        //cell.setBorderColorLeft(new BaseColor(255, 255, 255));
        //cell.setBorderColorRight(new BaseColor(255, 255, 255));
        //cell.setBorderWidthTop(2f);
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setColspan(4);
        cell.setHorizontalAlignment(com.itextpdf.text.Phrase.ALIGN_RIGHT);
        cell.setPaddingBottom(2);
        table.addCell(cell);
        
        cell = new PdfPCell(new com.itextpdf.text.Phrase(new com.itextpdf.text.Chunk("Day Total",bfont)));
        //cell.setBorderColorTop(new BaseColor(0, 0, 0));
        //cell.setBorderColorBottom(new BaseColor(0, 0, 0));
        //cell.setBorderColorLeft(new BaseColor(255, 255, 255));
        //cell.setBorderColorRight(new BaseColor(255, 255, 255));
        //cell.setBorderWidthTop(2f);
        cell.setBorder(Rectangle.BOTTOM | Rectangle.TOP);
        cell.setHorizontalAlignment(com.itextpdf.text.Phrase.ALIGN_RIGHT);
        cell.setPaddingBottom(2);
        table.addCell(cell);
        
        cell = new PdfPCell(new com.itextpdf.text.Phrase(new com.itextpdf.text.Chunk(dc.format(bal),bfont)));
        //cell.setBorderColorTop(new BaseColor(0, 0, 0));
        //cell.setBorderColorBottom(new BaseColor(0, 0, 0));
        //cell.setBorderColorLeft(new BaseColor(255, 255, 255));
        //cell.setBorderColorRight(new BaseColor(255, 255, 255));
        //cell.setBorderWidthTop(2f);
        cell.setBorder(Rectangle.BOTTOM | Rectangle.TOP);
        cell.setHorizontalAlignment(com.itextpdf.text.Phrase.ALIGN_RIGHT);
        cell.setPaddingBottom(2);
        table.addCell(cell);
        
        cell = new PdfPCell(new com.itextpdf.text.Phrase(new com.itextpdf.text.Chunk(" ",font)));
        //cell.setBorderColorTop(new BaseColor(0, 0, 0));
        //cell.setBorderColorBottom(new BaseColor(0, 0, 0));
        //cell.setBorderColorLeft(new BaseColor(255, 255, 255));
        //cell.setBorderColorRight(new BaseColor(255, 255, 255));
        //cell.setBorderWidthTop(2f);
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setColspan(6);
        cell.setHorizontalAlignment(com.itextpdf.text.Phrase.ALIGN_RIGHT);
        cell.setPaddingBottom(2);
        table.addCell(cell);
        bal = 0;
        cr++;
        if(cr > maxrows || i == items.length-1){
            //break;
            table.writeSelectedRows(0, -1, 22, 590, stamper.getOverContent(pg));
            if(i < items.length-1){
                pg++;
                stamper.insertPage(pg, pdfTemplate.getPageSize(1));
                stamper.getUnderContent(pg).addTemplate(tpage, 0, 0);
                cr = 0;
            }
        }
    }
    
    
    }
 
table = new PdfPTable(wds0.length);
table.setWidths(wds0);
table.setTotalWidth(550);
table.setLockedWidth(true);
table.getDefaultCell().setFixedHeight(15);
PdfPCell cell = new PdfPCell(new com.itextpdf.text.Phrase(new com.itextpdf.text.Chunk("Grand Total:",bigbfont)));
cell.setBorder(Rectangle.BOTTOM | Rectangle.TOP);
cell.setHorizontalAlignment(com.itextpdf.text.Phrase.ALIGN_RIGHT);
cell.setPaddingBottom(2);
cell.setColspan(3);
table.addCell(cell);

for(int i=0;i<tots.length;i++){
    cell = new PdfPCell(new com.itextpdf.text.Phrase(new com.itextpdf.text.Chunk(dc.format(tots[i]),bigbfont)));
    cell.setBorder(Rectangle.BOTTOM | Rectangle.TOP);
    cell.setHorizontalAlignment(com.itextpdf.text.Phrase.ALIGN_RIGHT);
    cell.setPaddingBottom(2);
    table.addCell(cell);
}
cell = new PdfPCell(new com.itextpdf.text.Phrase(new com.itextpdf.text.Chunk(" ",font)));
cell.setBorder(Rectangle.BOTTOM | Rectangle.TOP);
cell.setHorizontalAlignment(com.itextpdf.text.Phrase.ALIGN_LEFT);
cell.setPaddingBottom(2);
table.addCell(cell);

table.writeSelectedRows(0, -1, 22, 200, stamper.getOverContent(pg));

float[] wds1 = {10f,40f,10,40f};
table = new PdfPTable(wds1.length);
table.setWidths(wds1);
table.setTotalWidth(550);
table.setLockedWidth(true);
table.getDefaultCell().setFixedHeight(15);

cell = new PdfPCell(new com.itextpdf.text.Phrase(new com.itextpdf.text.Chunk("Thank you for your stay with us. Please visit us again.",bigbfont)));
cell.setBorder(Rectangle.NO_BORDER);
cell.setHorizontalAlignment(com.itextpdf.text.Phrase.ALIGN_CENTER);
cell.setPaddingBottom(6);
cell.setColspan(4);
table.addCell(cell);

cell = new PdfPCell(new com.itextpdf.text.Phrase(new com.itextpdf.text.Chunk("ვეთანხმები, რომ ინვოისის მიხედვით გადასახდელი თანხა გადმოვა ჩემს პირად პასუხისმგებლობაში. იმ შემთხვევაში, თუ მითითებული პიროვნება ან კომპანია ვერ გადაიხდის მის ნაწილს ან მთლიან საფასურს.",ifont)));
cell.setBorder(Rectangle.BOTTOM | Rectangle.TOP);
cell.setHorizontalAlignment(com.itextpdf.text.Phrase.ALIGN_JUSTIFIED);
cell.setPaddingBottom(4);
cell.setPaddingRight(4);
cell.setColspan(2);
table.addCell(cell);
cell = new PdfPCell(new com.itextpdf.text.Phrase(new com.itextpdf.text.Chunk("I agree that my liability for this bill is not waived and agree to be held personally liable in the event that the indicated person, company or association fails to pay for any part or the full amount of these charges.",ifont)));
cell.setBorder(Rectangle.BOTTOM | Rectangle.TOP);
cell.setHorizontalAlignment(com.itextpdf.text.Phrase.ALIGN_JUSTIFIED);
cell.setPaddingBottom(4);
cell.setColspan(2);
cell.setPaddingLeft(4);
table.addCell(cell);

cell = new PdfPCell(new com.itextpdf.text.Phrase(new com.itextpdf.text.Chunk("Bill To:",bigbfont)));
cell.setBorder(Rectangle.NO_BORDER);
cell.setHorizontalAlignment(com.itextpdf.text.Phrase.ALIGN_LEFT);
cell.setPaddingBottom(10);
cell.setPaddingTop(10);
table.addCell(cell);
cell = new PdfPCell(new com.itextpdf.text.Phrase(new com.itextpdf.text.Chunk(sbillto,bigfont)));
cell.setBorder(Rectangle.NO_BORDER);
cell.setHorizontalAlignment(com.itextpdf.text.Phrase.ALIGN_LEFT);
cell.setPaddingBottom(10);
cell.setPaddingTop(10);
table.addCell(cell);

cell = new PdfPCell(new com.itextpdf.text.Phrase(new com.itextpdf.text.Chunk("Signature:",bigbfont)));
cell.setBorder(Rectangle.NO_BORDER);
cell.setHorizontalAlignment(com.itextpdf.text.Phrase.ALIGN_LEFT);
cell.setPaddingBottom(10);
cell.setPaddingTop(10);
table.addCell(cell);
cell = new PdfPCell(new com.itextpdf.text.Phrase(new com.itextpdf.text.Chunk("--------------------------------------------------",bigbfont)));
cell.setBorder(Rectangle.NO_BORDER);
cell.setHorizontalAlignment(com.itextpdf.text.Phrase.ALIGN_LEFT);
cell.setPaddingBottom(10);
cell.setPaddingTop(10);
table.addCell(cell);


table.writeSelectedRows(0, -1, 22, 180, stamper.getOverContent(pg));

for (int i = 1; i <= pg; i++) {
    getHeaderTable(i, pg, bigfont).writeSelectedRows(
            0, -1, 30, 46, stamper.getOverContent(i));
}



stamper.close();
pdfTemplate.close();



response.setContentType("application/pdf");
response.addHeader("Content-Disposition","filename=invoice_"+folio.getFolioid()+".pdf");
OutputStream oout0 = response.getOutputStream();
oout0.write(oout.toByteArray());
oout0.close();
%>