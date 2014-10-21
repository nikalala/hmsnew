<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="java.io.*"%>
<%@page import="com.mysoft.*"%>
<%@page import="com.mysoft.vf.*"%>
<%@page import="com.itextpdf.text.*" %>
<%@page import="com.itextpdf.text.pdf.*" %>
<%@page import="com.itextpdf.text.pdf.draw.*" %>
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
%>
<%
String basedir = session.getServletContext().getRealPath("/");

DecimalFormat dcf = new DecimalFormat("00000");
SimpleDateFormat sdt = new SimpleDateFormat("dd.MM.yyyy");

String sql = (String)session.getAttribute("SALARYPAYMENTLIST");

SalaryBean[] sals = SalaryManager.getInstance().loadByWhere(sql);

String[] header = {
    "კოდი","თანამშრომელი","გადახდის თარიღი","გადახდა თარიღისთვის","დანიშნულება","თანხა","შენიშვნა"
};
float[] wds1 = {10f,20f,10f,10f,20f,10f,20f};


float tinysize = 7;
float smallsize = 9;
float bigsize = 11;
float biggersize = 13;
float logosize = 17;

BaseFont utf = BaseFont.createFont(basedir+"/ARIALUNI.TTF", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
com.itextpdf.text.Font biggerboldfont = new com.itextpdf.text.Font(utf, biggersize,com.itextpdf.text.Font.BOLD);

com.itextpdf.text.Font tfont = new com.itextpdf.text.Font(utf, tinysize);
com.itextpdf.text.Font tbfont = new com.itextpdf.text.Font(utf, tinysize,com.itextpdf.text.Font.BOLD);
com.itextpdf.text.Font font = new com.itextpdf.text.Font(utf, smallsize, com.itextpdf.text.Font.NORMAL,BaseColor.BLACK);
com.itextpdf.text.Font redfont = new com.itextpdf.text.Font(utf, smallsize,com.itextpdf.text.Font.NORMAL,BaseColor.RED);
com.itextpdf.text.Font wfont = new com.itextpdf.text.Font(utf, smallsize,com.itextpdf.text.Font.NORMAL,BaseColor.WHITE);
com.itextpdf.text.Font ifont = new com.itextpdf.text.Font(utf, smallsize,com.itextpdf.text.Font.ITALIC);
com.itextpdf.text.Font bfont = new com.itextpdf.text.Font(utf, smallsize,com.itextpdf.text.Font.BOLD);
com.itextpdf.text.Font bigfont = new com.itextpdf.text.Font(utf, bigsize);
com.itextpdf.text.Font bbigfont = new com.itextpdf.text.Font(utf, bigsize,com.itextpdf.text.Font.BOLD);
com.itextpdf.text.Font biggerfont = new com.itextpdf.text.Font(utf, biggersize);
com.itextpdf.text.Font logofont = new com.itextpdf.text.Font(utf, logosize, com.itextpdf.text.Font.BOLD, BaseColor.LIGHT_GRAY);

com.itextpdf.text.Font boldulfont = new com.itextpdf.text.Font(utf, bigsize, com.itextpdf.text.Font.BOLD | com.itextpdf.text.Font.UNDERLINE);

com.itextpdf.text.Font certfont = new com.itextpdf.text.Font(utf, bigsize,com.itextpdf.text.Font.BOLD,BaseColor.BLUE);
com.itextpdf.text.Font isofont = new com.itextpdf.text.Font(utf, bigsize,com.itextpdf.text.Font.BOLD,BaseColor.RED);
com.itextpdf.text.Font titlefont = new com.itextpdf.text.Font(utf, bigsize,com.itextpdf.text.Font.BOLD,BaseColor.BLACK);
com.itextpdf.text.Font pfont = new com.itextpdf.text.Font(utf, bigsize,com.itextpdf.text.Font.NORMAL,BaseColor.BLACK);

com.itextpdf.text.Chunk tab1 = new com.itextpdf.text.Chunk(new VerticalPositionMark(), 8, false);
com.itextpdf.text.Chunk tab2 = new com.itextpdf.text.Chunk(new VerticalPositionMark(), 4, false);

File fl = File.createTempFile("act", ".pdf", new File("/tmp"));
OutputStream oout = new FileOutputStream(fl);   // response.getOutputStream();

com.itextpdf.text.Document document = new com.itextpdf.text.Document(com.itextpdf.text.PageSize.A4, 10, 10, 10, 10);
com.itextpdf.text.pdf.PdfWriter writer = com.itextpdf.text.pdf.PdfWriter.getInstance(document, oout);

document.open();

document.add(new com.itextpdf.text.Paragraph("\nხელფასის გადახდები\n\n\n\n",bbigfont));

PdfPTable table = new PdfPTable(wds1.length);
table.setWidths(wds1);
table.setWidthPercentage(100);

for(int i=0;i<header.length;i++){
    PdfPCell cell = new PdfPCell(new com.itextpdf.text.Phrase(new com.itextpdf.text.Chunk(header[i],bfont)));
    cell.setBorderColor(new BaseColor(0, 0, 0));
    //cell.setBackgroundColor(new BaseColor(146, 146, 146));
    cell.setPaddingBottom(10);
    cell.setHorizontalAlignment(com.itextpdf.text.Phrase.ALIGN_CENTER);
    table.addCell(cell);
}

double total = 0;
for(int i=0;i<sals.length;i++){
    PersonellBean pers = PersonellManager.getInstance().loadByPrimaryKey(sals[i].getPersonellid());
    PaytypeBean ptp = PaytypeManager.getInstance().loadByPrimaryKey(sals[i].getPaytypeid());
    DepartamentBean dept = DepartamentManager.getInstance().loadByPrimaryKey(pers.getDepartamentid());
    
    PdfPCell cell = new PdfPCell(new com.itextpdf.text.Phrase(new com.itextpdf.text.Chunk(dept.getCode()+"-"+pers.getCode(),font)));
    cell.setBorderColor(new BaseColor(0, 0, 0));
    //cell.setBackgroundColor(new BaseColor(146, 146, 146));
    cell.setPaddingBottom(5);
    cell.setHorizontalAlignment(com.itextpdf.text.Phrase.ALIGN_CENTER);
    table.addCell(cell);
    
    cell = new PdfPCell(new com.itextpdf.text.Phrase(new com.itextpdf.text.Chunk(pers.getFname()+" "+pers.getLname(),bfont)));
    cell.setBorderColor(new BaseColor(0, 0, 0));
    //cell.setBackgroundColor(new BaseColor(146, 146, 146));
    cell.setPaddingBottom(5);
    cell.setHorizontalAlignment(com.itextpdf.text.Phrase.ALIGN_LEFT);
    table.addCell(cell);

    cell = new PdfPCell(new com.itextpdf.text.Phrase(new com.itextpdf.text.Chunk(dt.format(sals[i].getPaydate()),font)));
    cell.setBorderColor(new BaseColor(0, 0, 0));
    //cell.setBackgroundColor(new BaseColor(146, 146, 146));
    cell.setPaddingBottom(5);
    cell.setHorizontalAlignment(com.itextpdf.text.Phrase.ALIGN_CENTER);
    table.addCell(cell);

    cell = new PdfPCell(new com.itextpdf.text.Phrase(new com.itextpdf.text.Chunk(dt.format(sals[i].getFordate()),font)));
    cell.setBorderColor(new BaseColor(0, 0, 0));
    //cell.setBackgroundColor(new BaseColor(146, 146, 146));
    cell.setPaddingBottom(5);
    cell.setHorizontalAlignment(com.itextpdf.text.Phrase.ALIGN_CENTER);
    table.addCell(cell);

    cell = new PdfPCell(new com.itextpdf.text.Phrase(new com.itextpdf.text.Chunk(ptp.getName(),font)));
    cell.setBorderColor(new BaseColor(0, 0, 0));
    //cell.setBackgroundColor(new BaseColor(146, 146, 146));
    cell.setPaddingBottom(5);
    cell.setHorizontalAlignment(com.itextpdf.text.Phrase.ALIGN_LEFT);
    table.addCell(cell);
    
    cell = new PdfPCell(new com.itextpdf.text.Phrase(new com.itextpdf.text.Chunk(dc.format(sals[i].getAmount()),font)));
    cell.setBorderColor(new BaseColor(0, 0, 0));
    //cell.setBackgroundColor(new BaseColor(146, 146, 146));
    cell.setPaddingBottom(5);
    cell.setHorizontalAlignment(com.itextpdf.text.Phrase.ALIGN_RIGHT);
    table.addCell(cell);
    
    cell = new PdfPCell(new com.itextpdf.text.Phrase(new com.itextpdf.text.Chunk(sals[i].getNote(),font)));
    cell.setBorderColor(new BaseColor(0, 0, 0));
    //cell.setBackgroundColor(new BaseColor(146, 146, 146));
    cell.setPaddingBottom(5);
    cell.setHorizontalAlignment(com.itextpdf.text.Phrase.ALIGN_LEFT);
    table.addCell(cell);

    total += sals[i].getAmount().doubleValue();

}
String tname = "სულ";

PdfPCell cell = new PdfPCell(new com.itextpdf.text.Phrase(new com.itextpdf.text.Chunk(tname,bfont)));
cell.setBorderColor(new BaseColor(0, 0, 0));
//cell.setBackgroundColor(new BaseColor(146, 146, 146));
cell.setPaddingBottom(5);
cell.setHorizontalAlignment(com.itextpdf.text.Phrase.ALIGN_CENTER);
cell.setColspan(5);
table.addCell(cell);

cell = new PdfPCell(new com.itextpdf.text.Phrase(new com.itextpdf.text.Chunk(dc.format(total),bfont)));
cell.setBorderColor(new BaseColor(0, 0, 0));
//cell.setBackgroundColor(new BaseColor(146, 146, 146));
cell.setPaddingBottom(5);
cell.setHorizontalAlignment(com.itextpdf.text.Phrase.ALIGN_RIGHT);
table.addCell(cell);

cell = new PdfPCell(new com.itextpdf.text.Phrase(new com.itextpdf.text.Chunk("",font)));
cell.setBorderColor(new BaseColor(0, 0, 0));
//cell.setBackgroundColor(new BaseColor(146, 146, 146));
cell.setPaddingBottom(5);
cell.setHorizontalAlignment(com.itextpdf.text.Phrase.ALIGN_LEFT);
table.addCell(cell);

document.add(table);

document.add(new com.itextpdf.text.Paragraph("\n"));

document.close();
//out.flush();
oout.close();

FileInputStream fi = new FileInputStream(fl);
byte[] b = new byte[fi.available()];
fi.read(b);
fi.close();

response.setContentType("application/pdf");
response.addHeader("Content-Disposition","filename=payment_list.pdf");
OutputStream ooout = response.getOutputStream();
ooout.write(b);
ooout.close();
%>
