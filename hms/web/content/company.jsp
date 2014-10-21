<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
SalutationBean[] salutations = SalutationManager.getInstance().loadByWhere("order by name");
CountryBean[] countries = CountryManager.getInstance().loadByWhere("order by name");
%>
<script>
    
    function savecompany(){
        $.post(
                "content/ajax/updcompany.jsp",
                {
                    act: "add",
                    companyname: $("#company_companyname").val(),
                    salutationid: $("#company_salutationid").val(),
                    contactname: $("#company_contactname").val(),
                    mobile: $("#company_mobile").val(),
                    phone: $("#company_phone").val(),
                    email: $("#company_email").val(),
                    fax: $("#company_fax").val(),
                    address: $("#company_address").val(),
                    countryid: $("#company_countryid").val(),
                    city: $("#company_city").val(),
                    zip: $("#company_zip").val()
                },
                function(data){
                    if(data.result == 0) BootstrapDialog.alert(data.error);
                    else {
                        $("#wlakin_other_companyid").append("<option value='"+data.id+"'>"+data.name+"</option>");
                        $("#wlakin_other_companyid").val(data.id);
                        $("#mediummodal").modal('hide');
                    }
                },
                "json"
            );
    }
    
    $(document).ready(function(){
        $("#mediummodalsave").remove();
        $("#mediummodal .modal-footer").append("<button type=\"button\" class=\"btn btn-primary\" id='mediummodalsave' onclick=\"savecompany()\">შენახვა</button>");
        
        
        
    });
</script>
<div class="container-fluid" id="registration" style="padding-top: 4px; height: 100%;">
    <div class="row" style="margin-top: 0px; margin-bottom: 0px; padding-left: 5px;  padding-right: 5px;">
        <div class="col-md-9">
            <div class="panel panel-primary" id='reg_guestinfo'>
                <div class="panel-heading">
                    <h3 class="panel-title">
                        ძირითადი ინფორმაცია
                    </h3>
                </div>
                <div class="panel-body" style="height: 140px;">
                    <table class="table table-borderless">
                        <tr>
                            <td class="tbllabel" style="width: 150px;" nowrap>დასახელება</td>
                            <td>
                                <form class="form-inline" role="form">
                                <div class="form-group">
                                    <div class="input-group">
                                        <input class="form-control" type="text" id="company_companyname" size="20" style="">
                                    </div>
                                </div>
                                </form>
                            </td>
                        </tr>
                        <tr>
                            <td class="tbllabel" style="width: 150px;">საკონტაქტო პირი</td>
                            <td>
                                <form class="form-inline" role="form">
                                <div class="form-group">
                                    <div class="input-group">
                                        <select class="form-control dropdown" name="company_salutationid" id="company_salutationid" style="width: 50px; padding: 2px 2px; font-size: 12px; line-height: 1.5;">
                                            <%
                                            for(int i=0;i<salutations.length;i++){
                                            %>
                                            <option value="<%=salutations[i].getSalutationid()%>"><%=salutations[i].getName()%></option>
                                            <%
                                            }
                                            %>
                                        </select>
                                        <input class="form-control" type="text" id="company_contactname" style="width: 115px;">
                                    </div>
                                </div>
                                </form>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-md-7">
            <div class="panel panel-primary" id='reg_guestinfo'>
                <div class="panel-heading">
                    <h3 class="panel-title">
                        საკონტაქტო ინფორმაცია
                    </h3>
                </div>
                <div class="panel-body" style="height: 140px;">
                    <table class="table table-borderless">
                        <tr>
                            <td class="tbllabel" style="width: 100px;" nowrap>მობილური</td>
                            <td>
                                <form class="form-inline" role="form">
                                <div class="form-group">
                                    <div class="input-group">
                                        <input class="form-control" type="text" id="company_mobile" size="20" style="">
                                    </div>
                                </div>
                                </form>
                            </td>
                        </tr>
                        <tr>
                            <td class="tbllabel" style="width: 100px;" nowrap>ტელეფონი</td>
                            <td>
                                <form class="form-inline" role="form">
                                <div class="form-group">
                                    <div class="input-group">
                                        <input class="form-control" type="text" id="company_phone" size="20" style="">
                                    </div>
                                </div>
                                </form>
                            </td>
                        </tr>
                        <tr>
                            <td class="tbllabel" style="width: 100px;" nowrap>ელფოსტა</td>
                            <td>
                                <form class="form-inline" role="form">
                                <div class="form-group">
                                    <div class="input-group">
                                        <input class="form-control" type="text" id="company_email" size="20" style="">
                                    </div>
                                </div>
                                </form>
                            </td>
                        </tr>
                        <tr>
                            <td class="tbllabel" style="width: 100px;" nowrap>ფაქსი</td>
                            <td>
                                <form class="form-inline" role="form">
                                <div class="form-group">
                                    <div class="input-group">
                                        <input class="form-control" type="text" id="company_fax" size="20" style="">
                                    </div>
                                </div>
                                </form>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="row" style="margin-top: 0px; margin-bottom: 0px; padding-left: 5px;  padding-right: 5px;">
        <div class="col-md-16">
            <div class="panel panel-primary" id='reg_guestinfo'>
                <div class="panel-heading">
                    <h3 class="panel-title">
                        საკონტაქტო პირის ინფორმაცია
                    </h3>
                </div>
                <div class="panel-body" style="height: 120px;">
                    <table class="table table-borderless">
                        <tr>
                            <td class="tbllabel" style="width: 100px;" nowrap valign="top" rowspan="2">მისამართი</td>
                            <td valign="top" rowspan="2">
                                <form class="form-inline" role="form">
                                <div class="form-group">
                                    <div class="input-group">
                                        <textarea class="form-control" id="company_address" cols="30" rows="4" style=""></textarea>
                                    </div>
                                </div>
                                </form>
                            </td>
                            <td class="tbllabel" style="width: 50px;" nowrap valign="top">ქვეყანა</td>
                            <td valign="top" colspan="3">
                                <form class="form-inline" role="form">
                                <div class="form-group">
                                    <div class="input-group">
                                        <select class="form-control dropdown" name="company_countryid" id="company_countryid" style="width: 265px;">
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
                        <tr>
                            <td class="tbllabel" style="width: 50px;" nowrap valign="top">ქალაქი</td>
                            <td valign="top">
                                <form class="form-inline" role="form">
                                <div class="form-group">
                                    <div class="input-group">
                                        <input class="form-control" type="text" id="company_city" size="20" style="">
                                    </div>
                                </div>
                                </form>
                            </td>
                            <td class="tbllabel" style="width: 50px;" nowrap valign="top">ინდექსი</td>
                            <td valign="top">
                                <form class="form-inline" role="form">
                                <div class="form-group">
                                    <div class="input-group">
                                        <input class="form-control" type="text" id="company_zip" size="20" style="">
                                    </div>
                                </div>
                                </form>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
