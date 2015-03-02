<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
long fid = 0;
int eid = 0;
ExtrachargefolioBean exb = null;
if(request.getParameter("fid") != null){
    fid = Long.parseLong(request.getParameter("fid"));
}
if(request.getParameter("xid") != null){
    eid = Integer.parseInt(request.getParameter("xid"));
}
if(eid > 0 && fid > 0)
    exb = ExtrachargefolioManager.getInstance().loadByPrimaryKey(fid, eid);

if(fid > 0){
    Vector v = new Vector();
    ExtrachargefolioBean[] exbs = ExtrachargefolioManager.getInstance().loadByWhere("where folioitemid in (select folioitemid from folioitem where folioid = "+fid+")");
    for(int i=0;i<exbs.length;i++)
        v.addElement((ExtrachargefolioBean)exbs[i]);
    session.setAttribute("WALKIN_EXTRACHARGES", (Vector)v);
    System.out.println("v1.size() = "+v.size());
}



ExtrachargeBean[] extracharges = ExtrachargeManager.getInstance().loadByWhere("where active = true and deleted = false order by ord");
%>
<script>
    
    function getExtrachargeList(){
        $.post(
            "content/ajax/getExtracharges.jsp",
            {

            },
            function(data){$("#walkin_extracharges").html(data);},
            "html"
        );
    }
    
    function editExtracharge(n){
        $.post(
                "content/ajax/saveextracharges.jsp",
                {
                    act: "get",
                    num: n
                },
                function(data){
                    if(data.result == 0) BootstrapDialog.alert(data.error);
                    else {
                        $("#wlakin_extrachargeid").val(data.extrachargeid);
                        $("#wlakin_extrachargerate").val(data.rate);
                        $("#wlakin_extrachargepostingtype").val(data.postingtype);
                        $("#wlakin_extrachargechargeapplieson").val(data.chargeapplyrieson);
                        $("#extrapar_0_val").val(data.adult);
                        $("#extrapar_1_val").val(data.child);
                        $("#extrapar_4_val").val(data.qty);
                        $("#extrapar_3_val1").val(data.adult);
                        $("#extrapar_3_val2").val(data.child);
                        $("#additionalservices_add").hide();
                        $("#additionalservices_rst").show();
                        $("#additionalservices_edt").attr("onclick","updExtracharge("+n+")");
                        $("#additionalservices_edt").show();
                        for(var i=0;i<5;i++){
                            if(i == data.chargeapplyrieson) $("#extrapar_"+i).show();
                            else $("#extrapar_"+i).hide();
                        }
                    }
                },
                "json"
            );
    }
    
    function updExtracharge(i){
        $.post(
                "content/ajax/saveextracharges.jsp",
                {
                    act: "edt",
                    num: i,
                    extrachargeid: $("#wlakin_extrachargeid").val(),
                    rate: $("#wlakin_extrachargerate").val(),
                    postingtype: $("#wlakin_extrachargepostingtype").val(),
                    chargeapplyrieson: $("#wlakin_extrachargechargeapplieson").val(),
                    adult: $("#extrapar_0_val").val(),
                    child: $("#extrapar_1_val").val(),
                    qty: $("#extrapar_4_val").val(),
                    adult1: $("#extrapar_3_val1").val(),
                    child1: $("#extrapar_3_val2").val()
                },
                function(data){
                    if(data.result == 0) BootstrapDialog.alert(data.error);
                    else {
                        $("#additionalservices_rst").hide();
                        $("#additionalservices_add").show();
                        $("#additionalservices_edt").hide();
                        resetExtracharge();
                        getExtrachargeList();
                    }
                },
                "json"
            );
    }
    
    function addExtracharge(){
        $.post(
                "content/ajax/saveextracharges.jsp",
                {
                    act: "add",
                    extrachargeid: $("#wlakin_extrachargeid").val(),
                    rate: $("#wlakin_extrachargerate").val(),
                    postingtype: $("#wlakin_extrachargepostingtype").val(),
                    chargeapplyrieson: $("#wlakin_extrachargechargeapplieson").val(),
                    adult: $("#extrapar_0_val").val(),
                    child: $("#extrapar_1_val").val(),
                    qty: $("#extrapar_4_val").val(),
                    adult1: $("#extrapar_3_val1").val(),
                    child1: $("#extrapar_3_val2").val()
                },
                function(data){
                    if(data.result == 0) BootstrapDialog.alert(data.error);
                    else {
                        resetExtracharge();
                        getExtrachargeList();
                    }
                },
                "json"
            );
    }
    
    function delExtracharge(i){
        $.post(
                "content/ajax/saveextracharges.jsp",
                {
                    act: "del",
                    num: i
                },
                function(data){
                    if(data.result == 0) BootstrapDialog.alert(data.error);
                    else {
                        getExtrachargeList();
                    }
                },
                "json"
            );
    }
    
    function resetExtracharge(){
        $("#wlakin_extrachargeid").val(0);
        $("#wlakin_extrachargerate").val("");
        $("#wlakin_extrachargepostingtype").val(-1);
        $("#wlakin_extrachargechargeapplieson").val(-1);
        $("#extrapar_0_val").val("");
        $("#extrapar_1_val").val("");
        $("#extrapar_4_val").val("");
        $("#extrapar_3_val1").val("");
        $("#extrapar_3_val2").val("");
        $("#additionalservices_add").show();
        $("#additionalservices_rst").hide();
        $("#additionalservices_edt").attr("onclick","");
        $("#additionalservices_edt").hide();
    }
    
    $(document).ready(function(){
        
        $("#mediummodalsave").remove();
        
        $("#extrapar_0").hide();
        $("#extrapar_1").hide();
        $("#extrapar_2").hide();
        $("#extrapar_3").hide();
        $("#extrapar_4").hide();
        
        $("#wlakin_extrachargechargeapplieson").change(function(){
            var val = $(this).val();
            for(var i=0;i<5;i++){
                if(i == val) $("#extrapar_"+i).show();
                else $("#extrapar_"+i).hide();
            }
        });
        
        $("#wlakin_extrachargeid").change(function(){
            var val = $(this).val();
            if(val != '0'){
                var vals = val.split("_");
                $("#wlakin_extrachargerate").val(vals[1]);
                $("#wlakin_extrachargerate").attr("readonly",false);
            } else {
                $("#wlakin_extrachargerate").val("");
                $("#wlakin_extrachargerate").attr("readonly",true);
            }
        });
        
        <%if(exb != null){%>
            $("#additionalservices_add").hide();
            $("#additionalservices_rst").show();
            $("#additionalservices_edt").show();
        <%}else{%>
            $("#additionalservices_add").show();
            $("#additionalservices_rst").hide();
            $("#additionalservices_edt").hide();
        <%}%>
        getExtrachargeList();
        
    });
    
