<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/xml;charset=utf-8" %>
<%@include file="../includes/initxml.jsp" %>

<%
    String where = (String) request.getParameter("where");
    if (where == null) {
        where = "";
    }
    String room = "";
    SimpleDateFormat resListDate = new SimpleDateFormat(arrdepdateformats[dff]);
    VArrivallistBean[] ArrivalBeanList = VArrivallistManager.getInstance().loadByWhere(where);
%>


<rows>
          <%--  &lt;%&ndash;
                &lt;%&ndash;<page><%=ipg%></page>&ndash;%&gt;
                &lt;%&ndash;<total><%=total_pages%></total>&ndash;%&gt;
                &lt;%&ndash;<records><%=count%></records>&ndash;%&gt;
        &ndash;%&gt;--%>
            <%
                for (int i = 0; i < ArrivalBeanList.length; i++) { %>
            <%
                if (ArrivalBeanList[i].getRoomcode() != "null") {
                    room = ArrivalBeanList[i].getRoomcode() + " - ";
                }
            %>
            <row id='<%=ArrivalBeanList[i].getReservationid()%>'>
                <cell>
                    <![CDATA[<%=ArrivalBeanList[i].getReservationroomid()%>]]></cell>
                <cell><![CDATA[<%=resListDate.format(ArrivalBeanList[i].getArraivaldate())%>]]></cell>
                <cell><![CDATA[<%=resListDate.format(ArrivalBeanList[i].getDeparturedate())%>]]></cell>
                <cell><![CDATA[<%=ArrivalBeanList[i].getGuest()%>]]></cell>
                <cell>
                    <![CDATA[<%=room%>
                            <%=ArrivalBeanList[i].getRoomtypecode()%> ]]>
                </cell>
                <cell><![CDATA[<%=ArrivalBeanList[i].getBsourcename()%>]]></cell>
                <cell><![CDATA[<%=ArrivalBeanList[i].getCompanyname()%>]]></cell>
                <cell><![CDATA[<%=ArrivalBeanList[i].getAdult()%>]]></cell>
                <cell><![CDATA[<%=ArrivalBeanList[i].getChild()%>]]></cell>
                <cell><![CDATA[<%=ArrivalBeanList[i].getReservtype()%>]]></cell>
                <cell>
                    <![CDATA[
                                <div class="btn-group" style="position:absolute;margin-top: -14px;">
                                   <button type="button" class="btn btn-default dropdown-toggle"
                                      data-toggle="dropdown" id="actionBtn">
                                     <i class="glyphicon glyphicon-chevron-right"></i>
                                   </button>
                                   <ul class="dropdown-menu" role="menu" style="margin-left: -220px;">
                                        <li>
                                            <a href="#"><img src="images/grid/edit.png"> რედაქირება </a>
                                        </li>
                                        <li class="divider"></li>
                                        <li>
                                            <a href="#"><img src="images/grid/delete.png"> რეზერვაციის წაშლა</a>
                                        </li>
                                        <li class="divider"></li>
                                        <li>
                                            <a href="#"><img src="images/grid/bed_black.png"> დარჩენის ცვლილება</a>
                                        </li>
                                        <li class="divider"></li>
                                        <li>
                                            <a href="#"><img src="images/grid/calendar_delete.jpg"> გაუქმება</a>
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
