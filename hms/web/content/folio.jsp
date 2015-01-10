<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
DiscountBean[] discounts = DiscountManager.getInstance().loadByWhere("where extracharge = true and active = true and deleted = false order by name");
ReservationroomBean rroom = ReservationroomManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("reservationroomid")));
ReservationBean reserv = ReservationManager.getInstance().loadByPrimaryKey(rroom.getReservationid());
long bid = 0;
if(reserv.getBillto() == 0) bid = reserv.getCompanyid().longValue();
//if(reserv.getBillto() == 1) bid = rroom.getGuestid().longValue();
//if(reserv.getBillto() == 2) bid = rroom.getGuestid().longValue();
//if(reserv.getBillto() == 3) bid = rroom.getGuestid().longValue();
String sql = "select sum(amount) from folioitem where folioid in "
        + "(select folioid from folio where "
        + "reservationroomid = "+rroom.getReservationroomid()+" and ";
if(bid > 0)
        sql += "contragentid = "+bid+" and ";
sql += "guestid = "+rroom.getGuestid()+") ";
double tot = getSum(sql);
FolioBean[] folios = FolioManager.getInstance().loadByWhere("where reservationroomid = "+rroom.getReservationroomid()+" order by folioid");
%>
<script>
    
    function editFolioAction(itemid){
        newmWindow1("editfolioitem","რედაქტირება","folioitemid="+itemid);
    }
    
    function printFolioAction(itemid){
        window.open("content/form/printFolioItemPdf.jsp?id="+itemid);
        //addTab("content/form/printInvoiceFolioItem.jsp?act=folioitem&id="+itemid,"გადახდის ინვოისი","folioiteminvoice_"+itemid);
    }
    
    function printFolio(id){
        window.open("content/form/printFolioPdf.jsp?id="+id);
        //addTab("content/form/printInvoiceFolioItem.jsp?act=folio&id="+id,"ფოლიოს ბეჭდვა","foliovoice_"+id);
    }
    
    function refreshFoliolist(id){
        jQuery("#listfolio").jqGrid().setGridParam({
            url:"content/getfoliolist.jsp?reservationroomid="+id+"&itemize="+$("#itemizelist").prop('checked')+"&folioid="+$("#folio_folioid").val()+"&hideunposted="+$("#hideunposted").prop('checked')+"&hidevoid="+$("#hidevoid").prop('checked')
        }).trigger("reloadGrid");
    }
    
    function addFolioitem(){
        $.post(
        "content/ajax/folioitem.jsp",
        {
            act: "add",
            date: $("#foliodate").val(),
            actiontype: $("#folio_actiontype").val(),
            actionvalue: $("#folio_actionvalue").val(),
            currencyid: $("#folio_currencyid").val(),
            amount: $("#folio_amount").val(),
            qty: $("#folio_qty").val(),
            voucher: $("#folio_voucher").val(),
            comment: $("#folio_comment").val(),
            folioid: $("#folio_folioid").val(),
            discountid: $("#folio_discountid").val(),
            discount: $("#folio_discount_amount").val()
        },
        function(data){
            if(data.result == 0)    BootstrapDialog.alert(data.error);
            else {
                $("#foliodate").val("<%=dt.format(dclosedate)%>");
                $("#folio_actiontype").val("-1");
                $("#folio_actionvalue").val("-1");
                $("#folio_currencyid").val("<%=maincurrency.getCurrencyid().intValue()%>");
                $("#folio_amount").val("");
                $("#folio_qty").val("");
                $("#folio_voucher").val("");
                $("#folio_comment").val("");
                //$("#folio_folioid").val();
                $("#folio_discountid").val("-1");
                $("#folio_discount_amount").val("");
                refreshFoliolist(<%=rroom.getReservationroomid()%>);
            }
        },"json");
    }
    
