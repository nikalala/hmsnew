<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<%

    request.setCharacterEncoding("UTF-8");
    String updatestr = (String) request.getParameter("query");
    System.out.println(updatestr);
%>

<link rel="stylesheet" type="text/css" href="css/grid-filter.css">

<script type="text/javascript">

    $(document).ready(function () {

        loadDefaults();

    });

    function joinGuests()
    {
        var ids = getRadioRowIds("list_contrgrid");
        if(isNullOrEmpty(ids))
        {
            BootstrapDialog.alert("მონიშნეთ მინიმუმ ერთი ჩანაწერი");
            return;
        }
        BootstrapDialog.confirm("ნამდვილად გსურთ დარჩენილი ჩანაწერების წაშლა", function (result) {
            if (!isNullOrEmpty(result)) {
                if (result == true) {
                    var update = "?query=UPDATE contragent set deleted = true where contragentid in (" + ids + ")";
                    $.post("content/execute.jsp" + update, {}, function (data) {
                        $("#dismissbutton").click();
                        doFilter(true);
                    });
                }
            }
        });
    }

    function loadDefaults() {

        var where = '<%=updatestr%>';
        if(!isNullOrEmpty(where))
        {
            constagentGrid.url = "content/getconscontrlist.jsp?query=" + where;
        }
        initializeGrid(constagentGrid);

        $("#grid-table .btn-group").css("width", "100%", "!important");
        $("#grid-table label").each(function () {
            $(this).css("float", "right", "!important");
            $(this).css("line-height", "27px", "!important");
        });
        $("#filter-form input[type='text']").css("width", "100%", "!important");
        $("#grid-table .date input[type='text']").css("position", "relative");
        $("#list_contrgrid").parent().parent().css("height","100%","!important");
        $(".modal-dialog").css("width",$("#list_contrgrid").width()+45);
        $("#list_contrgrid").closest('#smbody').next().hide();

    }
</script>
<form name="filter-form" id="filter-form">
    <table id="grid-table">
        <tr>
            <td>
                <table id='list_contrgrid' class="table-striped table-hover" align='center'></table>
            </td>
        </tr>
    </table>
</form>
<div class="modal-footer">
    <button type="button" class="btn btn-default" id="dismissbutton" data-dismiss="modal" onclick="this.click();">დახურვა</button>
    <button type="button" class="btn btn-primary" onclick="joinGuests()">გაერთიანება</button>
</div>