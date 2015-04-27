<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>
<style>
    .header_select{
        width: 200px !important;
        float: right;
        margin-top: -6px;
        margin-right: 10px;
    }
    .bootstrap-select:not([class*="col-"]):not([class*="form-control"]):not(.input-group-btn) {
        width: 100% !important;
    }
    .ui-jqgrid tr.footrow-ltr td {
    border-right-width: 0px;
}
</style>
<%

    long folioid = 0;
    FolioBean folio = null;
    if(request.getParameter("folioid") != null) folioid = Long.parseLong(request.getParameter("folioid"));
    
    if(folioid > 0)
        folio = FolioManager.getInstance().loadByPrimaryKey(folioid);
    
    
    panel dl0 = new panel();
    dl0.readFromFile(basedir+"/content/templates/expenses_contact.json");
    
    session.setAttribute("PANEL0", (panel)dl0);
    
    panel pl1 = new panel();
    pl1.readFromFile(basedir+"/content/templates/expenses_voucher.json");
    
    panel pl2 = new panel();
    pl2.readFromFile(basedir+"/content/templates/expenses_charges.json");
    
    panel pl3 = new panel();
    pl3.readFromFile(basedir+"/content/templates/expenses_payments.json");

    session.removeAttribute("PAYMENTS_EXPENCES_LIST_WHERE");
    session.removeAttribute("EXPENCES_LIST_WHERE");
    session.removeAttribute("CHARGES_LIST_WHERE");
    
    double bal = 0;
    
