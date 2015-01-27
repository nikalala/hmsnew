<%@include file="../includes/init.jsp" %>

<%
    request.setCharacterEncoding("UTF-8");
    String update = (String) request.getParameter("query");
    Connection con = Manager.getInstance().getConnection();
    ResultSet retVal = con.createStatement().executeQuery(update);
    Manager.getInstance().releaseConnection(con);

    while(retVal.next())
    {%>
    <%=retVal.getInt(1)%>
    <% } %>


