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

%>
<%
Manager.getInstance().setJdbcDriver(getServletContext().getInitParameter("driver"));
Manager.getInstance().setJdbcUrl(getServletContext().getInitParameter("url"));
Manager.getInstance().setJdbcUsername(getServletContext().getInitParameter("user"));
Manager.getInstance().setJdbcPassword(getServletContext().getInitParameter("pass"));

ReservationroomBean rres = ReservationroomManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("id")));
ReservationBean res = ReservationManager.getInstance().loadByPrimaryKey(rres.getReservationid());
GuestBean guest = GuestManager.getInstance().loadByPrimaryKey(rres.getGuestid());
SalutationBean slt = SalutationManager.getInstance().loadByPrimaryKey(guest.getSalutationid());
CountryBean gcountry = CountryManager.getInstance().loadByPrimaryKey(guest.getCountryid());
IdtypeBean idtype = IdtypeManager.getInstance().loadByPrimaryKey(guest.getIdtypeid());
Calendar calarr = Calendar.getInstance();
calarr.setTime(res.getArraivaldate());
Calendar caldep = Calendar.getInstance();
caldep.setTime(res.getDeparturedate());
int days = DayDiff(calarr,caldep);
RoomtypeBean roomtype = RoomtypeManager.getInstance().loadByPrimaryKey(rres.getRoomtypeid());
String sroom = roomtype.getCode();
if(rres.getRoomid() != null){
    RoomBean room = RoomManager.getInstance().loadByPrimaryKey(rres.getRoomid());
    sroom = room.getName()+" "+sroom;
}
double[] rates = getRoomrateForStay(rres.getReservationroomid().longValue());
RatetypeBean rttype = RatetypeManager.getInstance().loadByPrimaryKey(rres.getRatetypeid());

double tot = rates[1]+rates[2]-rates[3]+rates[4];
double paid = getSum("select sum(amount) from payment where folioid in (select folioid from folio where reservationroomid = "+rres.getReservationroomid()+")");

String ptypes = "";
String pmethods = "";
PaymentBean[] pments = PaymentManager.getInstance().loadByWhere("where folioid in (select folioid from folio where reservationroomid = "+rres.getReservationroomid()+") order by paydate");
for(int i=0;i<pments.length;i++){
    PaymentmethodBean pmethod = PaymentmethodManager.getInstance().loadByPrimaryKey(pments[i].getPaymentmethodid());
    if(i > 0)   {
        ptypes += ", ";
        pmethods += ", ";
    }
    pmethods += pmethod.getName();
    ptypes += paymentmode[pmethod.getPaymentmode().intValue()];
}

String[] names = {
    "hotelname",                //  0
    "hoteladdress",             //  1
    "hotelphome",               //  2
    "hotelemail",               //  3
    "registrationcardnumber",   //  4
    "guestname",                //  5
    "guestphone",               //  6
    "guestmobile",              //  7
    "guestaddress",             //  8
    "guestemail",               //  9
    "guestfax",                 // 10
    "guestcity",                // 11
    "guestcountry",             // 12
    "guestidtype+idnumber",     // 13
    "company",                  // 14
    "bsource",                  // 15
    "arrivaldate",              // 16
    "departuredate",            // 17
    "totnights",                // 18
    "roomnumber+roomtype",      // 19
    "rateamountperday",         // 20
    "taxamountparday",          // 21
    "discountamountperday",     // 22
    "adjustmentperday",         // 23
    "netperday",                // 24
    "arrivaltime",              // 25
    "departuretime",            // 26
    "pax (a/c)",                // 27
    "ratetype",                 // 28
    "totalcharge+currencyshortcode",    // 29
    "depositpaid+currencyshortcode",    // 30
    "amountleft+currencyshortcode",     // 31
    "paymenttype",                      // 32
    "peymentmethod",                    // 33
    "printdate+time"                    // 34
};

String idtp = "";
if(idtype != null && idtype.getName() != null)
    idtp += idtype.getName()+" ";
idtp += guest.getIdn();

String[] values = {
    hotel.getName(),                                            //  0
    hotel.getAddress1(),                                        //  1
    hotel.getPhone(),                                           //  2
    hotel.getEmail(),                                           //  3
    rres.getReservationroomid().toString(),                     //  4
    slt.getName()+" "+ guest.getFname()+" "+guest.getLname(),   //  5
    guest.getPhone(),                                           //  6
    guest.getMobile(),                                          //  7
    guest.getAddress(),                                         //  8
    guest.getEmail(),                                           //  9
    guest.getFax(),                                             // 10
    guest.getCity(),                                            // 11
    gcountry.getName(),                                         // 12
    idtp,                        // 13
    "",                                                         // 14
    "",                                                         // 15
    dt.format(res.getArraivaldate()),                           // 16
    dt.format(res.getDeparturedate()),                          // 17
    String.valueOf(days),                                       // 18
    sroom,                                                      // 19
    dc.format(rates[1]/days),                                   // 20
    dc.format(rates[2]/days),                                   // 21
    dc.format(rates[3]/days),                                   // 22
    dc.format(rates[4]/days),                                   // 23
    dc.format(rates[0]/days),                                   // 24
    dtime.format(res.getArraivaldate()),                        // 25
    dtime.format(res.getDeparturedate()),                       // 26
    rres.getAdult()+"/"+rres.getChild(),                        // 27
    rttype.getName(),                                           // 28
    maincurrency.getCode()+" "+dc.format(tot),                  // 29
    maincurrency.getCode()+" "+dc.format(paid),                 // 30
    maincurrency.getCode()+" "+dc.format(tot-paid),             // 31
    ptypes,                                                     // 32
    pmethods,                                                   // 33
    dtlong.format(new Date())                                   // 34
};

String basedir = session.getServletContext().getRealPath("/");


float tinysize = 6;
float smallsize = 8;
float bigsize = 10;
float biggersize = 12;
float logosize = 16;

BaseFont utf = BaseFont.createFont(basedir+"/sylfaen.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
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

PdfReader pdfTemplate = new PdfReader(basedir+"/templates/Guest_Registration_Card.pdf");
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



/*
PdfContentByte content = stamper.getOverContent(pdfTemplate.getNumberOfPages());
com.itextpdf.text.Image img = com.itextpdf.text.Image.getInstance(basedir+"/logos/logo1.png");
float scaler = 6.23f;
img.scalePercent(scaler);
img.setAbsolutePosition(100,100);
content.addImage(img);
*/
for(int i=0;i<names.length;i++){
    form1.setFieldProperty(names[i], "textfont", utf, null);
    form1.setField(names[i], values[i]);
}

pdfTemplate.close();
stamper.close();


response.setContentType("application/pdf");
response.addHeader("Content-Disposition","filename=rrrr.pdf");
OutputStream oout0 = response.getOutputStream();
oout0.write(oout.toByteArray());
oout0.close();
%>