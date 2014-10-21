<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
ReservationroomBean rroom = ReservationroomManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("reservationroomid")));
ReservationBean reserv = ReservationManager.getInstance().loadByPrimaryKey(rroom.getReservationid());
GuestBean guest = GuestManager.getInstance().loadByPrimaryKey(rroom.getGuestid());
boolean edit = true;
String mode = request.getParameter("mode");
if(mode != null && mode.equalsIgnoreCase("add"))
    edit = false;
SalutationBean[] salutations = SalutationManager.getInstance().loadByWhere("order by name");
CountryBean[] countries = CountryManager.getInstance().loadByWhere("order by name");
IdtypeBean[] idtypes = IdtypeManager.getInstance().loadByWhere("order by name");
VipstatusBean[] vipstatuses = VipstatusManager.getInstance().loadByWhere("order by name");
NationalityBean[] nationalities = NationalityManager.getInstance().loadByWhere("order by name");
String guestaddress = "";
String guestcity = "";
String guestzip = "";
String guestname = "";
String guestemail = "";
String guestphone = "";
String guestmobile = "";
String guestfax = "";
String guestidn = "";
if(edit){
    guestaddress = guest.getAddress();
    guestcity = guest.getCity();
    guestzip = guest.getZip();
    guestname = guest.getFname()+" "+guest.getLname();
    guestemail = guest.getEmail();
    guestphone = guest.getPhone();
    guestmobile = guest.getMobile();
    guestfax = guest.getFax();
    guestidn = guest.getIdn();
}
String gends = "";
for(int i=0;i<gender.length;i++){
    gends = "editguestinfo_gender"+i+",";
}
%>
<script>
    function remEditGuestName(){
        $("#editguestinfo_salutationid").val(0);
        $("#editguestinfo_address").val("");
        $("#editguestinfo_city").val("");
        $("#editguestinfo_zip").val("");
        $("#editguestinfo_countryid").val(0);
        $("#editcontacttinfo_email").val("");
        $("#editcontacttinfo_phone").val("");
        $("#editcontacttinfo_mobile").val("");
        $("#editcontacttinfo_fax").val("");
        $("#editguestinfo_idtypeid").val(0);
        $("#editguestinfo_idn").val("");
        $("#editguestinfo_nationalityid").val("");
        $("#editguestinfo_vipstatusid").val("");
        $("#editguestinfo_guestid").val(0);
        $('#editguestinfo_name').val('');
        $('#editguestinfo_name').focus();
        <%for(int i=0;i<gender.length;i++){%>$("#editguestinfo_gender<%=i%>").prop("checked",false);<%}%>
    }
    
    $(document).ready(function(){
        $("#mediummodalsave").remove();
        $("#mediummodal .modal-footer").append("<button type=\"button\" class=\"btn btn-primary\" id='mediummodalsave' onclick=\"savedataprefix('mediummodal','editguestinfo_')\">შენახვა</button>");
    });
