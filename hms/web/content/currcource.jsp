<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<%
    CurrencyBean[] currencyBeans = CurrencyManager.getInstance().loadByWhere("");
    String mainCourse = "";
    for (int i = 0; i < currencyBeans.length; i++) {
        if(currencyBeans[i].getBasic())
        {
            mainCourse = currencyBeans[i].getIcon();
        }
    }
%>

<script type="text/javascript">

    $(document).ready(function () {
        $('.dropdown').selectpicker();
        $("#curr_table .btn-group").css("width","100%");
        $("#curr_table input").height("27px", "!important");
        $("#curr_table input[type='text']").css("width", "100%", "!important");
        $(".currtxt").ForceNumericOnly();
    });

    $("#currs").on('change', function () {
        getRate();
    });

    function getRate()
    {
        var element = $("#currs option:selected");
        var val = element.val();
        if(!isNullOrEmpty(val))
        {
            $("#simple_curr_symb").html(element.attr("symbol"));
            calculate(val);
        }
    }

    $(document).on("change",".currtxt",function(){
       getRate();
    });

    function calculate(id)
    {
        $.post("content/getcurrrate.jsp?query=" + id, {}, function (data) {
            $("#main_curr").val(data * $("#simple_curr").val());
        });
    }

</script>
<div>
    <table style="width: 278px; max-width: 278px; text-align: center;" id="curr_table" align="center">
        <tr>
            <td colspan="5">
                <select class="dropdown" id="currs">
                    <option value="0">-აირჩიეთ-</option>
                    <% for (int i = 0; i < currencyBeans.length; i++) { %>
                    <option symbol="<%=currencyBeans[i].getIcon()%>" value="<%=currencyBeans[i].getCurrencyid()%>"><%=currencyBeans[i].getName()%>
                        (<%=currencyBeans[i].getIcon()%>)
                    </option>
                    <% } %>
                </select>
            </td>
        </tr>
        <tr>
            <td colspan="5">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="5" style="float: left; padding-left: 2px; vertical-align: middle;">
                გაცვლითი კურსი
            </td>
        </tr>
        <tr>
            <td colspan="5">&nbsp;</td>
        </tr>
        <tr>
            <td>
                <input type="text" class="currtxt" id="simple_curr" value="1">
            </td>
            <td>
                <span id="simple_curr_symb"></span>
            </td>
            <td>
                =
            </td>
            <td>
                <input type="text" class="currtxt" id="main_curr">
            </td>
            <td>
                <span id="main_curr_symb"><%=mainCourse%></span>
            </td>
        </tr>
    </table>
</div>
