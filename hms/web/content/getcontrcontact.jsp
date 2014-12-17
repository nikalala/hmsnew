<%@include file="../includes/init.jsp" %>

<%
    String where = (String) request.getParameter("contrid");
    String guest = (String) request.getParameter("guestid");
    if (where != null) {
        where = "where type = " + where;
        ContragentBean[] contragentBean = ContragentManager.getInstance().loadByWhere(where);
        for (int i = 0; i < contragentBean.length; i++) { %>
<option value="<%=contragentBean[i].getContragentid()%>"><%=contragentBean[i].getName()%>
</option>
<% }
} %>
<%
    if (guest != null) {
        GuestBean[] guestBeans = GuestManager.getInstance().loadByWhere("");
        for (int i = 0; i < guestBeans.length; i++) { %>
<option value="<%=guestBeans[i].getGuestid()%>"><%=guestBeans[i].getFname() + " " + guestBeans[i].getLname()%>
</option>
<% }
} %>