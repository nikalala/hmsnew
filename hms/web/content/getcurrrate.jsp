<%@include file="../includes/init.jsp" %>

<%
    request.setCharacterEncoding("UTF-8");
    String id = (String) request.getParameter("query");
    Connection con = Manager.getInstance().getConnection();

    CurrencyrateBean[] ratevalue = CurrencyrateManager.getInstance().loadByWhere("where currencyid = " + id + "  order by currencyrateid desc limit 1");

    Manager.getInstance().releaseConnection(con);
    System.out.println(ratevalue.length);
    if (ratevalue != null && ratevalue.length > 0 && ratevalue[0].getValue() != null) { %><%=ratevalue[0].getValue() %><% }else{ %> 0 <% } %>

