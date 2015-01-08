<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<%
    GuestBean guestdblistBean = null;
    SalutationBean[] salutationBeans = SalutationManager.getInstance().loadByWhere("");
    CountryBean[] country = CountryManager.getInstance().loadByWhere("order by name");
    VipstatusBean[] vips = VipstatusManager.getInstance().loadByWhere("");
    NationalityBean[] nats = NationalityManager.getInstance().loadByWhere("");
    IdtypeBean[] idtypes = IdtypeManager.getInstance().loadByWhere("");
    ContragentBean[] contrs = ContragentManager.getInstance().loadByWhere("");
    PaymentmethodBean[] paymentmethodBeans = PaymentmethodManager.getInstance().loadByWhere("");
    String tid = (String) request.getParameter("tid");
    if (tid != null) {
        guestdblistBean = GuestManager.getInstance().loadByWhere("where guestid = " + tid)[0];
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
        $('.date').datepicker();
        $('.box_outer .dropdown').selectpicker();
        $(".box_outer input[type=text]").height($(".box_outer .btn-group").height() - 6, "!important");
        $("#tsalutation").next().css("width", "70px").css("padding-right", "10px");
        $("#phone, #mobile, #fax, #tvalue, #topenbal").ForceNumericOnly();
    });
</script>


<style>
    .box_outer {
        background: #FFF;
        /* box-shadow: 0 1px 2px rgba(0,0,0,0.2);
         -moz-box-shadow: 0 1px 2px rgba(0,0,0,0.2);
         -webkit-box-shadow: 0 1px 2px rgba(0,0,0,0.2);
         -webkit-box-sizing: border-box;
         -moz-box-sizing: border-box;
         box-sizing: border-box;*/
        float: left;
        margin-bottom: 7px;
        position: relative;
        width: 100%;
    }

    .box_head {
        /*background-color: #FFF;
        border-bottom: 1px solid #bebebe;*/
        box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
        -moz-box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
        -webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
        float: left;
        font-family: BGMtavr;
        font-size: 12px;
        padding: 9px 0 7px;
        text-indent: 7px;
        text-shadow: 0px 1px 1px #FFF;
        width: 100%;
        margin-top: -11px;
    }

    .box_container {
        display: inline-block;
        padding: 6px;
    }

    .fieldset {
        float: left;
        margin-bottom: 4px;
        width: 100%;
    }

    .label_big {
        width: 140px;
    }

    .label_sm {
        /*color: #000;
        float: left;
        font-weight: bold;
        padding-top: 2px;
        text-overflow: ellipsis;
        overflow: hidden;
        white-space: nowrap;
        width: 79px;
        height: 15px;*/

        color: #4F4F4F;
        float: left;
        font-weight: bold;
        margin-right: 3px;

    }

    .acomplete {
        max-height: 110px;
        overflow: auto;
        overflow-x: hidden;
        overflow-y: scroll;
        text-shadow: 0 1px 1px #FFF;
    }
</style>


