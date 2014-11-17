<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>
<script type="text/javascript">
    $(document).ready(function(){
        $("#contrbean").next().css("min-width","170px");
    });
</script>
<div class="panel-heading" style="height: 34px;">
    <h3 class="panel-title">
        <div style="float: left; margin: 5px 0 0 10px;">კონტაქტი</div>
        <div style="float: right; margin: -2px 0 0 10px;">
            <table>
                <tr>
                    <td style="padding-right: 10px;">
                        <select class="dropdown col-md-2" id="contrbean">
                            <%
                                for (int i = 0; i < contragenttype.length - 1; i++) {
                                    String selected = "";
                                    if (i == 4) {
                                        selected = "selected='selected'";
                                    } else {
                                        selected = "";
                                    }
                            %>
                            <option value="<%=i%>" <%=selected%>><%=contragenttype[i]%>
                            </option>
                            <% } %>
                        </select>
                    </td>
                    <td>
                        <a href="#" class="glyphicon glyphicon-plus iconblack" style="text-decoration: none;"
                           data-toggle="tooltip"></a>
                    </td>
                    <td>
                        <a href="#" class="glyphicon glyphicon-search iconblack"
                           style="text-decoration: none; padding-left: 10px; padding-right: 10px;" data-toggle="tooltip"></a>
                    </td>
                </tr>
            </table>
        </div>
    </h3>
</div>
<div class="panel-body" style="height:110px;">
    <table width="100%" class="table table-borderless" style="text-align: right;">
        <tbody>
        <tr>
            <td><b><span style="color: #598904">guestname</span></b></td>
            <td><b>მობილური:</b></td>
            <td>577 65 11 00</td>
        </tr>
        <tr>
            <td></td>
            <td><b>ტელეფონი:</b></td>
            <td>2 124 755</td>
        </tr>
        <tr>
            <td></td>
            <td><b>ელფოსტა:</b></td>
            <td>giorgi.vashakidze@amindsolutions.com</td>
        </tr>
        <tr>
            <td colspan="3">
                ვაჟა ფშაველას 55
            </td>
        </tr>
        </tbody>
    </table>
</div>
