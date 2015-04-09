<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>
<div id="icondiv">
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
                String colorName = CodeHelpers.getColorByRoomStatus(hstatus, hksb);
    %>
    <div id="room_<%=rs.getInt("roomid")%>" class="roomclass" color="<%=colorName%>">
        <div style="bottom: 3px;  right: 6px;  position: absolute;" >
            <div class="truncate"><%=CodeHelpers.ifIsNullOrEmptyReturnEmptryString(rs.getString("guest"))%></div><br />
            <a style="cursor:pointer;" onclick="newsWindow1('blockunblock', 'ოთახის ბლოკირება', 'roomid=<%=rs.getInt("roomid")%>')"><i
                    style="font-size: 10px; "
                    class="fa fa-lock"></i></a><% if (rs.getInt("task") > 0) {%>
            <a style="cursor:pointer;"
               onclick="newWindowWithParams('setTask','დავალებები','?reservationid=<%=rs.getInt("task")%>&ishotelstatus=true')">
                <i style="font-size: 10px; " class="fa fa-wrench"></i></a>
            <% } %>
            <% if (rs.getInt("message") > 0) {%>
            <a style="cursor:pointer;"
               onclick="newWindowWithParams('setMessages','დავალებები','?reservationid=<%=rs.getInt("message")%>&ishotelstatus=true')"><i
                    style="font-size: 10px; " class="fa fa-envelope-o"></i></a>
            <% } %>
            <% if (rs.getInt("reservationid") > 0) {%>
            <a style="cursor:pointer;"
               onclick="newWindowWithParams('setPreference','უპირატესობის მინიჭება','?reservationid=<%=rs.getInt("reservationid")%>&ishotelstatus=true')">
                <i style="font-size: 10px; " class="fa fa-sun-o"></i>
            </a>

            <% } %>
        </div>
    </div>
    <% }
        rs.close();
    }
        Manager.getInstance().releaseConnection(con);
        Manager.getInstance().endTransaction(true); %>
</div>

