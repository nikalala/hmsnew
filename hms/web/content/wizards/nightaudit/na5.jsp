<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../../includes/init.jsp"%>
<script>
    
    function postAll(ids){
        if(ids.length > 0){
            $.post("content/postfolioitems.jsp",{ ids: "'"+ids+"'"},function(data){
                if (data.result == 0)    BootstrapDialog.alert(data.error);
                else {
                    reloadGrid("list_postcharges");
                    BootstrapDialog.info("ოპერაცია წარმატებით შესრულდა");
                }
            },"json");
        } else BootstrapDialog.alert("აირჩიეთ ჩანაწერ(ებ)ი");
    }
    
    function initializeGridMs(grid) {
    //console.log("initializing grid named > " + grid.id);
    jQuery("#" + grid.id).jqGrid(
        {
            url: grid.url,
            datatype: grid.type,
            colNames: grid.cols,
            colModel: grid.model,
            gridComplete: grid.gridComplete,
            beforeRequest: grid.beforeRequest,
            rowNum: 2000,
            height: 320,
            autowidth: true,
            sortname: grid.sort,
            //viewrecords: true,
            sortorder: grid.order,
            multiselect: true,
            loadComplete: function () {
                $("#" + grid.id + " td:last-child").removeAttr("title");
                reInitializeGrid(grid.id, grid.isPopup);
                $(".ui-jqgrid-htable").css("background", "#FFF").css("border-bottom", "solid 1px #D1D1D1");
                //console.log("initializing grid named > " + grid.id + " is completed successfully");
            },
            gridComplete: function () {
                var rows = $("#"+grid.id).getGridParam("records");
                if (rows > 0) {
                    $("#no"+grid.id).hide();
                    $("#"+grid.id).show();
                } else {
                    $("#no"+grid.id).show();
                    $("#"+grid.id).hide();
                }
                $("#nastp5").val(rows);
            }
        })
        .jqGrid('bindKeys')
        ;
}
    
    
    $(document).ready(function() {
        initializeGridMs(postchargesGrid);
    });
</script>
<div id="nolist_postcharges" style="color: red;">მიმდინარე თარიღისთვის არ არსებობს დაუსრულებელი რეზერვაცია</div>
<table id='list_postcharges' class="table-striped table-hover" align='center'></table>
<button type="button" class="btn btn-sm btn-primary navbar-btn" onclick="postAll(jQuery('#list_postcharges').jqGrid('getGridParam','selarrrow'))">არჩეულ(ებ)ის დასრულება</button>

