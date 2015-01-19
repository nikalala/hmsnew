<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/xml;charset=utf-8" %>
<%@include file="../includes/initxml.jsp" %>

<rows>
    <%


        Connection con = Manager.getInstance().getConnection();
        String query = "SELECT gethotelstatusgrid('" + dclosedate + "')";
        System.out.println(query);
        ResultSet retVal = con.createStatement().executeQuery(query);
        if(retVal != null)
        {
            int size = retVal.getFetchSize();
            for(int u = 0; u < size; u++)
            {
                String item = new String(retVal.getBytes(u));
                System.out.println(item);

            }

        }
        Manager.getInstance().releaseConnection(con);


        for (int i = 0; i < 30; i++) {
            String color = "color='#FA1511'";
            if (i % 4 == 0) {
                color = "";
            }




    %>
    <row id='<%=i%>'>
        <cell>
            <![CDATA[<%=(i+1)*100%><a style="cursor:pointer;" onclick="blockunbloc(<%=(i+1)*100%>)">    <i style="font-size: 15px; margin-left:10px;" class="fa fa-lock"></i></a>]]></cell>
        <cell><![CDATA[Junior King Room]]></cell>
        <cell>
            <![CDATA[<div class="status-color" <%=color%> style="-webkit-border-radius: 3px;-moz-border-radius: 3px;border-radius: 3px;background-color:#FA1511; width:16px; margin-top: 1px; margin-right: 4px; height:16px; float:left;"></div><div style="float:left;">Dirty <i style="font-size: 15px; margin-left:10px;" class="fa fa-pencil"></i> <i style="font-size: 15px; margin-left:10px;" class="fa fa-times"></i></div> ]]></cell>
        <cell><![CDATA[Available]]></cell>
        <cell><![CDATA[<i style="font-size: 15px;  margin-left:10px;" class="fa fa-pencil"></i>]]></cell>
        <cell><![CDATA[<i style="font-size: 15px;  margin-left:10px;" class="fa fa-times"></i> ]]></cell>
    </row>
    <% } %>
</rows>

