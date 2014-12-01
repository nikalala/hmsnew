<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<%
    VContragentlistBean contragentlistBeans = null;
    SalutationBean[] salutationBeans = SalutationManager.getInstance().loadByWhere("");
    CountryBean[] country = CountryManager.getInstance().loadByWhere("order by name");
    String tid = (String) request.getParameter("tid");
    if (tid != null) {
        contragentlistBeans = VContragentlistManager.getInstance().loadByWhere("where contragentid = " + tid)[0];
    }
%>
<style>
    .ttable td {
        border: 0 !important;
        border-bottom: 0 !important;
    }
</style>
<script>
    $(document).ready(function () {
        $(".ttable label").css("margin-left", "5px");
        $(".ttable td").css("padding-left", "10px").css("box-shadow", "none", "!important");
        $(".ttable input[type=text],textarea").css("width", "100%");
        $(".ttable").parent().css("background-color", "#FFF");
        $('.dropdown').selectpicker();
        $(".ttable input[type=text]").height($(".ttable .btn-group").height() - 6, "!important");
        $("#tsalutation").next().css("width", "70px").css("padding-right", "10px");
        $("#tphone, #tmobile, #tfax, #tclimit, #tcterm, #topenbal").ForceNumericOnly();
    });
</script>
<form id="tagentsfrm" name="tagentsfrm">
    <div style="float: left; margin-left: 15px;">
        <table class="ttable">
            <tr>
                <td><label>კომპანია:</label></td>
                <td><input type="text" id="tcompany" name="tcompany"
                           value="<% if (contragentlistBeans != null)       {%><%=contragentlistBeans.getCompany()%><%}%>">
                </td>
            </tr>
            <tr>
                <td><label>ტელეფონი:</label></td>
                <td><input type="text" id="tphone" name="tphone"
                           value="<% if (contragentlistBeans != null)      {%><%=contragentlistBeans.getPhone()%><%}%>">
                </td>
            </tr>
            <tr>
                <td><label>მობილური:</label></td>
                <td><input type="text" id="tmobile" name="tmobile"
                           value="<% if (contragentlistBeans != null)    {%><%=contragentlistBeans.getMobile()%><%}%>">
                </td>
            </tr>
            <tr>
                <td><label>ფაქსი:</label></td>
                <td><input type="text" id="tfax" name="tfax"
                           value="<% if (contragentlistBeans != null)  {%><%=contragentlistBeans.getFax()%><%}%>"></td>
            </tr>
            <tr>
                <td><label>ელ-ფოსტა:</label></td>
                <td><input type="text" id="temail" name="temail"
                           value="<% if (contragentlistBeans != null)  {%><%=contragentlistBeans.getEmail()%><%}%>">
                </td>
            </tr>
            <tr>
                <td><label>კრედიტის პირობა:</label></td>
                <td>
                    <input type="text" id="tcterm" name="tcterm" style="width:80% !important;"
                           value="<% if (contragentlistBeans != null)  {%><%=contragentlistBeans.getCreditterm()%><%}%>">
                    <b>დღე</b>
                </td>
            </tr>
            <tr>
                <td><label>კრედიტის ლიმიტი:</label></td>
                <td>
                    <input type="text" id="tclimit" name="tclimit" style="width:80% !important;"
                           value="<% if (contragentlistBeans != null)  {%><%=contragentlistBeans.getCreditlimit()%><%}%>">
                    <b>ლარი</b>
                </td>
            </tr>
            <tr>
                <td><label>საწყისი ბალანსი(GEL):</label></td>
                <td><input type="text" id="topenbal" name="topenbal"
                           value="<% if (contragentlistBeans != null)   {%><%=contragentlistBeans.getOpenbalance()%><%}%>">
                </td>
            </tr>
            <tr>
                <td><label>ოთახის ინვენტარი</label></td>
                <td>
                    <%
                        for (int i = 0; i < roominventory.length; i++) {
                            String selected;
                            if (contragentlistBeans != null && contragentlistBeans.getRoominventory() == i) {
                                selected = "checked";
                            } else {
                                selected = "";
                                if (contragentlistBeans == null && i == 0) {
                                    selected = "checked";
                                }
                            }
                    %>
                    <input type="radio" name="rinve" value="<%=i%>" <%=selected%>><label><%=roominventory[i]%>
                </label>
                    <%
                        }
                    %>
                </td>
            </tr>
            <tr>
                <td><label>შექმენი მომხმარებელი</label></td>
                <td>

                    <%
                        String checked = "";
                        if (contragentlistBeans != null && contragentlistBeans.getCreateuser()) {
                            checked = "checked";
                        }%>
                    <input type="checkbox" id="tcreateuser" name="tcreateuser" <%=checked%>></td>
            </tr>
        </table>
    </div>
    <div style="float: left; margin-left: 10px;">
        <table class="ttable">
            <tr>
                <td>
                    <label>სახელი:</label>
                </td>
                <td>
                    <div style="float: left; width: 20%;">
                        <select class="dropdown" name="tsalutation" id="tsalutation">
                            <%
                                for (SalutationBean object :
                                        salutationBeans) {

                                    String selected = "";
                                    if (contragentlistBeans != null
                                            && contragentlistBeans.getSalutationid() == object.getSalutationid()) {
                                        selected = "selected='selected'";
                                    } else {
                                        selected = "";
                                    }

                            %>
                            <option <%=selected%> value="<%=object.getSalutationid()%>"><%=object.getName()%>
                            </option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                    <div style="float: left; width: 80%;">
                        <input type="text" id="tcontrname" name="tcontrname" style="width: 100%;"
                               value="<% if (contragentlistBeans != null) {%><%=contragentlistBeans.getContragent()%><%}%>"/>
                    </div>
                </td>
            </tr>
            <tr>
                <td><label>მისამართი:</label></td>
                <td><textarea id="taddress"
                              name="taddress"><% if (contragentlistBeans != null) {%><%=contragentlistBeans.getAddress()%><%}%>
                </textarea></td>
            </tr>
            <tr>
                <td><label>ქვეყანა:</label></td>
                <td>
                    <select class="dropdown combobox" style="width: 100%; margin: 4px;" id="tcountryid"
                            name="tcountryid">
                        <option value="">--აირჩიეთ--</option>
                        <%
                            for (int i = 0; i < country.length; i++) {
                                String selected = "";
                                if (contragentlistBeans != null
                                        && contragentlistBeans.getCountryid() == country[i].getCountryid()) {
                                    selected = "selected='selected'";
                                } else {
                                    selected = "";
                                }
                        %>
                        <option value="<%=country[i].getCountryid()%>" <%=selected%>><%=country[i].getName()%>
                        </option>
                        <% } %>
                    </select>
                </td>
            </tr>
            <tr>
                <td><label>ქალაქი:</label></td>
                <td><input type="text" id="tcity" name="tcity"
                           value="<% if (contragentlistBeans != null)   {%><%=contragentlistBeans.getCity()%><%}%>"/>
                </td>
            </tr>
            <tr>
                <td><label>დაამატე ბიზნეს წყაროში:</label></td>
                <td>
                    <%
                        String taddtobussinesssource = "";
                        if (contragentlistBeans != null && contragentlistBeans.getBsource()) {
                            taddtobussinesssource = "checked";
                        }%>
                    <input type="checkbox" name="taddtobussinesssource"
                           id="taddtobussinesssource" <%=taddtobussinesssource%>></td>
            </tr>
            <tr>
                <td><label>ტარიფი:</label></td>
                <td>
                    <%
                        for (int i = 0; i < rate.length; i++) {
                            String selected = "";
                            if ((contragentlistBeans != null && contragentlistBeans.getRate() == i)) {
                                selected = "checked";
                            } else {
                                selected = "";
                                if (contragentlistBeans == null && i == 0) {
                                    selected = "checked";
                                }
                            }
                    %>
                    <input type="radio" name="trate" value="<%=i%>" <%=selected%>><label><%=rate[i]%>
                </label>
                    <%
                        }
                    %>
                </td>
            </tr>

        </table>
    </div>

</form>