<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
String ids = request.getParameter("ids");
FolioitemBean[] folioitems = FolioitemManager.getInstance().loadByWhere("where folioitemid in ("+ids+")");
boolean canvoid = true;
long rid = 0;
for(int i=0;i<folioitems.length;i++){
    if(folioitems[i].getParticular().intValue() == 6 && folioitems[i].getRoomoper() == null){
        canvoid = false;
        break;
    }
    if(i == 0){
        FolioBean folio = FolioManager.getInstance().loadByPrimaryKey(folioitems[i].getFolioid());
        ReservationroomBean rroom = ReservationroomManager.getInstance().loadByPrimaryKey(folio.getReservationroomid());
        rid = rroom.getReservationroomid().longValue();
    }
}

if(!canvoid){
    %>
    <h1>ელდარ! ოთახის გადასახადის წაშლა შეუძლებელია!</h1>
    <%
} else {

ReasonBean[] reasons = ReasonManager.getInstance().loadByWhere("where reasoncategory = 4 order by name");

%>
<script>
    $("#vfirrname").hide();

    function chreason(){
        var id = Number($("#reasonid").val());
        //if(id == 0) $("#vfirrname").show();
        //else        $("#vfirrname").hide();
    }
    
    var addr = 0;
    function addreason(){
        if(addr == 0){
            $("#vfirrname").show();
            addr = 1;
            $("#addreasonicon").removeClass("glyphicon-plus");
            $("#addreasonicon").addClass("glyphicon-minus");
        } else {
            $("#vfirrname").hide();
            addr = 0;
            $("#addreasonicon").removeClass("glyphicon-minus");
            $("#addreasonicon").addClass("glyphicon-plus");
        }
    }
</script>
<input type="hidden" id="action" value="savevoidfolioitem.jsp?ids=<%=ids%>"/>
<input type="hidden" id="controls" value="reasonid,reasonname"/>
<input type="hidden" id="callbackurl" value="script:refreshFoliolist(<%=rid%>)"/>
<table width="100%" class="table table-borderless">
    <tr>
        <td>
            <select name='reasonid' id='reasonid' onchange="chreason()">
                <option value='0'>-- გაუქმების მიზეზი --</option>
                <%
                for(int i=0;i<reasons.length;i++){
                    %>
                    <option value='<%=reasons[i].getReasonid()%>'><%=reasons[i].getName()%></option>
                    <%
                }
                %>
            </select>
            <a id="addreasonicon" href="javascript:addreason();" class="glyphicon glyphicon-plus iconblack" style="text-decoration: none;" data-toggle="tooltip" title="ახალი მიზეზის დამატება"></a>
        </td>
    </tr>
    <tr id='vfirrname'>
        <td>
            <textarea name='reasonname' id='reasonname' cols='30' rows='3' placeholder="ახალი მიზეზი"></textarea>
        </td>
    </tr>
</table>
<%}%>