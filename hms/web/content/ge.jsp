<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/xml;charset=utf-8"%>
<%@include file="../includes/initxml.jsp"%>

<%
    String where = (String)request.getParameter("where");
    if(where == null)
    {
        where = "";
    }
    SimpleDateFormat resListDate = new SimpleDateFormat(arrdepdateformats[dff]);
    
    
int ipg = 1;
int ilmt = 10;
String pg = request.getParameter("page");
if(pg != null)  ipg = Integer.parseInt(pg);
String lmt = request.getParameter("rows");
if(lmt != null) ilmt = Integer.parseInt(lmt);
String sidx = request.getParameter("sidx");
if(sidx == null)    sidx = "";
String sord = request.getParameter("sord");
if(sord == null)    sord = "";
//int count = VReservationlistManager.getInstance().countWhere(where);
int total_pages = 0;
//if(count > 0)    total_pages = (int)(count/ilmt);
//if(total_pages*ilmt < count)    total_pages++;
if(ipg > total_pages) ipg=total_pages;
int start = ilmt*ipg - ilmt;
if(start < 0)   start = 0;
String limit = "limit "+ilmt+" offset "+start;
String order = "order by "+sidx+" "+sord;
    
    
    VReservationlistBean[] ReservationBeanList = VReservationlistManager.getInstance().loadByWhere(where+" "+order);
System.out.println("select * from v_reservationlist "+where+" "+order);
%>

<rows>
	<%--<page><%=ipg%></page>--%>
	<%--<total><%=total_pages%></total>--%>
	<%--<records><%=count%></records>--%>
	<%
        for(int u=0; u < 1; u++){
        for(int i=0;i< ReservationBeanList.length;i++){  %>
                <row id='<%=ReservationBeanList[i].getReservationid()%>'>
                    <cell><![CDATA[<%=ReservationBeanList[i].getReservationroomid()%>]]></cell>
                    <cell><![CDATA[<%=resListDate.format(ReservationBeanList[i].getArraivaldate())%>]]></cell>
                    <cell><![CDATA[<%=resListDate.format(ReservationBeanList[i].getDeparturedate())%>]]></cell>
                    <cell><![CDATA[<%=ReservationBeanList[i].getGuest()%>]]></cell>
                    <cell><![CDATA[<%=ReservationBeanList[i].getRoomcode()%> - <%=ReservationBeanList[i].getRoomtypecode()%> ]]></cell>
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
            <% }} %>
</rows>
