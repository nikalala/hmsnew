<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<%
  String rromid = request.getParameter("rroomid");
  String roomid = "";
  String resId = "";
  String folionum = "";

  if (!CodeHelpers.isNullOrEmpty(rromid)) {
    ReservationroomBean rr = ReservationroomManager.getInstance().loadByPrimaryKey(new Long(rromid));
    if (rr != null) {
      resId = rr.getReservationid().toString();
      FolioBean[] fb = FolioManager.getInstance().loadByWhere("where reservationroomid = " + rromid);
      if (fb != null) {
        folionum = fb[0].getNum();
      }
      if (rr.getRoomid() != null) {
        RoomBean rb = RoomManager.getInstance().loadByPrimaryKey(new Integer(rr.getRoomid()));
        roomid = rb.getName() + " - " + rb.getCode();
      }
    }
  }

%>

<% RoomtypeBean[] roomTypes = RoomtypeManager.getInstance().loadByWhere("ORDER BY ord"); %>
<% RatetypeBean[] RatetypeBeans = RatetypeManager.getInstance().loadByWhere("where active = true and deleted = false"); %>
<% DiscountBean[] discountBeans = DiscountManager.getInstance().loadByWhere("where roomrate = true");%>
<% CurrencyBean[] currencyBeans = CurrencyManager.getInstance().loadByWhere("where basic = true");

  Calendar cal = Calendar.getInstance();
  cal.setTimeInMillis(lclosedate);
  int year = cal.get(Calendar.YEAR);
  int month = cal.get(Calendar.MONTH);

  String qr = "";
%>

<script src="js/zabuto_calendar.js"></script>

<script>
    
  function doCalSearch(){
      var roomtypeid = $("#roomType").val();
      var ratetypeid = $("#RatetypeBeans").val();
      var adult = $("#adult").val();
      var child = $("#child").val();
      var discountid = $("#discount").val();
      var valuenumbe = $("#valuenumbe").val();
      var notax = $("#tax").is(":checked");
      if(roomtypeid > 0 && ratetypeid > 0){
        var qr = "?act=1&notax="+notax+"&roomtypeid="+roomtypeid+"&ratetypeid="+ratetypeid+"&adult="+adult+"&child="+child+"&discountid="+discountid+"&valuenumbe="+valuenumbe;
        reInit(qr);
    } else BootstrapDialog.alert("ოთახის და ტარიფის ტიპი აუცილებელია");
  }
    
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

  $("#roomlistitems tr").click(function(e) {
    loader.show();
    e.preventDefault();
    var id = $(this).prop('id');
    getBody('stayviewleft', 'dashboard', 'სამუშაო მაგიდა', 'res1', '?rroomid=' + id ,true);
    return;
  })
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

  .pull-right{
    width : auto !important;
  }
</style>

<div class="q-main-div">
  <div class="col-md-16">
    <div id="status_bar" class="first-status-bar" align='center'>
      <div class="q-statusbar-div" style="  background: #FFF;">
        <span class="q-statusbar-span">
          <div style="  float: left;  margin-right: 10px;">ოთახი: <b><%=roomid%></b></div>
          <div style="float: left; border-left: solid 1px #999; margin-right: 10px;">ფოლიო:  <b><%=folionum%></b></div>
          <div style="float: left; border-left: solid 1px #999; margin-right: 10px;">რეზ #:  <b><%=resId%></b></div>
        </span>
      </div>
    </div>
  </div>
</div>
<div class="q-main-div">
  <div class="col-md-7">
    <div class="panel panel-primary" id='guestinfo'>
        <jsp:include page="guestinfo.jsp">
            <jsp:param name="reservationroomid" value="<%=rromid%>"/>
        </jsp:include>
    </div>
  </div>
  <div class="col-md-4">
    <div class="panel panel-primary" id='stayinfo'>
        <jsp:include page="stayinfodates.jsp">
            <jsp:param name="reservationroomid" value="<%=rromid%>"/>
        </jsp:include>
    </div>
  </div>
  <div class="col-md-5">
    <div class="panel panel-primary" id='otherinfo'>
        <jsp:include page="otherinfo.jsp">
            <jsp:param name="reservationroomid" value="<%=rromid%>"/>
        </jsp:include>
    </div>
  </div>
</div>

<div class="q-main-div">
  <div class="col-md-10">
    <div id="status_bar" class="first-status-bar" align='center'>
      <div class="q-statusbar-div">
        <span class="q-statusbar-span">თავისუფალი ოთახები და ტარიფები (<%=maincurrency.getCode()%>)</span>
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
            <td colspan="2" style="height: 5px;"></td>
            <%--td style="padding-right: 10px;">
              შეიცავს გადასახადებს
            </td>
            <td style="padding-right: 10px; text-align: left;">
              <input type="checkbox" name="tax" id="tax" />
            </td--%>
            <td style="padding-right: 10px;" colspan="2">
                <input type="button" name="go" id="go" value="Go!" onclick="doCalSearch()" />
            </td>
          </tr>
        </table>
      </div>
      <div class="q-table-div" style="height : 347px;" id="dash-calendar-container">
        
      </div>
    </div>
  </div>
  <div class="col-md-6">
    <div id="status_bar" class="first-status-bar" align='center'>
      <div class="q-statusbar-div">
        <span class="q-statusbar-span">ფოლიო</span>
        <div class="btn-group pull-right" style="width: auto !important; float: right !important;  margin: 6px 9px 0px 0;">

        <a href="javascript:newsWindow1('editotherinfo','სხვა ინფორმაციის რედაქტირება','reservationroomid=<%//=rroom.getReservationroomid()%>');" class="glyphicon glyphicon-pencil iconblack" style="text-decoration: none;" data-toggle="tooltip" title="სხვა ინფორმაციის რედაქტირება"></a>

      </div>
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
    
  function reInit(qr){
      $("#dash-calendar").remove();
      $("#dash-calendar-container").html('<div id="dash-calendar"></div>');
      $("#dash-calendar").zabuto_calendar({
      language : "ge",
      year : <%=year%>,
      month : <%=month+1%>,
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
        url: "content/getdashdata.jsp"+qr,
        modal : false
      }
    });
    
    
  }
    
  $(document).ready(function () {
    reInit('<%=qr%>');
  });
</script>