</script>
<table class="table table-borderless">
    <tr>
        <td class="tbllabel" style=""><b>დამატებითი სერვისი</b></td>
        <td>
            <form class="form-inline" role="form">
            <div class="form-group">
                <div class="input-group-xs">
                    <select class="form-control dropdown" name="wlakin_extrachargeid" id="wlakin_extrachargeid" style="">
                        <option value="0">--აირჩიეთ--</option>
                        <%
                        for(int i=0;i<extracharges.length;i++){
                            double erate = extracharges[i].getRate().doubleValue();
                            String sel = "";
                            if(eid == extracharges[i].getExtrachargeid().intValue())
                                sel = "selected";
                        %>
                        <option value="<%=extracharges[i].getExtrachargeid()%>" <%=sel%>><%=extracharges[i].getName()%></option>
                        <%
                        }
                        %>
                    </select>
                </div>
            </div>
            </form>
        </td>
        <td class="tbllabel" style=""><b>ტარიფი</b></td>
        <td>
            <form class="form-inline" role="form">
            <div class="form-group">
                <div class="input-group-xs">
                    <input class="form-control" type="text" id="wlakin_extrachargerate" size="10" readonly="" style="" value="<%=(exb != null && exb.getRate() != null) ? dc.format(exb.getRate()):""%>">
                    <b><%=maincurrency.getCode()%></b>
                </div>
            </div>
            </form>
        </td>
    </tr>
    <tr>
        <td class="tbllabel" style=""><b>ტიპი</b></td>
        <td>
            <form class="form-inline" role="form">
            <div class="form-group">
                <div class="input-group-xs">
                    <select class="form-control dropdown" name="wlakin_extrachargepostingtype" id="wlakin_extrachargepostingtype" style="">
                        <option value="-1">--აირჩიეთ--</option>
                        <%
                        for(int i=0;i<extrachargepostingtype.length;i++){
                            String sel = "";
                            if(exb != null && exb.getPostingtype().intValue() == i)
                                sel = "selected";
                        %>
                        <option value="<%=i%>" <%=sel%>><%=extrachargepostingtype[i]%></option>
                        <%
                        }
                        %>
                    </select>
                </div>
            </div>
            </form>
        </td>
        <td colspan="2"></td>
    </tr>
    <tr>
        <td class="tbllabel" style=""><b>წესი</b></td>
        <td>
            <form class="form-inline" role="form">
            <div class="form-group">
                <div class="input-group-xs">
                    <select class="form-control dropdown" name="wlakin_extrachargechargeapplieson" id="wlakin_extrachargechargeapplieson" style="">
                        <option value="-1">--აირჩიეთ--</option>
                        <%
                        for(int i=0;i<chargeapplieson.length;i++){
                            String sel = "";
                            if(exb != null && exb.getChargeapplyrieson().intValue() == i)
                                sel = "selected";
                        %>
                        <option value="<%=i%>" <%=sel%>><%=chargeapplieson[i]%></option>
                        <%
                        }
                        %>
                    </select>
                </div>
            </div>
            </form>
        </td>
        <td colspan="2">
            <table id="extrapar_0">
                <tr>
                    <td class="tbllabel" style="padding-right: 10px;"><b>უფროსი</b></td>
                    <td>
                        <form class="form-inline" role="form">
                        <div class="form-group">
                            <div class="input-group-xs">
                                <input class="form-control" type="text" id="extrapar_0_val" size="3" style="">
                            </div>
                        </div>
                        </form>
                    </td>
                </tr>
            </table>
            <table id="extrapar_1">
                <tr>
                    <td class="tbllabel" style="padding-right: 10px;"><b>ბავშვი</b></td>
                    <td>
                        <form class="form-inline" role="form">
                        <div class="form-group">
                            <div class="input-group-xs">
                                <input class="form-control" type="text" id="extrapar_1_val" size="3" style="">
                            </div>
                        </div>
                        </form>
                    </td>
                </tr>
            </table>
            <table id="extrapar_2">
                <tr>
                    <td class="tbllabel" style=""></td>
                </tr>
            </table>
            <table id="extrapar_3">
                <tr>
                    <td class="tbllabel" style="padding-right: 10px;"><b>უფროსი</b></td>
                    <td>
                        <form class="form-inline" role="form">
                        <div class="form-group">
                            <div class="input-group-xs">
                                <input class="form-control" type="text" id="extrapar_3_val1" size="3" style="">
                            </div>
                        </div>
                        </form>
                    </td>
                    <td class="tbllabel" style="padding-left: 20px; padding-right: 10px;"><b>ბავშვი</b></td>
                    <td>
                        <form class="form-inline" role="form">
                        <div class="form-group">
                            <div class="input-group-xs">
                                <input class="form-control" type="text" id="extrapar_3_val2" size="3" style="">
                            </div>
                        </div>
                        </form>
                    </td>
                </tr>
            </table>
            <table id="extrapar_4">
                <tr>
                    <td class="tbllabel" style="padding-right: 10px;"><b>რაოდენობა</b></td>
                    <td>
                        <form class="form-inline" role="form">
                        <div class="form-group">
                            <div class="input-group-xs">
                                <input class="form-control" type="text" id="extrapar_4_val" size="3" style="">
                            </div>
                        </div>
                        </form>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr style="background-color: silver;">
        <td class="tbllabel" style="" colspan="4" align="right">
            <button type="button" class="btn btn-warning" id='additionalservices_rst' hidden="" onclick="resetExtracharge()">გაუქმება</button>
            <button type="button" class="btn btn-danger" id='additionalservices_edt' hidden="" onclick="">განახლება</button>
            <button type="button" class="btn btn-danger" id='additionalservices_add' onclick="addExtracharge()">დამატება</button>
        </td>
    </tr>
    <tr>
        <td class="tbllabel" id="walkin_extracharges" style="" colspan="4" align="right">
        </td>
    </tr>
</table>

