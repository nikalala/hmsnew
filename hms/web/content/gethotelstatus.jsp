<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/xml;charset=utf-8" %>
<%@include file="../includes/initxml.jsp" %>

<rows>
    <%
        Manager.getInstance().beginTransaction();
        Connection con = Manager.getInstance().getConnection();

        java.sql.CallableStatement cntfnct = con.prepareCall("{ ? = call gethotelstatusgrid ( ?,? ) }");
        cntfnct.registerOutParameter(1, java.sql.Types.OTHER);
        cntfnct.setString(2, df.format(dclosedate));
        cntfnct.setInt(3, 0);
        cntfnct.execute();

        ResultSet rs = (ResultSet) cntfnct.getObject(1);

        if (rs != null) {
            while (rs.next()) {
                int hstatus = rs.getInt("hstatus");
                int rstatus = rs.getInt("rstatus");
                String roomst = "";
                if (rstatus != -2) {
                    roomst = roomstatus[rs.getInt("rstatus")];
                }
                String colorName = CodeHelpers.getColorByRoomStatus(hstatus, hksb);
                String color = "style='background-color:" + colorName + ";'";
    %>

    <row id='<%=rs.getInt("roomid")%>_room'>

        <cell>
            <![CDATA[
                <%=rs.getString("roomname")%>
                <a style="cursor:pointer;" onclick="blockunbloc(<%=rs.getInt("roomid")%>)">
                    <i style="font-size: 15px; margin-left:10px;" class="fa fa-lock"></i>
                </a>
                <% if(rs.getInt("reservationid") > 0){%>
                <a style="cursor:pointer;" onclick="newWindowWithParams('setPreference','უპირატესობის მინიჭება','?reservationid=<%=rs.getInt("reservationid")%>')">
                    <i style="font-size: 15px; margin-left:10px;" class="fa fa-sun-o"></i>
                </a>
                <% } %>
            ]]>
        </cell>
        <cell><![CDATA[<%=rs.getString("roomtype")%>]]></cell>
        <cell>
            <![CDATA[
                <div class="status-color" color="<%=colorName%>" <%=color%>></div>
                <div style="float:left;">
                    <% if(!CodeHelpers.isNullOrEmpty(colorName)){ %><%=CodeHelpers.getCurrentHouseKeepingStatus(hstatus, hksb)%><% } %>
                    <i style="font-size: 15px; margin-left:10px;" onclick="updateselectedhs('<%=rs.getInt("roomid")%>_room',this)" class="fa fa-pencil"></i>
                    <% if(!CodeHelpers.isNullOrEmpty(colorName)){ %><i onclick="removeRoomStatus(<%=rs.getInt("roomid")%>,false)" style="font-size: 15px; margin-left:10px; color: red;" class="fa fa-times"></i><% } %>
                </div>
            ]]>
        </cell>
        <cell><![CDATA[<%=roomst%>]]></cell>
        <cell><![CDATA[ <div class="truncate"><%=CodeHelpers.ifIsNullOrEmptyReturnEmptryString(rs.getString("remark"))%></div> &nbsp; <i onclick="changeRemark(<%=rs.getInt("roomid")%>,'<%=rs.getString("remark")%>',false,this)" style="font-size: 15px;  margin-left:10px;" class="fa fa-pencil"></i>]]></cell>
        <cell><![CDATA[

                <%=CodeHelpers.ifIsNullOrEmptyReturnEmptryString(rs.getString("fname"))%> &nbsp; <%=CodeHelpers.ifIsNullOrEmptyReturnEmptryString(rs.getString("lname"))%> &nbsp; <i onclick="changeRoomKeeper(<%=rs.getInt("roomid")%>,this,false)" style="font-size: 15px;  margin-left:10px;" class="fa fa-pencil"></i>

                 <% if(!CodeHelpers.isNullOrEmpty(rs.getString("fname"))){ %>
                    <i onclick="removeRoomKeeper(<%=rs.getInt("roomid")%>,false)" style="font-size: 15px;  margin-left:10px;" class="fa fa-times"></i>
                <% } %>

                ]]></cell>
    </row>
    <% }
        rs.close();
    }

        java.sql.CallableStatement cntfnct1 = con.prepareCall("{ ? = call gethotelstatusgrid ( ?,? ) }");
        cntfnct1.registerOutParameter(1, java.sql.Types.OTHER);
        cntfnct1.setString(2, df.format(dclosedate));
        cntfnct1.setInt(3, 1);
        cntfnct1.execute();

        ResultSet rs1 = (ResultSet) cntfnct1.getObject(1);

        if (rs1 != null) {
            while (rs1.next()) {
                int hstatus = rs1.getInt("hstatus");
                String colorName = CodeHelpers.getColorByRoomStatus(hstatus, hksb);
                String color = "style='background-color:" + colorName + ";'"; %>

    <row id='<%=rs1.getInt("roomid")%>_house'>

        <cell>
            <![CDATA[
                <%=rs1.getString("roomname")%>
                <a style="cursor:pointer;" onclick="blockunbloc(<%=rs1.getInt("roomid")%>)">
                    <i style="font-size: 15px; margin-left:10px;" class="fa fa-lock"></i>
                </a>
            ]]>
        </cell>
        <cell><![CDATA[]]></cell>
        <cell>
            <![CDATA[
                <div class="status-color" color="<%=colorName%>" <%=color%>></div>
                <div style="float:left;">
                    <% if(!CodeHelpers.isNullOrEmpty(colorName)){ %><%=CodeHelpers.getCurrentHouseKeepingStatus(hstatus, hksb)%><% } %>
                    <i style="font-size: 15px; margin-left:10px;" onclick="updateselectedhs('<%=rs1.getInt("roomid")%>_house',this)" class="fa fa-pencil"></i>
                    <% if(!CodeHelpers.isNullOrEmpty(colorName)){ %><i onclick="removeRoomStatus(<%=rs1.getInt("roomid")%>,true)" style="font-size: 15px; margin-left:10px;color: red;" class="fa fa-times"></i><% } %>
                </div>
            ]]>
        </cell>
        <cell><![CDATA[]]></cell>
        <cell><![CDATA[ <div class="truncate"><%=CodeHelpers.ifIsNullOrEmptyReturnEmptryString(rs1.getString("remark"))%></div> &nbsp; <i onclick="changeRemark(<%=rs1.getInt("roomid")%>,'<%=rs1.getString("remark")%>',true,this)" style="font-size: 15px;  margin-left:10px;" class="fa fa-pencil"></i>]]></cell>
        <cell><![CDATA[

                <%=CodeHelpers.ifIsNullOrEmptyReturnEmptryString(rs1.getString("fname"))%> &nbsp; <%=CodeHelpers.ifIsNullOrEmptyReturnEmptryString(rs1.getString("lname"))%> &nbsp; <i onclick="changeRoomKeeper(<%=rs1.getInt("roomid")%>,this,true)" style="font-size: 15px;  margin-left:10px;" class="fa fa-pencil"></i>
                <% if(!CodeHelpers.isNullOrEmpty(rs1.getString("fname"))){ %>
                <i onclick="removeRoomKeeper(<%=rs1.getInt("roomid")%>,true)" style="font-size: 15px;  margin-left:10px;" class="fa fa-times"></i>
                <% } %>

                ]]></cell>

    </row>


    <%
            }
            rs1.close();
        }
        Manager.getInstance().releaseConnection(con);
        Manager.getInstance().endTransaction(true);
    %>
</rows>

