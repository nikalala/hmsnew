<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
ReservationroomBean rroom = ReservationroomManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("reservationroomid")));
ReservationBean reserv = ReservationManager.getInstance().loadByPrimaryKey(rroom.getReservationid());
//ViewReservationconditionalrateslistBean[] rlist = ViewReservationconditionalrateslistManager.getInstance().loadByWhere(" where reservationid="+reserv.getReservationid()+" order by daynumber asc");

GuestBean guest = GuestManager.getInstance().loadByPrimaryKey(rroom.getGuestid());
//RoomBean room = RoomManager.getInstance().loadByPrimaryKey(rroom.getRoomid());
RoomtypeBean roomtype = RoomtypeManager.getInstance().loadByPrimaryKey(rroom.getRoomtypeid());
RatetypeBean rtp = RatetypeManager.getInstance().loadByPrimaryKey(rroom.getRatetypeid());
RatetypeBean[] rates = RatetypeManager.getInstance().loadByWhere("where ratetypeid in (select ratetypeid from ratetyperoomtype where roomtypeid = "+rroom.getRoomtypeid()+") order by ord");

DiscountBean disc = null;
if(reserv.getDiscountid() != null)
    disc = DiscountManager.getInstance().loadByPrimaryKey(reserv.getDiscountid());
double discamount = 0;
if(reserv.getPostingvalueevery() != null)
    discamount = reserv.getPostingvalueevery().doubleValue();
int adult = rroom.getAdult().intValue();
int child = rroom.getChild().intValue();
int extraadult = adult - roomtype.getBadult().intValue();
int extrachild = child - roomtype.getBchild().intValue();
if(extraadult < 0)  extraadult = 0;
if(extrachild < 0)  extrachild = 0;
int baseadult = adult - extraadult;
int basechild = child - extrachild;
if(baseadult < 0)   baseadult = 0;
if(basechild < 0)   basechild = 0;
Calendar calstart = Calendar.getInstance();
Calendar calend = Calendar.getInstance();
calend.add(Calendar.DATE,1);
calstart.setTime(reserv.getArraivaldate());
calend.setTime(reserv.getDeparturedate());
%>
<style>
table.scroll tbody,
table.scroll thead { display: block; }

table.scroll tbody {
    height: 200px;
    overflow-y: auto;
    overflow-x: hidden;
}

table.scroll tr {
    height: 30px;
}

.disabled {
    background-color: #F5F5F5;
}

.trh td {
    padding: 0px;
    height: 20px;
}

.labeltext {
    color: #000;
    float: left;
    font-weight: bold;
    padding-top: 4px;
    text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
    height: 18px;
}

.list_statusbar {
    background-color: white;
    padding: 0px 7px;
    line-height: 17px;
    height: 29px;
    border-bottom: none !important;
}

.legenditem {
    //border-bottom: 1px solid #686868;
    color: #000;
    padding: 0px 4px 1px 0px;
    text-align: left;
    float: left;
    margin-right: 10px;
    cursor: pointer;
    
}

.legenditem:hover {
    color: #000;
    text-decoration: none;
}


.activelegend {
    border: 1px solid #E13B27;
}

.selectedred {
    background: -webkit-linear-gradient(right, rgba(255,0,0,0), rgba(255,0,0,1)); /* For Safari 5.1 to 6.0 */
    background: -o-linear-gradient(left, rgba(255,0,0,0), rgba(255,0,0,1)); /* For Opera 11.1 to 12.0 */
    background: -moz-linear-gradient(left, rgba(255,0,0,0), rgba(255,0,0,1)); /* For Firefox 3.6 to 15 */
    background: linear-gradient(to left, rgba(255,0,0,0), rgba(255,0,0,1)); /* Standard syntax (must be last) */
}
.ui-jqgrid-bdiv {
    background: white;
}
.ui-jqgrid-sdiv {
    background-color: white !important;
}
.ui-jqgrid-sdiv td {
    border: none !important;
    border-top: 1px solid #ccc !important;
}
.ui-jqgrid-labels {
    background: white;
    border-bottom: 1px solid #ccc;
}
</style>
<script>
var ratesid = 0;
var height = 230;

function selunsel(val){
    jQuery("#roomtable1").jqGrid('resetSelection');
    jQuery("#roomtable1").jqGrid('setSelection',"roomch"+val);
}

function setDiscount(rid){
    newmWindow1('setdiscount','ვადის გაგრძელება','rid=' + rid);
}

