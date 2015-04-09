<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>
<%

    int req_roomId = 0;
    int req_roomTypeId = 0;
    String req_dtStart = null;
    String req_dtEnd = null;
    String picker1 = null;
    String picker2 = null;

    if (request.getParameter("req_roomId") != null) {
        req_roomId = Integer.parseInt(request.getParameter("req_roomId"));
        RoomBean roomBean = RoomManager.getInstance().loadByPrimaryKey(req_roomId);
        if(roomBean.getRoomtypeid() != null){
            req_roomTypeId = roomBean.getRoomtypeid();
        }
    }

    if (request.getParameter("req_dtStart") != null) {
        req_dtStart = (String)request.getParameter("req_dtStart");
    }

    if (request.getParameter("req_dtEnd") != null) {
        req_dtEnd = (String)request.getParameter("req_dtEnd");
    }

    int wintype = 0;
    if (request.getParameter("wintype") != null) {
        wintype = Integer.parseInt(request.getParameter("wintype"));
    }

    session.removeAttribute("WALKIN_EXTRACHARGES");
    session.removeAttribute("WALKIN_REMARKS");

    String fields = ""
            + "guestinfo_salutationid,guestinfo_fname,guestinfo_lname,guestinfo_address,guestinfo_city,guestinfo_zip,guestinfo_countryid,"
            + "guestinfo_roomnumber,guestinfo_roomtypeid,guestinfo_roomid,guestinfo_ratetypeid,guestinfo_arrivaldate,guestinfo_arrivaltime,guestinfo_night,guestinfo_departuredate,guestinfo_departuretime,guestinfo_adult,guestinfo_reservationtypeid,guestinfo_child,"
            + "contacttinfo_email,contacttinfo_phone,contacttinfo_mobile,contacttinfo_fax,"
            + "guestinfo_idtypeid,guestinfo_idn,guestinfo_nationalityid,";
    for (int i = 0; i < gender.length; i++) {
        fields += "guestinfo_gender" + i + ",";
    }
    fields += "guestinfo_vipstatusid,";
    for (int i = 0; i < ratetype.length; i++) {
        fields += "payinfo_ratetype" + i + ",";
    }
    fields += "payinfo_contragentid,guestinfo_manual,payinfo_tax,payinfo_billto,payinfo_notax,guestinfo_taxid,";
    for (int i = 0; i < paymentmode.length; i++) {
        fields += "payinfo_paymentmode" + i + ",";
    }
    fields += "payinfo_paymentmethodid,payinfo_paymentcontragentid,payinfo_hasrelesedate,payinfo_relesedate,payinfo_term,"
            + "wlakin_other_companyid,wlakin_other_marketid,wlakin_other_bsourceid,"
            + "wlakin_other_taid,wlakin_other_commissionplan,wlakin_other_value,wlakin_other_voucher,"
            + "wlakin_payment_paymentmethod,wlakin_payment_currencyid,wlakin_payment_amount,wlakin_payment_vaoucher,"
            + "wlakin_discount_discountid,wlakin_discount_discountplan,wlakin_discount_nights,wlakin_discount_amount,"
            + "walkin_printcard,walkin_payregcard,walkin_printfolio,walkin_printbill,"
            + "";

    String ratetableqr = "'arrdate='+$('#guestinfo_arrivaldate').val()"
            + "+'&depdate='+$('#guestinfo_departuredate').val()"
            + "+'&ratetypeid='+$('#guestinfo_ratetypeid').val()"
            + "+'&roomtypeid='+$('#guestinfo_roomtypeid').val()"
            + "+'&contragentid='+$('#payinfo_contragentid').val()"
            + "+'&payinforatetype='+$('input[name$=\\'payinfo_ratetype\\']:checked').val()"
            + "+'&manualrate='+$('#guestinfo_manual').val()"
            + "+'&adult='+$('#guestinfo_adult').val()"
            + "+'&child='+$('#guestinfo_child').val()"
            + "+'&tax='+$('#payinfo_notax').is(':checked')"
            + "+'&discountid='+$('#wlakin_discount_discountid').val()"
            + "+'&discountplan='+$('#wlakin_discount_discountplan').val()"
            + "+'&discountnights='+$('#wlakin_discount_nights').val()"
            + "+'&discount='+$('#wlakin_discount_amount').val()";


