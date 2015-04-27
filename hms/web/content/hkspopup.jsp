<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<% PersonnelBean[] keepers = PersonnelManager.getInstance().loadByWhere("where personneltypeid = 2"); %>

<script type="text/javascript">

  $(document).ready(function () {
    $('.dropdown').selectpicker();
    $("#curr_table .btn-group").css("width", "100%");
    $("#curr_table input").height("27px", "!important");
    $("#curr_table input[type='text']").css("width", "100%", "!important");
    $(".currtxt").ForceNumericOnly();
    $("#curr_table").closest('#smbody').next().hide();
  });


</script>
<div>
  <table style="width: 278px; max-width: 278px; text-align: center;" id="curr_table" align="center">
    <tr>
      <td>
        <select id="changestatus" class="dropdown changestatus2" style="float: left; margin: 15px 10px 0 10px;">
          <% for (int i = 0; i < hksb.length; i++) { %>
          <option value="<%=hksb[i].getHousekeepingstatusid()%>"><%=hksb[i].getName()%>
          </option>
          <% } %>
        </select>
      </td>
    </tr>
    <tr>
      <td>
        <textarea id="remarktxt" style="  width: 100%;  margin: 10px 0 10px 0;  height: 112px;"></textarea>
      </td>
    </tr>
    <tr>
      <td>
        <select id="changekeeper" class="dropdown changestatus3" style="float: left; margin: 15px 10px 0 10px;">
          <% for (int i = 0; i < keepers.length; i++) { %>
          <option value="<%=keepers[i].getPersonnelid()%>"><%=keepers[i].getFname() + " " + keepers[i].getLname()%>
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
    <button type="button" class="btn btn-primary" onclick="SaveCurr()">შენახვა</button>
  </div>
</div>