function roomchAction(n,rid){
    selunsel(rid);
    for(var i=1;i<4;i++)
        $("#legend"+i).removeClass("activelegend");
    if(n > 0){
        var rowData = $('#roomtable1').getRowData("roomch"+rid);
        if(roomch_opened == 0){
            $("#roomchfunc").show();
            $("#roomtable1").setGridHeight(height-70,true);
            //$("#roomchtbody").height($("#roomchtbody").height()-70);
            roomch_opened = 1;
        }
        $("#legend"+n).addClass("activelegend");
        
        $("#roomch_date").prop('disabled', true);
        $("#roomch_tariff_rate").prop('disabled', true);
        $("#roomch_update_tariff").prop('disabled', true);
        $("#roomch_tariff").prop('disabled', true);
        $("#roomch_inclusive_tax").prop('disabled', true);
        $("#roomch_adult").prop('disabled', true);
        $("#roomch_child").prop('disabled', true);

        $("#roomch_date").val($("#roomch_staydate"+rid).html());
        $("#roomch_tariff").val($("#roomch_tariffprice"+rid).html());

        $("#roomch_tariff_rate option").filter(function() {
            return $(this).text() == $("#roomch_tariffname"+rid).html(); 
        }).prop('selected', true);

        
        var valadch = rowData['adch'];
        
        var ac = valadch.split(" / ");
        var adult = ac[0];
        var child = ac[1];

        $("#roomch_adult").val(adult);
        $("#roomch_child").val(child);
        
        $("#roomch_date").val(rowData['roomdate']);
        $("#roomch_tariff").val(rowData['price']);
        if(rowData['incl'] == 0)    $("#roomch_inclusive_tax").prop('checked', false);
        else    $("#roomch_inclusive_tax").prop('checked', true);
        var rtr = $("#roomch_tariff_rate option:contains('"+rowData['type']+"')").val();
        $("#roomch_tariff_rate").val(rtr);
        
        if(n == 1) {
            $("#roomch_tariff").prop('disabled', false);
            $("#roomch_inclusive_tax").prop('disabled', false);
            $("#roomch_tariff").data('selected', true);
            $("#roomch_tariff").select();
            
        } else if(n == 2) {
            $("#roomch_update_tariff").prop('disabled', false);
            $("#roomch_tariff_rate").prop('disabled', false);
        } else if(n == 3) {
            $("#roomch_adult").prop('disabled', false);
            $("#roomch_child").prop('disabled', false);
        }
        
        $("input[id$='roomid']").prop("checked",false);
        $("input[name$='"+rid+"']").prop("checked",true);
        ratesid = rid;
        
    } else {
        if(roomch_opened == 1){
            $("#roomchfunc").hide();
            $("#roomtable1").setGridHeight(height+70,true);
            //$("#roomchtbody").height($("#roomchtbody").height()+70);
            roomch_opened = 0;
        }
    }
    selected_action = n;
}

function changeRoomchData(){
    $.post(
        "content/updtransaction.jsp",
        {
            roomdate: $("#roomch_date").val(),
            ratetypeid: $("#roomch_tariff_rate").val(),
            updtariff: $("#roomch_update_tariff").prop("checked"),
            manualrate: $("#roomch_tariff").val(),
            incl: $("#roomch_inclusive_tax").prop("checked"),
            adult: $("#roomch_adult").val(),
            child: $("#roomch_child").val(),
            onlydate: $("#roomch_only_selected0").prop("checked"),
            wholeperiod: $("#roomch_only_selected1").prop("checked"),
            reservationroomid: <%=rroom.getReservationroomid()%>
        },
        function(data){
            if(data.result == 0){
                BootstrapDialog.alert(data.error);
            } else {
                //var current_index = $("#specialTab").tabs("option","active");
                //$("#specialTab").tabs('load',current_index);
                $("#roomtable1").trigger("reloadGrid");
            }
        },
        "json"
    );
}

