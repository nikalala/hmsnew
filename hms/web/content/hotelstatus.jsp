<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<link rel="stylesheet" type="text/css" href="css/grid-filter.css">

<script type="text/javascript">

    $(document).ready(function () {

        loadDefaults();
        drawTwoDimFooterForGuestDbList();

    });

    function loadDefaults() {
        initializeGrid(hsGrid);
        $('#grid-table .date').datepicker(<%=pickerformat1%>);
        $('#grid-table .dropdown').selectpicker();
        $("#grid-table .btn-group").css("width", "100%", "!important");
        $("#grid-table label").each(function () {
            $(this).css("float", "right", "!important");
            $(this).css("line-height", "27px", "!important");
        });
        $("#grid-table input").height($("#grid-table .btn-group").height() - 6, "!important");
        $("#filter-form input[type='text']").css("width", "100%", "!important");
        $("#grid-table .date input[type='text']").css("position", "relative");
        $("#grid-table #roomBean").next().css("padding-left", "0");
        $("#grid-table #roomType").next().css("padding-right", "0");
    }

    function drawTwoDimFooterForGuestDbList() {
        $(".ui-jqgrid-bdiv").height($(".ui-jqgrid-bdiv").height() - 100);
        var html =
                '<div class="panel-footer" style="height: 50px !important; display:table; width: 100%; padding-bottom: 1px; background-color: #FFF;">' +
                '<div>' +
                '<span style="margin: 15px 10px 0 10px; float: left;">მონიშნულის: </span>' +
                '<button type="button" class="btn btn-default" id="btnDropSelected" onclick="deleteSelectedGuest()" style="font-weight: bold; float: left; margin: 9px 10px 0 0;">' +
                'წაშლა <i class="fa fa-trash"></i></button>' +
                '<button type="button" class="btn btn-default" id="btnJoinSelected" onclick="joinSelected()" style="font-weight: bold; float: left; margin: 9px 10px 0 0;">' +
                'გაერთიანება <i class="fa fa-life-bouy"></i></button>' +
                '</div></div>' +
                '<div class="panel-footer" style="height: 50px !important; display:table; width: 100%; padding-bottom: 1px; background-color: #FFF;">' +
                '<div>' +
                '<span style="margin: 15px 10px 0 10px; float: left;">ჩანაწერების რაოდენობა გვერდზე</span>' +
                '<select id="limitselectbox" style="float: left; margin: 15px 10px 0 10px;">' +
                '<option value="5">5</option>' +
                '<option value="15">15</option>' +
                '<option value="25">25</option>' +
                '<option value="50">50</option>' +
                '</select>' +
                '<button type="button" class="btn btn-default" id="btnNext" style="font-weight: bold; float: right; margin: 9px 10px 0 0;">' +
                'შემდეგი</button>' +
                '<button type="button" class="btn btn-danger" id="btnPrev" style="font-weight: bold; float: right; margin: 9px 10px 0 0;">' +
                'წინა</button>' +
                '</div></div>';
        $(".ui-jqgrid-view").find(".panel-footer").remove();
        $(".ui-jqgrid-view").append(html);
    }




</script>

<form name="filter-form" id="filter-form" class="filter-form1">
    <table id="grid-table" class="first-table">
        <tr>
            <td>
                <div id="status_bar" class="first-status-bar" align='center'>
                    <div style="width: 100%; float: left;">
                        <button type="button" class="btn btn-default" id="btnSearch"
                                style="border: 0; font-weight: bold; float: left; margin: 3px 5px 0 0;">
                            ძიება
                        </button>
                        <button type="button" class="btn btn-default" id="btnShowAll" onclick="doFilter(true);"
                                style="border: 0; font-weight: bold; float: left; margin: 3px 5px 0 0;">
                            მაჩვენე ყველა
                        </button>
                    </div>
                </div>
            </td>
        </tr>
    </table>
    <table id="grid-table">
        <tr>
            <td>
                <table id='list_hsgrid' class="table-striped table-hover" align='center'></table>
            </td>
        </tr>
    </table>
</form>