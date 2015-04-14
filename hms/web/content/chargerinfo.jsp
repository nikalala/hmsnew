<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<%
    PayoutBean[] payoutBeans = PayoutManager.getInstance().loadByWhere("");
    CurrencyBean[] currencyBeans = CurrencyManager.getInstance().loadByWhere("");
    DiscountBean[] discountBeans = DiscountManager.getInstance().loadByWhere("");
%>
<script>
    $(document).ready(function () {

        var height = 142;
        if(maincontentheight > 654){
            var diff = maincontentheight - 654;
            height = 143+diff;
        }

        $("#currnumber, #vouchernum, #valuenumbe").ForceNumericOnly();
        $(".btn-group").css("width", "100%", "!important");
        $("#voucher-panel-body label").each(function () {
            $(this).css("float", "right", "!important");
            $(this).css("line-height", "27px", "!important");
        });
        $("#voucher-panel-body input").height($("#voucher-panel-body .btn-group").height() - 6, "!important");
        $("#voucher-panel-body input[type='text']").css("width", "100%", "!important");


        jQuery('#list_chargesGrid').jqGrid(
                {
                    url:'content/getcharges.jsp',
                    datatype: 'xml',
                    colNames:['Sr. #', 'RefNo', 'Particular', 'Comment', 'Amount'],
                    colModel:[
                        {width: 120, hidden:false, name:'srno', index:'srno', align:'left'},
                        {width: 120, hidden:false, name:'refno', index:'refno', align:'left'},
                        {width: 120, hidden:false, name:'particular', index:'particular', align:'left'},
                        {width: 160, hidden:false, name:'comment', index:'comment', align:'left'},
                        {width: 120, hidden:false, name:'amount', index:'amount', align:'left'}
                    ],
                    gridComplete : function(){
                        $("#gbox_list_chargesGrid").css("float","left");
                        $("#gbox_list_chargesGrid .ui-jqgrid-sdiv").width(0);
                        $("#gbox_list_chargesGrid .ui-jqgrid-bdiv").css("height","auto");
                        $("#gbox_list_chargesGrid").parent().height($("#gbox_list_chargesGrid").height() + $("#gbox_list_chargesGrid").parent().height());
                    },
                    loadComplete : function(){
                        $("#gbox_list_chargesGrid").css("float","left");
                        $("#gbox_list_chargesGrid .ui-jqgrid-sdiv").width(0);
                        $("#gbox_list_chargesGrid .ui-jqgrid-bdiv").css("height","auto");
                        $("#gbox_list_chargesGrid").parent().height($("#gbox_list_chargesGrid").height() + $("#gbox_list_chargesGrid").parent().height());
                    },
                    rowNum:2000,
                    autowidth: true,
                    sortname: 'srno',
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
        ;
        $('.ui-jqgrid-sortable').css('white-space', 'normal');
        $('.ui-jqgrid-sortable').css('height', 'auto');

        $("#jqgh_list_chargesGrid_srno").css('text-align', 'left');
        $("#jqgh_list_chargesGrid_refno").css('text-align', 'left');
        $("#jqgh_list_chargesGrid_particular").css('text-align', 'left');
        $("#jqgh_list_chargesGrid_comment").css('text-align', 'left');
        $("#jqgh_list_chargesGrid_amount").css('text-align', 'left');

    });

    $("#discount").on('change', function () {
        var element = $("option:selected", this);
        var openbal = element.attr("openbal");
        var openprice = element.attr("openprice");
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

    });
</script>
<div class="panel-heading" style="height: 26px;">
    <h3 class="panel-title">
        <div class="span-header" style="margin: 0;">დაკისრებული გადასახადი</div>
    </h3>
</div>
<div class="panel-body" id="voucher-panel-body" style="height:130px;">
    <div style="width:100%; float: left;">
        <div class="col-md-1">
            <label class="pull-left">ტიპი</label>
        </div>
        <div class="col-md-3">
            <select name="payout" class="dropdown">
                <option value="">--აირჩიეთ--</option>
                <% for (PayoutBean item : payoutBeans) { %>
                <option value="<%=item.getPayoutid()%>"><%=item.getName()%>
                </option>
                <% } %>
            </select>
        </div>
        <div class="col-md-1" style="padding-left: 15px;">
            <label class="pull-left">თანხა</label>
        </div>
        <div class="col-md-1">
            <select name="currency" class="dropdown">
                <% for (CurrencyBean item : currencyBeans) { %>
                <option value="<%=item.getCurrencyid()%>" <% if (item.getBasic()) { %>
                        selected="selected" <% } %>><%=item.getName()%>
                </option>
                <% } %>
            </select>
        </div>
        <div class="col-md-2">
            <input type="text" id="currnumber" name="currnumber"/>
        </div>
        <div class="col-md-1">
            <label class="pull-left" style="padding-left: 15px;">Rec/Vou#</label>
        </div>
        <div class="col-md-2">
            <input type="text" id="vouchernum" name="vouchernum"/>
        </div>
        <div class="col-md-2">
            <label class="pull-left" style="padding-left: 15px;">კომენტარი</label>
        </div>
        <div class="col-md-3">
            <input type="text" id="comment" name="comment"/>
        </div>
    </div>
    <div style="width:100%; float: left;">
        <div class="col-md-1">
            <label class="pull-left">ფასდაკლება</label>
        </div>
        <div class="col-md-3">
            <select name="discount" id="discount" class="dropdown">
                <option value="">--აირჩიეთ--</option>
                <% for (DiscountBean item : discountBeans) { %>
                <option value="<%=item.getDiscountid()%>" openbal="<%=item.getOpen()%>"
                        openprice="<%=item.getVal()%>"><%=item.getName()%>
                </option>
                <% } %>
            </select>
        </div>
        <div class="col-md-1" id="disc-first" style="display: none; padding-left: 15px;">
            <label class="pull-left">ოდენობა</label>
        </div>
        <div class="col-md-2" id="disc-second" style="display: none;">
            <input type="text" id="valuenumbe" name="valuenumbe"/>
        </div>
        <div class="col-md-1" style="padding-left: 15px;">
            <button type="button" class="btn btn-default" id="btnExport"
                    style="border: 0; color: #0F83D7; color:#FFF; font-weight: bold; float: left; margin: 3px 5px 0 0; background-color: #0F83D7 !important;">
                დამატება
            </button>
        </div>
        <div class="col-md-1">
        </div>
        <div class="col-md-1">
        </div>
        <div class="col-md-2">
        </div>
        <div class="col-md-3">
        </div>
    </div>
    <table id='list_chargesGrid' class="table-striped table-hover" align='center'></table>
    <div align="center" id="grid-footer"
         style="background: transparent; width: 100%;height: 33px;line-height: 33px; margin:0 auto; float: left;">
        <div style="margin: 10px 0 10px 0;background-color: #E9E9E9 !important;border-color: #C8C8C8 !important;-webkit-border-radius: 3px;-moz-border-radius: 3px;border-radius: 3px; height: 33px;">
            <div style="margin-left: 6px;line-height: 33px;font-family: BGMtavr;float: left;">მონიშნულის</div>
            <div style="margin-left: 4px;line-height: 33px;float: left;background-color: #FAFAFA;padding-left: 10px;padding-right: 10px;border-left: solid 1px #D0D0D0;
            border-right: solid 1px #D0D0D0;font-family: BGMtavr;color: #0F83D7;font-weight: bold;">წაშლა
            </div>
        </div>
    </div>
</div>