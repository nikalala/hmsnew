<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>
<%
dialog dl = new dialog();
String fl = basedir+"/content/templates/guestprofile_geninfo.json";
dl.readFromFile(fl);

//System.out.println(fl);
//System.out.println(dl.getParams());
%>

<script type="text/javascript">
    
    function saveGuestprofileGeninfo(){
        $.post(
            "content/saveGuestprofileGeninfo.jsp",
            <%=dl.getParams()%>,
            function(data){
                if(data.result == 0)    BootstrapDialog.alert(data.error);
                else {
                    $currentmodal.close();
                }
            },
            "json");
    }
    
    function addContact(){
        <%=dl.draw()%>
    }
    
    function searchContact(){
        
    }
    
    $(document).ready(function(){
        $("#contrbean").next().css("min-width","170px");
        $("#contrbean").next().css("top","-4px");
    });
</script>
<style>
    .ellipsis {
    white-space: nowrap; 
    overflow: hidden;
    text-overflow: ellipsis;
}
</style>
<div class="panel-heading" style="height: 26px;">
    <h3 class="panel-title">
        <div class="span-header" style="margin: 0;">კონტაქტი</div>
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
                        <a href="#" onclick="addContact()" class="glyphicon glyphicon-plus iconblack" style="text-decoration: none; top: -4px;" data-toggle="დამატება"></a>
                    </td>
                    <td>
                        <a href="#" class="glyphicon glyphicon-search iconblack" onclick="searchContact()" style="text-decoration: none; padding-left: 10px; padding-right: 10px; top: -3px;" data-toggle="ძებნა"></a>
                    </td>
                </tr>
            </table>
        </div>
    </h3>
</div>
<div class="panel-body" style="height:110px;">
    <div class="col-md-8">
        <div class="col-md-16" style="text-align: left; padding: 3px;"><b><span style="color: #598904">guestname</span></b></div>
        <div class="col-md-16" style="text-align: left; padding: 3px;"><span>address</span></div>
        <div class="col-md-16" style="text-align: left; padding: 3px;"><span>city - zip</span></div>
        <div class="col-md-16" style="text-align: left; padding: 3px;"><span>country</span></div>
    </div>
    <div class="col-md-8">
    <div class="col-md-16" style="text-align: left; padding: 3px; padding-top: 20px;"><b><i class="fa fa-mobile" style="width: 15px;"></i></b> 577 65 11 00</div>
    <div class="col-md-16" style="text-align: left; padding: 3px;"><b><i class="fa fa-phone" style="width: 15px;"></i></b> 2 124 755</div> 
    <div class="col-md-16" style="text-align: left; padding: 3px;"><b><i class="fa fa-envelope-o pull-left" style="width: 15px;"></i></b> <span class="ellipsis col-md-14" style="padding: 0;">giorgi.vashakidze@amindsolutions.com</span></div>
    </div>
</div>