%>
<style>
    .specialTab1,
    li.walkintabs {
    // position : absolute;
    // margin-left : 0 px;
        height: 27px;
    }

    li.active {
        border-bottom: none;
    }

    .specialTab1 {
        margin-top: 0px !important;
    }

    #walkin_tbl td {
        padding: 2px;
    }

    table.scrollwk tbody,
    table.scrollwk thead {
        display: block;
    }

    table.scrollwk tbody {
        height: 150px;
        overflow-y: auto;
        overflow-x: hidden;
    }

    table.scrollwk tr {
        height: 30px;
    }
</style>
<script>

    var rooms = 1;

    function getRateTable() {

    }

    function addRow() {
        $.ajax({
            type: 'POST',
            url: "content/ajax/addGuestRow.jsp",
            data: {id: rooms},
            success: function (data) {
                $(data).appendTo($("#walkin_table_body"));
                var $ctbefore = $("#walkin_guest_" + rooms).prev("tr");
                if ($ctbefore.length > 0) {
                    var sid = $ctbefore.attr('id');
                    $("#" + sid.replace("walkin_guest_", "walkin_guest_copy_")).show();
                }
                $("#walkin_guest_copy_" + rooms).hide();
                $("#walkin_guest_usd_" + rooms).hide();
                rooms++;
                $("#guestinfo_roomnumber").val(rooms);
                if (rooms > 1)
                    $("#walkin_set_copy").show();
            },
            dataType: "html",
            async: false
        });

        /*
         $.post(
         "content/ajax/addGuestRow.jsp",
         {id: rooms},
         function(data){
         $(data).appendTo($("#walkin_table_body"));
         var $ctbefore = $("#walkin_guest_"+rooms).prev("tr");
         if($ctbefore.length > 0){
         var sid = $ctbefore.attr('id');
         $("#"+sid.replace("walkin_guest_","walkin_guest_copy_")).show();
         }
         $("#walkin_guest_copy_"+rooms).hide();
         $("#walkin_guest_usd_"+rooms).hide();
         rooms++;
         $("#guestinfo_roomnumber").val(rooms);
         }
         );*/

    }

    function delRow(id) {
        var $ctnext = $("#walkin_guest_" + id).next("tr");
        if ($ctnext.length == 0) {
            var $ctbefore = $("#walkin_guest_" + id).prev("tr");
            if ($ctbefore.length > 0) {
                var sid = $ctbefore.attr('id');
                $("#" + sid.replace("walkin_guest_", "walkin_guest_copy_")).hide();
            }
        }
        $("#walkin_guest_" + id).remove();
        rooms--;
        $("#guestinfo_roomnumber").val(rooms);
        if (rooms < 2)   $("#walkin_set_copy").hide();
    }

    function copyguest() {
        alert('adfhd');
    }

    function loadRooms(id){
        //newWindowWithParams('walkin','dasdasdada','?req_roomId=3&req_dtStart=10.10.2014&req_dtEnd=12.12.2014')
        setTimeout(function (){
            var guestRoomId = $("#guestinfo_roomid");
            if(guestRoomId.size() == 0 || guestRoomId.val() == null){
                loadRooms(id);
            }
            if(guestRoomId.val() == "0" || isNullOrEmpty(guestRoomId.val())){
                guestRoomId.val(id);
                /*$('#guestinfo_arrivaldate').trigger('changeDate');*/
                $('#guestinfo_departuredate').trigger('changeDate');
            }
        }, 100);
    }

    function walkinRoomType(id) {
        $.post(
                "content/ajax/getRoomsByType.jsp",
                {roomtypeid: $("#walkin_roomtypeid_" + id).val()},
                function (data) {
                    $("#walkin_roomid_" + id).html(data.selectroom);
                    $("#walkin_ratetypeid_" + id).html(data.selectratetype);
                    $("#walkin_adult_" + id).html(data.selectadult);
                    $("#walkin_child_" + id).html(data.selectcild);
                    if ($("#walkin_roomtypeid_" + id).val() > 0) $("#walkin_guest_usd_" + id).show();
                    else $("#walkin_guest_usd_" + id).hide();
                },
                "json"
        );
    }

    function walkinNameSearch1(id, cid) {
        var type = $("#" + id).get(0).tagName;
        var term = "";
        if (type == 'INPUT') term = $("#" + id).val();
        if (type == 'SELECT') term = $('#' + id).find(":selected").text();
        if ($("#" + id).val() == '0') term = '';
        //if(term.length == 0)    BootstrapDialog.alert("შეიყვანეთ საძებნი სიტყვა");
        //else {
        extramodal00("contactSearch1", "კონტაქტის ძებნა", "id=" + id + "&term=" + term + "&cid=" + cid);
        //}
    }

    function remGuestName() {
        $("#guestinfo_salutationid").val(0);
        $("#guestinfo_address").val("");
        $("#guestinfo_city").val("");
        $("#guestinfo_zip").val("");
        $("#guestinfo_countryid").val(0);
        $("#contacttinfo_email").val("");
        $("#contacttinfo_phone").val("");
        $("#contacttinfo_mobile").val("");
        $("#contacttinfo_fax").val("");
        $("#guestinfo_idtypeid").val(0);
        $("#guestinfo_idn").val("");
        $("#guestinfo_nationalityid").val("");
        $("#guestinfo_vipstatusid").val("");
        $("#guestinfo_guestid").val(0);
        $('#guestinfo_lname').val('');
        $('#guestinfo_fname').val('');
        $('#guestinfo_fname').focus();
        <%for(int i=0;i<gender.length;i++){%>$("#guestinfo_gender<%=i%>").prop("checked", false);
        <%}%>
    }

    function showRateTable(id) {
        var dpl = $('#wlakin_discount_discountplan').val();
        var dnt = $('#wlakin_discount_nights').val();
        var amt = $('#wlakin_discount_amount').val();
        var did = $('#wlakin_discount_discountid').val();
        if (isNaN(amt)) amt = 0;
        if (isNaN(dnt)) dnt = 0;
        if (did > 0 && amt == 0)    BootstrapDialog.alert("აირჩიეთ ფასდაკლების ოდენობა");
        else if (dpl < 0 && did > 0)    BootstrapDialog.alert("აირჩიეთ ფასდაკლების წესი");
        else if (dpl == 0 && dnt == 0)    BootstrapDialog.alert("აირჩიეთ ფასდაკლების ღამეები");
        else if (id != '') newmWindow1('ratetable', 'ტარიფების ცხრილი [<%=maincurrency.getCode()%>]', <%=ratetableqr%>);
        else {
            var qr = <%=ratetableqr%>;
            qr.replace("guestinfo_ratetypeid", "walkin_ratetypeid_" + id);
            qr.replace("guestinfo_roomtypeid", "walkin_roomtypeid_" + id);
            qr.replace("guestinfo_adult", "walkin_adult_" + id);
            qr.replace("guestinfo_child", "walkin_child_" + id);
            newmWindow1('ratetable', 'ტარიფების ცხრილი [<%=maincurrency.getCode()%>]', qr);
        }
    }

    $(document).ready(function () {

        $(".modal-dialog").removeAttr( "style" );

        $("#myModalSave").remove();
        var r1 = $('<button type="button" class="btn btn-danger" id="myModalSave" onclick="savedata(\'myModal\')">რეზერვაცია</button>');
        <%if(wintype == 2){%>

        r1 = $('<button type="button" class="btn btn-danger" id="myModalSave" onclick="savedata(\'myModal\')">შენახვა</button>');

        <%}%>
        $("#myModalFooter").append(r1);

        $("#myModalCheckin").remove();

        <%if(wintype == 0){%>
        var r = $('<button type="button" class="btn btn-danger" id="myModalCheckin" onclick="savedata1(\'myModal\',\'checkin=true\')">მიღება</button>');
        $("#myModalFooter").append(r);
        <%}%>
        $("#walkin_set_rates").hide();
        $("#walkin_set_copy").hide();

        var $table = $('table.scrollwk'),
                $bodyCells = $table.find('tbody tr:first').children(),
                colWidth;

        $(window).resize(function () {

            colWidth = $bodyCells.map(function () {
                var wd = $(this).width();
                //alert(wd);
                return wd;
            }).get();

            $table.find('thead tr').children().each(function (i, v) {
                $(v).width(colWidth[i]);
            });
        }).resize();

        $('.specialTab').click(function (e) {
            //e.preventDefault();
            //var containerId = '#content'; /** Specify which element container */
            //var self = $(this);
            //var url = self.attr('href');
            //$(self.data('target'))
            //    .load(url, function(){
            //       self.tab('show');
            //    });
        });

       <%
       // ეს აუცილებელია!!!!
       if(req_dtStart != null && req_dtEnd != null){
           Date req_dtStart_date = (Date)dt.parse(req_dtStart);
           long req_dtStart_long = req_dtStart_date.getTime();
           Date req_dtEnd_date = (Date)dt.parse(req_dtEnd);
           long req_dtEnd_long = req_dtEnd_date.getTime();
           picker1 = "{autoclose: true, format: '" + dateformats1[dff] + "', weekStart: 1, startDate: new Date(" + req_dtStart_long + "), language: 'ka', todayHighlight: true, allowEmpty: false}";
           picker2 = "{autoclose: true, format: '" + dateformats1[dff] + "', weekStart: 1, startDate: new Date(" + req_dtEnd_long + "), language: 'ka', todayHighlight: true, allowEmpty: false}";
       %>

        var roomTypeId = '<%=req_roomTypeId%>';
        var roomId = '<%=req_roomId%>';
        /*
         var dtStart = '<%=picker1%>';
         var dtEnd = '<%=picker2%>';
         */

        /*        console.log(roomTypeId,roomId,dtStart,dtEnd);*/

        if(!isNullOrEmpty(roomTypeId)){
            loader.show();
            $("#guestinfo_roomtypeid").val(roomTypeId);
            $("#guestinfo_arrivaldate").datepicker(<%=picker1%>);
            $("#guestinfo_departuredate").datepicker(<%=picker2%>);

            setTimeout(function (){
                $("#guestinfo_roomtypeid").trigger( "change" );
                loadRooms(roomId);
            }, 1000);
            loader.hide();
        }
        <% } %>

        //this is test.....
        //$("#guestinfo_arrivaldate").datepicker({autoclose: true, format: 'dd.mm.yyyy', startDate: new Date(1414267199999), language: 'ka', todayHighlight: true, allowEmpty: false});

     });




 </script>
 <input type="hidden" id="action" value="savereservation.jsp?action=save&type=walkin&wintype=<%=wintype%>"/>
