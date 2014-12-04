<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<% RoomBean[] roomBeans = RoomManager.getInstance().loadByWhere("ORDER BY ord"); %>
<% RoomtypeBean[] roomTypes = RoomtypeManager.getInstance().loadByWhere("ORDER BY ord"); %>
<% ReservationtypeBean[] reservTypes = ReservationtypeManager.getInstance().loadByWhere(""); %>
<link rel="stylesheet" type="text/css" href="css/grid-filter.css">

<script type="text/javascript">

    $(document).ready(function () {
        loadDefaults();
    });

    function loadDefaults() {
        $('.date').datepicker(<%=pickerformat1%>);
        $('.dropdown').selectpicker();
        $(".btn-group").css("width", "100%", "!important");
        $("#grid-table label").each(function () {
            $(this).css("float", "right", "!important");
            $(this).css("line-height", "27px", "!important");
        });
        $("#filter-form input[type='text']").css("width", "100%", "!important");
        $(".date input[type='text']").css("position", "relative");
        $("#res1").css("margin", "0px 10px 10px 10px");
        $("#grid-table").width($("#filter-form").width());
    }

</script>

<form name="filter-form" id="filter-form">
    <table id="grid-table" class="first-table">
        <tr>
            <td>
                <div id="status_bar" class="first-status-bar" align='center'>
                    <div style="width: 100%; float: left;">
                        <span style="float: left; margin: 7px 0 0 10px;color: #67A338;">რეჟიმი:</span>
                        <button type="button" class="btn btn-default" id="addnewexps"
                                style="border: 0; font-weight: bold; float: right; margin: 3px 5px 0 0;">
                            ახლის დამატება
                        </button>
                    </div>
                </div>
            </td>
        </tr>
    </table>
    <div class="row" style="margin-top: 10px; margin-bottom: 0px; padding-left: 5px;  padding-right: 5px;">
        <div class="col-md-7" style="height: 145px;">
            <div class="panel panel-primary" id='contactinfo'>
                <jsp:include page="contactinfo.jsp">
                    <jsp:param name="none" value="none"/>
                </jsp:include>
            </div>
        </div>
        <div class="col-md-9" style="height: 145px;">
            <div class="panel panel-primary" id='voucherinfo'>
                <jsp:include page="voucherinfo.jsp">
                    <jsp:param name="none" value="none"/>
                </jsp:include>
            </div>
        </div>
    </div>

    <div class="row" style="margin-top: 10px; margin-bottom: 0px; padding-left: 5px;  padding-right: 5px;">
        <div class="col-md-16" style="height: 165px;">
            <div class="panel panel-primary" id='chargerinfo'>
                <jsp:include page="chargerinfo.jsp">
                    <jsp:param name="none" value="none"/>
                </jsp:include>
            </div>
        </div>
    </div>

</form>
<div align="center" id="grid-footer"
     style="background: transparent; width: 100%;height: 33px;line-height: 33px; margin:0 auto;">
    <div style="background-color: red; margin:10px 0 10px 0;">HELLO THIS IS THE FOOTER</div>
</div>