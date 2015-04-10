<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
boolean edit = true;
SalutationBean[] salutations = SalutationManager.getInstance().loadByWhere("order by name");
CountryBean[] countries = CountryManager.getInstance().loadByWhere("order by name");
IdtypeBean[] idtypes = IdtypeManager.getInstance().loadByWhere("order by name");
VipstatusBean[] vipstatuses = VipstatusManager.getInstance().loadByWhere("order by name");
NationalityBean[] nationalities = NationalityManager.getInstance().loadByWhere("order by name");
String guestaddress = "";
String guestcity = "";
String guestzip = "";
String guestfname = "";
String guestlname = "";
String guestemail = "";
String guestphone = "";
String guestmobile = "";
String guestfax = "";
String guestidn = "";
String gends = "";
for(int i=0;i<gender.length;i++){
    gends = "editcontactinfo_gender"+i+",";
}

Vector v = new Vector();

panelitem pi = new panelitem();
pi.setId("editcontactinfo_salutationid");
pi.setLabel("");
pi.setSize1(20);
pi.setSql("select salutationid, name from salutation order by name");
pi.setType(2);
pi.setVal("");
pi.setX(0);
pi.setY(0);
v.addElement((panelitem)pi);

pi = new panelitem();
pi.setId("editcontactinfo_fname");
pi.setLabel("სახელი");
pi.setSize1(20);
pi.setSql("");
pi.setType(0);
pi.setVal("");
pi.setX(1);
pi.setY(0);
v.addElement((panelitem)pi);

pi = new panelitem();
pi.setId("editcontactinfo_lname");
pi.setLabel("გვარი");
pi.setSize1(20);
pi.setSql("");
pi.setType(0);
pi.setVal("");
pi.setX(2);
pi.setY(0);
v.addElement((panelitem)pi);

pi = new panelitem();
pi.setId("editcontactinfo_adultchild");
pi.setLabel("უფროსი/ბავშვი");
pi.setSql("");
pi.setValues(pax);
pi.setType(3);
pi.setVal("");
pi.setX(0);
pi.setY(1);
v.addElement((panelitem)pi);

pi = new panelitem();
pi.setId("editcontactinfo_gender");
pi.setLabel("სქესი");
pi.setSql("");
pi.setValues(gender);
pi.setType(3);
pi.setVal("");
pi.setX(0);
pi.setY(2);
v.addElement((panelitem)pi);

pi = new panelitem();
pi.setId("editcontactinfo_nationality");
pi.setLabel("ეროვნება");
pi.setSql("select nationalityid, name from nationality order by name");
pi.setType(3);
pi.setVal("");
pi.setX(0);
pi.setY(3);
v.addElement((panelitem)pi);

pi = new panelitem();
pi.setId("editcontactinfo_idnum");
pi.setLabel("ეროვნება");
pi.setSize1(20);
pi.setSql("");
pi.setType(0);
pi.setVal("");
pi.setX(1);
pi.setY(3);
v.addElement((panelitem)pi);

panel pl = new panel();
pl.setClassnames("");
pl.setHeight("350");
pl.setId("geninfo");
pl.setTitle("ზოგადი ინფორმაცია");
pl.setPanelitems(v);
%>
<script>
    function remEditGuestName(){
        $("#editcontactinfo_salutationid").val(0);
        $("#editcontactinfo_address").val("");
        $("#editcontactinfo_city").val("");
        $("#editcontactinfo_zip").val("");
        $("#editcontactinfo_countryid").val(0);
        $("#editcontactinfo_email").val("");
        $("#editcontactinfo_phone").val("");
        $("#editcontactinfo_mobile").val("");
        $("#editcontactinfo_fax").val("");
        $("#editcontactinfo_idtypeid").val(0);
        $("#editcontactinfo_idn").val("");
        $("#editcontactinfo_nationalityid").val("");
        $("#editcontactinfo_vipstatusid").val("");
        $("#editcontactinfo_guestid").val(0);
        $('#editcontactinfo_fname').val('');
        $('#editcontactinfo_lname').val('');
        $('#editcontactinfo_lname').focus();
        <%for(int i=0;i<gender.length;i++){%>$("#editcontactinfo_gender<%=i%>").prop("checked",false);<%}%>
    }
    
    $(document).ready(function(){
        $("#mediummodalsave").remove();
        $("#mediummodal .modal-footer").append("<button type=\"button\" class=\"btn btn-primary\" id='mediummodalsave' onclick=\"savedataprefix('mediummodal','editcontactinfo_')\">შენახვა</button>");
    });
