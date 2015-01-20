<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%
String type = request.getParameter("type");
ContragentBean[] specs = ContragentManager.getInstance().loadByWhere("where rate = 1 order by name, lname, fname");
PaymentmethodBean[] paymentmethods = PaymentmethodManager.getInstance().loadByWhere("where active = true and deleted = false order by name");
ContragentBean[] contragents = ContragentManager.getInstance().loadByWhere("where contragentid > 0 order by name, lname, fname");

RoomrateBean[] roomrates = RoomrateManager.getInstance().loadByWhere("order by ord");
ReservationtypeBean[] resrvationtypes = ReservationtypeManager.getInstance().loadByWhere("order by name");
%>
<script>
    $(document).ready(function(){
        
        
        $('#payinfo_spectype').hide();
        $('#payinfo_manualtype').hide();
        $("#pluss").hide();
        $("#payinfo_paymentmethodid").hide();
        $("#payinfo_paymentcontragentid").hide();
        
        
        $("input[name='payinfo_ratetype']").click( function(){
            
            var rtp = $(this).val();
            
            if(rtp == 0){
                $('#payinfo_spectype').hide();
                $('#payinfo_manualtype').hide();
                if($('#guestinfo_ratetypeid').val() > 0)
                    $('#walkin_set_rates').show();
            } else if(rtp == 1){
                $('#payinfo_spectype').show();
                $('#payinfo_manualtype').hide();
                if($('#payinfo_contragentid').val() == 0){
                    $('#walkin_set_rates').hide();
                } else {
                    if($('#guestinfo_ratetypeid').val() > 0)
                        $('#walkin_set_rates').show();
                }
            } else if(rtp == 2){
                $('#payinfo_spectype').hide();
                $('#payinfo_manualtype').show();
                if($('#guestinfo_ratetypeid').val() > 0)
                    $('#walkin_set_rates').show();
            }
            
        });
        
        $("#payinfo_contragentid").change(function(){
            if($(this).val() == 0)  $('#walkin_set_rates').hide();
            else {
                if($('#guestinfo_ratetypeid').val() > 0)
                    $('#walkin_set_rates').show();
            }
        });
        
        $("#pluss").click(function(){
            var reason = $("#guestinfo_taxid").val().trim();
            if(reason == '')    BootstrapDialog.alert("ჩაწერეთ გადასახადის გამოკლების მიზეზი");
            else newsWindow1('taxexempt','გადასახადის გამორთვა','')
        });
        
        $("#payinfo_notax").click(function(){
            if($(this).is(':checked')){
                $("#guestinfo_taxid").attr("readonly",false);
                //$("#pluss").show();
            } else {
                $("#guestinfo_taxid").attr("readonly",true);
                //$("#pluss").hide();
            }
        });
        
        $("input[name='payinfo_paymentmode']").click(function(){
            
            var rtp = $(this).val();
            if(rtp == 0){
                $("#payinfo_paymentmethodid").show();
                $("#payinfo_paymentcontragentid").hide();
            } else if(rtp == 1){
                $("#payinfo_paymentmethodid").hide();
                $("#payinfo_paymentcontragentid").show();
            }
        });
        
        $("#payinfo_hasrelesedate").click(function(){
            if($(this).is(':checked')){
                $("#payinfo_relesedate").attr("readonly",false);
                $("#payinfo_relesedate").datepicker(<%=pickerformat2%>).on('changeDate', function(ev){
                    $("#payinfo_term").attr("readonly",false);
                    $("#payinfo_relesedate").datepicker("hide");
                    $("#payinfo_term").focus();
                    
                    $("#payinfo_relesedate").click(function(){
                        $("#payinfo_relesedate").datepicker("show");
                    });
                });
                $("#payinfo_relesedate").datepicker("show");
            } else {
                $("#payinfo_relesedate").attr("readonly",true);
                $("#payinfo_term").attr("readonly",true);
                $("#payinfo_relesedate").unbind();
                $("#payinfo_relesedate").val("");
            }
        });
        
        
        
    });