if(folioid > 0){
        String addr = "";
        String mobile = "";
        String phone = "";
        String email = "";
        if(folio.getGuestid() != null)  {
            addr = getGuestName(folio.getGuestid().longValue());
            GuestBean guest = GuestManager.getInstance().loadByPrimaryKey(folio.getGuestid());
            addr += "<br>"+guest.getAddress()+"<br>";
            if(guest.getCity() != null && guest.getCity().length() > 0) addr += guest.getCity()+", ";
            if(guest.getZip() != null && guest.getZip().length() > 0) addr += guest.getZip()+"<br>";
            if(guest.getCountryid() != null){
                CountryBean country = CountryManager.getInstance().loadByPrimaryKey(guest.getCountryid());
                addr += country.getName();
            }
            mobile = guest.getMobile();
            phone = guest.getPhone();
            email = guest.getEmail();
        }
        if(folio.getContragentid() != null)     {
            addr = getContragentName(folio.getContragentid().longValue());
            ContragentBean contragent = ContragentManager.getInstance().loadByPrimaryKey(folio.getContragentid());
            addr += "<br>"+contragent.getAddress()+"<br>";
            if(contragent.getCity() != null && contragent.getCity().length() > 0) addr += contragent.getCity()+", ";
            if(contragent.getZip() != null && contragent.getZip().length() > 0) addr += contragent.getZip()+"<br>";
            if(contragent.getCountryid() != null){
                CountryBean country = CountryManager.getInstance().loadByPrimaryKey(contragent.getCountryid());
                addr += country.getName();
            }
            mobile = contragent.getMobile();
            phone = contragent.getPhone();
            email = contragent.getEmail();
        }
        Vector v = dl0.getPanelitems();
        for(int i=0;i<v.size();i++){
            panelitem pl = (panelitem)v.elementAt(i);
            if(pl.getId().equalsIgnoreCase("expenses_contact_address")) pl.setLabel(addr);
            if(pl.getId().equalsIgnoreCase("expenses_contactinfo_moble")) pl.setLabel(mobile);
            if(pl.getId().equalsIgnoreCase("expenses_contactinfo_phone")) pl.setLabel(phone);
            if(pl.getId().equalsIgnoreCase("expenses_contactinfo_email")) pl.setLabel(email);
        }
        
        v = pl1.getPanelitems();
        PaymentBean[] pm = PaymentManager.getInstance().loadByWhere("where folioid = "+folioid+" limit 1");
        if(pm.length > 0){
            PersonnelBean prs = PersonnelManager.getInstance().loadByPrimaryKey(pm[0].getRegbyid());
            for(int i=0;i<v.size();i++){
                panelitem pl = (panelitem)v.elementAt(i);
                if(pl.getId().equalsIgnoreCase("expenses_voucher_nom")) pl.setVal(pm[0].getVoucherno());
                if(pl.getId().equalsIgnoreCase("expenses_voucher_created")) pl.setVal(prs.getFname()+" "+prs.getLname());
                if(pl.getId().equalsIgnoreCase("expenses_voucher_date")) pl.setVal(dt.format(pm[0].getPaydate()));
                if(pl.getId().equalsIgnoreCase("expenses_voucher_paym")) pl.setVal(pm[0].getPaymentmethodid().toString());
            }
        }
        
        session.setAttribute("PAYMENT_INFO_MAIN", (PaymentBean)pm[0]);
        
        String where = "where folioid = "+folioid+" and particular = 2 and paymentid is not null order by itemdate";
        FolioitemBean[] folios1 = FolioitemManager.getInstance().loadByWhere(where);
        session.setAttribute("EXPENCES_LIST_WHERE", (FolioitemBean[])folios1);
        
        where = "where folioid = "+folioid+" and particular = 8 order by itemdate";
        FolioitemBean[] folios2 = FolioitemManager.getInstance().loadByWhere(where);
        session.setAttribute("CHARGES_LIST_WHERE", (FolioitemBean[])folios2);
        
        where = "where folioid = "+folioid+" order by paydate";
        PaymentBean[] payments = PaymentManager.getInstance().loadByWhere(where);
        session.setAttribute("PAYMENTS_EXPENCES_LIST_WHERE", (PaymentBean[])payments);
        
        bal = getSum("select sum(amount) from folioitem where folioid = "+folioid+" and particular = 8")
                +
                getSum("select sum(amount) from folioitem where folioid = "+folioid+" and particular in (1,2) and paymentid is not null");
        
    } else {
        Vector v = pl1.getPanelitems();
        for(int i=0;i<v.size();i++){
            panelitem pl = (panelitem)v.elementAt(i);
            if(pl.getId().equalsIgnoreCase("expenses_voucher_nom")) pl.setVal("ახალი");
            if(pl.getId().equalsIgnoreCase("expenses_voucher_created")) pl.setVal(user.getFname()+" "+user.getLname());
            if(pl.getId().equalsIgnoreCase("expenses_voucher_date")) pl.setVal(dt.format(dclosedate));
        }
    }

    String panel1 = pl1.drawpanel();
    String panel2 = pl2.drawpanel();
    String panel3 = pl3.drawpanel();


    dialog dl1 = new dialog();
    dl1.readFromFile(basedir+"/content/templates/guestprofile_geninfo_guest.json");
    String dialog1 = dl1.draw();
    
    dialog dl2 = new dialog();
    dl2.readFromFile(basedir+"/content/templates/guestprofile_geninfo.json");
    String dialog2 = dl2.draw();

    String selectbox = "<a href=\"#\" class=\"glyphicon glyphicon-search iconblack\" onclick=\"searchContact()\" style=\"text-decoration: none; padding-left: 10px; padding-right: 10px; top: 1px; float:right;\" data-toggle=\"ძებნა\"></a>"
            + "<a href=\"#\" onclick=\"addContact()\" class=\"glyphicon glyphicon-plus iconblack\" style=\"text-decoration: none; top: 1px; float:right;\" data-toggle=\"დამატება\"></a>"
            + "<div class=\"header_select\"><select class=\"dropdown\" id=\"contragenttype\">";
    for (int i = 0; i < contragenttype.length - 1; i++) {
        if(i == 1)  continue;
        String selected = "";
        if (i == 4) {
            selected = "selected='selected'";
        } else {
            selected = "";
        }
        selectbox += "<option value=\""+i+"\" "+selected+">"+contragenttype[i]+"</option>";
    }
    selectbox += "</select></div>";
    dl0.setTitle(dl0.getTitle()+selectbox);
    String panel0 = dl0.drawpanel();
    
    String modename = "დამატება";
    if(folioid > 0)
        modename = "რედაქტირება "+folio.getNum();
    
    System.out.println(pl3.getScript());
%>
<link rel="stylesheet" type="text/css" href="css/grid-filter.css">