</script>
<input type="hidden" id="editcontactinfo_action" value="updatecontactinfo.jsp"/>
<input type="hidden" id="editcontactinfo_controls" value="<%=gends%>editcontactinfo_vipstatusid,editcontactinfo_nationalityid,editcontactinfo_idn,editcontactinfo_idtypeid,editcontactinfo_fax,editcontactinfo_mobile,editcontactinfo_phone,editcontactinfo_email,editcontactinfo_fname,editcontactinfo_lname,editcontactinfo_guestid,editcontactinfo_salutationid,editcontactinfo_address,editcontactinfo_city,editcontactinfo_zip,editcontactinfo_countryid"/>
<input type="hidden" id="editcontactinfo_callbackurl" value="content/contactinfo.jsp"/>
<input type="hidden" id="editcontactinfo_callbackdata" value="contactinfo"/>

<%=pl.drawpanel()%>
<%--
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
                                <select class="form-control dropdown" name="editcontactinfo_salutationid" id="editcontactinfo_salutationid" style="width: 50px; padding: 2px 2px; font-size: 12px; line-height: 1.5;">
                                    <%
                                    for(int i=0;i<salutations.length;i++){
                                        String sel = "";
                                        
                                    %>
                                    <option value="<%=salutations[i].getSalutationid()%>" <%=sel%>><%=salutations[i].getName()%></option>
                                    <%
                                    }
                                    %>
                                </select>
                                <div class="input-group">
                                    <input class="form-control" type="text" id="editcontactinfo_fname" value="<%=guestfname%>" style="width: 50px;">
                                    <input class="form-control" type="text" id="editcontactinfo_lname" value="<%=guestlname%>" style="width: 100px;">
                                    <div class="input-group-addon glyphicon glyphicon-remove" style="color: red; cursor: pointer;" onclick="remEditGuestName()"></div>
                                    <div class="input-group-addon glyphicon glyphicon-search" style="cursor: pointer;" onclick="editNameSearch('editcontactinfo_lname',4,'edit')"></div>
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
                                <textarea class="form-control" id="editcontactinfo_address" rows="3" style="height: 40px !important; width: 265px;"><%=guestaddress%></textarea>
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
                                <input class="form-control" type="text" id="editcontactinfo_city" style="width: 135px;" placeholder="ქალაქი" value="<%=guestcity%>">
                                <input class="form-control" type="text" id="editcontactinfo_zip" style="width: 127px;" placeholder="ინდექსი" value="<%=guestzip%>">
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
                                <select class="form-control dropdown" name="editcontactinfo_countryid" id="editcontactinfo_countryid" style="width: 265px;">
                                    <option value="0">--აირჩიეთ--</option>
                                    <%
                                    for(int i=0;i<countries.length;i++){
                                        String sel = "";
                                        
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
                                <input class="form-control" type="text" id="editcontactinfo_email" style="width: 190px;" value="<%=guestemail%>">
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
                                <input class="form-control" type="text" id="editcontactinfo_phone" style="width: 190px;" value="<%=guestphone%>">
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
                                <input class="form-control" type="text" id="editcontactinfo_mobile" style="width: 190px;" value="<%=guestmobile%>">
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
                                <input class="form-control" type="text" id="editcontactinfo_fax" style="width: 190px;" value="<%=guestfax%>">
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
                                <select class="form-control dropdown" name="editcontactinfo_idtypeid" id="editcontactinfo_idtypeid" style="width: 170px;">
                                    <option value="0">--აირჩიეთ--</option>
                                    <%
                                    for(int i=0;i<idtypes.length;i++){
                                        String sel = "";
                                        
                                    %>
                                    <option value="<%=idtypes[i].getIdtypeid()%>" <%=sel%>><%=idtypes[i].getName()%></option>
                                    <%
                                    }
                                    %>
                                </select>
                                <input class="form-control" type="text" id="editcontactinfo_idn" value="<%=guestidn%>" style="width: 80px;" placeholder="ნომერი">
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
                        <select class="form-control dropdown" name="editcontactinfo_nationalityid" id="editcontactinfo_nationalityid" style="width: 252px;">
                            <option value="0">--აირჩიეთ--</option>
                            <%
                            for(int i=0;i<nationalities.length;i++){
                                String sel = "";
                                
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
                            
                        
                        %>
                        <label class="radio-inline" style="height: 23px !important;">
                            <input type="radio" name="editcontactinfo_gender" id="editcontactinfo_gender<%=i%>" value="<%=i%>" <%=sel%>> <%=gender[i]%>
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
                        <select class="form-control dropdown" name="editcontactinfo_vipstatusid" id="editcontactinfo_vipstatusid" style="width: 252px;">
                            <option value="0">--აირჩიეთ--</option>
                            <%
                            for(int i=0;i<vipstatuses.length;i++){
                                String sel = "";
                                
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
--%>
                    