$(document).ready(function(){
    
    $('#foliodate').datepicker(<%=pickerformat2%>);
    
    //$("#foliotab").height(edittransactionheight*0.5);
    
    $("#spacer").height(0);
    /*
    //$("#spacer").height(0);
    var scale = 102;
    if(folio_opened == 1)
        scale = 252;
    //$("#roomtable2").width(edittransactionwidth);
    */
    var height = 142;
    if(maincontentheight > 654){
        var diff = maincontentheight - 654;
        height = 143+diff;
    }
    /*
    //$("#roomch0").height(edittransactionheight*0.5);
    /*
    if(maincontentheight > 654){
        var diff = maincontentheight - 654;
        $("#foliotbody").height($("#foliotab").height()-scale+diff);
    } else
        $("#foliotbody").height($("#foliotab").height()-scale);
    
    var widths = new Array();
    
    $("#roomtable2").find('thead tr').children().each(function(i, v) {
        widths[i] = $(v).attr('wd')*edittransactionwidth/100;
        $(v).width(widths[i]);
    });
    
    $("#roomtable2").find('tbody tr').children().each(function(i, v) {
        $(v).width(widths[i]);
    });
    */
   
   $("#itemizelist").on('click',function(){ refreshFoliolist(<%=rroom.getReservationroomid()%>); });
   $("#hideunposted").on('click',function(){ refreshFoliolist(<%=rroom.getReservationroomid()%>); });
   $("#hidevoid").on('click',function(){ refreshFoliolist(<%=rroom.getReservationroomid()%>); });
   
   $("#folio_folioid").on('change',function(){ refreshFoliolist(<%=rroom.getReservationroomid()%>); });
   
   $("#folio_actiontype").on("change",function(){
        var action = $("#folio_actiontype").val();
        var h = jQuery("#listfolio").jqGrid().getGridParam('height');
        //alert(h);
        if(action == 5) {
            $("#folio_extra0").show();
            $("#folio_extra1").show();
            $("#folio_extra2").show();
            h = h-40;
            jQuery("#listfolio").jqGrid().setGridParam({height: h}).trigger("reloadGrid");
        } else {
            $("#folio_extra0").hide();
            $("#folio_extra1").hide();
            $("#folio_extra2").hide();
            h = h+40;
            jQuery("#listfolio").jqGrid().setGridParam({height: h});
        } 
        $.post("content/ajax/getactions.jsp",{ actiontype: action },function(data){
            $("#folio_actionvalue").html(data);
        });
        
   });
   
   $("#folio_actionvalue").on("change",function(){
       var action = $("#folio_actiontype").val();
       var aval = $("#folio_actionvalue").val();
       if(action == 4){
           $.post("content/ajax/getBeanPars.jsp",{ objname: "Discount", id: aval },function(data){
                //console.log(data);
            },"json");
       }
   });
   
   $("#folio_extra0").hide();
   $("#folio_extra1").hide();
   $("#folio_extra2").hide();
   
   jQuery('#listfolio').jqGrid(
    {
        url:'content/getfoliolist.jsp?reservationroomid=<%=rroom.getReservationroomid()%>&itemize=true&folioid=<%=folios[0].getFolioid()%>&hideunposted=false&hidevoid=false',
        datatype: 'xml',
        colNames:['ოთახი', 'თარიღი', 'ნომერი', 'ტიპი', 'აღწერა', 'მომხმარებელი','მოქმედება','','ფასი','st'],
        colModel:[
            {width: 80, hidden:false, name:'roomnumber', index:'roomnumber', align:'left'},
            {width: 100, hidden:false, name:'itemdate', index:'itemdate', align:'left'},
            {width: 100, hidden:false, name:'number', index:'number', align:'center'},
            {width: 150, hidden:false, name:'type', index:'type', align:'left'},
            {width: 200, hidden:false, name:'descr', index:'descr', align:'left'},
            {width: 120, hidden:false, name:'regby', index:'regby', align:'left'},
            {width: 100, hidden:false, name:'act', index:'act', align:'center'},
            {width: 40, hidden:false, name:'curr', index:'curr', align:'right'},
            {width: 50, hidden:false, name:'price', index:'price', align:'right'},
            {hidden:true, name:'st', index:'st'}
        ],
        rowNum:2000,
        height: height,
        autowidth: true,
        sortname: 'name',
        viewrecords: true,
        sortorder: 'asc',
        //altRows: true,
        //altclass: 'altrow',
        multiselect: true,
        loadComplete: function() {
            var rows = $("#listfolio").getDataIDs();
            var totbal = 0;
            for (var i = 0; i < rows.length; i++)
            {
                var st = $("#listfolio").getCell(rows[i],"st");
                if(st == "0"){
                    $("#listfolio").jqGrid('setRowData',rows[i],false, {color: '#949090'});
                    jQuery("#jqg_listfolio_"+rows[i]).hide();
                }
                var price = Number($("#listfolio").getCell(rows[i],"price"));
                
                totbal += price;
            }
            $("#listfolio td").css('border-right-style', 'none').css('border-left-style', 'none');
            
            $("#folio_total_balance").html(totbal.toFixed(2));
        }
        })
        .jqGrid('bindKeys')
	//.navButtonAdd('#pager1',{caption:'',buttonicon:'ui-icon-circle-plus',onClickButton: function(){ setInsurance(jQuery('#listcurrency').jqGrid('getGridParam','selrow')); },position:'last'})
	;
	$('.ui-jqgrid-sortable').css('white-space', 'normal');
	$('.ui-jqgrid-sortable').css('height', 'auto');
   
        $("#jqgh_listfolio_roomnumber").css('text-align', 'left');
        $("#jqgh_listfolio_itemdate").css('text-align', 'left');
        $("#jqgh_listfolio_number").css('text-align', 'left');
        $("#jqgh_listfolio_type").css('text-align', 'left');
        $("#jqgh_listfolio_descr").css('text-align', 'left');
        $("#jqgh_listfolio_regby").css('text-align', 'left');
        $("#jqgh_listfolio_price").css('text-align', 'right');

        //$("#listfolio").jqGrid().setGridParam({height: 1700}).trigger("reloadGrid");

});
</script>
<div id="foliotab" style="height: 100%;">
    <table width="100%" style="border-color: #BEBEBE; border-style: solid; border-width: 1px;">
        <tr>
            <td style="padding-left: 5px; width: 80px;"><b>თარიღი</b></td>
            <td style="padding-left: 5px; width: 120px;">
                <input class="span2" style="width: 100px;" value="<%=dt.format(dclosedate)%>" readonly="" type="text" id="foliodate">
            </td>
            <td style="padding-left: 5px; width: 100px;"><b>ტიპი</b></td>
            <td style="padding-left: 5px; width: 350px;" nowrap>
                <select class="dropdown" name="folio_actiontype" id="folio_actiontype" style="width: 150px;">
                    <option value="-1">--აირჩიეთ--</option>
                    <%
                    for(int i=0;i<folioactiontype.length;i++){
                    %>
                    <option value="<%=i%>"><%=folioactiontype[i]%></option>
                    <%
                    }
                    %>
                </select>
                <select class="dropdown" name="folio_actionvalue" id="folio_actionvalue" style="width: 150px;">
                    <option value="-1">--აირჩიეთ--</option>
                </select>
            </td>
            <td style="padding-left: 5px; width: 80px;"><b>თანხა</b></td>
            <td style="padding-left: 5px; width: 300px;">
                <select class="dropdown" name="folio_currencyid" id="folio_currencyid" style="width: 50px;">
                    <%
                    for(int i=0;i<currencies.length;i++){
                        String sel = "";
                        if(currencies[i].getCurrencyid().intValue() == maincurrency.getCurrencyid().intValue())
                            sel = "selected";
                    %>
                    <option value="<%=currencies[i].getCurrencyid()%>" <%=sel%>><%=currencies[i].getCode()%></option>
                    <%
                    }
                    %>
                </select>
                <input class="" type="text" id="folio_amount" style="width: 100px;">
            </td>
            <td style="padding-left: 5px; width: 50px;" id="folio_extra0"><b>რაოდ.</b></td>
            <td style="padding-right: 5px;" id="folio_extra1">
                <input class="" type="text" id="folio_qty" style="width: 80px;">
            </td>
        </tr>
        <tr>
            <td style="padding-left: 5px; width: 80px;"><b>ვაუჩერი</b></td>
            <td style="padding-left: 5px; width: 120px;">
                <input class="" type="text" id="folio_voucher" style="width: 100px;">
            </td>
            <td style="padding-left: 5px; width: 80px;"><b>კომენტარი</b></td>
            <td style="padding-left: 5px; width: 350px;">
                <input class="" type="text" id="folio_comment" style="width: 305px;">
            </td>
            <td style="padding-left: 5px; width: 80px;"><b>ფოლიო</b></td>
            <td style="padding-left: 5px; width: 300px;">
                <select class="dropdown" name="folio_folioid" id="folio_folioid" style="width: 250px;">
                    <%if(folios.length > 1){%>
                    <option value="-1">--აირჩიეთ--</option>
                    <%}
                    for(int i=0;i<folios.length;i++){
                        String folioname = folios[i].getNum();
                        if(folios[i].getGuestid() != null){
                            GuestBean guest = GuestManager.getInstance().loadByPrimaryKey(folios[i].getGuestid());
                            SalutationBean slt = SalutationManager.getInstance().loadByPrimaryKey(guest.getSalutationid());
                            folioname += " - "+slt.getName()+" "+guest.getFname()+" "+guest.getLname();
                        } else if(folios[i].getContragentid() != null) {
                            ContragentBean contr = ContragentManager.getInstance().loadByPrimaryKey(folios[i].getContragentid());
                            folioname += " - "+contr.getName();
                        } else {
                            
                        }
                        %>
                        <option value="<%=folios[i].getFolioid()%>"><%=folioname%></option>
                        <%
                    }
                    %>
                </select>
            </td>
            <td></td>
            <td style="text-align: right; padding-right: 5px;">
                <button style="width: 80px; margin-top: 2px;" onclick="addFolioitem()" type="button" class="btn btn-sm btn-danger navbar-btn">დამატება</button>
            </td>
        </tr>
        <tr style="height: 27px;" id="folio_extra2">
            <td style="padding-left: 5px; width: 80px;"><b>ფასდაკლება</b></td>
            <td style="padding-left: 5px; width: 120px;">
                <select class="dropdown" name="folio_discountid" id="folio_discountid" style="width: 100px;">
                    <option value="-1">--აირჩიეთ--</option>
                    <%
                    for(int i=0;i<discounts.length;i++){
                    %>
                    <option value="<%=discounts[i].getDiscountid()%>"><%=discounts[i].getName()%></option>
                    <%
                    }
                    %>
                </select>
            </td>
            <td style="padding-left: 5px; width: 100px;"><b>ოდენობა</b></td>
            <td style="padding-left: 5px; width: 350px;" nowrap>
                <input class="" type="text" id="folio_discount_amount" style="width: 100px;">
            </td>
            <td style="padding-left: 5px; width: 80px;"></td>
            <td style="padding-left: 5px; width: 300px;">
                
            </td>
            <td style="padding-left: 5px; width: 50px;"></td>
            <td style="padding-right: 5px;">
                
            </td>
        </tr>
    </table>
    <table id='listfolio' width='100%' align='center'></table>
    <table width="100%" style="border-color: #BEBEBE; border-style: solid; border-width: 1px;">
        <tr>
            <td style="background-color: #E9E9E9; width: 80px; border-right-color: #BEBEBE; border-right-style: solid; border-right-width: 1px; padding-left: 5px;">
                არჩეულზე
            </td>
            <td class='pseudobutton' style="background-color: #F9F9F9; text-align: center; width: 80px; border-right-color: #BEBEBE; border-right-style: solid; border-right-width: 1px;">
                <b>გაუქმება</b>
            </td>
            <td class='pseudobutton' style="background-color: #F9F9F9; text-align: center; width: 80px; border-right-color: #BEBEBE; border-right-style: solid; border-right-width: 1px;">
                <b>გადატანა</b>
            </td>
            <td style="background-color: #E9E9E9; text-align: center; width: 400px; border-right-color: #BEBEBE; border-right-style: solid; border-right-width: 1px;" nowrap>
                <input type="checkbox" class="allitems" name="itemizelist" id="itemizelist" value="yes" checked/>
                <label for="itemizelist"><b>დაჯგუფება</b></label>&nbsp;&nbsp;&nbsp;
                <input type="checkbox" class="allitems" name="hidevoid" id="hidevoid" value="yes"/>
                <label for="hidevoid"><b>გაუქმ. დამალვა</b></label>&nbsp;&nbsp;&nbsp;
                <input type="checkbox" class="allitems" name="hideunposted" id="hideunposted" value="yes"/>
                <label for="hideunposted"><b>შეუსრ. დამალვა</b></label>
                
            </td>
            <td style="background-color: #E9E9E9; text-align: left; color: red; font-size: 11px; padding-left: 5px;">
                <b>*გამოყენებულია დამატებითი მომსახურებები</b>
            </td>
            <td style="background-color: #E9E9E9; text-align: right; color: #E13B27; font-size: 16px; padding-right: 15px;">
                <b>ბალანსი: <%=maincurrency.getCode()%> <span id="folio_total_balance"><%=dc.format(tot)%></span></b>
            </td>
        </tr>
    </table>
    <table width="100%" style="border-color: #BEBEBE; border-style: solid; border-width: 1px;">
        <tr>
            <td class='pseudobutton' onclick="printFolio($('#folio_folioid').val())" style="background-color: #F9F9F9; text-align: center; width: 70px; border-right-color: #BEBEBE; border-right-style: solid; border-right-width: 1px;">
                <b>ბეჭდვა</b>
            </td>
            <td class='pseudobutton' style="background-color: #F9F9F9; text-align: center; width: 70px; border-right-color: #BEBEBE; border-right-style: solid; border-right-width: 1px;">
                <b>გაყოფა</b>
            </td>
            <td class='pseudobutton' style="background-color: #F9F9F9; text-align: center; width: 70px; border-right-color: #BEBEBE; border-right-style: solid; border-right-width: 1px;">
                <b>ახალი</b>
            </td>
            <td class='pseudobutton' style="background-color: #F9F9F9; text-align: center; width: 90px; border-right-color: #BEBEBE; border-right-style: solid; border-right-width: 1px;">
                <b>გადამხდელი</b>
            </td>
            <td style="background-color: #E9E9E9; text-align: right; color: red; font-size: 11px; padding-right: 5px;">
                <b>დააჭირეთ ოპერაციების ღილაკს დამატებითი ოპერაციებისათვის</b>
            </td>
            <td style="background-color: #E9E9E9; text-align: right; width: 150px; padding-right: 40px;">
                <div class="btn-group">
                    <button type="button" class="btn btn-md btn-primary dropdown-toggle" data-toggle="dropdown" id="service">ოპერაციები <span class="glyphicon glyphicon-chevron-down"></span></button>
                    <ul class="dropdown-menu" style="background-color: #F9F9F9; width: 50px;">
                        <li><a href="javascript:alert('');">ფოლიო</a></li>
                        <li><a href="javascript:alert('');">გადასახადები</a></li>
                        <li><a href="javascript:alert('');">მიკვლევა</a></li>
                    </ul>
                </div>
            </td>
        </tr>
    </table>
</div>
