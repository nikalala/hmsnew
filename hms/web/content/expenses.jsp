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
</style>
<%

panel dl0 = new panel();
dl0.readFromFile(basedir+"/content/templates/expenses_contact.json");

panel pl1 = new panel();
pl1.readFromFile(basedir+"/content/templates/expenses_voucher.json");

panel pl2 = new panel();
pl2.readFromFile(basedir+"/content/templates/expenses_charges.json");

panel pl3 = new panel();
pl3.readFromFile(basedir+"/content/templates/expenses_payments.json");

dialog dl1 = new dialog();
dl1.readFromFile(basedir+"/content/templates/guestprofile_geninfo_guest.json");
dialog dl2 = new dialog();
dl2.readFromFile(basedir+"/content/templates/guestprofile_geninfo.json");

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
%>
<link rel="stylesheet" type="text/css" href="css/grid-filter.css">

<script type="text/javascript">
    
    function saveGuestprofileGeninfo(){
        var contragenttype = $("#contragenttype").val();
        var params = {<%=dl2.getParams().replaceAll("\n","")%>,contragenttype: contragenttype};
        if(contragenttype == 4) params = {<%=dl1.getParams().replaceAll("\n","")%>,contragenttype: contragenttype};
        
        $.post(
            "content/saveGuestprofileGeninfo.jsp",
            params,
            function(data){
                if(data.result == 0)    BootstrapDialog.alert(data.error);
                else {
                    $currentmodal.close();
                }
            },
            "json");
    }
    
    function addContact(){
        var contragenttype = $("#contragenttype").val();
        if(contragenttype == 4){
        <%=dl1.draw()%>
        }else{
        <%=dl2.draw()%>
        }
    }
    
    function searchContact(){
        
    }
    

    $(document).ready(function () {
        loadDefaults();
        drawFooterExp();
    });

    function drawFooterExp(){
        var html =
        '<div class="gridfooter expfooter" style="height: 80px !important;">' +
        '<div class="col-md-16" style="height: 30px; background: #E9E9E9; border: 1px solid #C8C8C8;">'+
        '<span class="pull-right" style="margin: 7px;"><b style="color: red;">ბალანსი</b></span>'+
        '</div>' +
        '<div>' +
        '<a class="pull-right btn btn-default" style="font-weight: bold; float: right; margin: 9px 10px 0 0;">გაუქმება</a>'+
        '<a class="pull-right btn btn-danger" style="font-weight: bold; float: right; margin: 9px 10px 0 0;">შენახვა</a>' +
        '</div></div>';


        var panel = $("#centercontent .panel")[0];
        var pwidth = $(panel).width();
        $(".gridfooter").remove();
        var panelheading = $(panel).find(".panel-heading")[0];
        $("#centerTabContent").css("height",$(panel).height()-panelheading);
        $("#centerTabContent").append(html);
        $(".expfooter").css("width",pwidth+"px","!important");

    }

    function loadDefaults() {
//        $('.date').datepicker(<%=pickerformat1%>);
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

</script>

<form name="filter-form" id="filter-form">
    <div class="row" style="margin-bottom: 0px; padding-left: 5px;  padding-right: 5px;">
        <div class="col-md-16" style="height: 15px;">
            <table class="table table-condensed table-bordered" width="100%" cellspacing="0" id="transaction-title" style="background-color: #FFFFFF; margin-top: 2px; margin-bottom: 2px;">
                <tbody>
                    <tr>
                        <td align="left" style="font-size: 12px; border: none;"><b style="padding-left: 10px; color: #598904"> რეჟიმი: <span style="color: #598904">...</span></b></td>
                        <td align="center" style="font-size: 12px; border: none;"><button type="button" class="btn btn-default" id="addnewexps"
                                style="border: 0; font-weight: bold; float: right; color: black; font-weight: bold; padding: 1px 10px;">
                            ახლის დამატება
                        </button></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    
    <div class="row" style="margin-top: 10px; margin-bottom: 0px; padding-left: 5px;  padding-right: 5px;">
        <div class="col-md-7" style="height: 145px;" id="expenses_contactinfo">
            <%=dl0.drawpanel()%>
        </div>
        <div class="col-md-9" style="height: 145px;">
            <%=pl1.drawpanel()%>
        </div>
    </div>

    <div class="row" style="margin-top: 10px; margin-bottom: 0px; padding-left: 5px;  padding-right: 5px;">
        <div class="col-md-16">
            <%=pl2.drawpanel()%>
        </div>
    </div>
        
    <div class="row" style="margin-top: 0px; margin-bottom: 0px; padding-left: 5px;  padding-right: 5px;">
        <div class="col-md-16">
            <%=pl3.drawpanel()%>
        </div>
    </div>    
</form>
