<%@page contentType="application/pdf"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="java.io.*"%>
<%@page import="com.mysoft.*"%>
<%@page import="com.mysoft.hms.*"%>
<%@page import="javax.imageio.*"%>
<%@page import="java.awt.*"%>
<%@page import="java.awt.image.*"%>
<%@page import="com.itextpdf.text.*" %>
<%@page import="com.itextpdf.text.pdf.*" %>
<%@page import="com.itextpdf.text.pdf.draw.*" %>
<jsp:useBean id="user" scope="session" class="com.mysoft.hms.PersonnelBean"/>
<jsp:useBean id="hotel" scope="session" class="com.mysoft.hms.HotelBean"/>
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

public static PdfPTable getHeaderTable(int x, int y) {
        PdfPTable table = new PdfPTable(2);
        table.setTotalWidth(527);
        table.setLockedWidth(true);
        table.getDefaultCell().setFixedHeight(20);
        //table.getDefaultCell().setBorder(Rectangle.BOTTOM);
        table.addCell("FOOBAR FILMFESTIVAL");
        table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_RIGHT);
        table.addCell(String.format("Page %d of %d", x, y));
        return table;
    }
   
%>
<%
String language = "en";
String fontname = "arial.ttf";
if(language.equalsIgnoreCase("ka"))
    fontname = "sylfaen.ttf";
    
java.text.NumberFormat dc1 = new DecimalFormat("0.0");

Manager.getInstance().setJdbcDriver(getServletContext().getInitParameter("driver"));
Manager.getInstance().setJdbcUrl(getServletContext().getInitParameter("url"));
Manager.getInstance().setJdbcUsername(getServletContext().getInitParameter("user"));
Manager.getInstance().setJdbcPassword(getServletContext().getInitParameter("pass"));

FolioBean folio = FolioManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("id")));
ReservationroomBean rroom = ReservationroomManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("reservationroomid")));
RoomtypeBean rtp = RoomtypeManager.getInstance().loadByPrimaryKey(rroom.getRoomtypeid());
ReservationBean reserv = ReservationManager.getInstance().loadByPrimaryKey(rroom.getReservationid());
String roomname = rtp.getCode();
if(rroom.getRoomid() != null){
    RoomBean room = RoomManager.getInstance().loadByPrimaryKey(rroom.getRoomid());
    roomname = " - "+room.getName();
}
String sql = "where folioid = "+folio.getFolioid();
sql += " order by itemdate, (case when particular = 6 then 1 when particular = -1 then 2 when particular = 0 then 3 when particular = 1 then 4 when particular = 2 then 5 when particular = 4 then 6 when particular = 5 then 7 else 8 end)";
FolioitemBean[] items = FolioitemManager.getInstance().loadByWhere(sql);

String[] names = {"hotelname","hoteladdress","hotelphome","hotelemail","registrationcardnumber","guestname","guestphone","guestmobile",
"guestaddress","guestemail","guestfax","guestcity","guestcountry","guestidtype+idnumber","company","bsource","arrivaldate","departuredate",
"totnights","roomnumber+roomtype","rateamountperday","taxamountparday","discountamountperday","adjustmentperday","netperday",
"arrivaltime","departuretime","pax (a/c)","ratetype","totalcharge+currencyshortcode","depositpaid+currencyshortcode","amountleft+currencyshortcode",
"paymenttype","peymentmethod"};

String[] values = {
    hotel.getName(), hotel.getAddress1(), hotel.getPhone(), hotel.getEmail()
};

String[] headers = {"Date","Ref.No.","Particular","Charges","Payment","Balance"};

String basedir = session.getServletContext().getRealPath("/");

DecimalFormatSymbols dfs = new DecimalFormatSymbols(Locale.US);

SimpleDateFormat dt = new SimpleDateFormat("dd/MM/yyyy");
SimpleDateFormat df = new SimpleDateFormat("dd.MM.yyyy");
SimpleDateFormat sdf0 = new SimpleDateFormat("yyyy/MM/dd");
SimpleDateFormat dtlong = new SimpleDateFormat("dd/MM/yyyy HH:mm");
SimpleDateFormat dtime = new SimpleDateFormat("HH:mm");
SimpleDateFormat defcal = new SimpleDateFormat("[yyyy,MM,dd]");

java.text.NumberFormat dc = new DecimalFormat("0.00",dfs);
java.text.NumberFormat dcc = new DecimalFormat("0.0000",dfs);
java.text.NumberFormat dcl = new DecimalFormat("#,##0.00",dfs);
java.text.NumberFormat dcint = new DecimalFormat("0");
java.text.NumberFormat dclkb = new DecimalFormat("#,##0",dfs);
java.text.NumberFormat dclong = new DecimalFormat("#,##0.0000",dfs);

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
com.itextpdf.text.Font biggerfont = new com.itextpdf.text.Font(utf, biggersize);
com.itextpdf.text.Font logofont = new com.itextpdf.text.Font(utf, logosize, com.itextpdf.text.Font.BOLD, BaseColor.LIGHT_GRAY);

