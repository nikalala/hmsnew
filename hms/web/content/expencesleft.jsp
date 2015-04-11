<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
    
    
%>
<div class="panel panel-default" id='leftpanel' style="margin-top: 0px; height: 215px; font-family: bgmtavr;">
        <div class="panel-heading  panel-title" style="text-align: center; font-size: 16px !important; height: 31px; background-color: #474544 !important;">
            <b style='vertical-align: middle; color: #FFFFFF; font-family: bgmtavr;'>ძებნა</b>
        </div>
        <div class="panel-body" style="background-color: #FFFFFF;">
                <div class="col-md-16">
                    <label class="col-md-7" style="line-height: 2.4;">თარიღიდან</label>
                    <div class="col-md-9"><input class="form-control" id="search-from"/></div>
                </div>
                <div class="col-md-16">
                    <label class="col-md-7" style="line-height: 2.4;">თარიღამდე</label>
                    <div class="col-md-9"><input class="form-control" id="search-to"/></div>
                </div>
                <div class="col-md-16">
                    <label class="col-md-7" style="line-height: 2.4;">სახელი</label>
                    <div class="col-md-9"><input type="text" class="form-control"/></div>
                </div>
                <div class="col-md-16">
                    <label class="col-md-7" style="line-height: 2.4;">ვაუჩერის #</label>
                    <div class="col-md-9"><input type="text" class="form-control"/></div>
                </div>
                <div class="col-md-16">
                    <a class="btn btn-default pull-right" style="margin: 5px;">განახლება</a>
                    <a class="btn btn-danger pull-right" style="margin: 5px;">ძებნა</a>
                </div>
            
        </div>
</div>
<div class="panel panel-default" id='leftpanel' style="margin-top: 0px; height: calc(100% - 227px); font-family: bgmtavr;">
        <div class="panel-heading  panel-title" style="text-align: center; font-size: 16px !important; height: 31px; background-color: #474544 !important;">
            <b style='vertical-align: middle; color: #FFFFFF; font-family: bgmtavr;'>ხარჯები</b>
        </div>
        <div class="panel-body" style="background-color: #FFFFFF;">
            <table class="table table-striped">
                <tbody>
                    <tr>
                        <td>123</td>
                        <td>vaax vendor midi aba</td>
                        <td style="text-align: center;"><i class="fa fa-print"></i></td>
                        <td style="text-align: center;"><i class="fa fa-pencil" style="color: #febd04;"></i></td>
                        <td style="text-align: center;"><i class="fa fa-trash-o" style="color: red;"></i></td>
                    </tr>
                    <tr>
                        <td>5896</td>
                        <td>samosi pirveli</td>
                        <td style="text-align: center;"><i class="fa fa-print"></i></td>
                        <td style="text-align: center;"><i class="fa fa-pencil" style="color: #febd04;"></i></td>
                        <td style="text-align: center;"><i class="fa fa-trash-o" style="color: red;"></i></td>
                    </tr>
                    <tr>
                        <td>658</td>
                        <td>kaloche</td>
                        <td style="text-align: center;"><i class="fa fa-print"></i></td>
                        <td style="text-align: center;"><i class="fa fa-pencil" style="color: #febd04;"></i></td>
                        <td style="text-align: center;"><i class="fa fa-trash-o" style="color: red;"></i></td>
                    </tr>
                </tbody>
            </table>
        </div>
</div>
<script>
    $('#search-from, #search-to').datepicker({
        autoclose: true
    });
</script>
