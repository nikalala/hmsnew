<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../../../includes/init.jsp" %>

<% RoomtypeBean[] roomTypes = RoomtypeManager.getInstance().loadByWhere("ORDER BY ord"); %>
<% PersonnelBean[] PersonellBeans = PersonnelManager.getInstance().loadByWhere(""); %>
<% RatetypeBean[] RatetypeBeans = RatetypeManager.getInstance().loadByWhere(""); %>
<% ContragentBean[] bSources = ContragentManager.getInstance().loadByWhere("where deleted = false and bsource = true"); %>
<% ContragentBean[] ContragentBeans = ContragentManager.getInstance().loadByWhere("where type = 2 and deleted = false"); %>


<link rel="stylesheet" type="text/css" href="css/grid-filter.css">

<script type="text/javascript">

  $(document).ready(function () {
    $('#reserv_dateTo').datepicker(<%=pickerFormatForDatePickers%>);
    $('#reserv_dateFrom').datepicker(<%=pickerFormatForDatePickers%>);
    loadDefaults();
  });

  function resetFilterPanel() {
    $("#filter-form :input").each(function () {
      console.log($(this).attr('id'))
      if ($(this).attr('id') !== "reserv_dateFrom" && $(this).attr('id') !== "reserv_dateTo") {
        $(this).val('');
      }
    });
    //clean dropdowns
    $('#filter-form .dropdown option').removeAttr('selected');
    $("#filter-form .dropdown").change();
    reInitialize();
  }

  function reInitialize() {
    $('#reservStatus').val(0);
    $('#reservStatus').change();
    resetDates();
  }

  $("#reserv_dateFrom").on('change', function () {
    var value = $(this).val();
    $("#reserv_dateTo").val(value);
  });

  function resetDates() {
    var today = new Date(<%=lclosedate%>);
    $("#reserv_dateTo").datepicker("setDate", today);
    $("#reserv_dateFrom").datepicker("setDate", today);
  }

  reInitialize();

  function loadDefaults() {
    $('#grid-table .dropdown').selectpicker();
    $("#grid-table .btn-group").css("width", "100%", "!important").css("padding-left", "0px").css("padding-right", "0px");
    $("#grid-table label").each(function () {
      $(this).css("float", "left", "!important");
      $(this).css("line-height", "27px", "!important");
    });
    $("#grid-table input").height($("#grid-table .btn-group").height() - 6, "!important");
    $("#filter-form input[type='text']").css("width", "100%", "!important");
    $("#grid-table .date input[type='text']").css("position", "relative");
    $("#grid-table #roomBean").next().css("padding-left", "0");
    $("#grid-table #roomType").next().css("padding-right", "0");
  }

</script>

<form name="filter-form" id="filter-form">
  <table id="grid-table" style="margin: 10px;">
    <tr>
      <td style="width: 150px;">
        <label>გაუქმების თარიღი:</label>
      </td>
      <td>
        <div class="input-append date">
          <input type="text" class="span2 " id="reserv_dateFrom" placeholder=" თარიღიდან">
                    <span class="add-on"
                          style="position:absolute !important; right : 4px  !important;background : none  !important;border: none !important;top: 1px;">
                        <i class="glyphicon glyphicon-calendar"></i></span>
        </div>
      </td>
      <td>
        <div class="input-append date">
          <input type="text" class="span2" id="reserv_dateTo" placeholder=" თარიღამდე">
                    <span class="add-on"
                          style="position:absolute !important; right : 4px  !important;background : none  !important;border: none !important;top: 1px;">
                        <i class="glyphicon glyphicon-calendar"></i></span>
        </div>
      </td>
    </tr>
    <tr>
      <td>
        <label>ოთახის ტიპი:</label>
      </td>
      <td colspan="2">
        <select class="dropdown col-md-2" id="roomType">
          <option value="0">-აირჩიეთ-</option>
          <% for (int i = 0; i < roomTypes.length; i++) { %>
          <option value="<%=roomTypes[i].getRoomtypeid()%>"><%=roomTypes[i].getName()%>
          </option>
          <% } %>
        </select>
      </td>
    </tr>
    <tr>
      <td>
        <label>ტარიფის ტიპი:</label>
      </td>
      <td colspan="2">
        <select class="dropdown col-md-2" id="RatetypeBeans">
          <option value="0">-აირჩიეთ-</option>
          <% for (int i = 0; i < RatetypeBeans.length; i++) { %>
          <option value="<%=RatetypeBeans[i].getRatetypeid()%>"><%=RatetypeBeans[i].getName()%>
          </option>
          <% } %>
        </select>
      </td>
    </tr>
    <tr>
      <td>
        <label>მომხმარებელი:</label>
      </td>
      <td colspan="2">
        <select class="dropdown" id="PersonellBeans">
          <option value="">-აირჩიეთ-</option>
          <% for (int i = 0; i <= PersonellBeans.length - 1; i++) { %>
          <option value="<%=PersonellBeans[i].getPersonnelid()%>"><%=PersonellBeans[i].getLoginid()%>
          </option>
          <% } %>
        </select>
      </td>
    </tr>
    <tr>
      <td>
        <label>ბიზნეს წყარო:</label>
      </td>
      <td colspan="2">
        <select class="dropdown" name="tagent" id="tagent">
          <option value="">-აირჩიეთ-</option>
          <% for (int i = 0; i <= bSources.length - 1; i++) { %>
          <option value="<%=bSources[i].getContragentid()%>"><%=bSources[i].getName()%>
          </option>
          <% } %>
        </select>
      </td>
    </tr>
    <tr>
      <td>
        <label>ტურისტული აგენტი:</label>
      </td>
      <td colspan="2">
        <select class="dropdown" id="bSources">
          <option value="">-აირჩიეთ-</option>
          <% for (int i = 0; i <= ContragentBeans.length - 1; i++) { %>
          <option value="<%=ContragentBeans[i].getContragentid()%>"><%=ContragentBeans[i].getName()%>
          </option>
          <% } %>
        </select>
      </td>
    </tr>
  </table>
  <div style="width: 100%;float: right; background-color: rgb(231, 231, 231);padding-right: 20px;height: 35px;">
    <button type="button" class="btn btn-default" style="margin-top: 5px; float: right; " id="showAllGuests"
            onclick="resetFilterPanel()">
      Reset
    </button>
    <button type="button" class="btn btn-danger" style="margin-top: 5px; margin-right: 7px; float: right;"
            id="search_reserve_filer"
            onclick="doFilter()"
            style="width: 69px;">ძებნა
    </button>
  </div>
</form>