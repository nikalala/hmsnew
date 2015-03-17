<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>
<%
  
    String[] hdrs = {"რეზერვაციების ანგარიშგება","წინა მხარის რეპორტი","ბექ ოფისის რეპორტი","აუდიტის რეპორტები","სტატისტიკური რეპორტები","გრაფები და დიაგრამები"};
    RepcatBean[] cats = RepcatManager.getInstance().loadByWhere("order by repcatid");
%>
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
        <div class="panel-group accordion-group accordion-caret" id="accordion" role="tablist" aria-multiselectable="true">
            <%
            for(int i=0;i<cats.length;i++){
                ReportBean[] reps = ReportManager.getInstance().loadByWhere("where repcatid = "+cats[i].getRepcatid()+" order by displayname");
            
            %>
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="heading<%=i%>">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" class="accordion-toggle" data-parent="#accordion" href="#collapseOne<%=i%>"
                           aria-expanded="true"
                           aria-controls="collapseOne<%=i%>">
                            <%=cats[i].getName()%>
                        </a>

                    </h4>
                </div>
                <div id="collapseOne<%=i%>" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading<%=i%>">
                    <div class="panel-body">
                        <ul>
                            <%for(int j=0;j<reps.length;j++){%>
                            <li>
                                <i class="fa fa-dot-circle-o"></i>
                                <a href="javascript:loadStats(<%=reps[j].getReportid()%>,'');"><%=reps[j].getDisplayname()%></a>
                            </li>
                            <%}%>
                        </ul>
                    </div>
                </div>
            </div>
            <%}%>
             
        </div>
    </div>
</div>
