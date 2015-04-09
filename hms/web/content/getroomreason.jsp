<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
    request.setCharacterEncoding("UTF-8");
    String param = (String) request.getParameter("reasonid");
    if (!CodeHelpers.isNullOrEmpty(param)) {
        try {
            param = URLDecoder.decode(request.getQueryString(), "UTF-8");
            Manager.getInstance().beginTransaction();
            ReasonBean reasonBean = ReasonManager.getInstance().createReasonBean();
            reasonBean.setRegbyid(user.getPersonnelid());
            reasonBean.setActive(true);
            reasonBean.setReasoncategory(6);
            reasonBean.setName(param.replace("reasonid=",""));
            ReasonManager.getInstance().save(reasonBean);
            Manager.getInstance().endTransaction(true);
        } catch (Exception e) {
            e.printStackTrace();
            Manager.getInstance().endTransaction(false);
        }
    }

    ReasonBean[] reasonBeans = ReasonManager.getInstance().loadByWhere("where reasoncategory = 6 AND active = true AND deleted = false");

    for (int i = 0; i < reasonBeans.length; i++) { %>
    <option value="<%=reasonBeans[i].getReasonid()%>"><%=reasonBeans[i].getName()%></option>
    <% } %>