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

FolioitemBean fi = FolioitemManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("id")));
FolioBean folio = FolioManager.getInstance().loadByPrimaryKey(fi.getFolioid());
ReservationroomBean rres = ReservationroomManager.getInstance().loadByPrimaryKey(folio.getReservationroomid());
ReservationBean res = ReservationManager.getInstance().loadByPrimaryKey(rres.getReservationid());
GuestBean guest = GuestManager.getInstance().loadByPrimaryKey(rres.getGuestid());
SalutationBean slt = SalutationManager.getInstance().loadByPrimaryKey(guest.getSalutationid());
PaymentBean payment = PaymentManager.getInstance().loadByPrimaryKey(fi.getPaymentid());
String pmethodname = "";
if(payment.getPaymentmethodid() != null){
    PaymentmethodBean pmethod = PaymentmethodManager.getInstance().loadByPrimaryKey(payment.getPaymentmethodid());
    pmethodname = pmethod.getName();
} else if(payment.getContracgentid() != null) {
    ContragentBean contragent = ContragentManager.getInstance().loadByPrimaryKey(payment.getContracgentid());
    pmethodname += (contragent.getFname() != null) ? contragent.getFname()+" ":"";
    pmethodname += (contragent.getLname() != null) ? contragent.getLname()+" ":"";
    pmethodname += (contragent.getName() != null) ? contragent.getName()+" ":"";
}
PersonnelBean pers = PersonnelManager.getInstance().loadByPrimaryKey(payment.getRegbyid());
CurrencyBean cr = CurrencyManager.getInstance().loadByPrimaryKey(payment.getCurrencyid());
RoomtypeBean roomtype = RoomtypeManager.getInstance().loadByPrimaryKey(rres.getRoomtypeid());
String sroom = roomtype.getCode();
if(rres.getRoomid() != null){
    RoomBean room = RoomManager.getInstance().loadByPrimaryKey(rres.getRoomid());
    sroom = room.getName()+" "+sroom;
}

String[] names = {
    "hotelname",                //  0
    "hoteladdress",             //  1
    "hotelphome",               //  2
    "hotelemail",               //  3
    "roomnumber+roomtype",      //  4
    "guestname",                //  5
    "paymentdate",              //  6
    "paymethod",                //  7
    "remark",                   //  8
    "receiptno",                //  9
    "foliono",                  // 10
    "enteredon",                // 11
    "amount",                   // 12
    "username"                  // 13
};

String[] values = {
    hotel.getName(),                                            //  0
    hotel.getAddress1(),                                        //  1
    hotel.getPhone(),                                           //  2
    hotel.getEmail(),                                           //  3
    sroom,                                                      //  4
    slt.getName()+" "+ guest.getFname()+" "+guest.getLname(),   //  5
    dt.format(payment.getPaydate()),                            //  6
    pmethodname,                                          //  7
    payment.getNote(),                                          //  8
    payment.getPaymentid().toString(),                          //  9
    folio.getNum(),                                             // 10
    "",                                                         // 11
    cr.getCode() +" "+dc.format(payment.getAmount()),           // 12
    pers.getFname()+" "+pers.getLname()                         // 13
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

PdfReader pdfTemplate = new PdfReader(basedir+"/templates/paymentreceipt.pdf");
ByteArrayOutputStream oout = new ByteArrayOutputStream();
PdfStamper stamper = new PdfStamper(pdfTemplate, oout);
stamper.setFormFlattening(true);




AcroFields form1 = stamper.getAcroFields();

PushbuttonField ad = form1.getNewPushbuttonFromField("hotellogo");
ad.setLayout(PushbuttonField.LAYOUT_ICON_ONLY);
ad.setProportionalIcon(true);
ad.setImage(com.itextpdf.text.Image.getInstance(basedir+"/logos/logo1.png"));
form1.replacePushbuttonField("hotellogo", ad.getField());

PushbuttonField ad1 = form1.getNewPushbuttonFromField("hotellogo1");
ad1.setLayout(PushbuttonField.LAYOUT_ICON_ONLY);
ad1.setProportionalIcon(true);
ad1.setImage(com.itextpdf.text.Image.getInstance(basedir+"/logos/logo1.png"));
form1.replacePushbuttonField("hotellogo1", ad1.getField());

addImage(stamper,form1,"hotellogo",basedir+"/logos/logo1.png");
addImage(stamper,form1,"hotellogo1",basedir+"/logos/logo1.png");

for(int i=0;i<names.length;i++){
    form1.setFieldProperty(names[i], "textfont", utf, null);
    form1.setField(names[i], values[i]);
    form1.setFieldProperty(names[i]+"1", "textfont", utf, null);
    form1.setField(names[i]+"1", values[i]);
}

stamper.close();
pdfTemplate.close();



response.setContentType("application/pdf");
response.addHeader("Content-Disposition","filename=rrrr.pdf");
OutputStream oout0 = response.getOutputStream();
oout0.write(oout.toByteArray());
oout0.close();
%>