<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<script>

    $('.panel-group .panel-collapse.in').prev().addClass('actives');
    $('.panel-group')
            .on('show.bs.collapse', function(e) {
                $(e.target).prev('.panel-heading').addClass('actives');
                $(e.target).prev('.panel-heading').css({

                });
            })
            .on('hide.bs.collapse', function(e) {
                $(e.target).prev('.panel-heading').removeClass('actives');
            });
</script>
<style>

    #accordion ul li a {
        font-family: BGMtavr;
        font-size: 12px;
        color: #494949;
        margin-left: 4px;
    }

    #accordion ul li a:hover {
        color: #428bca;
    }

    #accordion ul li {
        margin-left: -30px;
        margin-bottom: 7px;
    }

    .accordion-toggle {
        font-family: BGMtavr;
    }

    .accordion-caret .accordion-toggle:hover {
        text-decoration: none;
    }

    .accordion-caret .accordion-toggle:hover span,
    .accordion-caret .accordion-toggle:hover strong {
        text-decoration: none;
    }

    .accordion-caret .accordion-toggle:before {
        font-size: 25px;
        vertical-align: -3px;
    }

    .accordion-caret .accordion-toggle:not(.collapsed):before {
        content: "▾";
        margin-right: 0px;
    }

    .accordion-caret .accordion-toggle.collapsed:before {
        content: "▸";
        margin-right: 0px;
    }
    .panel-title > a {
        color: inherit;
        text-decoration: none !important;
        font-size: 12px;
    }
    .panel-group .panel {
        margin-bottom: 0;
        border-radius: 0px !important;
    }
    .stats .panel-heading{
        border-bottom: 1px solid #CCC;
        font-weight: bold;
        padding: 5px 7px;
        font-weight: bold;
        text-shadow: 0 1px 0 #FFFFFF;
        background: -moz-linear-gradient(32% 96% 90deg, #e7e9ea, #FFF 80%);
        background: -webkit-gradient(linear, 77% 96%, 77% 28%, from(#e7e9ea), to(#FFF));
        cursor: pointer;
    }
    .stats .panel-heading:hover{
        color: #FFF !important;
        font-weight: bold;
        background: #474544 !important;
    }
    .stats .panel {
        border-color: #E7E7E7 !important;
    }
    .actives{

        color: #FFF !important;
        font-weight: bold;
        background: #474544 !important;
        /*background: -moz-linear-gradient(32% 76% 90deg, #7eb5dd, #a3d8ff 80%)  !important;
        background: -webkit-gradient(linear, 77% 82%, 77% 30%, from(#7eb5dd), to(#a3d8ff))  !important;*/
        /*text-shadow: 0 1px 0 #cde3f3  !important;*/

    }
    .panel-group .panel + .panel {
        margin-top: 0px;
    }
    .tab-pane{
        background: #F8F8F8 !important;
        background: -moz-linear-gradient(32% 76% 90deg, #F8F8F8, #e8e8e8 80%) !important;
        background: -webkit-gradient(linear, 77% 82%, 77% 30%, from(#F8F8F8), to(#e8e8e8)) !important;
        box-shadow: 0px 1px 2px #e1e1e1 !important;
        -moz-box-shadow: 0px 1px 2px #e1e1e1 !important;
        -webkit-box-shadow: 0px 1px 2px #e1e1e1 !important;
    }
</style>

<div class="panel panel-default" id='leftpanel' style="margin-top: 0px; height: auto">
    <div class="panel-heading  panel-title"
         style="text-align: center; font-size: 16px !important; height: 31px; background-color: #474544 !important;">
        <b style='vertical-align: middle; color: #FFFFFF;'>ანგარიშგებები</b>
    </div>
    <div class="panel-body stats" style="background-color: #F5F5F5;">
        <div class="panel-group accordion-group accordion-caret" id="accordion" role="tablist"
             aria-multiselectable="true">
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingOne">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" class="accordion-toggle" data-parent="#accordion" href="#collapseOne"
                           aria-expanded="true"
                           aria-controls="collapseOne">
                            რეზერვაციების ანგარიშგება
                        </a>

                    </h4>
                </div>
                <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                    <div class="panel-body">
                        <ul>
                            <li>
                                <i class="fa fa-dot-circle-o"></i>
                                <a href="javascript:loadStats('arlist','1');">ჩამომსვლელთა სია</a>
                            </li>
                            <li>
                                <i class="fa fa-dot-circle-o"></i>
                                <a href="javascript:loadStats('c_reservs','1');">გაუქმებული რეზერვაციები</a>
                            </li>
                            <li>
                                <i class="fa fa-dot-circle-o"></i>
                                <a href="javascript:loadStats('noshow','1');">არ გამოცხადებული (რეზ)</a>
                            </li>
                            <li>
                                <i class="fa fa-dot-circle-o"></i>
                                <a href="javascript:loadStats('reserv_activity','1');">რეზერვაციის აქტივობა</a>
                            </li>
                            <li>
                                <i class="fa fa-dot-circle-o"></i>
                                <a href="javascript:loadStats('void','1');">წაშლილი რეზერვაციები</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="heading2">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" class="accordion-toggle" data-parent="#accordion" href="#collapseOne2"
                           aria-expanded="true"
                           aria-controls="collapseOne2">
                            წინა მხარის რეპორტი
                        </a>

                    </h4>
                </div>
                <div id="collapseOne2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                    <div class="panel-body">
                        <ul>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">Guest Checked In </a></li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">Guest Checked Out</a></li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">Guest List </a></li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">Guest Message</a></li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">Inclusion Report </a></li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">Inventory By Room Type</a></li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">Invoice Breakdown</a></li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">Night Audit </a></li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">Pickup Dropoff</a></li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">Room Availability</a></li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">Room Status Report</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="heading3">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" class="accordion-toggle" data-parent="#accordion" href="#collapseOne3"
                           aria-expanded="true"
                           aria-controls="collapseOne3">
                            ბექ ოფისის რეპორტი
                        </a>

                    </h4>
                </div>
                <div id="collapseOne3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading3">
                    <div class="panel-body">
                        <ul>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">Advance Deposit Ledger </a></li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">City Ledger - Detail </a></li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">City Ledger - Summary </a></li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">Credit Card Process - DetailDaily </a>
                            </li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">Extra Charge - Detail </a></li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">Daily Receipt - Detail </a></li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">Daily Receipt - Summary </a></li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">Daily Refund Report </a></li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">Daily Revenue </a></li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">Expense Voucher </a></li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">Folio List </a></li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">Guest Ledger </a></li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">House Status </a></li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">Maintenance Block </a></li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">Manager Report </a></li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">Owner Statement </a></li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">Rate Card </a></li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">Revenue By Rate Type </a></li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">Revenue By Room Type </a></li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">Travel Agent Commission - Detail </a>
                            </li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">Travel Agent Commission - Summary </a>
                            </li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">Work Order List </a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="heading4">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" class="accordion-toggle" data-parent="#accordion" href="#collapseOne4"
                           aria-expanded="true"
                           aria-controls="collapseOne4">
                           აუდიტის რეპორტები
                        </a>

                    </h4>
                </div>
                <div id="collapseOne4" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading4">
                    <div class="panel-body">
                        <ul>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">Audit Trails</a></li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">IP Report</a></li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">Void Report</a></li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">Void Payment</a></li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">Void Transaction</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="heading5">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" class="accordion-toggle" data-parent="#accordion" href="#collapseOne5"
                           aria-expanded="true"
                           aria-controls="collapseOne5">
                            სტატისტიკური რეპორტები
                        </a>

                    </h4>
                </div>
                <div id="collapseOne5" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading5">
                    <div class="panel-body">
                        <ul>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">Business Analysis </a></li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">Contribution Analysis Report </a></li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">Monthly Country wise Pax Analysis </a></li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">Monthly Statistics </a></li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">Monthly Summary </a></li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">Monthly Tax </a></li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">Room Sale Statistics </a></li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">Room Statistics </a></li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">Yearly Statistics </a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="heading6">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" class="accordion-toggle" data-parent="#accordion" href="#collapseOne6"
                           aria-expanded="true"
                           aria-controls="collapseOne6">
                            გრაფები და დიაგრამები
                        </a>

                    </h4>
                </div>
                <div id="collapseOne6" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading6">
                    <div class="panel-body">
                        <ul>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">Monthly Occupancy</a></li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">Monthly Revenue</a></li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">Payment Summary</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>