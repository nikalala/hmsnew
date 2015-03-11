<%@page contentType="application/json; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/meta.jsp" %>

<%
    JSONObject obj = null;
    JSONArray array = new JSONArray();
    Manager.getInstance().beginTransaction();
    try {
        for (int i = 0; i < 10; i++) {
            obj = new JSONObject();
            obj.put("date", "2015-06-0" + i);
            obj.put("badge", true);
            obj.put("title", "16"+i);
            obj.put("body", "<p class='lead'>Information for this date</p><p>You can add <strong>html</strong> in this block</p>");
            obj.put("footer", i);
            array.add(obj);
        }
        Manager.getInstance().endTransaction(true);
    } catch (Exception e) {
        e.printStackTrace();
        Manager.getInstance().endTransaction(false);
    }
%>
<%=array%>