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
        showHideFooter();
        $(".ttable label").css("margin-left", "5px");
        $(".ttable td").css("padding-left", "10px").css("box-shadow", "none", "!important");
        $(".ttable input[type=text],textarea").css("width", "100%");
        $(".ttable").parent().css("background-color", "#FFF");
        $('.dropdown').selectpicker();
        $(".ttable input[type=text]").height($(".ttable .btn-group").height() - 6, "!important");
        $("#tsalutation").next().css("width", "70px").css("padding-right", "10px");
        $("#tphone, #tmobile, #tfax, #tvalue, #topenbal").ForceNumericOnly();
    });
</script>
<form id="tagentsfrm" name="tagentsfrm">
    <input type="hidden" name="tid" value="<%=tid%>">

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
                                    if (contragentlistBeans != null && contragentlistBeans.getSalutationid() != null
                                            && contragentlistBeans.getSalutationid().equals(object.getSalutationid())) {
                                        selected = "selected";
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
                <td><textarea id="taddress" name="taddress"><% if (contragentlistBeans != null) {%><%=contragentlistBeans.getAddress()%><%}%></textarea></td>
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
                                if (contragentlistBeans != null && contragentlistBeans.getCountryid() != null
                                        && contragentlistBeans.getCountryid().equals(country[i].getCountryid())) {
                                    selected = "selected";
                                } else {
                                    selected = "";
                                }
                        %>
                        <option value="<%=country[i].getCountryid()%>" <%=selected%> ><%=country[i].getName()%>
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
                <td><label>საფოსტო ინდექსი:</label></td>
                <td><input type="text" id="zip" name="zip"
                           value="<% if (contragentlistBeans != null)   {%><%=contragentlistBeans.getZip()%><%}%>"/>
                </td>
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
                    <input type="radio" name="trate" value="<%=i%>" <%=selected%> ><label><%=rate[i]%>
                </label>
                    <%
                        }
                    %>
                </td>
            </tr>
            <tr>
                <td><label>დაამატე ბიზნეს წყაროში:</label></td>
                <td>
                    <%
                        String taddtobussinesssource = "";
                        if (contragentlistBeans != null && contragentlistBeans.getBsource() != null && contragentlistBeans.getBsource()) {
                            taddtobussinesssource = "checked";
                        }%>
                    <input type="checkbox" name="taddtobussinesssource"
                           id="taddtobussinesssource" <%=taddtobussinesssource%>></td>
            </tr>
        </table>
    </div>
    <div style="float: left; margin-left: 15px;">
        <table class="ttable">
            <tr>
                <td><label>კომპანია:</label></td>
                <td><input type="text" id="tcompany" name="tcompany"
                           value="<% if (contragentlistBeans != null && contragentlistBeans.getCompany() != null)       {%><%=contragentlistBeans.getCompany()%><%}%>">
                </td>
            </tr>
            <tr>
                <td><label>ტელეფონი:</label></td>
                <td><input type="text" id="tphone" name="tphone"
                           value="<% if (contragentlistBeans != null && contragentlistBeans.getPhone() != null)      {%><%=contragentlistBeans.getPhone()%><%}%>">
                </td>
            </tr>
            <tr>
                <td><label>მობილური:</label></td>
                <td><input type="text" id="tmobile" name="tmobile"
                           value="<% if (contragentlistBeans != null && contragentlistBeans.getMobile() != null)    {%><%=contragentlistBeans.getMobile()%><%}%>">
                </td>
            </tr>
            <tr>
                <td><label>ფაქსი:</label></td>
                <td><input type="text" id="tfax" name="tfax"
                           value="<% if (contragentlistBeans != null && contragentlistBeans.getFax() != null)  {%><%=contragentlistBeans.getFax()%><%}%>">
                </td>
            </tr>
            <tr>
                <td><label>ელ-ფოსტა:</label></td>
                <td><input type="text" id="temail" name="temail"
                           value="<% if (contragentlistBeans != null && contragentlistBeans.getEmail() != null)  {%><%=contragentlistBeans.getEmail()%><%}%>">
                </td>
            </tr>
            <tr>
                <td><label>საკომისიოს გეგმა:</label></td>
                <td>
                    <select class="dropdown" id="tcommissionplan" name="tcommissionplan">
                        <option value="">--აირჩიეთ--</option>
                        <%
                            int tind = 0;
                            for (String item : commissionplan) {
                                String selected = "";
                                if (
                                        contragentlistBeans != null &&
                                                contragentlistBeans.getCommissionplan() != null &&
                                                contragentlistBeans.getCommissionplan().equals(tind)) {
                                    selected = "selected";
                                } else {
                                    selected = "";
                                }
                        %>
                        <option value="<%=tind%>" <%=selected%> ><%=item%>
                        </option>
                        <%
                                tind++;
                            }
                        %>
                    </select>
                </td>
            </tr>
            <tr>
                <td><label>ოდენობა:</label></td>
                <td><input type="text" id="tvalue" name="tvalue"
                           value="<% if (contragentlistBeans != null && contragentlistBeans.getVal() != null)     {%><%=contragentlistBeans.getVal()%><%}%>">
                </td>
            </tr>
            <tr>
                <td><label>საწყისი ბალანსი(GEL):</label></td>
                <td><input type="text" id="topenbal" name="topenbal"
                           value="<% if (contragentlistBeans != null && contragentlistBeans.getOpenbalance() != null)   {%><%=contragentlistBeans.getOpenbalance()%><%}%>">
                </td>
            </tr>
            <tr>
                <td><label>ოთახის ინვენტარი</label></td>
                <td>
                    <%
                        for (int i = 0; i < roominventory.length; i++) {
                            String selected;
                            if (contragentlistBeans != null && contragentlistBeans.getRoominventory() != null && contragentlistBeans.getRoominventory().equals(i)) {
                                selected = "checked";
                            } else {
                                selected = "";
                                if (contragentlistBeans == null && Integer.valueOf(i).equals(0)) {
                                    selected = "checked";
                                }
                            }
                    %>
                    <input type="radio" name="rinve" value="<%=i%>" <%=selected%> ><label><%=roominventory[i]%>
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
                        String selected = "";
                        if (contragentlistBeans != null && contragentlistBeans.getCreateuser() != null && contragentlistBeans.getCreateuser()) {
                            selected = "checked";
                        }%>
                    <input type="checkbox" id="tcreateuser" name="tcreateuser" <%=selected%> ></td>
            </tr>
            <tr>
                <td><label>CC ლისტის ნახვის უფლება</label></td>
                <td>
                    <%
                        String tccblock = "";
                        if (contragentlistBeans != null && contragentlistBeans.getCcblock() != null && contragentlistBeans.getCcblock()) {
                            tccblock = "checked";
                        }%>
                    <input type="checkbox" id="tccblock" name="tccblock" <%=tccblock%> ></td>
            </tr>
        </table>
    </div>
</form>