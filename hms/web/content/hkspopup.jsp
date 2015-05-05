<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<% PersonnelBean[] keepers = PersonnelManager.getInstance().loadByWhere("where personneltypeid = 2"); %>
<%

  String rromid = request.getParameter("rrid");
  ReservationroomBean rrb = ReservationroomManager.getInstance().loadByPrimaryKey(Long.valueOf(rromid));

  int roomid = rrb.getRoomid();
  RoomhstBean[] rhsb = RoomhstManager.getInstance().loadByWhere("where (roomid = 0 AND houseunitid = " + roomid + ") OR (houseunitid = 0 AND roomid = " + roomid + ")");



%>
<script type="text/javascript">

  $(document).ready(function () {
    $('.dropdown').selectpicker();
    $("#curr_table .btn-group").css("width", "100%");
    $("#curr_table input").height("27px", "!important");
    $("#curr_table input[type='text']").css("width", "100%", "!important");
    $(".currtxt").ForceNumericOnly();
    $("#curr_table").closest('#smbody').next().hide();
  });

  function saveStatus(){
    var sql = "?query=UPDATE roomhst SET personnelid = " + $("#changekeeper").val() + ", remark = N'" + $("#remarktxt").val() + "', housekeepingstatusid =  " + $("#changestatus").val() + ", closedate = '<%=df2.format(dclosedate)%>', regbyid = <%=user.getPersonnelid()%> where roomhstid = <%=rhsb[0].getRoomhstid()%>";

    $.post("content/execute.jsp" + sql, {}, function (data2) {
      reloadGrid(hsGrid.id, hsGrid.url);
      $("#dismissbutton").click();
      loader.hide();
    });
  }

</script>
<div>
  <table style="width: 278px; max-width: 278px; text-align: center;" id="curr_table" align="center">
    <tr>
      <td>
        <select id="changestatus" class="dropdown changestatus2" style="float: left; margin: 15px 10px 0 10px;">
          <%
            for (int i = 0; i < hksb.length; i++) {
              String  selected = hksb[i].getHousekeepingstatusid().equals(rhsb[0].getHousekeepingstatusid()) ? "selected='selected'" : "";
          %>
          <option value="<%=hksb[i].getHousekeepingstatusid()%>" <%=selected%>><%=hksb[i].getName()%></option>
          <% } %>
        </select>
      </td>
    </tr>
    <tr>
      <td>
        <textarea id="remarktxt" style="  width: 100%;  margin: 10px 0 10px 0;  height: 112px;"><%=rhsb[0].getRemark()%></textarea>
      </td>
    </tr>
    <tr>
      <td>
        <select id="changekeeper" class="dropdown changestatus3" style="float: left; margin: 15px 10px 0 10px;">
          <%
            for (int i = 0; i < keepers.length; i++) {
            String  selected = keepers[i].getPersonnelid().equals(rhsb[0].getPersonnelid()) ? "selected='selected'" : "";
          %>
          <option value="<%=keepers[i].getPersonnelid()%>" <%=selected%>><%=keepers[i].getFname() + " " + keepers[i].getLname()%>
          </option>
          <% } %>
        </select>
      </td>
    </tr>
  </table>
  <div class="modal-footer" style="margin-top: 10px;">
    <button type="button" class="btn btn-default" id="dismissbutton" data-dismiss="modal" onclick="this.click();">
      დახურვა
    </button>
    <button type="button" class="btn btn-primary" onclick="saveStatus()">შენახვა</button>
  </div>
</div>