<div class="box_outer" style="width:100%">
    <h2 class="box_head">
        <span id="ctl0_fdmain_lblGTitle">ტურისტული აგენტის დამატება</span>
    </h2>
    <ul class="box_container">
        <li class="col1" style="width:490px;float: left;">
            <p class="fieldset">
                <span id="ctl0_fdmain_lblName" class="label_sm label_big">სახელი, გვარი</span>
                <select class="dropdown" name="tsalutation" id="tsalutation">
                    <%
                        for (SalutationBean object :
                                salutationBeans) {

                            String selected = "";
                            if (guestdblistBean != null
                                    && guestdblistBean.getSalutationid() == object.getSalutationid()) {
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
                <input name="guest" type="text" placeholder="" id="txtguestname"
                       class="txtbox btnpad">
            </p>
            <p class="fieldset">
                <span id="ctl0_fdmain_lblType" class="label_sm label_big">ტიპი</span>
                <input id="adultradio" type="radio" name="type" checked="checked">
                უფროსი <span style="padding-left:10px;">
              <input id="childradio" type="radio" name="adult">
              </span> ბავშვი </p>

            <p class="fieldset">
                <span id="ctl0_fdmain_lblGender" class="label_sm label_big">სქესი</span>
              <span>
              <input id="manradio" type="radio" name="manradio" checked="checked">
              </span> კაცი <span style="padding-left:10px;">
              <input id="wmanradio" type="radio" name="wmanradio">
              </span> ქალი <span style="padding-left:10px;">
              <input id="otherradio" type="radio" name="otherradio">
              </span> სხვა </p>

            <p class="fieldset">
                <span id="ctl0_fdmain_lblAddess1" class="label_sm label_big">მისამართი</span>
              <span style="display:block;float:left;">
              <textarea name="txtaddress" rows="4" cols="31" placeholder="" id="txtaddress"
                        class="textarea"></textarea>
              </span></p>

            <p class="fieldset">
                <span id="ctl0_fdmain_lblCountry" class="label_sm label_big">ქალაქი</span>
                <select class="dropdown combobox" style="width: 100%; margin: 4px;" id="tcountryid" name="tcountryid">
                    <option value="">--აირჩიეთ--</option>
                    <%
                        for (int i = 0; i < country.length; i++) {
                            String selected = "";
                            if (guestdblistBean != null
                                    && guestdblistBean.getCountryid() == country[i].getCountryid()) {
                                selected = "selected='selected'";
                            } else {
                                selected = "";
                            }
                    %>
                    <option value="<%=country[i].getCountryid()%>" <%=selected%>><%=country[i].getName()%>
                    </option>
                    <% } %>
                </select>

            </p>

            <div id="ctl0_fdmain_lstState_result" class="acomplete" style="display: none;"></div>
            <p></p>

            <p class="fieldset">
                <span id="ctl0_fdmain_lblCity" class="label_sm label_big">ქალაქი</span>
                <input name="txtcity" type="text" placeholder="" id="txtcity" class="txtbox"
                       autocomplete="off"></p>

            <div id="ctl0_fdmain_lstCity_result" class="acomplete" style="display: none;"></div>
            <p></p>

            <p class="fieldset">
                <span id="ctl0_fdmain_lblZip" class="label_sm label_big">საფოსტო ინდექსი</span>
                <input name="zip" type="text" placeholder="" id="zip" class="txtbox">
            </p>
            <p class="fieldset">
                <span id="ctl0_fdmain_lblVIPStatus" class="label_sm label_big">VIP სტატუსი</span>
                <select class="dropdown" name="vipstatus" id="vipstatus">
                    <option value="">--აირჩიეთ--</option>
                    <%
                        for (VipstatusBean object :
                                vips) {

                            String selected = "";
                            if (guestdblistBean != null
                                    && guestdblistBean.getVipstatusid() == object.getVipstatusid()) {
                                selected = "selected='selected'";
                            } else {
                                selected = "";
                            }

                    %>
                    <option <%=selected%> value="<%=object.getVipstatusid()%>"><%=object.getName()%>
                    </option>
                    <%
                        }
                    %>
                </select>
            </p>
            <p class="fieldset">
                <span id="ctl0_fdmain_lblIDType" class="label_sm label_big">საბუთის ტიპი</span>
                <select class="dropdown" name="idtype" id="idtype">
                    <option value="">--აირჩიეთ--</option>
                    <%
                        for (IdtypeBean object :
                                idtypes) {

                            String selected = "";
                            if (guestdblistBean != null
                                    && guestdblistBean.getIdtypeid() == object.getIdtypeid()) {
                                selected = "selected='selected'";
                            } else {
                                selected = "";
                            }

                    %>
                    <option <%=selected%> value="<%=object.getIdtypeid()%>"><%=object.getName()%>
                    </option>
                    <%
                        }
                    %>
                </select>
                <span id="ctl0_fdmain_ctl2" class="validation_control"
                      style="display: none; color: red; visibility: hidden;">Please select Identity Type</span>
            </p>
            <p class="fieldset">
                <span id="ctl0_fdmain_lblIDNo" class="label_sm label_big">საბუთის No</span>
                <input name="ctl0$fdmain$txtIDNo" type="text" placeholder="" id="ctl0_fdmain_txtIDNo" class="txtbox">
                <span id="ctl0_fdmain_ctl3" class="validation_control"
                      style="display: none; color: red; visibility: hidden;">Please enter Identity No</span>
            </p>
        </li>
        <li class="col1" style="width:450px;float: left;">

            <p class="fieldset">
                <span id="ctl0_fdmain_lblPhone" class="label_sm label_big">ტელეფონი</span>
                <input name="phone" type="text" placeholder="" id="phone" class="txtbox">
            </p>

            <p class="fieldset">
                <span id="ctl0_fdmain_lblMobile" class="label_sm label_big">მობილური</span>
                <input name="mobile" type="text" placeholder="" id="mobile"
                       class="txtbox">
            </p>

            <p class="fieldset">
                <span id="ctl0_fdmain_lblFax" class="label_sm label_big">ფაქსი</span>
                <input name="fax" type="text" placeholder="" id="fax" class="txtbox">
            </p>

            <p class="fieldset">
                <span id="ctl0_fdmain_lblEmail" class="label_sm label_big">ელ-ფოსტა</span>
                <input name="ctl0$fdmain$txtEmail" type="text" placeholder="" id="ctl0_fdmain_txtEmail" class="txtbox">
            </p>

            <div class="fieldset">
                <span class="label_sm label_big">დაბ. თარიღი</span>
                <div class="input-append date" id="bDate">
                    <input type="text" class="span2 " id="birthdate" placeholder=" თარიღი">
                    <span class="add-on"
                          style="background : none  !important;border: none !important;margin-left: -30px;">
                        <i class="glyphicon glyphicon-calendar"></i></span>
                </div>
            </div>

            <div class="fieldset">
                <span class="label_sm label_big">მეუღლის დაბ. თარიღი</span>
                <div class="input-append date" id="wifDate">
                    <input type="text" class="span2 " id="wifebirthdate" placeholder=" თარიღი">
                    <span class="add-on"
                          style="background : none  !important;border: none !important;margin-left: -30px;">
                        <i class="glyphicon glyphicon-calendar"></i></span>
                </div>
            </div>

            <div class="fieldset">
                <span class="label_sm label_big">ქორწ. წლის თავი:</span>
                <div class="input-append date" id="wDate">
                    <input type="text" class="span2 " id="weddingyeardate" placeholder=" თარიღი">
                    <span class="add-on"
                          style="background : none  !important;border: none !important;margin-left: -30px;">
                        <i class="glyphicon glyphicon-calendar"></i></span>
                </div>
            </div>

            <p class="fieldset">
                <span id="ctl0_fdmain_lblNationality" class="label_sm label_big">ეროვნება</span>
                <select class="dropdown" name="nationality" id="nationality">
                    <option value="">--აირჩიეთ--</option>
                    <%
                        for (NationalityBean object :
                                nats) {

                            String selected = "";
                            if (guestdblistBean != null
                                    && guestdblistBean.getNationalityid() == object.getNationalityid()) {
                                selected = "selected='selected'";
                            } else {
                                selected = "";
                            }

                    %>
                    <option <%=selected%> value="<%=object.getName()%>"><%=object.getName()%>
                    </option>
                    <%
                        }
                    %>
                </select>
            </p>
            <p class="fieldset">
                <span id="ctl0_fdmain_lblDirectBilling" class="label_sm label_big">პირდაპირი ანგარიშვალდებულება</span>
                <select class="dropdown" name="contragent" id="contragent">
                    <option value="">--აირჩიეთ--</option>
                    <%
                        for (ContragentBean object :
                                contrs) {

                            String selected = "";
                            if (guestdblistBean != null
                                    && guestdblistBean.getContragentid() == object.getContragentid()) {
                                selected = "selected='selected'";
                            } else {
                                selected = "";
                            }

                    %>
                    <option <%=selected%> value="<%=object.getContragentid()%>"><%=object.getName()%>
                    </option>
                    <%
                        }
                    %>
                </select>
            </p>
            <p class="fieldset">
                <span id="ctl0_fdmain_lblPaymentType" class="label_sm label_big">გადახდის მეთოდი</span>
                <select class="dropdown" name="paymentmethods" id="paymentmethods">
                    <option value="">--აირჩიეთ--</option>
                    <%
                        for (PaymentmethodBean object :
                                paymentmethodBeans) {

                            String selected = "";
                            if (guestdblistBean != null
                                    && guestdblistBean.getPaymentmethodid() == object.getPaymentmethodid()) {
                                selected = "selected='selected'";
                            } else {
                                selected = "";
                            }

                    %>
                    <option <%=selected%> value="<%=object.getPaymentmethodid()%>"><%=object.getName()%>
                    </option>
                    <%
                        }
                    %>
                </select>
            </p>
        </li>
    </ul>
</div>