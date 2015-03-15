<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<% RoomBean[] roomBeans = RoomManager.getInstance().loadByWhere("ORDER BY ord"); %>
<% RoomtypeBean[] roomTypes = RoomtypeManager.getInstance().loadByWhere("ORDER BY ord"); %>
<% ReservationtypeBean[] reservTypes = ReservationtypeManager.getInstance().loadByWhere(""); %>
<%  %>

<link rel="stylesheet" type="text/css" href="css/grid-filter.css">

<style>
  .pull-right table td {
    border-bottom: 0px !important;
    padding-top: 0px !important;
  }

  .pull-right table td:first-child {
    border-left: solid 1px slategrey;
  }
  .pull-right table td:nth-child(even) {
    border-right: solid 1px slategrey;
    text-align: left;
  }
  .pull-right input[type="checkbox"] {
    height: 13px;
    margin-left: 10px;
  }

  .pull-right{
    width : auto !important;
  }
</style>

<script type="text/javascript">

  var lastroomtypeId = 0;

  $(document).ready(function () {
    loadDefaults();
    drawFooter();
  });

  var page = searchresGrid.page;

  function getNextRecords() {
    page += 1;
    searchresGrid.limit = $("#limitselectbox").val();
    var items_per_page = searchresGrid.limit;
    var offset = (page - 1) * items_per_page;
    var limit = " LIMIT " + items_per_page + " OFFSET " + offset;
    var url = doFilter(true,limit);
    reloadGrid(searchresGrid.id, url);

  }

  function getPrevRecords() {
    page -= 1;
    if(page < 1){
      page = 1;
      return;
    }
    searchresGrid.limit = $("#limitselectbox").val();
    var items_per_page = searchresGrid.limit;
    var offset = (page - 1) * items_per_page;
    var limit = " LIMIT " + items_per_page + " OFFSET " + offset;
    var url = doFilter(true,limit);
    reloadGrid(searchresGrid.id, url);
  }

  $("#btnNext").click(function(){
    getNextRecords();
  });

  $("#btnPrev").click(function(){
    getPrevRecords();
  });

  $("#roomType").on('change', function () {
    var element = $("option:selected", this);
    var id = $(this).val();
    var selected = "";
    if (id > 0) {
      var html = "<option value='0'>-ოთახის #-</option>";
      <% for (int i = 0; i < roomBeans.length; i++) {%>
      var value = "<%=roomBeans[i].getRoomtypeid()%>";
      var roomid = "<%=roomBeans[i].getRoomid()%>";
      if (roomid == lastroomtypeId) {
        selected = 'selected="selected"';
      } else {
        selected = '';
      }
      if (id == value) {
        html +=
                "<option value='<%=roomBeans[i].getRoomid()%>' roomtypeid='<%=roomBeans[i].getRoomtypeid()%>' " + selected + "><%=roomBeans[i].getName()%>";
        html += "</option>";
      }
      <% } %>
    } else {
      var html = "<option value='0'>-ოთახის #-</option>";
      <% for (int i = 0; i < roomBeans.length; i++) {%>
      html += "<option value='<%=roomBeans[i].getRoomid()%>' roomtypeid='<%=roomBeans[i].getRoomtypeid()%>'><%=roomBeans[i].getName()%>";
      html += "</option>";
      <% }%>
    }
    selected = ""
    lastroomtypeId = 0;
    //console.log(html);
    $("#roomBean").html(html);
    $('#roomBean').selectpicker("refresh");
    $('#roomBean').next().css("width", "100%").css("padding-left", "0px");
    /**/
    /*$('#roomBean').change();*/
  });

  $("#roomBean").on('change', function () {
    var element = $("option:selected", this);
    var id = element.attr("roomtypeid");
    if (id > 0) {
      $("#roomType").val(id);
      lastroomtypeId = element.val();
      $('#roomType').change();
    } else {
      var html = "<option value='0' selected='selected'>-ოთახის ტიპი-</option>";
      <% for (int i = 0; i < roomTypes.length; i++) { %>
      html += "<option value='<%=roomTypes[i].getRoomtypeid()%>'><%=roomTypes[i].getName()%></option>";
      <% } %>
      $("#roomType").html(html);
      $('#roomType').selectpicker("refresh");
      $('#roomType').next().css("width", "100%").css("padding-left", "0px");

      var rooms = "<option value='0'>-ოთახის #-</option>";
      <% for (int i = 0; i < roomBeans.length; i++) {%>
      rooms += "<option value='<%=roomBeans[i].getRoomid()%>' roomtypeid='<%=roomBeans[i].getRoomtypeid()%>'><%=roomBeans[i].getName()%>";
      rooms += "</option>";
      <% }%>

      $("#roomBean").html(rooms);
      $('#roomBean').selectpicker("refresh");
      $('#roomBean').next().css("width", "100%").css("padding-left", "0px");
    }
  });

  $("#arrival").on('change',function(){
      initDates();
  });
  initDates();
  function initDates(){
    var checked = $("#arrival").prop('checked');
    if(!checked){
      $("#arrival_dateFrom, #arrival_dateTo").prop('disabled',true);
      $('.glyphicon-calendar').hide();
    }else{
      $("#arrival_dateFrom, #arrival_dateTo").prop('disabled',false);
      $('.glyphicon-calendar').show();
    }
  }

  function loadDefaults() {
    AddDays(7);
    searchresGrid.url = "content/gettrsearch.jsp?firstload=1&<%=URLDecoder.decode(request.getQueryString(), "UTF-8")%>";
    initializeGrid(searchresGrid);
     var limit = " LIMIT " + searchresGrid.limit + " OFFSET " + 0;
     searchresGrid.url = doFilter(true,limit);

    $('#grid-table .date').datepicker(<%=pickerFormatForDatePickers%>);
    $('#grid-table .dropdown').selectpicker();
    $("#grid-table .btn-group").css("width", "100%", "!important");
    $("#grid-table label").each(function () {
      $(this).css("float", "right", "!important");
      $(this).css("line-height", "27px", "!important");
    });
    $("#grid-table input").height(21);
    $("#filter-form input[type='text']").css("width", "100%", "!important");
    $("#grid-table .date input[type='text']").css("position", "relative");
    $("#roomBean").next().css("padding-left", "0");
    $("#roomType").next().css("padding-right", "0");

    $("#mobilenum, #resnum, #folionum, #vouchernum, #invoicenum").ForceNumericOnly();
  }

  function AddDays(arg) {

    $('#dateFrom').datepicker(<%=pickerFormatForDatePickers%>);
    $('#dateTo').datepicker(<%=pickerFormatForDatePickers%>);

    var today = new Date(<%=lclosedate%>);
    $("#dateFrom").datepicker("setDate", today);
    var tomorrow = new Date(<%=lclosedate%>);
    tomorrow.setDate(today.getDate() + arg);
    $("#dateTo").datepicker("setDate", tomorrow);
  }

  function doFilter(donotreload, limit) {

    var l = "";
    if (!isNullOrEmpty(limit)) {
      l = "&limit=" + limit;
    }
    var url = "content/gettrsearch.jsp?" + $("#filter-form").serialize() + l;
    console.log(url)
    reloadGrid(searchresGrid.id, url);
    return url;
  }

  function resetFilterPanel() {
    $("#filter-form :input").each(function () {
      $(this).val('');
    });
    //clean dropdowns
    $('#filter-form .dropdown option').removeAttr('selected');
    $("#filter-form .dropdown").change();
    $("#showMrooms").attr('checked', false);
    $("#showIncomplOrders").attr('checked', false);
    reInitialize();
    doFilter(false);
    AddDays(7);
  }

  function reInitialize() {
    $('#reservStatus').val(0);
    $('#reservStatus').change();
    $('#reserv_dateFrom').val('');
    $('#reserv_dateTo').val('');
  }

  reInitialize();

