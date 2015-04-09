<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>
<%

    String[] tabs = {"დაუსრულებელი რეზერვაციები", "დასრულებული რეზერვაციები", "ოთახის სტატუსი", "დაურეგულირებელი ფოლიო", "ღამის გადასახადი", "დღის დახურვა"};


    String cldate = dt.format(dclosedate);

%>
<style>
    /* custom inclusion of right, left and below tabs */

    .tabs-left > .nav-tabs {
        border-bottom: 0;
    }

    .tabs-left > .nav-tabs > li {
        float: none;
    }

    .tabs-left > .nav-tabs > li > a {
        min-width: 74px;
        margin-right: 0;
        margin-bottom: 3px;
    }

    .tabs-left > .nav-tabs {
        float: left;
        margin-right: 19px;
        border-right: 1px solid #ddd;
    }

    .tabs-left > .nav-tabs > li > a {
        margin-right: -1px;
        -webkit-border-radius: 4px 0 0 4px;
        -moz-border-radius: 4px 0 0 4px;
        border-radius: 4px 0 0 4px;
    }

    .tabs-left > .nav-tabs > li > a:hover,
    .tabs-left > .nav-tabs > li > a:focus {
        border-color: #eeeeee #dddddd #eeeeee #eeeeee;
    }

    .tabs-left > .nav-tabs .active > a,
    .tabs-left > .nav-tabs .active > a:hover,
    .tabs-left > .nav-tabs .active > a:focus {
        border-color: #ddd transparent #ddd #ddd;
        *border-right-color: #ffffff;
    }

    .rootwizard-ul > li {
        float: left;
        margin-bottom: -1px;
        border: solid 1px #DFDFDF;
        width: 100%;
    }

    .rootwizard-ul {
        border-bottom: 0;
    }

    .rootwizard-ul > li.active > a, .nav-tabs > li.active > a:hover, .nav-tabs > li.active > a:focus {
        color: #555;
        background-color: #fff;
        border: 0 !important;
        border-bottom-color: transparent;
        cursor: default;
    }

    .rootwizard-ul li > a {
        margin-right: 0px !important;
    }
</style>
<script>
    
    function closeDate(nd){
        $.post("content/closedate.jsp",{ nd: nd },function(data){
            if (data.result == 0)    BootstrapDialog.alert(data.error);
            else {
                location.reload();
                BootstrapDialog.info("ოპერაცია წარმატებით შესრულდა");
            }
        },"json");
    }
    
    $(document).ready(function () {
        $("#myModalSave").remove();
        $("#myModalCheckin").remove();

        $('#rootwizard').bootstrapWizard(
                {
                    'tabClass': 'nav nav-tabs',
                    onTabClick:function(tab, navigation, index)
                    {
                        return false;
                    },
                    onNext: function(tab, navigation, index) {
                        //alert("#nastp"+index+" = "+$("#nastp"+index).val());
                        if($("#nastp"+index).val() > 0){
                            alert("ტრანზაქციები არ დასრულებულა");
                            return false;
                        }
                    },
                    onTabShow: function(tab, navigation, index) {
                        var $total = navigation.find('li').length;
                        var $current = index+1;
                        // If it's the last tab then hide the last button and show the finish instead
                        if($current >= $total) {
                            $('#rootwizard').find('.pager .next').hide();
                            $('#rootwizard').find('.pager .finish').show();
                            $('#rootwizard').find('.pager .finish').removeClass('disabled');
                        } else {
                            $('#rootwizard').find('.pager .next').show();
                            $('#rootwizard').find('.pager .finish').hide();
                        }
                    }
                }
        );
    });


</script>
<input type="hidden" name="nastp1" id="nastp1" value="0"/>
<input type="hidden" name="nastp2" id="nastp2" value="0"/>
<input type="hidden" name="nastp3" id="nastp3" value="0"/>
<input type="hidden" name="nastp4" id="nastp4" value="0"/>
<input type="hidden" name="nastp5" id="nastp5" value="0"/>
<div id="rootwizard" class="tabbable tabs-left" style="height: 500px;">
    <table id="rootwizard-table">
        <tr>
            <td style="width:225px; vertical-align: top;">
                <ul class="rootwizard-ul">
                    <%
                        for (int i = 0; i < tabs.length; i++) {

                    %>
                    <li index="<%=i%>"><a href="#tab<%=i+1%>" data-toggle="tab"><%=tabs[i]%>
                    </a></li>
                    <%
                        }
                    %>
                </ul>
            </td>
            <td style="width: 953px;">
                <div class="tab-content">
                        <%
                            for(int i=0;i<tabs.length;i++){
                                String fname = "wizards/nightaudit/na"+String.valueOf(i+1)+".jsp?cldate="+cldate;
                                %>
                    <div class="tab-pane" id="tab<%=i+1%>">
                        <div class="panel panel-primary" id='na<%=i+1%>'>
                            <div class="panel-heading">
                                <h3 class="panel-title">
                                    ნაბიჯი <%=i + 1%> - <%=tabs.length%>-დან [ <%=tabs[i]%> <%=cldate%> ]
                                </h3>
                            </div>
                            <div class="panel-body">
                                <jsp:include page="<%= fname %>" flush="true"/>
                            </div>
                        </div>
                    </div>
                        <%
                            }
                            %>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <ul class="pager wizard">
                    <li class="previous"><a href="#">წინა</a></li>
                    <li class="next"><a href="#">შემდეგი</a></li>
                    <li class="next finish" style="display:none;"><a href="javascript:closeDate('<%=dt.format(dclosedate)%>');">დღის დახურვა</a></li>
                </ul>
            </td>
        </tr>
    </table>
</div>
</div>