<script type="text/javascript">

    function saveGuestprofileGeninfo(){
        var contragenttype = $("#contragenttype").val();
        var params = {<%=dl2.getParams().replaceAll("\n","")%>,contragenttype: contragenttype,ses:"PANEL0"};
    if(contragenttype == 4) params = {<%=dl1.getParams().replaceAll("\n","")%>,contragenttype: contragenttype,ses:"PANEL0"};

    $.post(
            "content/saveGuestprofileGeninfo.jsp",
            params,
            function(data){
                if(data.result == 0)    BootstrapDialog.alert(data.error);
                else {
                    $.post("content/draw.jsp",{ act: "panel", ses: "PANEL0" },function(data){ $("#expenses_contactinfo").html(data); });
                    $currentmodal.close();
                    if(data.type == 0){
                        $("#exp_contragentid").val(0);
                        $("#exp_guestid").val(data.id);
                    } else {
                        $("#exp_contragentid").val(data.id);
                        $("#exp_guestid").val(0);
                    }
                }
            },
            "json");
    }

    function addContact(){
        var contragenttype = $("#contragenttype").val();
        if(contragenttype == 4){
            <%=dialog1%>
        }else{
            <%=dialog2%>
        }
    }

    function openSearch(){
        var contragenttype = $("#contragenttype").val();
        extramodal00("contactSearch", "კონტაქტის ძებნა", "term=&cid=" + contragenttype + "&prefix=aaa");
    }
    
    function cancelRowClickSelection(rowid, e) 
    {
     var target=e.originalTarget;
     var str=target.innerHTML;
     if(target.classList!=null && target.classList!="undefined" && target.classList[0]!=null && target.classList[0]!="undefined")
     {
      if(target.classList[0]=="cbox")
      {
       return true;
      }
     }
     if(str.indexOf("input")!=-1 || str.indexOf("INPUT")!=-1)
     {
      return true;
     }
     return false; 
    }


    $(document).ready(function () {
        loadDefaults();
        drawFooterExp();
        
        <%=pl1.getScript()%>
        <%=pl2.getScript()%>
        <%=pl3.getScript()%>
            
        jQuery("#expenseslist1").jqGrid("setGridParam", {
            beforeSelectRow: function(rowid, e) { cancelRowClickSelection(rowid, e); },
            loadComplete: function(rowid, status) {
                var userdata1 = jQuery("#expenseslist1").jqGrid('getGridParam', 'userData' );
                var userdata2 = jQuery("#expenseslist2").jqGrid('getGridParam', 'userData' );
                var bal = Number(userdata1.amount)+Number(userdata2.amount);
                $("#bal").html("ბალანსი "+bal.toFixed(2));
                var rows = $("#expenseslist1").getDataIDs(); 
                for (var i = 0; i < rows.length; i++)
                {
                    var vd = $("#expenseslist1").getCell(rows[i],"z");
                    if(vd == "true")    $("#expenseslist1").jqGrid('setRowData',rows[i],false, {'text-decoration': 'line-through'});
                }
            }
        });
        
        jQuery("#expenseslist2").jqGrid("setGridParam", {
            beforeSelectRow: function(rowid, e) { cancelRowClickSelection(rowid, e); },
            loadComplete: function(rowid, status) {
                var userdata1 = jQuery("#expenseslist1").jqGrid('getGridParam', 'userData' );
                var userdata2 = jQuery("#expenseslist2").jqGrid('getGridParam', 'userData' );
                var bal = Number(userdata1.amount)+Number(userdata2.amount);
                $("#bal").html("ბალანსი "+bal.toFixed(2));
                var rows = $("#expenseslist2").getDataIDs(); 
                for (var i = 0; i < rows.length; i++)
                {
                    var vd = $("#expenseslist2").getCell(rows[i],"z");
                    if(vd == "true")    $("#expenseslist2").jqGrid('setRowData',rows[i],false, {'text-decoration': 'line-through'});
                }
            }
        });
        
        });
        

    function drawFooterExp(){
        var html =
                '<div class="gridfooter expfooter" style="height: 80px !important;">' +
                '<div class="col-md-16" style="height: 30px; background: #E9E9E9; border: 1px solid #C8C8C8;">'+
                '<span class="pull-right" style="margin: 7px;"><b style="color: red;" id="bal">ბალანსი <%=dc.format(bal)%></b></span>'+
                '</div>' +
                '<div>' +
                '<a class="pull-right btn btn-default" style="font-weight: bold; float: right; margin: 9px 10px 0 0;" onclick="cancelExpences()">გაუქმება</a>'+
                '<a class="pull-right btn btn-danger" style="font-weight: bold; float: right; margin: 9px 10px 0 0;" onclick="saveExpences(<%=folioid%>)">შენახვა</a>' +
                '</div></div>';


        var panel = $("#centerTabContent");
        var pwidth = $("#centerTabContent").width();
        $(".gridfooter").remove();
        var panelheading = $(panel).find(".panel-heading")[0];
        $("#centerTabContent").css("height",$(panel).height()-panelheading);
        $("#centerTabContent").append(html);
        $(".expfooter").css("width",pwidth+"px","!important");

    }

    function loadDefaults() {
//        $('.date').datepicker(< %=pickerformat1%>);
        $('select').selectpicker();
        $("#grid-table label").each(function () {
            $(this).css("float", "right", "!important");
            $(this).css("line-height", "27px", "!important");
        });
        $("#filter-form input[type='text']").css("width", "100%", "!important");
        $(".date input[type='text']").css("position", "relative");
        $("#res1").css("margin", "0px 10px 10px 10px");
        $("#grid-table").width($("#filter-form").width());
    }

    function cancelExpences(){
        getBody('expencesleft','expenses','ხარჯები','res1','',true);
    }
    
    function saveExpences(id){
        $.post(
            "content/saveexpences.jsp",
            {
                oper: "save",
                voucher_nom: $("#expenses_voucher_nom").val(),
                voucher_date: $("#expenses_voucher_date").val(),
                voucher_paym: $("#expenses_voucher_paym").val(),
                contragentid: $("#exp_contragentid").val(),
                guestid: $("#exp_guestid").val(),
                folioid: id
            },
            function(data){
                if(data.result == 0)    BootstrapDialog.alert(data.error);
                else {
                    getBody('expencesleft','expenses','ხარჯები','res1','',true);
                }
            },
            "json"
        );
    }
    
    
    function addCharges(){
        $.post(
            "content/savecharges.jsp",
            {
                type: $("#expenses_charges_type").val(),
                currencyid: $("#expenses_charges_currencyid").val(),
                amount: $("#expenses_charges_amount").val(),
                voucherno: $("#expenses_charges_voucherno").val(),
                comment: $("#expenses_charges_comment").val(),
                folioid: <%=folioid%>
            },
            function(data){
                if(data.result == 0)    BootstrapDialog.alert(data.error);
                else {
                    $("#expenseslist1").trigger("reloadGrid");
                }
            },
            "json"
        );
    }
    
    function addPayments(){
        $.post(
            "content/savepayments.jsp",
            {
                type: $("#expenses_payments_type").val(),
                currencyid: $("#expenses_payments_currency").val(),
                amount: $("#expenses_payments_amount").val(),
                voucherno: $("#expenses_payments_voucherno").val(),
                comment: $("#expenses_payments_comment").val(),
                folioid: <%=folioid%>
            },
            function(data){
                if(data.result == 0)    BootstrapDialog.alert(data.error);
                else {
                    $("#expenseslist2").trigger("reloadGrid");
                }
            },
            "json"
        );
    }
    
    function voidPayments(){
        var ids = jQuery("#expenseslist2").jqGrid ('getGridParam', 'selarrrow');
        alert(ids);
        console.log(ids);
        if(ids.length > 0)
        $.post(
            "content/voidexpences.jsp",
            {
                ses: "EXPENCES_LIST_WHERE",
                ids: ids.toString()
            },
            function(data){
                if(data.result == 0)    BootstrapDialog.alert(data.error);
                else {
                    $("#expenseslist2").trigger("reloadGrid");
                }
            },
            "json"
        );
    }
    
    function voidCharges(){
        var ids = jQuery("#expenseslist1").jqGrid ('getGridParam', 'selarrrow');
        alert(ids);
        console.log(ids);
        if(ids.length > 0)
        $.post(
            "content/voidexpences.jsp",
            {
                ses: "CHARGES_LIST_WHERE",
                ids: ids.toString()
            },
            function(data){
                if(data.result == 0)    BootstrapDialog.alert(data.error);
                else {
                    $("#expenseslist1").trigger("reloadGrid");
                }
            },
            "json"
        );
    }