<input type="hidden" id="maindiv" value="registration"/>
<input type="hidden" id="callbackurl" value="content/stayviewleft.jsp"/>
<input type="hidden" id="callbackmethod" value="reloadPageAfterSave()"/>
<input type="hidden" id="callbackdata" value="leftcontent"/>
<div class="container-fluid" id="registration" style="padding-top: 4px; height: 100%;">
    <div class="row" style="margin-top: 0px; margin-bottom: 0px; padding-left: 5px;  padding-right: 5px;">
        <div class="col-md-5">
            <div class="panel panel-primary" id='reg_guestinfo'>
                <div class="panel-heading">
                    <h3 class="panel-title">
                        სტუმრის ინფორმაცია
                        <div class="btn-group pull-right">
                            <a href="javascript:showRateTable('')" id='walkin_set_rates'
                               class="glyphicon glyphicon-usd iconblack"
                               style="text-decoration: none; padding-right: 4px;" data-toggle="tooltip"
                               title="ტარიფები"></a>
                            <a href="javascript:copyguest()" id='walkin_set_copy'
                               class="glyphicon glyphicon-tags iconblack"
                               style="text-decoration: none; padding-right: 4px;" data-toggle="tooltip"
                               title="კოპირება"></a>
                            <a href="javascript:newmWindow1('remarks','შენიშვნები','rid=0')" id='walkin_set_remark'
                               class="glyphicon glyphicon-file iconblack"
                               style="text-decoration: none; padding-right: 4px;" data-toggle="tooltip"
                               title="შენიშვნა"></a>
                            <a href="javascript:newmWindow1('additionalservices','დამატებითი სერვისები','')"
                               id='walkin_set_incl' class="glyphicon glyphicon-paperclip iconblack"
                               style="text-decoration: none; padding-right: 4px;" data-toggle="tooltip"
                               title="დამატებითი სერვისები"></a>
                            <a href="javascript:alert('Not Implemented')" id='walkin_set_color'
                               class="glyphicon glyphicon-pushpin iconblack" style="text-decoration: none;"
                               data-toggle="tooltip" title="ჯგუფის ფერი"></a>
                        </div>
                    </h3>
                </div>
                <div class="panel-body" style="height: 140px;">
                    <jsp:include page="panels/guestinfo.jsp">
                        <jsp:param name="type" value=""/>
                    </jsp:include>
                </div>
            </div>
        </div>
        <div class="col-md-7">
            <div class="panel panel-primary" id='reg_stayinfo'>
                <div class="panel-heading">
                    <h3 class="panel-title">დარჩენის ინფორმაცია</h3>
                </div>
                <div class="panel-body" style="height: 140px;">
                    <jsp:include page="panels/stayinfo.jsp">
                        <jsp:param name="type" value=""/>
                        <jsp:param name="wintype" value="<%=wintype%>"/>
                    </jsp:include>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="panel panel-primary" id='reg_contactinfo'>
                <div class="panel-heading">
                    <h3 class="panel-title">საკონტაქტო ინფორმაცია</h3>
                </div>
                <div class="panel-body" style="height: 140px;">
                    <jsp:include page="panels/contactinfo.jsp">
                        <jsp:param name="type" value=""/>
                    </jsp:include>
                </div>
            </div>
        </div>
    </div>
    <div class="row" style="margin-top: 0px; margin-bottom: 0px; padding-left: 5px;  padding-right: 5px;">
        <div class="col-md-5">
            <div class="panel panel-primary" id='reg_guestinfo'>
                <div class="panel-heading">
                    <h3 class="panel-title">სხვა ინფორმაცია</h3>
                </div>
                <div class="panel-body" style="height: 140px;">
                    <jsp:include page="panels/otherinfo.jsp">
                        <jsp:param name="type" value=""/>
                    </jsp:include>
                </div>
            </div>
        </div>
        <div class="col-md-7">
            <div class="panel panel-primary" id='reg_payinfo'>
                <div class="panel-heading">
                    <h3 class="panel-title">გადახდის ინფორმაცია</h3>
                </div>
                <div class="panel-body" style="height: 140px;">
                    <jsp:include page="panels/payinfo.jsp">
                        <jsp:param name="type" value=""/>
                    </jsp:include>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="panel panel-default" id="tabpanel" style="height: 100%;">
                <ul class="nav nav-tabs" id="infotabs" style="background-color: #F5F5F5; height:27px;" role="tablist">
                    <li class="active walkintabs"><a class="specialTab specialTab1"
                                                     href="content/panels/walkin_other.jsp?type=walkin" role="tab"
                                                     data-target="#walkin_other" data-toggle="tab">სხვა</a></li>
                    <li class="walkintabs"><a class="specialTab specialTab1"
                                              href="content/panels/walkin_ta.jsp?type=walkin" role="tab"
                                              data-target="#walkin_ta" data-toggle="tab">ტა</a></li>
                    <li class="walkintabs"><a class="specialTab specialTab1"
                                              href="content/panels/walkin_discount.jsp?type=walkin" role="tab"
                                              data-target="#walkin_discount" data-toggle="tab">ფასდ.</a></li>
                    <li class="walkintabs"><a class="specialTab specialTab1"
                                              href="content/panels/walkin_payment.jsp?type=walkin" role="tab"
                                              data-target="#walkin_payment" data-toggle="tab">გადახდა</a></li>
                </ul>
                <div class="tab-content panel-body" id="edittransactionbody"
                     style="height: 140px; padding-bottom: 0px;">
                    <div class="tab-pane active" id="walkin_other" style="height: 100%;">
                        <jsp:include page="panels/walkin_other.jsp">
                            <jsp:param name="type" value=""/>
                        </jsp:include>
                    </div>
                    <div class="tab-pane" id="walkin_ta" style="height: 100%;">
                        <jsp:include page="panels/walkin_ta.jsp">
                            <jsp:param name="type" value=""/>
                        </jsp:include>
                    </div>
                    <div class="tab-pane" id="walkin_discount" style="height: 100%;">
                        <jsp:include page="panels/walkin_discount.jsp">
                            <jsp:param name="type" value=""/>
                        </jsp:include>
                    </div>
                    <div class="tab-pane" id="walkin_payment" style="height: 100%;">
                        <jsp:include page="panels/walkin_payment.jsp">
                            <jsp:param name="type" value=""/>
                        </jsp:include>
                    </div>
                    <p style="height: 0px;" id='spacer'></p>
                </div>
            </div>
        </div>
    </div>
    <div class="row" style="margin-top: 0px; margin-bottom: 0px; padding-left: 5px;  padding-right: 5px;">
        <div class="col-md-16" style="height: 30px;">
            <table class="table table-condensed table-bordered" width="100%" cellspacing="0" id="transaction-title"
                   style="background-color: #FFFFFF;">
                <tbody>
                <tr>
                    <td align="left" style="font-size: 11px">
                        <form class="form-inline" role="form">
                            <div class="form-group">
                                <input type="checkbox" id="walkin_printcard">&nbsp;
                                <label for="tksmail">სარეგისტრაციო ბარათის ბეჭდვა</label>&nbsp;
                            </div>
                            <div class="form-group">
                                <input type="checkbox" id="walkin_payregcard">&nbsp;
                                <label for="tksmail">დაფარე ტარიფები სარეგისტრაციო ბარათიდან</label>&nbsp;
                            </div>
                            <div class="form-group">
                                <input type="checkbox" id="walkin_printfolio">&nbsp;
                                <label for="tksmail">დაბეჭდე ფოლიო</label>&nbsp;
                            </div>
                            <div class="form-group">
                                <input type="checkbox" id="walkin_printbill">&nbsp;
                                <label for="tksmail">დაბეჭდე ქვითარი</label>&nbsp;
                            </div>
                        </form>
                    </td>
                    <td align="center" style="font-size: 11px"><b>საბანკო ბარათი</b></td>
                    <td align="center" style="font-size: 11px"><b>დამატებითი სერვისები</b></td>
                    <td align="center" style="font-size: 11px"><b>შენიშვნა</b></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row" style="margin-top: 0px; margin-bottom: 0px; padding-left: 5px;  padding-right: 5px;">
        <div class="col-md-16" style="height: 180px; width: 100%;">
            <table class="scrollwk table table-condensed table-hover" id="walkin_tbl" width="100%">
                <thead>
                <tr>
                    <th nowrap align="center" style="width: 110px;">&nbsp;&nbsp;ოთახის ტიპი</th>
                    <th nowrap align="center" style="width: 90px;">&nbsp;&nbsp;ოთახი</th>
                    <th nowrap align="center" style="width: 110px;">&nbsp;&nbsp;ტარიფის ტიპი</th>
                    <th nowrap align="center" style="width: 90px;">&nbsp;&nbsp;უფრ&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;ბავშ
                    </th>
                    <th nowrap align="center" style="width: 55px;">&nbsp;</th>
                    <th nowrap align="center" style="width: 260px;">&nbsp;&nbsp;სტუმარი</th>
                    <th nowrap align="center" style="width: 130px;">&nbsp;&nbsp;&nbsp;საბუთის ტიპი</th>
                    <th nowrap align="center" style="width: 290px;">&nbsp;&nbsp;&nbsp;ნომერი</th>
                    <th nowrap align="center" style="width: 20px; text-align: right;">
                        <span class="glyphicon glyphicon-plus" style="cursor: pointer;" onclick="addRow()"></span>
                    </th>
                </tr>
                </thead>

                <tbody id="walkin_table_body">

                </tbody>
            </table>
        </div>
    </div>
</div>