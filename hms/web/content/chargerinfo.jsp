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
        $("#currnumber, #vouchernum, #valuenumbe").ForceNumericOnly();
        $(".btn-group").css("width", "100%", "!important");
        $("#voucher-panel-body label").each(function () {
            $(this).css("float", "right", "!important");
            $(this).css("line-height", "27px", "!important");
        });
        $("#voucher-panel-body input").height($("#voucher-panel-body .btn-group").height() - 6, "!important");
        $("#voucher-panel-body input[type='text']").css("width", "100%", "!important");
        $("#res1").css("margin", "0px 10px 10px 10px");

    });

    $("#discount").on('change', function () {
        var element = $("option:selected", this);
        var openbal = element.attr("openbal");
        var openprice =  element.attr("openprice");
        if(isNullOrEmpty($(this).val()))
        {
            $("#disc-first, #disc-second").hide();
            return;
        }else{
            $("#disc-first, #disc-second").show();
        }
        if(openbal === "true")
        {
            console.log("dasdasdas");
            $("#valuenumbe").prop('disabled',false);
            $("#valuenumbe").html("");
            $("#valuenumbe").val("");
        }else{
            $("#valuenumbe").val(openprice);
            $("#valuenumbe").attr('disabled',true);
        }

    });
</script>
<div class="panel-heading" style="height: 34px;">
    <h3 class="panel-title">
        <div class="span-header">დაკისრებული გადასახადი</div>
    </h3>
</div>
<div class="panel-body" id="voucher-panel-body" style="height:130px;">
    <div style="width:100%; float: left;">
        <div class="col-md-1">
            <label>ტიპი</label>
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
        <div class="col-md-1">
            <label>თანხა</label>
        </div>
        <div class="col-md-2">
            <select name="currency" class="dropdown">
                <% for (CurrencyBean item : currencyBeans) { %>
                <option value="<%=item.getCurrencyid()%>" <% if (item.getBasic()) { %>
                        selected="selected" <% } %>><%=item.getName()%>
                </option>
                <% } %>
            </select>
        </div>
        <div class="col-md-1">
            <input type="text" id="currnumber" name="currnumber"/>
        </div>
        <div class="col-md-2">
            <label>Rec/Vou#</label>
        </div>
        <div class="col-md-1">
            <input type="text" id="vouchernum" name="vouchernum"/>
        </div>
        <div class="col-md-2">
            <label>კომენტარი</label>
        </div>
        <div class="col-md-3">
            <input type="text" id="comment" name="comment"/>
        </div>
    </div>
    <div style="width:100%; float: left;">
        <div class="col-md-1">
            <label>ფასდაკლება</label>
        </div>
        <div class="col-md-3">
            <select name="discount" id="discount" class="dropdown">
                <option value="">--აირჩიეთ--</option>
                <% for (DiscountBean item : discountBeans) { %>
                <option value="<%=item.getDiscountid()%>" openbal="<%=item.getOpen()%>" openprice="<%=item.getVal()%>"><%=item.getName()%>
                </option>
                <% } %>
            </select>
        </div>
        <div class="col-md-1" id="disc-first" style="display: none;">
            <label>value</label>
        </div>
        <div class="col-md-2" id="disc-second" style="display: none;">
            <input type="text" id="valuenumbe" name="valuenumbe"/>
        </div>
        <div class="col-md-2">
            <button type="button" class="btn btn-default" id="btnExport"
                    style="border: 0; font-family: BGMtavr; color: #0F83D7; color:#FFF; font-weight: bold; float: left; margin: 3px 5px 0 0; background-color: #0F83D7 !important;">
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
</div>