</script>

<form name="filter-form" id="filter-form">
    <input type="hidden" name="exp_contragentid" id="exp_contragentid" value='0'/>
    <input type="hidden" name="exp_guestid" id="exp_guestid" value='0'/>
    <div class="row" style="margin-bottom: 0px; padding-left: 5px;  padding-right: 5px;">
        <div class="col-md-16" style="height: 15px;">
            <table class="table table-condensed table-bordered" width="100%" cellspacing="0" id="transaction-title" style="background-color: #FFFFFF; margin-top: 2px; margin-bottom: 2px;">
                <tbody>
                <tr>
                    <td align="left" style="font-size: 12px; border: none;"><b style="padding-left: 10px; color: #598904"> რეჟიმი: <span style="color: #598904"><%=modename%></span></b></td>
                    <%--td align="center" style="font-size: 12px; border: none;">
                        <button type="button" class="btn btn-default" id="addnewexps" onclick="cancelExpences()" style="border: 0; font-weight: bold; float: right; color: black; font-weight: bold; padding: 1px 10px;">
                        ახლის დამატება
                        </button>
                    </td--%>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

    <div class="row" style="margin-top: 10px; margin-bottom: 0px; padding-left: 5px;  padding-right: 5px;">
        <div class="col-md-7" style="height: 145px;" id="expenses_contactinfo">
            <%=panel0%>
        </div>
        <div class="col-md-9" style="height: 145px;">
            <%=panel1%>
        </div>
    </div>

    <div class="row" style="margin-top: 10px; margin-bottom: 0px; padding-left: 5px;  padding-right: 5px;">
        <div class="col-md-16">
            <%=panel2%>
        </div>
    </div>

    <div class="row" style="margin-top: 0px; margin-bottom: 0px; padding-left: 5px;  padding-right: 5px;">
        <div class="col-md-16">
            <%=panel3%>
        </div>
    </div>
</form>