</script>
<input type="hidden" id="editguestinfo_action" value="updateguestinfo.jsp?reservationroomid=<%=rroom.getReservationroomid()%>"/>
<input type="hidden" id="editguestinfo_controls" value="<%=gends%>editguestinfo_vipstatusid,editguestinfo_nationalityid,editguestinfo_idn,editguestinfo_idtypeid,editcontactinfo_fax,editcontactinfo_mobile,editcontactinfo_phone,editcontactinfo_email,editguestinfo_name,editguestinfo_guestid,editguestinfo_salutationid,editguestinfo_address,editguestinfo_city,editguestinfo_zip,editguestinfo_countryid"/>
<input type="hidden" id="editguestinfo_callbackurl" value="content/guestinfo.jsp?reservationroomid=<%=rroom.getReservationroomid()%>"/>
<input type="hidden" id="editguestinfo_callbackdata" value="guestinfo"/>
<input type="hidden" id="editguestinfo_guestid" value="<%=(guest != null) ? guest.getGuestid():"0"%>"/>
<table width="100%" align=" center">
    <tr>
        <td align="center" valign="top">
                        <table class="table table-borderless table-condensed">
                <tr>
                    <td class="tbllabel">სახელი</td>
                    <td>
                        <form class="form-inline" role="form">
                        <div class="form-group">
                            <div class="input-group">
                                <select class="form-control dropdown" name="editguestinfo_salutationid" id="editguestinfo_salutationid" style="width: 50px; padding: 2px 2px; font-size: 12px; line-height: 1.5;">
                                    <%
                                    for(int i=0;i<salutations.length;i++){
                                        String sel = "";
                                        if(edit && guest.getSalutationid().intValue() == salutations[i].getSalutationid().intValue())
                                            sel = "selected";
                                    %>
                                    <option value="<%=salutations[i].getSalutationid()%>" <%=sel%>><%=salutations[i].getName()%></option>
                                    <%
                                    }
                                    %>
                                </select>
                                <div class="input-group">
                                    <input class="form-control" type="text" id="editguestinfo_name" value="<%=guestname%>" style="width: 150px;">
                                    <div class="input-group-addon glyphicon glyphicon-remove" style="color: red; cursor: pointer;" onclick="remEditGuestName()"></div>
                                    <div class="input-group-addon glyphicon glyphicon-search" style="cursor: pointer;" onclick="editNameSearch('editguestinfo_name',4,'edit')"></div>
                                </div>
                            </div>
                        </div>
                        </form>
                    </td>
                </tr>
                <tr>
                    <td class="tbllabel" valign="top">მისამართი</td>
                    <td valign="top">
                        <form class="form-inline" role="form">
                        <div class="form-group">
                            <div class="input-group-xs">
                                <textarea class="form-control" id="editguestinfo_address" rows="3" style="height: 40px !important; width: 265px;"><%=guestaddress%></textarea>
                            </div>
                        </div>
                        </form>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <form class="form-inline" role="form">
                        <div class="form-group">
                            <div class="input-group-xs">
                                <input class="form-control" type="text" id="editguestinfo_city" style="width: 135px;" placeholder="ქალაქი" value="<%=guestcity%>">
                                <input class="form-control" type="text" id="editguestinfo_zip" style="width: 127px;" placeholder="ინდექსი" value="<%=guestzip%>">
                            </div>
                        </div>
                        </form>
                    </td>
                </tr>
                <tr>
                    <td class="tbllabel">ქვეყანა</td>
                    <td>
                        <form class="form-inline" role="form">
                        <div class="form-group">
                            <div class="input-group-xs">
                                <select class="form-control dropdown" name="editguestinfo_countryid" id="editguestinfo_countryid" style="width: 265px;">
                                    <option value="0">--აირჩიეთ--</option>
                                    <%
                                    for(int i=0;i<countries.length;i++){
                                        String sel = "";
                                        if(edit && guest.getCountryid().intValue() == countries[i].getCountryid().intValue())
                                            sel = "selected";
                                    %>
                                    <option value="<%=countries[i].getCountryid()%>" <%=sel%>><%=countries[i].getName()%></option>
                                    <%
                                    }
                                    %>
                                </select>
                            </div>
                        </div>
                        </form>
                    </td>
                </tr>
            </table>
        </td>
        <td align="center" valign="top">
                        <table class="table table-borderless">
                <tr>
                    <td class="tbllabel" style="width: 50px;">ელფოსტა</td>
                    <td>
                        <form class="form-inline" role="form">
                        <div class="form-group">
                            <div class="input-group-xs">
                                <input class="form-control" type="text" id="editcontacttinfo_email" style="width: 190px;" value="<%=guestemail%>">
                            </div>
                        </div>
                        </form>
                    </td>
                </tr>
                <tr>
                    <td class="tbllabel" style="width: 50px;">ტელეფონი</td>
                    <td>
                        <form class="form-inline" role="form">
                        <div class="form-group">
                            <div class="input-group-xs">
                                <input class="form-control" type="text" id="editcontacttinfo_phone" style="width: 190px;" value="<%=guestphone%>">
                            </div>
                        </div>
                        </form>
                    </td>
                </tr>
                <tr>
                    <td class="tbllabel" style="width: 50px;">მობილური</td>
                    <td>
                        <form class="form-inline" role="form">
                        <div class="form-group">
                            <div class="input-group-xs">
                                <input class="form-control" type="text" id="editcontacttinfo_mobile" style="width: 190px;" value="<%=guestmobile%>">
                            </div>
                        </div>
                        </form>
                    </td>
                </tr>
                <tr>
                    <td class="tbllabel" style="width: 50px;">ფაქსი</td>
                    <td>
                        <form class="form-inline" role="form">
                        <div class="form-group">
                            <div class="input-group-xs">
                                <input class="form-control" type="text" id="editcontacttinfo_fax" style="width: 190px;" value="<%=guestfax%>">
                            </div>
                        </div>
                        </form>
                    </td>
                </tr>

            </table>
        </td>
    </tr>
    <tr>
        <td align="center" valign="top">
            <table class="table table-borderless table-condensed">
                <tr>
                    <td class="tbllabel">საბუთის ტიპი</td>
                    <td>
                        <form class="form-inline" role="form">
                        <div class="form-group">
                            <div class="input-group-xs">
                                <select class="form-control dropdown" name="editguestinfo_idtypeid" id="editguestinfo_idtypeid" style="width: 170px;">
                                    <option value="0">--აირჩიეთ--</option>
                                    <%
                                    for(int i=0;i<idtypes.length;i++){
                                        String sel = "";
                                        if(edit && guest.getIdtypeid() != null && guest.getIdtypeid().intValue() == idtypes[i].getIdtypeid().intValue())
                                            sel = "selected";
                                    %>
                                    <option value="<%=idtypes[i].getIdtypeid()%>" <%=sel%>><%=idtypes[i].getName()%></option>
                                    <%
                                    }
                                    %>
                                </select>
                                <input class="form-control" type="text" id="editguestinfo_idn" value="<%=guestidn%>" style="width: 80px;" placeholder="ნომერი">
                            </div>
                        </div>
                        </form>
                    </td>
                </tr>
                <tr>
                    <td class="tbllabel">ეროვნება</td>
                    <td valign="top">
                        <form class="form-inline" role="form">
                        <div class="form-group">
                            <div class="input-group-xs">
                        <select class="form-control dropdown" name="editguestinfo_nationalityid" id="editguestinfo_nationalityid" style="width: 252px;">
                            <option value="0">--აირჩიეთ--</option>
                            <%
                            for(int i=0;i<nationalities.length;i++){
                                String sel = "";
                                if(edit && guest.getNationalityid() != null && guest.getNationalityid().intValue() == nationalities[i].getNationalityid().intValue())
                                    sel = "selected";
                            %>
                            <option value="<%=nationalities[i].getNationalityid()%>" <%=sel%>><%=nationalities[i].getName()%></option>
                            <%
                            }
                            %>
                        </select>
                            </div>
                        </div>
                        </form>
                    </td>
                </tr>
            </table>
        </td>
        <td align="center" valign="top">
            <table class="table table-borderless table-condensed">
                <tr>
                    <td class="tbllabel">სქესი</td>
                    <td>
                        <form class="form-inline" role="form">
                        <div class="form-group">
                            <div class="input-group-xs">
                        <%
                        for(int i=0;i<gender.length;i++){
                            String sel = "";
                            if(edit && guest.getGender() != null && guest.getGender().intValue() == i)
                                sel = "checked";
                        
                        %>
                        <label class="radio-inline" style="height: 23px !important;">
                            <input type="radio" name="editguestinfo_gender" id="editguestinfo_gender<%=i%>" value="<%=i%>" <%=sel%>> <%=gender[i]%>
                        </label>
                        <%}%>
                            </div>
                        </div>
                        </form>
                    </td>
                </tr>
                <tr>
                    <td class="tbllabel">VIP სტატუსი</td>
                    <td>
                        <form class="form-inline" role="form">
                        <div class="form-group">
                            <div class="input-group-xs">
                        <select class="form-control dropdown" name="editguestinfo_vipstatusid" id="editguestinfo_vipstatusid" style="width: 252px;">
                            <option value="0">--აირჩიეთ--</option>
                            <%
                            for(int i=0;i<vipstatuses.length;i++){
                                String sel = "";
                                if(edit && guest.getVipstatusid() != null && guest.getVipstatusid().intValue() == vipstatuses[i].getVipstatusid().intValue())
                                    sel = "selected";
                            %>
                            <option value="<%=vipstatuses[i].getVipstatusid()%>" <%=sel%>><%=vipstatuses[i].getName()%></option>
                            <%
                            }
                            %>
                        </select>
                            </div>
                        </div>
                        </form>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

                    


