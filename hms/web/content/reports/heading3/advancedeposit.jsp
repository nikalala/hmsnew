<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../../../includes/init.jsp" %>

<link rel="stylesheet" type="text/css" href="css/grid-filter.css">

<script type="text/javascript">

  $(document).ready(function () {
    $('#reserv_dateTo').datepicker(<%=pickerFormatForDatePickers%>);
    $('#reserv_dateFrom').datepicker(<%=pickerFormatForDatePickers%>);
    loadDefaults();
  });

  function resetFilterPanel() {
    resetDates();
  }

  function doFilter(){
    loader.show();
    $.post("content/reports/content/advance-deposit-ledger.html",function(data){
      $("#grid-table").html(data);
      loader.hide();
    });
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

  function loadDefaults() {
    $("#grid-table .btn-group").css("width", "100%", "!important").css("padding-left", "0px").css("padding-right", "0px");
    $("#grid-table label").each(function () {
      $(this).css("float", "left", "!important");
      $(this).css("line-height", "27px", "!important");
    });
    $("#grid-table input").height(21);
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
        <label>From:</label>
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