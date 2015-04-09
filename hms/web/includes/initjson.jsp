<%@page contentType="application/json;charset=utf-8"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="java.net.*"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="javax.swing.text.*"%>
<%@page import="javax.swing.text.rtf.*"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="jxl.*"%>
<%@page import="jxl.write.*"%>
<%@page import="java.lang.reflect.*" %>
<%@page import="java.net.URL"%>
<%@page import="javax.xml.parsers.DocumentBuilder"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@page import="org.w3c.dom.CharacterData"%>
<%@page import="org.w3c.dom.Document"%>
<%@page import="org.w3c.dom.Element"%>
<%@page import="org.w3c.dom.Node"%>
<%@page import="org.w3c.dom.NodeList"%>
<%@page import="java.lang.*"%>
<%@page import="org.apache.commons.lang.*"%>
<%@page import="com.itextpdf.text.*" %>
<%@page import="com.itextpdf.text.pdf.*" %>
<%@page import="com.itextpdf.text.pdf.draw.*" %>
<%@page import="net.sf.json.*" %>
<%@page import="com.mysoft.*"%>
<%@page import="com.mysoft.hms.*"%>
<jsp:useBean id="user" scope="session" class="com.mysoft.hms.PersonnelBean"/>
<%!
public String eReg(String s)
{
    String ss = s;
    try {
    if(s == null)   ss = "";
//    else
//            ss = new String(s.getBytes("8859_1"), "UTF-8");
    //ss = ss.replaceAll("\"","&quot;");
    }catch(Exception ign){ss = "";}
    return ss;
}

public double getSum(String sql)
{
    double val = 0;
    Connection c = null;
    try 
    {
    c = Manager.getInstance().getConnection();
    ResultSet rs = c.createStatement().executeQuery(sql);
    if(rs.next())   val = rs.getDouble(1);
    rs.close();
    return val;
    }
    catch(Exception e){e.printStackTrace();}
    finally
    {
    Manager.getInstance().releaseConnection(c);
    }
    return val;
}

public double[] getSum(String sql,int num)
{
    double[] val = new double[num];
    Connection c = null;
    try
    {
    c = Manager.getInstance().getConnection();
    ResultSet rs = c.createStatement().executeQuery(sql);
    if(rs.next())
        {
        for(int i=0;i<num;i++)
            val[i] = rs.getDouble(i+1);
        }
    rs.close();
    return val;
    }
    catch(Exception e){e.printStackTrace();}
    finally
    {
    Manager.getInstance().releaseConnection(c);
    }
    return val;
}
%>
<%
String mand = "<font color=\"RED\">*</font>";
Manager.getInstance().setJdbcDriver(getServletContext().getInitParameter("driver"));
Manager.getInstance().setJdbcUrl(getServletContext().getInitParameter("url"));
Manager.getInstance().setJdbcUsername(getServletContext().getInitParameter("user"));
Manager.getInstance().setJdbcPassword(getServletContext().getInitParameter("pass"));

DecimalFormatSymbols dfs = new DecimalFormatSymbols(Locale.US);

SimpleDateFormat dtsmall = new SimpleDateFormat("dd/MM/yy");
SimpleDateFormat dt = new SimpleDateFormat("dd/MM/yyyy");
SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
SimpleDateFormat sdf0 = new SimpleDateFormat("yyyy/MM/dd");
SimpleDateFormat dtlong = new SimpleDateFormat("dd/MM/yyyy HH:mm");
SimpleDateFormat dtime = new SimpleDateFormat("HH:mm");
SimpleDateFormat defcal = new SimpleDateFormat("[yyyy,MM,dd]");

java.text.NumberFormat dc = new DecimalFormat("0.00",dfs);
java.text.NumberFormat dcc = new DecimalFormat("0.0000",dfs);
java.text.NumberFormat dcl = new DecimalFormat("#,##0.00",dfs);
java.text.NumberFormat dcint = new DecimalFormat("0");
java.text.NumberFormat dc1 = new DecimalFormat("0.0");
java.text.NumberFormat dclkb = new DecimalFormat("#,##0",dfs);
java.text.NumberFormat dclong = new DecimalFormat("#,##0.0000",dfs);

%>
