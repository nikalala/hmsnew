<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
long fid = 0;
int eid = 0;
long ftid = 0;
long rid = 0;
int n = 0;

FolioitemBean fbitem = null;
ExtrachargefolioBean exb = null;
FolioBean[] folios = new FolioBean[0];

if(request.getParameter("n") != null)
    n = Integer.parseInt(request.getParameter("n"));

if(request.getParameter("fid") != null){
    fid = Long.parseLong(request.getParameter("fid"));
    FolioBean folio = FolioManager.getInstance().loadByPrimaryKey(fid);
    folios = FolioManager.getInstance().loadByWhere("where reservationroomid = "+folio.getReservationroomid()+" order by reservationroomid");
}
if(request.getParameter("ftid") != null){
    ftid = Long.parseLong(request.getParameter("ftid"));
    fbitem = FolioitemManager.getInstance().loadByPrimaryKey(ftid);
    fid = fbitem.getFolioid().longValue();
    FolioBean folio = FolioManager.getInstance().loadByPrimaryKey(fid);
    folios = FolioManager.getInstance().loadByWhere("where reservationroomid = "+folio.getReservationroomid()+" order by reservationroomid");
}
if(request.getParameter("xid") != null){
    eid = Integer.parseInt(request.getParameter("xid"));
}


if(request.getParameter("reservationroomid") != null){
    //ReservationroomBean rb = ReservationroomManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("reservationroomid")));
    //ReservationBean rv = ReservationManager.getInstance().loadByPrimaryKey(rb.getReservationid());
    folios = FolioManager.getInstance().loadByWhere("where reservationroomid = "+request.getParameter("reservationroomid")+" order by reservationroomid");
    if(folios.length > 0)
        fid = folios[0].getFolioid().longValue();
}

if(eid > 0 && ftid > 0)
    exb = ExtrachargefolioManager.getInstance().loadByPrimaryKey(ftid, eid);


