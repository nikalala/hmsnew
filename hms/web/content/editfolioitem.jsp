<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
FolioitemBean folioitem = FolioitemManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("folioitemid")));
FolioBean folio = FolioManager.getInstance().loadByPrimaryKey(folioitem.getFolioid());
ReservationroomBean rroom = ReservationroomManager.getInstance().loadByPrimaryKey(folio.getReservationroomid());
String ftype = "";
if(folioitem.getParticular().intValue() < 0)    ftype = "გადასახადი";
else                                            ftype = folioactiontype[folioitem.getParticular().intValue()];
PersonnelBean pers = PersonnelManager.getInstance().loadByPrimaryKey(folioitem.getRegbyid());
GuestBean guest = GuestManager.getInstance().loadByPrimaryKey(folio.getGuestid());
SalutationBean slt = SalutationManager.getInstance().loadByPrimaryKey(guest.getSalutationid());
String folioname = folio.getNum()+" - "+slt.getName()+" "+guest.getFname()+" "+guest.getLname();
%>
<input type="hidden" id="action" value="savefolioitem.jsp?folioitemid=<%=folioitem.getFolioitemid()%>"/>
<input type="hidden" id="controls" value="editfolioitem_amount,editfolioitem_note"/>
<input type="hidden" id="callbackurl" value="script:refreshFoliolist(<%=rroom.getReservationroomid()%>)"/>
<table width="100%" class="table table-borderless">
    <tr>
        <td><b>თარიღი</b></td>
        <td><%=dt.format(folioitem.getItemdate())%></td>
        <td rowspan="4"><b>აღწერა</b></td>
        <td valign="top" rowspan="4">
            <textarea id="editfolioitem_note" cols="20" rows ="5"><%=folioitem.getNote()%></textarea>
        </td>
    </tr>
    <tr>
        <td><b>ნომერი</b></td>
        <td><%=(folioitem.getRefno() != null) ? folioitem.getRefno():folioitem.getFolioitemid().toString()%></td>
    </tr>
    <tr>
        <td><b>ტიპი</b></td>
        <td><%=ftype%></td>
    </tr>
    <tr>
        <td><b>მომხმარებელი</b></td>
        <td><%=pers.getFname()+" "+pers.getLname()%></td>
    </tr>
    <tr>
        <td><b>ფოლიო</b></td>
        <td><%=folioname%></td>
        <td><b>თანხა</b></td>
        <td nowrap>
            <b><%=maincurrency.getCode()%></b><input type="text" id="editfolioitem_amount" size="18" value="<%=dc.format(folioitem.getAmount().doubleValue())%>">
        </td>
    </tr>
</table>
