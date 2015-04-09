<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%
String type = request.getParameter("type");
if(type == null)    type = "";
SalutationBean[] salutations = SalutationManager.getInstance().loadByWhere("order by name");
CountryBean[] countries = CountryManager.getInstance().loadByWhere("order by name");
GuestBean guest = null;
if(request.getParameter("gid") != null)
    guest = GuestManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("gid")));

%>
<table class="table table-borderless table-condensed">
    <tr>
        <td class="tbllabel">სახელი</td>
        <td>
            <form class="form-inline" role="form">
            <div class="form-group">
                <div class="input-group">
                    <select class="form-control dropdown" name="<%=type%>guestinfo_salutationid" id="<%=type%>guestinfo_salutationid" style="width: 50px; padding: 2px 2px; font-size: 12px; line-height: 1.5;">
                        <%
                        for(int i=0;i<salutations.length;i++){
                            String sel = "";
                            if(guest != null && guest.getSalutationid() != null && guest.getSalutationid().intValue() == salutations[i].getSalutationid().intValue())
                                sel = "selected";
                            if(guest == null && displaysettings.length > 0 && displaysettings[0].getSalutationid() != null && displaysettings[0].getSalutationid().intValue() == salutations[i].getSalutationid().intValue())
                                sel = "selected";
                        %>
                        <option value="<%=salutations[i].getSalutationid()%>" <%=sel%>><%=salutations[i].getName()%></option>
                        <%
                        }
                        %>
                    </select>
                </div>
                <div class="input-group">
                    <input class="form-control" value="<%= (guest == null) ? "":guest.getFname() %>" type="text" id="<%=type%>guestinfo_fname" style="width: 50px; padding-left: 1px; padding-right: 1px;" placeholder="სახელი">
                    <input class="form-control" value="<%= (guest == null) ? "":guest.getLname() %>" type="text" id="<%=type%>guestinfo_lname" style="width: 65px; padding-left: 1px; padding-right: 1px;" placeholder="გვარი">
                    <input type="hidden" id="<%=type%>guestinfo_guestid" value="<%= (guest == null) ? "":guest.getGuestid() %>">
                    <div class="input-group-addon glyphicon glyphicon-remove" style="color: red; cursor: pointer;" onclick="remGuestName()"></div>
                    <div class="input-group-addon glyphicon glyphicon-search" style="cursor: pointer;" onclick="walkinNameSearch('guestinfo_lname',4)"></div>
                    <div class="input-group-addon glyphicon glyphicon-credit-card" style="cursor: pointer;" onclick="alert('ბარათი')"></div>
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
                    <textarea class="form-control" id="<%=type%>guestinfo_address" rows="3" style="height: 40px !important; width: 265px;"><%=(guest == null) ? "":guest.getAddress()%></textarea>
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
                    <input class="form-control" value="<%= (guest == null) ? "":guest.getCity() %>" type="text" id="<%=type%>guestinfo_city" style="width: 135px;" placeholder="ქალაქი">
                    <input class="form-control" value="<%= (guest == null) ? "":guest.getZip() %>" type="text" id="<%=type%>guestinfo_zip" style="width: 127px;" placeholder="ინდექსი">
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
                    <select class="form-control dropdown" name="<%=type%>guestinfo_countryid" id="<%=type%>guestinfo_countryid" style="width: 265px;">
                        <option value="0">--აირჩიეთ--</option>
                        <%
                        for(int i=0;i<countries.length;i++){
                            String sel = "";
                            if(guest != null && guest.getCountryid() != null && guest.getCountryid().intValue() == countries[i].getCountryid().intValue())
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