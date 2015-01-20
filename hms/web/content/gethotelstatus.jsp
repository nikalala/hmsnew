<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/xml;charset=utf-8" %>
<%@include file="../includes/initxml.jsp" %>

<rows>
    <%
        Manager.getInstance().beginTransaction();
        Connection con = Manager.getInstance().getConnection();

        java.sql.CallableStatement cntfnct = con.prepareCall("{ ? = call gethotelstatusgrid ( ? ) }");
        cntfnct.registerOutParameter(1, java.sql.Types.OTHER);
        cntfnct.setString(2, dclosedate.toString());
        cntfnct.execute();

        ResultSet rs = (ResultSet) cntfnct.getObject(1);

        if (rs != null) {
            while (rs.next()) {
                int hstatus = rs.getInt("hstatus");
                int rstatus = rs.getInt("rstatus");
                String roomst = "";
                if(rstatus != -2)
                {
                    roomst = roomstatus[rs.getInt("rstatus")];
                }
                String color = "style='background-color:" + CodeHelpers.getColorByRoomStatus(hstatus, hksb)+";'";
    %>
    <row id='<%=rs.getInt("roomid")%>_room'>
        <cell>
            <![CDATA[
                <%=rs.getString("roomname")%>
                <a style="cursor:pointer;" onclick="blockunbloc(<%=rs.getInt("roomid")%>)">
                    <i style="font-size: 15px; margin-left:10px;" class="fa fa-lock"></i>
                </a>
            ]]>
        </cell>
        <cell><![CDATA[<%=rs.getString("roomtype")%>]]></cell>
        <cell>
            <![CDATA[
                <div class="status-color" <%=color%>></div>
                <div style="float:left;">
                    <i style="font-size: 15px; margin-left:10px;" class="fa fa-pencil"></i>
                    <i style="font-size: 15px; margin-left:10px;" class="fa fa-times"></i>
                </div>
            ]]>
        </cell>
        <cell><![CDATA[<%=roomst%>]]></cell>
        <cell><![CDATA[<i style="font-size: 15px;  margin-left:10px;" class="fa fa-pencil"></i>]]></cell>
        <cell><![CDATA[<i style="font-size: 15px;  margin-left:10px;" class="fa fa-times"></i> ]]></cell>
    </row>
    <% }
    } %>

    <%
        Manager.getInstance().releaseConnection(con);
        Manager.getInstance().endTransaction(true);
    %>
</rows>

