<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%@page import="org.w3c.dom.CharacterData"%>
<%@page import="org.w3c.dom.Document"%>
<%@page import="org.w3c.dom.Element"%>
<%@page import="org.w3c.dom.Node"%>
<%@page import="org.w3c.dom.NodeList"%>
<%!
public String getElementValue(Element parent,String label)
    {
    return getCharacterDataFromElement((Element)parent.getElementsByTagName(label).item(0));
    }

public String getCharacterDataFromElement(Element e)
    {
    try {
        Node child = e.getFirstChild();
        if(child instanceof CharacterData)
            {
            CharacterData cd = (CharacterData) child;
            return cd.getData();
            }
        }catch(Exception ex) {}
    return " ";
    }

%>
<%
CurrencyBean[] crs = CurrencyManager.getInstance().loadByWhere("order by basic desc, code");
boolean done = false;
SimpleDateFormat stdt = new SimpleDateFormat("yyyy-MM-dd");
//double[] rates = new double[crs.length];
Calendar publishdate = Calendar.getInstance();
String[] desc=null;
try {
    DocumentBuilder builder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
    URL u = new URL("http://www.nbg.ge/rss.php");
    Document doc = builder.parse(u.openStream());
    String title;
    NodeList nodes = doc.getElementsByTagName("item");

    for(int i=0;i<nodes.getLength();i++)
        {
        Element element = (Element)nodes.item(i);
        publishdate.setTime(stdt.parse(getElementValue(element,"title").substring(15).trim()));
        desc=getElementValue(element,"description").split("<tr>");
        }

    for(int i=0;i<desc.length;i++)
        {
        for(int j=0;j<crs.length;j++)
            {
            if(desc[i].indexOf(crs[j].getCode().toUpperCase()) >= 0)
                {
                String[] lines = desc[i].split("\n");

                int pos1 = lines[2].indexOf(">");
                int pos2 = lines[2].indexOf("<",pos1+1);
                String nm = lines[2].substring(pos1+1,pos2);
                pos1 = nm.indexOf(" ");
                double rate0 = Double.parseDouble(nm.substring(0,pos1));
                pos1 = lines[3].indexOf(">");
                pos2 = lines[3].indexOf("<",pos1+1);
                double rate = Double.parseDouble(lines[3].substring(pos1+1,pos2))/rate0;

                RateBean rt = RateManager.getInstance().createRateBean();
                RateBean[] rts = RateManager.getInstance().loadByWhere("where currencyid = "+crs[j].getCurrencyid()+" and to_char(ratedate,'DD/MM/YYYY') = '"+dt.format(publishdate.getTime())+"' order by ratedate desc limit 1");
                if(rts.length > 0)  rt = RateManager.getInstance().loadByPrimaryKey(rts[0].getRateid());
                else
                    {
                    rt.setRatedate(publishdate.getTimeInMillis());
                    rt.setCurrencyid(crs[j].getCurrencyid());
                    }
                rt.setValue(rate);
                rt = RateManager.getInstance().save(rt);
                done = true;
                break;
                }
            }
        }
    }catch(Exception e)
    {
    e.printStackTrace();
    }
%>
<%=done%>
