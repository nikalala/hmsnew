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
//        $('.date').datepicker(<%=pickerformat1%>);
        $('.dropdown').selectpicker();
        $(".btn-group").css("width", "auto", "!important");
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
    <div class="row" style="margin-bottom: 0px; padding-left: 5px;  padding-right: 5px;">
        <div class="col-md-16" style="height: 15px;">
            <table class="table table-condensed table-bordered" width="100%" cellspacing="0" id="transaction-title" style="background-color: #FFFFFF; margin-top: 2px; margin-bottom: 2px;">
                <tbody>
                    <tr>
                        <td align="left" style="font-size: 12px; border: none;"><b style="padding-left: 10px; color: #598904"> რეჟიმი: <span style="color: #598904">...</span></b></td>
                        <td align="center" style="font-size: 12px; border: none;"><button type="button" class="btn btn-default" id="addnewexps"
                                style="border: 0; font-weight: bold; float: right; color: black; font-weight: bold; padding: 1px 10px;">
                            ახლის დამატება
                        </button></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    
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