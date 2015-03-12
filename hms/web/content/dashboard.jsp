<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<% RoomtypeBean[] roomTypes = RoomtypeManager.getInstance().loadByWhere("ORDER BY ord"); %>
<% RatetypeBean[] RatetypeBeans = RatetypeManager.getInstance().loadByWhere("where active = true and deleted = false"); %>
<% DiscountBean[] discountBeans = DiscountManager.getInstance().loadByWhere("where roomrate = true");%>
<% CurrencyBean[] currencyBeans = CurrencyManager.getInstance().loadByWhere("where basic = true");

  Calendar cal = Calendar.getInstance();
  cal.setTimeInMillis(lclosedate);
  int year = cal.get(Calendar.YEAR);
  int month = cal.get(Calendar.MONTH);

%>

<script src="js/zabuto_calendar.js"></script>

<script>
  function loadDefaults() {
    $('.q-main-div .dropdown').selectpicker();
    $(".q-main-div .btn-group").css("width", "100%", "!important").css("padding-left", "0px").css("padding-right", "0px");
    $(".q-main-div label").each(function () {
      $(this).css("float", "left", "!important");
      $(this).css("line-height", "27px", "!important");
    });
    $(".q-main-div input").height($(".q-main-div .btn-group").height() - 6, "!important");
    $(".q-main-div .date input[type='text']").css("position", "relative");
    $(".q-main-div #roomBean").next().css("padding-left", "0");
    $(".q-main-div #roomType").next().css("padding-right", "0");
    $("#valuenumbe").ForceNumericOnly();
  }
  $("#discount").on('change', function () {
    var element = $("option:selected", this);
    var openbal = element.attr("openbal");
    var openprice = element.attr("openprice");
    var perctype = element.attr("perctype");
    var basecurr = element.attr("basecurr");
    if (isNullOrEmpty($(this).val())) {
      $("#disc-first, #disc-second").hide();
      return;
    } else {
      $("#disc-first, #disc-second").show();
    }
    if (openbal === "true") {
      $("#valuenumbe").prop('disabled', false);
      $("#valuenumbe").html("");
      $("#valuenumbe").val("");
    } else {
      $("#valuenumbe").val(openprice);
      $("#valuenumbe").attr('disabled', true);
    }
    console.log("perctype = " + perctype)
    if(perctype === "true"){
      $("#maincurr").html("%");
    }else{
      $("#maincurr").html(basecurr);
    }

  });
  $(document).ready(function(){
    loadDefaults();
  });
</script>
<link rel="stylesheet" type="text/css" href="css/zabuto_calendar.css">

<style>

  #maincurr{
    margin-left: 4px;
    font-weight: bold;
  }

  .q-main-div {
    float: left;
    margin: 7px 0 0 0px;
    color: #46A9FF;
    width: 100%;
  }

  .q-statusbar-div {
    width: 100%;
    float: left;
    border-bottom: solid 1px #A1ACB2;
    margin-bottom: 4px;
    font-family: 'bgmtavr';
  }

  .q-statusbar-span {
    float: left;
    margin: 11px 0 0 10px;
  }

  .q-table-div {
    background: #fff;
    border: solid 1px #DADADA;
    height: 220px;
    color: #545454;
  }

  .t-s-table {
    width: 100%;
    margin: 6px 0 0 0;
    font-family: BaseFont;
    color: #646464;
  }

  .t-s-table td span {
    padding-left: 20px;
  }

  .t-s-table td {
    height: 20px;
  }

  .t-s-table tr:last-child > td {
    height: 26px;
    vertical-align: middle;
  }

  .t-s-table tr:last-child {
    height: 26px;
    vertical-align: middle;
  }

  .t-s-table tr {
    border-bottom: solid 1px #E4E4E4;
  }

  .t-s-table tr:nth-child(even) {
    background: #E4E4E4;
  }

  .t-s-table td:last-child {
    text-align: right;
    padding-right: 10px;
  }

  .t-s-table tr th {
    height: 20px;
  }

  .t-s-table tr th:last-child {
    text-align: right;
    padding-right: 6px;
  }

  .q-s-dt {
    position: absolute;
    left: 107px;
    top: 1px;
    width: 24px;
    height: 24px;
    background: none !important;
    border: 0 !important;
  }

  .q-s-search {
    float: right;
    margin: 2px 14px 0px 0px;
    background-color: #eeeeee;
    border: 1px solid #ccc;
    padding: 6px;
    cursor: pointer;
  }

  .q-s-search:hover {
    background-color: #3A94DF;
    border: solid 1px #fff;
    color: #fff;
  }

  .q-s-dt-box {
    position: relative;
    float: right;
    margin: 2px 4px 0px 0px;
  }

</style>

