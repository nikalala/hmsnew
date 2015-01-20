<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%
String type = request.getParameter("type");
IdtypeBean[] idtypes = IdtypeManager.getInstance().loadByWhere("order by name");
VipstatusBean[] vipstatuses = VipstatusManager.getInstance().loadByWhere("order by name");
NationalityBean[] nationalities = NationalityManager.getInstance().loadByWhere("order by name");
%>
<table class="table table-borderless table-condensed">
    <tr>
        <td class="tbllabel">საბუთის ტიპი</td>
        <td>
            <form class="form-inline" role="form">
            <div class="form-group">
                <div class="input-group-xs">
                    <select class="form-control dropdown" name="guestinfo_idtypeid" id="guestinfo_idtypeid" style="width: 170px;">
                        <option value="0">--აირჩიეთ--</option>
                        <%
                        for(int i=0;i<idtypes.length;i++){
                            String sel = "";
                            if(displaysettings.length > 0 && displaysettings[0].getIdtypeid().intValue() == idtypes[i].getIdtypeid().intValue())
                                sel = "selected";
                        %>
                        <option value="<%=idtypes[i].getIdtypeid()%>" <%=sel%>><%=idtypes[i].getName()%></option>
                        <%
                        }
                        %>
                    </select>
                    <input class="form-control" type="text" id="guestinfo_idn" style="width: 80px;" placeholder="ნომერი">
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
            <select class="form-control dropdown" name="guestinfo_nationalityid" id="guestinfo_nationalityid" style="width: 252px;">
                <option value="0">--აირჩიეთ--</option>
                <%
                for(int i=0;i<nationalities.length;i++){
                %>
                <option value="<%=nationalities[i].getNationalityid()%>"><%=nationalities[i].getName()%></option>
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
        <td class="tbllabel">სქესი</td>
        <td>
            <form class="form-inline" role="form">
            <div class="form-group">
                <div class="input-group-xs">
            <%
            for(int i=0;i<gender.length;i++){
            %>
            <label class="radio-inline" style="height: 23px !important;">
                <input type="radio" name="guestinfo_gender" id="guestinfo_gender<%=i%>" value="<%=i%>"> <%=gender[i]%>
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
            <select class="form-control dropdown" name="guestinfo_vipstatusid" id="guestinfo_vipstatusid" style="width: 252px;">
                <option value="0">--აირჩიეთ--</option>
                <%
                for(int i=0;i<vipstatuses.length;i++){
                %>
                <option value="<%=vipstatuses[i].getVipstatusid()%>"><%=vipstatuses[i].getName()%></option>
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