com.itextpdf.text.Font boldulfont = new com.itextpdf.text.Font(utf, bigsize, com.itextpdf.text.Font.BOLD | com.itextpdf.text.Font.UNDERLINE);

com.itextpdf.text.Font certfont = new com.itextpdf.text.Font(utf, bigsize,com.itextpdf.text.Font.BOLD,BaseColor.BLUE);
com.itextpdf.text.Font isofont = new com.itextpdf.text.Font(utf, bigsize,com.itextpdf.text.Font.BOLD,BaseColor.RED);
com.itextpdf.text.Font titlefont = new com.itextpdf.text.Font(utf, bigsize,com.itextpdf.text.Font.BOLD,BaseColor.BLACK);
com.itextpdf.text.Font pfont = new com.itextpdf.text.Font(utf, bigsize,com.itextpdf.text.Font.NORMAL,BaseColor.BLACK);

com.itextpdf.text.Chunk tab1 = new com.itextpdf.text.Chunk(new VerticalPositionMark(), 8, false);
com.itextpdf.text.Chunk tab2 = new com.itextpdf.text.Chunk(new VerticalPositionMark(), 4, false);

PdfReader pdfTemplate = new PdfReader(basedir+"/templates/folioInvoice.pdf");
ByteArrayOutputStream oout = new ByteArrayOutputStream();
PdfStamper stamper = new PdfStamper(pdfTemplate, oout);
stamper.setFormFlattening(true);

AcroFields form1 = stamper.getAcroFields();

PushbuttonField ad = form1.getNewPushbuttonFromField("hotellogo");
ad.setLayout(PushbuttonField.LAYOUT_ICON_ONLY);
ad.setProportionalIcon(true);
ad.setImage(com.itextpdf.text.Image.getInstance(basedir+"/logos/logo1.png"));
form1.replacePushbuttonField("hotellogo", ad.getField());
addImage(stamper,form1,"hotellogo",basedir+"/logos/logo1.png");
        
float[] wds0 = {15.7f,13.2f,31.1f,13f,14f,12f};
int[] aligns = {
    com.itextpdf.text.Phrase.ALIGN_LEFT,
    com.itextpdf.text.Phrase.ALIGN_LEFT,
    com.itextpdf.text.Phrase.ALIGN_LEFT,
    com.itextpdf.text.Phrase.ALIGN_RIGHT,
    com.itextpdf.text.Phrase.ALIGN_RIGHT,
    com.itextpdf.text.Phrase.ALIGN_RIGHT
};
PdfPTable table = new PdfPTable(wds0.length);
table.setWidths(wds0);
table.setTotalWidth(550);
table.setLockedWidth(true);
table.getDefaultCell().setFixedHeight(15);
//table.getDefaultCell().setBorder(Rectangle.BOTTOM);
for(int i=0;i<headers.length;i++){
    PdfPCell cell = new PdfPCell(new com.itextpdf.text.Phrase(new com.itextpdf.text.Chunk("  "+headers[i],bfont)));
    //cell.setBorderColorTop(new BaseColor(0, 0, 0));
    //cell.setBorderColorBottom(new BaseColor(0, 0, 0));
    //cell.setBorderColorLeft(new BaseColor(255, 255, 255));
    //cell.setBorderColorRight(new BaseColor(255, 255, 255));
    //cell.setBorderWidthTop(2f);
    cell.setHorizontalAlignment(aligns[i]);
    cell.setPaddingBottom(2);
    table.addCell(cell);
}

for(int i=0;i<items.length;i++){
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
    //System.out.println(i+" = "+n+" = "+amt);
    PdfPCell cell = new PdfPCell(new com.itextpdf.text.Phrase(new com.itextpdf.text.Chunk("  "+headers[i],bfont)));
    //cell.setBorderColorTop(new BaseColor(0, 0, 0));
    //cell.setBorderColorBottom(new BaseColor(0, 0, 0));
    //cell.setBorderColorLeft(new BaseColor(255, 255, 255));
    //cell.setBorderColorRight(new BaseColor(255, 255, 255));
    //cell.setBorderWidthTop(2f);
    cell.setHorizontalAlignment(aligns[i]);
    cell.setPaddingBottom(2);
    table.addCell(cell);
    }
        
table.writeSelectedRows(0, -1, 22, 590, stamper.getOverContent(1));

form1.setFieldProperty("hotelname", "textfont", utf, null);
form1.setFieldProperty("hoteladdress", "textfont", utf, null);
form1.setField("hotelname", hotel.getName());
form1.setField("hoteladdress", hotel.getAddress1());

form1.setField("hotelphone", hotel.getPhone());
form1.setField("hotelemail", hotel.getEmail());

stamper.close();
pdfTemplate.close();



response.setContentType("application/pdf");
response.addHeader("Content-Disposition","filename=rrrr.pdf");
OutputStream oout0 = response.getOutputStream();
oout0.write(oout.toByteArray());
oout0.close();
%>