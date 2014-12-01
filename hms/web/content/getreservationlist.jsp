<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/xml;charset=utf-8" %>
<%@include file="../includes/initxml.jsp" %>

<%
    /*request.setCharacterEncoding("UTF-8");
    String where = (String) request.getParameter("where");
    if (where == null) {
        where = "";
    }*/

    request.setCharacterEncoding("UTF-8");
    String where = (String) request.getParameter("query");
    if (where == null || where.equals("0")) {
        where = "";
    } else {
        String strToSplit = request.getQueryString().substring(0, request.getQueryString().indexOf('&'));
        where = URLDecoder.decode(strToSplit, "UTF-8");
        where = where.replace("query=", "");
    }


    System.out.println(where);
    String bc = "";
    String room = "";






    SimpleDateFormat resListDate = new SimpleDateFormat(arrdepdateformats[dff]);
    VReservationlistBean[] ReservationBeanList = VReservationlistManager.getInstance().loadByWhere(where);
%>

<rows>
        <%--<page><%=ipg%></page>--%>
        <%--<total><%=total_pages%></total>--%>
        <%--<records><%=count%></records>--%>
    <%
        for (int i = 0; i < ReservationBeanList.length; i++) { %>
    <%
        int st = ReservationBeanList[i].getStatus();
        if (ReservationBeanList[i].getRoomcode() != null) {
            room = ReservationBeanList[i].getRoomcode() + " - ";
        }else{
            room = "";
        }
        switch (st) {
            case 0:
                bc = "background-color: rgb(77, 190, 24);";
                break;
            case 1:
                bc = "background-color: rgb(24, 57, 190);";
                break;
            case 2:
                bc = "background-color: rgb(236, 13, 174);";
                break;
            case 3:
                bc = "background-color: red; color:#FFF;";
                break;
        }
    %>
    <row id='<%=ReservationBeanList[i].getReservationid()%>'>
        <cell>
            <![CDATA[<div style="width: 50px; text-align:center; color:#FFF; <%=bc%>"><%=ReservationBeanList[i].getReservationroomid()%></div>]]></cell>
        <cell><![CDATA[<%=resListDate.format(ReservationBeanList[i].getArraivaldate())%>]]></cell>
        <cell><![CDATA[<%=resListDate.format(ReservationBeanList[i].getDeparturedate())%>]]></cell>
        <cell><![CDATA[<%=ReservationBeanList[i].getGuest()%>]]></cell>
        <cell>
            <![CDATA[<%=room%>
                    <%=ReservationBeanList[i].getRoomtypecode()%> ]]>
        </cell>
        <cell><![CDATA[<%=ReservationBeanList[i].getBsourcename()%>]]></cell>
        <cell><![CDATA[<%=ReservationBeanList[i].getCompanyname()%>]]></cell>
        <cell><![CDATA[<%=ReservationBeanList[i].getPrice()%>]]></cell>
        <cell><![CDATA[<%=ReservationBeanList[i].getPaid()%>]]></cell>
        <cell><![CDATA[<%=ReservationBeanList[i].getUser()%>]]></cell>
        <cell><![CDATA[<%=ReservationBeanList[i].getReservationtype()%>]]></cell>
        <cell>
            <![CDATA[
                        <div class="btn-group" style="position:absolute;margin-top: -14px;">
                           <button type="button" class="btn btn-default dropdown-toggle"
                              data-toggle="dropdown" id="actionBtn">
                             <i class="glyphicon glyphicon-chevron-right"></i>
                           </button>
                           <ul class="dropdown-menu" role="menu" style="margin-left: -220px;">
                                <li>
                                    <a onclick="addTab('content/EditTransaction.jsp?reservationroomid=<%=ReservationBeanList[i].getReservationroomid()%>','<span class=\'glyphicon glyphicon-saved\'></span>&nbsp;&nbsp;<%=ReservationBeanList[i].getReservationroomid()%> - DXR','TAB_EditTransaction_<%=ReservationBeanList[i].getReservationroomid()%>');"><img src="images/grid/edit.png"> რედაქირება </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <%if(st == 3){%>
                                    <a onclick="newmWindow1('void','რეზერვაციის წაშლის გაუქმება','act=1&rid=<%=ReservationBeanList[i].getReservationroomid()%>')"><img src="images/grid/delete.png"> რეზერვაციის წაშლის გაუქმება</a>
                                    <%} else {%>
                                    <a onclick="newmWindow1('void','რეზერვაციის წაშლა','rid=<%=ReservationBeanList[i].getReservationroomid()%>')"><img src="images/grid/delete.png"> რეზერვაციის წაშლა</a>
                                    <%}%>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="#"><img src="images/grid/bed_black.png"> დარჩენის ცვლილება</a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <%if(st == 1){%>
                                    <a onclick="newmWindow1('cancel','რეზერვაციის აღდგენა','act=1&rid=<%=ReservationBeanList[i].getReservationroomid()%>')"><img src="images/grid/calendar_delete.jpg"> აღდგენა</a>
                                    <%} else {%>
                                    <a onclick="newmWindow1('cancel','რეზერვაციის გაუქმება','rid=<%=ReservationBeanList[i].getReservationroomid()%>')"><img src="images/grid/calendar_delete.jpg"> გაუქმება</a>
                                    <%}%>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="#"><img src="images/grid/calendar_icon.jpg"> რეზერვაციის ტიპის შეცვლა</a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="#"><img src="images/grid/key.png"> ოთახის მინიჭება</a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="#"><img src="images/grid/list2.jpg"> რეზერვაციის კოპირება</a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="#"><img src="images/grid/print.png"> ვაუჩერის ამობეჭდვა</a>
                                </li>
                           </ul>
                        </div>
                        ]]>
        </cell>

    </row>
    <% } %>
</rows>
