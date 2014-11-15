<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%

String[] tabs = {"დაუსრულებელი რეზერვაციები","დასრულებული რეზერვაციები","ოთახის სტატუსი","დაურეგულირებელი ფოლიო","ღამის გადასახადი","დღის დახურვა"};


String cldate = dt.format(new Date());
ClosedateBean[] closedates = ClosedateManager.getInstance().loadByWhere("order by cldate desc limit 1");
if(closedates.length > 0)
    cldate = dt.format(closedates[0].getCldate());
else {
    ReservationBean[] ress = ReservationManager.getInstance().loadByWhere("order by arraivaldate asc limit 1");
    if(ress.length > 0)
        cldate = dt.format(ress[0].getArraivaldate());
}
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

    .tabs-right > .nav-tabs {
        float: right;
        margin-left: 19px;
        border-left: 1px solid #ddd;
    }

</style>
<script>
    $(document).ready(function() {
        
        $("#myModalSave").remove();
        $("#myModalCheckin").remove();
        
        $('#rootwizard').bootstrapWizard({'tabClass': 'nav nav-tabs'});
    });
</script>
<div id="rootwizard" class="tabbable tabs-left">
    <ul>
        <%
        for(int i=0;i<tabs.length;i++){
            
            %>
            <li><a href="#tab<%=i+1%>" data-toggle="tab"><%=tabs[i]%></a></li>
            <%
        }
        %>
    </ul>
    <div class="tab-content">
        <%
        for(int i=0;i<tabs.length;i++){
            String fname = "wizards/nightaudit/na"+String.valueOf(i+1)+".jsp?cldate="+cldate;
            %>
        <div class="tab-pane" id="tab<%=i+1%>">
            <div class="panel panel-primary" id='na<%=i+1%>'>
                <div class="panel-heading" style="margin-left: 212px;">
                    <h3 class="panel-title">
                        ნაბიჯი <%=i+1%> - <%=tabs.length%>-დან [ <%=tabs[i]%> <%=cldate%> ]
                    </h3>
                </div>
                <div class="panel-body" style="height:300px;">
                    <jsp:include page="<%= fname %>" flush="true" />    
                </div>
            </div>
        </div>
            <%
        }
        %>
        <ul class="pager wizard">
            <li class="previous first" style="display:none;"><a href="#">პირველი</a></li>
            <li class="previous"><a href="#">წინა</a></li>
            <li class="next last" style="display:none;"><a href="#">ბოლო</a></li>
            <li class="next"><a href="#">შემდეგი</a></li>
        </ul>
    </div>	
</div>