if(fid > 0){
    FolioBean folio = FolioManager.getInstance().loadByPrimaryKey(fid);
    rid = folio.getReservationroomid().longValue();
    Vector v = new Vector();
    ExtrachargefolioBean[] exbs = ExtrachargefolioManager.getInstance().loadByWhere("where folioitemid in (select folioitemid from folioitem where folioid in (select folioid from folio where reservationroomid = "+rid+")) order by extrachargeid");
    for(int i=0;i<exbs.length;i++)
        v.addElement((ExtrachargefolioBean)exbs[i]);
    session.setAttribute("WALKIN_EXTRACHARGES", (Vector)v);
}
//else session.removeAttribute("WALKIN_EXTRACHARGES");



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
                        <%if(folios.length > 1){%>
                        $("#wlakin_extrachargefolioid").val(data.folioid);
                        <%}%>
                        for(var i=0;i<5;i++){
                            if(i == data.chargeapplyrieson) $("#extrapar_"+i).show();
                            else $("#extrapar_"+i).hide();
                        }
                        <%if(folios.length > 1){%>
                        $(".folioclass0").show();
                        <%}%>
                        calcRate(false);
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
                    save: true,
                    num: i,
                    extrachargeid: $("#wlakin_extrachargeid").val(),
                    rate: $("#wlakin_extrachargerate").val(),
                    postingtype: $("#wlakin_extrachargepostingtype").val(),
                    chargeapplyrieson: $("#wlakin_extrachargechargeapplieson").val(),
                    adult: $("#extrapar_0_val").val(),
                    child: $("#extrapar_1_val").val(),
                    qty: $("#extrapar_4_val").val(),
                    adult1: $("#extrapar_3_val1").val(),
                    child1: $("#extrapar_3_val2").val(),
                    <%if(folios.length > 1){%>
                    folioid: $("#wlakin_extrachargefolioid").val()
                    <%} else {%>
                    folioid: <%=fid%>
                    <%}%>
                },
                function(data){
                    if(data.result == 0) BootstrapDialog.alert(data.error);
                    else {
                        $("#additionalservices_rst").hide();
                        $("#additionalservices_add").show();
                        $("#additionalservices_edt").hide();
                        resetExtracharge();
                        getExtrachargeList();
                        refreshExtrachargeList();
                        calcRate(false);
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
                    save: true,
                    extrachargeid: $("#wlakin_extrachargeid").val(),
                    rate: $("#wlakin_extrachargerate").val(),
                    postingtype: $("#wlakin_extrachargepostingtype").val(),
                    chargeapplyrieson: $("#wlakin_extrachargechargeapplieson").val(),
                    adult: $("#extrapar_0_val").val(),
                    child: $("#extrapar_1_val").val(),
                    qty: $("#extrapar_4_val").val(),
                    adult1: $("#extrapar_3_val1").val(),
                    child1: $("#extrapar_3_val2").val(),
                    <%if(folios.length > 1){%>
                    folioid: $("#wlakin_extrachargefolioid").val()
                    <%} else {%>
                    folioid: <%=fid%>
                    <%}%>
                },
                function(data){
                    if(data.result == 0) BootstrapDialog.alert(data.error);
                    else {
                        resetExtracharge();
                        getExtrachargeList();
                        //refreshExtrachargeList();
                        calcRate(false);
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
                        resetExtracharge();
                        getExtrachargeList();
                        refreshExtrachargeList();
                        calcRate(false);
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
        $(".folioclass0").hide();
        calcRate(false);
    }
    
    function calcRate(c){
        var exts = {};
        var extvals = {};
        <%
        for(int i=0;i<extracharges.length;i++){

            %>
            exts["<%=extracharges[i].getExtrachargeid()%>"] = <%=extracharges[i].getFixedprice()%>;
            extvals["<%=extracharges[i].getExtrachargeid()%>"] = <%=extracharges[i].getRate()%>;
            <%
        }
        %>


        var val = $("#wlakin_extrachargeid").val();
        if(exts[$("#wlakin_extrachargeid").val()] == true)
            $("#wlakin_extrachargerate").attr("readonly",true);
        else
            $("#wlakin_extrachargerate").attr("readonly",false);
        if(c)
            $("#wlakin_extrachargerate").val(extvals[$("#wlakin_extrachargeid").val()]);
        
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
            calcRate(true);
        });
        
        <%if(exb != null){%>
            $("#additionalservices_add").hide();
            $("#additionalservices_rst").show();
            $("#additionalservices_edt").show();
            var val = $("#wlakin_extrachargechargeapplieson").val();
            for(var i=0;i<5;i++){
                if(i == val) $("#extrapar_"+i).show();
                else $("#extrapar_"+i).hide();
            }
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
                        boolean rdonly = false;
                        for(int i=0;i<extracharges.length;i++){
                            double erate = extracharges[i].getRate().doubleValue();
                            String sel = "";
                            if(eid == extracharges[i].getExtrachargeid().intValue()){
                                if(extracharges[i].getFixedprice().booleanValue())
                                    rdonly = true;
                                sel = "selected";
                            }
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
                    <input class="form-control" type="text" id="wlakin_extrachargerate" size="10" style="" <%=(rdonly) ? "readonly=\"\"":""%> value="<%=(exb != null && exb.getRate() != null) ? dc.format(exb.getRate()):""%>">
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
        <%if(folios.length > 1){%>
        <td class="tbllabel folioclass0" style=""><b>ფოლიო</b></td>
        <td>
            <form class="form-inline" role="form">
            <div class="form-group folioclass0">
                <div class="input-group-xs">
                    <select class="form-control dropdown" name="wlakin_extrachargefolioid" id="wlakin_extrachargefolioid" style="">
                        <%
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
                            String sel = "";
                            if(fid == folios[i].getFolioid().longValue())
                                sel = "selected";
                        %>
                        <option value="<%=folios[i].getFolioid()%>" <%=sel%>><%=folioname%></option>
                        <%
                        }
                        %>
                    </select>
                </div>
            </div>
            </form>
        </td>
        <%}else{%>
        <td colspan="2"></td>
        <%}%>
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
                                <input class="form-control" type="text" id="extrapar_0_val" size="3" value="<%=(exb != null) ? exb.getAdult():""%>">
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
                                <input class="form-control" type="text" id="extrapar_1_val" size="3" value="<%=(exb != null) ? exb.getChild():""%>">
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
                                <input class="form-control" type="text" id="extrapar_3_val1" size="3" value="<%=(exb != null) ? exb.getAdult():""%>">
                            </div>
                        </div>
                        </form>
                    </td>
                    <td class="tbllabel" style="padding-left: 20px; padding-right: 10px;"><b>ბავშვი</b></td>
                    <td>
                        <form class="form-inline" role="form">
                        <div class="form-group">
                            <div class="input-group-xs">
                                <input class="form-control" type="text" id="extrapar_3_val2" size="3" value="<%=(exb != null) ? exb.getChild():""%>">
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
                                <input class="form-control" type="text" id="extrapar_4_val" size="3" value="<%=(exb != null) ? exb.getQty():""%>">
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
            <button type="button" class="btn btn-danger" id='additionalservices_edt' hidden="" onclick="updExtracharge(<%=n%>)">განახლება</button>
            <button type="button" class="btn btn-danger" id='additionalservices_add' onclick="addExtracharge()">დამატება</button>
        </td>
    </tr>
    <tr>
        <td class="tbllabel" id="walkin_extracharges" style="" colspan="4" align="right">
        </td>
    </tr>
</table>