</script>
<table class="table table-borderless table-condensed">
    <tr>
        <td class="tbllabel" style="width: 60px;">ტარიფი</td>
        <td style="" colspan="2">
            <form class="form-inline" role="form">
            <div class="form-group">
                <div class="input-group-xs">
                    <%
                    for(int i=0;i<ratetype.length;i++){
                        String sel = "";
                        if(i == 0)  sel = "checked";
                    %>
                    <label class="radio-inline" style="height: 23px !important;">
                        <input type="radio" name="payinfo_ratetype" id="payinfo_ratetype<%=i%>" value="<%=i%>" <%=sel%>> <%=ratetype[i]%>
                    </label>
                    <%}%>
                </div>
            </div>
            </form>
        </td>
        <td style="width: 120px;">
            <form class="form-inline" role="form">
                <div class="form-group">
                    <div class="input-group-xs" id="payinfo_spectype">
                        <select class="form-control dropdown" name="payinfo_contragentid" id="payinfo_contragentid" style="width: 95px;">
                            <option value="0">--აირჩიეთ--</option>
                            <%
                            for(int i=0;i<specs.length;i++){
                                String cname = specs[i].getName();
                                if(specs[i].getType().intValue() == 0)
                                    cname = specs[i].getFname()+" "+specs[i].getLname();
                            %>
                            <option value="<%=specs[i].getContragentid()%>"><%=cname%></option>
                            <%
                            }
                            %>
                        </select>
                    </div>
                    <div class="input-group-xs" id="payinfo_manualtype">
                        <input class="form-control" type="text" id="guestinfo_manual" style="width: 70px;">
                        <label class="checkbox-inline" style="height: 23px !important;">
                            <input type="checkbox" name="payinfo_tax" id="payinfo_tax" value="notax"> TAX
                        </label>
                    </div>
                </div>
            </form>
        </td>
    </tr>
    <tr>
        <td class="tbllabel">გადამხდელი</td>
        <td valign="top">
            <form class="form-inline" role="form">
                <div class="form-group">
                    <div class="input-group-xs">
                        <select class="form-control dropdown" name="payinfo_billto" id="payinfo_billto" style="width: 170px;">
                            <option value="-1">--აირჩიეთ--</option>
                            <%
                            for(int i=0;i<billto.length;i++){
                            %>
                            <option value="<%=i%>"><%=billto[i]%></option>
                            <%
                            }
                            %>
                        </select>
                    </div>
                </div>
            </form>
        </td>
        <td valign="top">
            <form class="form-inline" role="form">
                <div class="form-group">
                    <div class="input-group-xs">
                        <label class="checkbox-inline" style="height: 23px !important;">
                            <input type="checkbox" name="payinfo_notax" id="payinfo_notax" value="notax"> 
                            <span class="tbllabel">TAX გარეშე</span>
                        </label>
                    </div>
                </div>
            </form>
        </td>
        <td>
            <form class="form-inline" role="form">
                <div class="form-group">
                    <div class="input-group-xs">
                        <input class="form-control" placeholder="მიზეზი" readonly="" type="text" id="guestinfo_taxid" style="width: 90px;">
                        <button type="button" class="btn btn-xs btn-success glyphicon glyphicon-plus" id="pluss"></button>
                    </div>
                </div>
            </form>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <form class="form-inline" role="form">
            <div class="form-group">
                <div class="input-group-xs">
                    <span class="tbllabel" style="padding-right: 5px;">გადახდის მეთოდი</span>
                    <%
                    for(int i=0;i<paymentmode.length;i++){
                    %>
                    <label class="radio-inline" style="height: 23px !important;">
                        <input type="radio" name="payinfo_paymentmode" id="payinfo_paymentmode<%=i%>" value="<%=i%>"> <%=paymentmode[i]%>
                    </label>
                    <%}%>
                </div>
            </div>
            </form>
        </td>
        <td colspan="2">
            <form class="form-inline" role="form">
                <div class="form-group">
                    <div class="input-group-xs" id="payinfo_paymentmethods">
                        <select class="form-control dropdown" name="payinfo_paymentmethodid" id="payinfo_paymentmethodid" style="width: 195px;">
                            <option value="0">--აირჩიეთ--</option>
                            <%
                            for(int i=0;i<paymentmethods.length;i++){
                            %>
                            <option value="<%=paymentmethods[i].getPaymentmethodid()%>"><%=paymentmethods[i].getName()%></option>
                            <%
                            }
                            %>
                        </select>
                        <select class="form-control dropdown" name="payinfo_paymentcontragentid" id="payinfo_paymentcontragentid" style="width: 195px;">
                            <option value="0">--აირჩიეთ--</option>
                            <%
                            for(int i=0;i<contragents.length;i++){
                                String cname = contragents[i].getName();
                                if(contragents[i].getType().intValue() == 0)
                                    cname = contragents[i].getFname()+" "+contragents[i].getLname();
                            %>
                            <option value="<%=contragents[i].getContragentid()%>"><%=cname%></option>
                            <%
                            }
                            %>
                        </select>
                    </div>
                </div>
            </form>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <form class="form-inline" role="form">
                <div class="form-group">
                    <div class="input-group-xs">
                        <label class="checkbox-inline" style="height: 23px !important;">
                            <input type="checkbox" name="payinfo_hasrelesedate" id="payinfo_hasrelesedate" value="yes"> 
                            <span class="tbllabel" style="padding-right: 5px;">რელიზის თარიღი</span>
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group-xs">
                        <div class="input-append date" data-date="" data-date-format="dd-MM-yyyy">
                            <input class="span2 form-control" size="10" value="" readonly="" type="text" id="payinfo_relesedate">
                        </div>
                    </div>
                </div>
            </form>
        </td>
        <td class="tbllabel" align="right">პირობა</td>
        <td>
            <form class="form-inline" role="form">
                <div class="form-group">
                    <div class="input-group">
                        <input class="form-control" type="text" id="payinfo_term" readonly="" style="width: 60px;">
                        <div class="input-group-addon">%</div>
                    </div>
                </div>
            </form>
        </td>
    </tr>
</table>