$(document).ready(function(){
    
    $("#roomtable1").width(edittransactionwidth);
    /*
    if(maincontentheight > 654){
        var diff = maincontentheight - 654;
        //alert(diff);
        $("#roomch0").height(maincontentheight-279-diff);
    } else {
        $("#roomch0").height(maincontentheight-367);
    }
    */
    //$("#roomch0").height(edittransactionheight*0.5);
    
    if(maincontentheight > 654){
        var diff = maincontentheight - 654;
        height = height+diff;
    }
    $("#roomch_leftul").width($("#roomchfunc").width()-400);
    
    if(roomch_opened == 0)
        $("#roomchfunc").hide();
    else
        height = height - 70;
    
    var widths = new Array();
    
    $("#roomtable1").find('thead tr').children().each(function(i, v) {
        widths[i] = $(v).attr('wd')*edittransactionwidth/100;
        $(v).width(widths[i]);
    });
    
    $("#roomtable1").find('tbody tr').children().each(function(i, v) {
        $(v).width(widths[i]);
    });
    
//    for(var i=1;i<4;i++)
//        $("#legend"+i).removeClass("activelegend");
    if(selected_action > 0)
        $("#legend"+selected_action).addClass("activelegend");
    
    jQuery('#roomtable1').jqGrid(
    {
        url:'content/getroomch.jsp?reservationroomid=<%=rroom.getReservationroomid()%>',
        datatype: 'xml',
        colNames:['თარიღი', 'ოთახი', 'ტარიფის ტიპი', 'უფრ. / ბავშ.', 'ფასი', 'ფასდაკლება','გადასახადი','შესწორება','ნეტო','მომხმარებელი','მოქმედება','incl'],
        colModel:[
            {width: 110, hidden:false, name:'roomdate', index:'roomdate', align:'left'},
            {width: 100, hidden:false, name:'room', index:'room', align:'left'},
            {width: 140, hidden:false, name:'type', index:'type', align:'left'},
            {width: 70, hidden:false, name:'adch', index:'adch', align:'center'},
            {width: 110, hidden:false, name:'price', index:'price', align:'right'},
            {width: 90, hidden:false, name:'discount', index:'discount', align:'right'},
            {width: 90, hidden:false, name:'tax', index:'tax', align:'right'},
            {width: 90, hidden:false, name:'fix', index:'fix', align:'right'},
            {width: 90, hidden:false, name:'neto', index:'neto', align:'right'},
            {width: 110, hidden:false, name:'user', index:'user', align:'right'},
            {width: 100, hidden:false, name:'action', index:'action', align:'center'},
            {width: 1, hidden:true, name:'incl', index:'incl'}
        ],
        rowNum:2000,
        height: height,
        autowidth: true,
        sortname: 'roomdate',
        viewrecords: true,
        sortorder: 'asc',
        altRows: true,
        altclass: 'altrow',
        footerrow : true,
        userDataOnFooter:true,
        multiselect: true,
        multikey: "ctrlKey"
        })
        .jqGrid('bindKeys')
	//.navButtonAdd('#pager1',{caption:'',buttonicon:'ui-icon-circle-plus',onClickButton: function(){ setInsurance(jQuery('#listcurrency').jqGrid('getGridParam','selrow')); },position:'last'})
	;
	$('.ui-jqgrid-sortable').css('white-space', 'normal');
	$('.ui-jqgrid-sortable').css('height', 'auto');
   
        $("#jqgh_roomtable1_roomdate").css('text-align', 'left');
        $("#jqgh_roomtable1_room").css('text-align', 'left');
        $("#jqgh_roomtable1_type").css('text-align', 'left');
        $("#jqgh_roomtable1_adch").css('text-align', 'center');
        $("#jqgh_roomtable1_price").css('text-align', 'right');
        $("#jqgh_roomtable1_discount").css('text-align', 'right');
        $("#jqgh_roomtable1_tax").css('text-align', 'right');
        $("#jqgh_roomtable1_fix").css('text-align', 'right');
        $("#jqgh_roomtable1_neto").css('text-align', 'right');
        $("#jqgh_roomtable1_user").css('text-align', 'right');
        $("#jqgh_roomtable1_action").css('text-align', 'center');
    
});
</script>
<div id="roomch0" style="height: 100%;">
    <div id="roomchfunc" style="padding-top: 6px; padding-bottom: 0px; height: 70px; border-bottom: 1px solid #C8C8C8;">
        <ul style="padding-left: 7px; padding-right: 7px; display: inline-block; list-style: none outside none; line-height: 1;">
            <li id='roomch_leftul' style="float: left;">
                <p style="float: left; margin-bottom: 4px; width: 100%; height: 30px;">
                    <span style="float: left;">
                        <span style="width: 50px;" class="labeltext">
                            თარიღი
                        </span>
                        <span style='padding-left: 5px; width: 70px;'>
                            <input disabled style=" width: 70px;" size="10" value="" type="text" id="roomch_date">
                        </span>
                    </span>
                    <span style="float: left;">
                        <span style="padding-left: 20px; width: 110px;" class="labeltext">
                            ტარიფის ტიპი
                        </span>
                        <span style='padding-left: 5px; width: 200px;'>
                            <select class="dropdown" disabled id="roomch_tariff_rate" style="width: 200px;">
                                <%
                                for(int i=0;i<rates.length;i++){
                                %>
                                <option value="<%=rates[i].getRatetypeid()%>"><%=rates[i].getName()%></option>
                                <%}%>
                            </select>
                        </span>
                    </span>
                    <span style="float: left;">
                        <span style="width: 30px; padding-left: 20px; float: left;" >
                            <input disabled type="checkbox" name="roomch_update_tariff" id="roomch_update_tariff" value="1" onclick=""/>
                        </span>
                        <span class="labeltext" style='padding-left: 10px; width: 140px;'>
                            ტარიფის განახლება
                        </span>
                    </span>
                </p>
                <p style="float: left; margin-bottom: 4px; width: 100%; height: 30px;">
                    <span style="float: left;">
                        <span style="width: 50px;" class="labeltext">
                            ტარიფი
                        </span>
                        <span style='padding-left: 5px; width: 70px;'>
                            <input disabled size="10" value="" type="text" id="roomch_tariff" style="width: 70px;">
                        </span>
                    </span>
                    <span style="float: left;">
                        <span style='padding-left: 20px; width: 30px; float: left;'>
                            <input type="checkbox" disabled name="roomch_inclusive_tax" id="roomch_inclusive_tax" value="1" onclick=""/>
                        </span>
                        <span style="width: 220px; padding-left: 20px; float: left;" class="labeltext">
                            ტარიფი შეიცავს გადასახადებს
                        </span>
                        
                    </span>
                    <span style="float: left;">
                        <span style="width: 160px; padding-left: 20px; float: left;" class="labeltext">
                            მცხოვრები (უფრ/ბავშ)
                        </span>
                        <span style='padding-left: 10px; width: 85px;'>
                            <select id="roomch_adult" style="width: 40px;" disabled>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                            </select>
                            /
                            <select id="roomch_child" style="width: 40px;" disabled>
                                <option value="0">0</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                            </select>
                        </span>
                    </span>
                </p>
            </li>
            <li style="width: 350px; float: right;">
                <p style="float: left; margin-bottom: 4px; width: 100%; height: 30px;">
                    
                    <span style="width: auto;" class="labeltext">
                        მოქმედება არჩეულ თარიღებზე
                    </span>
                    <span style='padding-left: 10px;'>
                        <input type="radio" name="roomch_only_selected" id="roomch_only_selected0" value="0" onclick="" checked/>
                    </span>
                    <span style='padding-left: 10px; float: right;'>
                        <button onclick="changeRoomchData()" style="width: 80px; margin-top: -2px;" type="button" class="btn btn-sm btn-danger navbar-btn">შესრულება</button>
                    </span>
                </p>
                <p style="float: left; margin-bottom: 4px; width: 100%; height: 30px;">
                    
                    <span style="width: auto;" class="labeltext">
                        მოქმედება სრულ პერიოდზე
                    </span>
                    <span style='margin-left: 28px;'>
                        <input type="radio" name="roomch_only_selected" id="roomch_only_selected1" value="1" onclick=""/>
                    </span>
                    <span style='padding-left: 10px; float: right;'>
                        <button style="width: 80px; margin-top: -2px;" type="button" class="btn btn-sm btn-default navbar-btn" onclick='roomchAction(0)'>გაუქმება</button>
                    </span>
                </p>
            </li>
        </ul>
    </div>
    <table id='roomtable1' width='100%' align='center'></table>
    <ul class="list_statusbar" style="border-bottom: 1px solid #bebebe;">
        <li style="float:left; padding-top:5px;">
            <a class="legenditem" id="legend1"><span class="glyphicon glyphicon-usd" style="width: 18px; padding-left: 4px;"></span>ტარიფის ოპერაცია</a>
            <a class="legenditem" id="legend2"><span class="glyphicon glyphicon-record" style="width: 18px; padding-left: 4px;"></span>ტარიფის ტიპის ოპერაცია</a>
            <a class="legenditem" id="legend3"><span class="glyphicon glyphicon-user" style="width: 18px; padding-left: 4px;"></span>უფრ./ბავშ. ოპერაცია</a>
        </li>
        <li style="float:right; margin-right:-8px; height: 28px;">
            <button style="width: 80px; margin-top: 2px;" type="button" onclick="setDiscount(<%=rroom.getReservationroomid()%>)" class="btn btn-sm btn-danger navbar-btn">ფასდაკლება</button>
        </li>
    </ul>
</div>
