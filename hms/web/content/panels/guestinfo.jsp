<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%
String type = request.getParameter("type");
SalutationBean[] salutations = SalutationManager.getInstance().loadByWhere("order by name");
CountryBean[] countries = CountryManager.getInstance().loadByWhere("order by name");
%>
<table class="table table-borderless table-condensed">
    <tr>
        <td class="tbllabel">სახელი</td>
        <td>
            <form class="form-inline" role="form">
            <div class="form-group">
                <div class="input-group">
                    <select class="form-control dropdown" name="guestinfo_salutationid" id="guestinfo_salutationid" style="width: 50px; padding: 2px 2px; font-size: 12px; line-height: 1.5;">
                        <%
                        for(int i=0;i<salutations.length;i++){
                        %>
                        <option value="<%=salutations[i].getSalutationid()%>"><%=salutations[i].getName()%></option>
                        <%
                        }
                        %>
                    </select>
                </div>
                <div class="input-group">
                    <input class="form-control" type="text" id="guestinfo_name" style="width: 115px;">
                    <input type="hidden" id="guestinfo_guestid" value="0">
                    <div class="input-group-addon glyphicon glyphicon-remove" style="color: red; cursor: pointer;" onclick="remGuestName()"></div>
                    <div class="input-group-addon glyphicon glyphicon-search" style="cursor: pointer;" onclick="walkinNameSearch('guestinfo_name',4)"></div>
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
                    <textarea class="form-control" id="guestinfo_address" rows="3" style="height: 40px !important; width: 265px;"></textarea>
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
                    <input class="form-control" type="text" id="guestinfo_city" style="width: 135px;" placeholder="ქალაქი">
                    <input class="form-control" type="text" id="guestinfo_zip" style="width: 127px;" placeholder="ინდექსი">
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
                    <select class="form-control dropdown" name="guestinfo_countryid" id="guestinfo_countryid" style="width: 265px;">
                        <option value="0">--აირჩიეთ--</option>
                        <%
                        for(int i=0;i<countries.length;i++){
                        %>
                        <option value="<%=countries[i].getCountryid()%>"><%=countries[i].getName()%></option>
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