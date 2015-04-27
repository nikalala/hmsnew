<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
    String startdate = dt.format(dclosedate);
    String enddate = dt.format(dclosedate);
    
%>
<div class="panel panel-default" id='leftpanel' style="margin-top: 0px; height: 215px; font-family: bgmtavr;">
        <div class="panel-heading  panel-title" style="text-align: center; font-size: 16px !important; height: 31px; background-color: #474544 !important;">
            <b style='vertical-align: middle; color: #FFFFFF; font-family: bgmtavr;'>ძებნა</b>
        </div>
        <div class="panel-body" style="background-color: #FFFFFF;">
                <div class="col-md-16">
                    <label class="col-md-7" style="line-height: 2.4;">თარიღიდან</label>
                    <div class="col-md-9 input-append date">
                        <input class="form-control" id="startdate" value="<%=startdate%>"/>
                        <span class="add-on" style="position:absolute !important; right: 10px  !important;background : none  !important;border: none !important;top: 1px;">
                            <i class="fa fa-calendar"></i>
                        </span>
                    </div>
                </div>
                <div class="col-md-16">
                    <label class="col-md-7" style="line-height: 2.4;">თარიღამდე</label>
                    <div class="col-md-9 input-append date">
                        <input class="form-control" id="enddate" value="<%=enddate%>"/>
                        <span class="add-on" style="position:absolute !important; right: 10px  !important;background : none  !important;border: none !important;top: 1px;">
                            <i class="fa fa-calendar"></i>
                        </span>
                    </div>
                </div>
                <div class="col-md-16">
                    <label class="col-md-7" style="line-height: 2.4;">სახელი</label>
                    <div class="col-md-9"><input type="text" class="form-control" id="cname"/></div>
                </div>
                <div class="col-md-16">
                    <label class="col-md-7" style="line-height: 2.4;">ვაუჩერის #</label>
                    <div class="col-md-9"><input type="text" class="form-control" id="vnum"/></div>
                </div>
                <div class="col-md-16">
                    <a class="btn btn-default pull-right" style="margin: 5px;" onclick="resetLeftPanel();">განახლება</a>
                    <a class="btn btn-danger pull-right" style="margin: 5px;" onclick="searchExps();">ძებნა</a>
                </div>
            
        </div>
</div>
<div class="panel panel-default" id='leftpanel' style="margin-top: 0px; height: calc(100% - 227px); font-family: bgmtavr;">
        <div class="panel-heading  panel-title" style="text-align: center; font-size: 16px !important; height: 31px; background-color: #474544 !important;">
            <b style='vertical-align: middle; color: #FFFFFF; font-family: bgmtavr;'>ხარჯები</b>
        </div>
        <div class="panel-body" style="background-color: #FFFFFF;" id="folios">
            
        </div>
</div>
<script>
    
    $('#search-from, #search-to').datepicker({
        autoclose: true
    });
    
    function printExpFolio(id){
        alert("print");
    }
    
    function editExpFolio(id){
        getBody('expencesleft','expenses','ხარჯები','res1','?folioid='+id,true);
    }
    
    function delExpFolio(id){
        if(confirm("ნამდვილად გინდათ ფოლიოს წაშლა?")){
        $.post(
            "content/saveexpences.jsp",
            {
                oper: "del",
                folioid: id
            },
            function(data){
                if(data.result == 0)    BootstrapDialog.alert(data.error);
                else {
                    getBody('expencesleft','expenses','ხარჯები','res1','',true);
                }
            },
            "json"
        );
        }
    }
    
    function initDates(){
        $('.date').datepicker(<%=pickerFormatForDatePickers3%>);
    }
    
    function resetLeftPanel(){
        $("#leftpanel .form-control").val('');
        searchExps();
    }
    
    function searchExps(){
        $.post(
                "content/expencesleftfolios.jsp", 
            { 
                startdate: $("#startdate").val(), 
                enddate: $("#enddate").val(),
                cname: $("#cname").val(),
                vnum: $("#vnum").val()
            }, 
            function(data){ 
                $("#folios").html(data); 
            });
        
    }
    
    initDates();
    searchExps();
</script>

