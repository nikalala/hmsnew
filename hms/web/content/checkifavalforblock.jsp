<%@include file="../includes/init.jsp" %>

<%
    request.setCharacterEncoding("UTF-8");
    String update = (String) request.getParameter("query");
    Connection con = Manager.getInstance().getConnection();
    ResultSet retVal = con.createStatement().executeQuery(update);
    while(retVal.next())
    {%>
    <%=retVal.getInt(1)%>
    <% } 
    retVal.close();
    Manager.getInstance().releaseConnection(con);    
%>


