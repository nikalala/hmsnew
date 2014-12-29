<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<style>
    #accordion ul li a {
        font-family: BGMtavr;
        font-size: 12px;
        color: #494949;
        margin-left: 4px;
    }
    #accordion ul li a:hover{
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
</style>

<div class="panel panel-default" id='leftpanel' style="margin-top: 0px; height: 654px">
    <div class="panel-heading  panel-title"
         style="text-align: center; font-size: 16px !important; height: 31px; background-color: darkgray !important;">
        <b style='vertical-align: middle; color: #FFFFFF;'>ანგარიშგებები</b>
    </div>
    <div class="panel-body" style="background-color: #F5F5F5;">
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
                <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                    <div class="panel-body">
                        <ul>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="javascript:getBody('statsleft','arlist.jsp','ჩამომსვლელთა სია','res1','',true);">ჩამომსვლელთა სია</a></li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">გაუქმებული რეზერვაციები</a></li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">არ გამოცხადებული (რეზ)</a></li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">რეზერვაციის აქტივობა</a></li>
                            <li><i class="fa fa-dot-circle-o"></i> <a href="#">წაშლილი რეზერვაციები</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <%--   <div class="panel panel-default">
                   <div class="panel-heading" role="tab" id="headingTwo">
                       <h4 class="panel-title">
                           <a class="collapsed accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"
                              aria-expanded="false" aria-controls="collapseTwo">
                               Collapsible Group Item #2
                           </a>
                       </h4>
                   </div>
                   <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                       <div class="panel-body">
                           Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf
                           moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.
                           Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda
                           shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea
                           proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim
                           aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                       </div>
                   </div>
               </div>--%>
        </div>
    </div>
</div>