<div class="q-main-div">
  <div class="col-md-7">
    <div id="status_bar" class="first-status-bar" align='center'>
      <div class="q-statusbar-div">
        <span class="q-statusbar-span">Availability & Rate Chart</span>
      </div>
      <div class="q-table-div">
      </div>
    </div>
  </div>
  <div class="col-md-4">
    <div id="status_bar" class="first-status-bar" align='center'>
      <div class="q-statusbar-div">
        <span class="q-statusbar-span">ფოლიო</span>
      </div>
    </div>
    <div class="q-table-div">

    </div>
  </div>
  <div class="col-md-5">
    <div id="status_bar" class="first-status-bar" align='center'>
      <div class="q-statusbar-div">
        <span class="q-statusbar-span">ფოლიო</span>
      </div>
    </div>
    <div class="q-table-div">

    </div>
  </div>
</div>

<div class="q-main-div">
  <div class="col-md-9">
    <div id="status_bar" class="first-status-bar" align='center'>
      <div class="q-statusbar-div">
        <span class="q-statusbar-span">Availability & Rate Chart</span>
      </div>
      <div class="q-table-div" style="height : 100px;">
        <table style="width: 98%; text-align: right;">
          <tr>
            <td style="padding-right: 10px;">
              ოთახის ტიპი
            </td>
            <td>
              <select class="dropdown col-md-2" name="roomType" id="roomType">
                <option value="0">-აირჩიეთ-</option>
                <% for (int i = 0; i < roomTypes.length; i++) { %>
                <option value="<%=roomTypes[i].getRoomtypeid()%>"><%=roomTypes[i].getName()%>
                </option>
                <% } %>
              </select>
            </td>
            <td style="padding-right: 10px;">
              ტარიფის ტიპი
            </td>
            <td>
              <select class="dropdown col-md-2" name="RatetypeBeans" id="RatetypeBeans">
                <option value="0">-აირჩიეთ-</option>
                <% for (int i = 0; i < RatetypeBeans.length; i++) { %>
                <option value="<%=RatetypeBeans[i].getRatetypeid()%>"><%=RatetypeBeans[i].getName()%>
                </option>
                <% } %>
              </select>
            </td>
            <td>
              <input type="text" name="adult" id="adult" style="width: 30px;  font-size: 9px;" placeholder="უფ" />
            </td>
            <td>
              <input type="text" name="child" id="child" style="width: 30px;  font-size: 9px;" placeholder="ბა" />
            </td>
          </tr>
          <tr><td colspan="6" style="height: 5px;"></td></tr>
          <tr>
            <td style="padding-right: 10px;">
              ფასდაკლება
            </td>
            <td>
              <table>
                <tr>
                  <td>
                    <select name="discountbean" id="discount" class="dropdown">
                      <option value="">--აირჩიეთ--</option>
                      <% for (DiscountBean item : discountBeans) { %>
                      <option value="<%=item.getDiscountid()%>" openbal="<%=item.getOpen()%>" perctype="<%=item.getPerctype()%>" basecurr="<%=currencyBeans[0].getCode()%>"
                              openprice="<%=item.getVal()%>"><%=item.getName()%>
                      </option>
                      <% } %>
                    </select>
                  </td>
                  <td id="disc-second" style="display: none;">
                    <input type="text" id="valuenumbe" name="valuenumbe" style="margin-left: 10px;  width: 40px;"/>
                  </td>
                  <td>
                    <span id="maincurr"></span>
                  </td>
                </tr>
              </table>
            </td>
            <td style="padding-right: 10px;">
              შეიცავს Tax
            </td>
            <td style="padding-right: 10px; text-align: left;">
              <input type="checkbox" name="tax" id="tax" />
            </td>
            <td style="padding-right: 10px;" colspan="2">
              <input type="button" name="go" id="go" value="Go!" />
            </td>
          </tr>
        </table>
      </div>
      <div class="q-table-div" style="height : 347px;">
        <div id="dash-calendar"></div>
      </div>
    </div>
  </div>
  <div class="col-md-7">
    <div id="status_bar" class="first-status-bar" align='center'>
      <div class="q-statusbar-div">
        <span class="q-statusbar-span">ფოლიო</span>
      </div>
    </div>
    <div class="q-table-div" style="height: 270px;">

    </div>
    <br>
    <div id="status_bar" class="first-status-bar" align='center'>
      <div class="q-statusbar-div">
        <span class="q-statusbar-span">სწრაფი ოპერაციები</span>
      </div>
    </div>
    <div class="q-table-div" style="height: 164px;">

    </div>
  </div>
</div>




<script type="application/javascript">
  $(document).ready(function () {
    $("#dash-calendar").zabuto_calendar({
      language : "ge",
      year : <%=year%>,
      month : <%=month%>,
      show_previous : 0,
      /* show_next : 2,*/
      // show_reminder: true,
      // show_today: false,
      // show_days: true,
      // weekstartson: 0,
      // nav_icon: {
      //   prev: '<i class="fa fa-chevron-circle-left"></i>',
      //   next: '<i class="fa fa-chevron-circle-right"></i>'
      // },
      callbacks: {
        on_cell_double_clicked: function() {
        },
        on_cell_clicked: function() {
        },
        on_nav_clicked: function() {
        },
        on_event_clicked: function() {
        }
      },
      events: {

      },
      ajax: {
        url: "content/getdashdata.jsp",
        modal : false
      }
    });
  });
</script>