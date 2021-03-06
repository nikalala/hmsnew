<%@ page import="javax.mail.internet.MimeUtility" %><?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/xml;charset=utf-8" %>
<%@include file="../includes/initxml.jsp" %>

<%
    request.setCharacterEncoding("UTF-8");
    String where = (String) request.getParameter("query");
    if (where == null) {
        return;
    } else {
        String strToSplit = request.getQueryString().substring(0, request.getQueryString().indexOf('&'));
        where = URLDecoder.decode(strToSplit, "UTF-8");
        where = where.replace("query=", "");
    }
    VContragentlistBean[] contragentlistBeans = VContragentlistManager.getInstance().loadByWhere(where);

%>
<rows>
    <%
        for (int i = 0; i < contragentlistBeans.length; i++) {
            String methodName = "";
            if(contragentlistBeans[i].getType().equals(1)){
                methodName = "addCompany(" + contragentlistBeans[i].getContragentid() + ")";
            }else{
                methodName = "addContr(" + contragentlistBeans[i].getContragentid() + ")";
            }
    %>
    <row id='<%=contragentlistBeans[i].getContragentid()%>'>
        <cell><![CDATA[<%=contragentlistBeans[i].getCompany()%>]]></cell>
        <cell><![CDATA[<%=contragentlistBeans[i].getContragent()%>]]></cell>
        <cell><![CDATA[<%=contragentlistBeans[i].getCity()%>]]></cell>
        <cell><![CDATA[<%=contragentlistBeans[i].getCountry()%>]]></cell>
        <cell><![CDATA[<%=contragentlistBeans[i].getPhone()%>]]></cell>
        <cell><![CDATA[<%=contragentlistBeans[i].getEmail()%> ]]></cell>
        <cell>
            <![CDATA[
             <a href="#" class="btn btn-xs btn-default" onclick="deleteSelectedGuest(<%=contragentlistBeans[i].getContragentid()%>)"><i class="fa fa-trash"></i></a>
             <a href="#" class="btn btn-xs btn-default" onclick="<%=methodName%>"><i class="fa fa-list"></i></a>
            ]]>
        </cell>
    </row>
    <% }%>
</rows>