</script>
<form name="filter-form" id="filter-form">
  <table id="grid-table" class="first-table">
    <tr>
      <td>
        <div id="status_bar" class="first-status-bar" align='center'>
          <div style="width: 100%; float: left;">
            <span style="float: left; margin: 7px 0 0 10px;">ძიების კრიტერიუმები</span>
            <button type="button" class="btn btn-default" id="btnExport"
                    style=" display: none; border: 0; font-weight: bold; float: right; margin: 3px 5px 0 0;">
              ექსპორტი
            </button>
            <div class="btn-group pull-right" style="  margin: 2px 9px 0px 0px;  width: auto !important;  float: right !important;">

        
              <table style="width: 700px;">
                <tr>
                  <td><input type="checkbox" name="Reservation" checked></td>
                  <td>Reservation</td>
                  <td><input type="checkbox" name="InHouse" checked></td>
                  <td>In House</td>
                  <td><input type="checkbox" name="CheckedOut" checked></td>
                  <td>CheckedOut</td>
                  <td><input type="checkbox" name="Void" checked></td>
                  <td>Void</td>
                  <td><input type="checkbox" name="cancel" checked></td>
                  <td>Cancel</td>
                  <td><input type="checkbox" name="NoShow" checked></td>
                  <td>NoShow</td>
                </tr>
              </table>
              
            

            </div>
          </div>
        </div>
      </td>
    </tr>
    <tr>
      <td>
        <div style="width: 100%;float: left;">
          <div class="col-md-2">
            <input type="text" id="guestname" name="guestname" placeholder=" სტუმარი"/>
          </div>
          <div class="col-md-2">
            <input type="text" id="folionum" name="folionum" placeholder=" ფოლიოს #"/>
          </div>
          <div class="col-md-2">
            <input type="text" id="invoicenum" name="invoicenum" placeholder=" ინვოისის #"/>
          </div>
          <div class="col-md-1">
            <input type="checkbox" name="arrival" id="arrival" style="float: right;">
          </div>
          <div class="col-md-3">
            <div class="input-append date" id="dateFrom">
              <input type="text" class="span2 " name="arrival_dateFrom" id="arrival_dateFrom" placeholder=" თარიღიდან"
                     style="">
                    <span class="add-on"
                          style="position:absolute !important; right : 4px  !important;background : none  !important;border: none !important;top: 1px;">
                        <i class="glyphicon glyphicon-calendar"></i></span>
            </div>
          </div>
          <div class="col-md-3">
            <div class="input-append date" id="dateTo">
              <input type="text" class="span2 " name="arrival_dateTo" id="arrival_dateTo" placeholder=" თარიღამდე">
                    <span class="add-on"
                          style="position:absolute !important; right : 4px  !important;background : none  !important;border: none !important;top: 1px;">
                        <i class="glyphicon glyphicon-calendar"></i></span>
            </div>
          </div>
          <div class="col-md-3">
            <button type="button" class="btn btn-danger" style="width: 100%;" id="search_reserve_filer"
                    onclick="doFilter()"
                    style="width: 69px;">ძებნა
            </button>
          </div>
        </div>
        <div style="width: 100%;float: left; margin-top: 4px;">

          <div class="col-md-2">
            <input type="text" id="mobilenum" name="mobilenum" placeholder=" მობილური"/>
          </div>
          <div class="col-md-2">
            <input type="text" id="resnum" name="resnum" placeholder=" რეზ #"/>
          </div>
          <div class="col-md-2">
            <input type="text" id="vouchernum" name="vouchernum" placeholder=" ვაუჩერის #"/>
          </div>
          <div class="col-md-1">

          </div>

          <div class="col-md-3">
            <select class="dropdown col-md-2" name="roomBean" id="roomBean">
              <option value="0">-ოთახის #-</option>
              <% for (int i = 0; i < roomBeans.length; i++) { %>
              <option value="<%=roomBeans[i].getRoomid()%>"
                      roomtypeid="<%=roomBeans[i].getRoomtypeid()%>"><%=roomBeans[i].getName()%>
              </option>
              <% } %>
            </select>
          </div>
          <div class="col-md-3">
            <select class="dropdown col-md-2" name="roomType" id="roomType">
              <option value="0">-ოთახის ტიპი-</option>
              <% for (int i = 0; i < roomTypes.length; i++) { %>
              <option value="<%=roomTypes[i].getRoomtypeid()%>"><%=roomTypes[i].getName()%>
              </option>
              <% } %>
            </select>
          </div>
          <div class="col-md-3">
            <button type="button" class="btn btn-default" style="width: 100%;" id="cancel_reserve_filer"
                    onclick="resetFilterPanel()" data-dismiss="modal">გაუქმება
            </button>
          </div>
        </div>
      </td>
    </tr>
  </table>
  <table id="grid-table">
    <tr>
      <td>
        <table id='list_reservs' class="table-striped table-hover" align='center'></table>
      </td>
    </tr>
  </table>
</form>