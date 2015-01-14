<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<%
    CurrencyBean[] currencyBeans = CurrencyManager.getInstance().loadByWhere("");
    String mainCourse = "";
    for (int i = 0; i < currencyBeans.length; i++) {
        if (currencyBeans[i].getBasic()) {
            mainCourse = currencyBeans[i].getIcon();
        }
    }
%>

<script type="text/javascript">

    $(document).ready(function () {
        $('.dropdown').selectpicker();
        $("#curr_table .btn-group").css("width", "100%");
        $("#curr_table input").height("27px", "!important");
        $("#curr_table input[type='text']").css("width", "100%", "!important");
        $(".currtxt").ForceNumericOnly();
        $("#curr_table").closest('#smbody').next().hide();
    });

    $("#currs").on('change', function () {
        getRate();
    });

    function getRate() {
        var element = $("#currs option:selected");
        /*    if(element.attr("basic") == "true")
         {
         $(".currtxt").prop("disabled",true);
         }else{
         $(".currtxt").prop("disabled",false);
         }*/
        var val = element.val();
        if (!isNullOrEmpty(val)) {
            $("#simple_curr_symb").html(element.attr("symbol"));
            calculate(val);
        }
    }

    /* $(document).on("change",".currtxt",function(){
     getRate();
     });*/

    function calculate(id) {
        $.post("content/getcurrrate.jsp?query=" + id, {}, function (data) {
            $("#main_curr").val(data);
        });
    }

    function SaveCurr() {
        var simpl = $("#simple_curr").val();
        var main = $("#main_curr").val();
        var selected = $("#currs option:selected");
        if (!isNullOrEmpty(simpl) && !isNullOrEmpty(main) && !isNullOrEmpty(selected.val()) && main > 0 && simpl > 0) {
            var calculated = main / simpl;
            var insert = "INSERT INTO currencyrate(currencyrateid,currencyid, value) VALUES ((SELECT MAX(currencyrateid) %2B 1 FROM currencyrate)," + selected.val() + "," + calculated + ")";
            console.log(insert);
            $.post("content/execute.jsp?query=" + insert, {}, function (data) {
                $("#dismissbutton").click();
            });
        }
    }

</script>
<div>
    <table style="width: 278px; max-width: 278px; text-align: center;" id="curr_table" align="center">
        <tr>
            <td colspan="5">
                <select class="dropdown" id="currs">
                    <option value="">-აირჩიეთ-</option>
                    <% for (int i = 0; i < currencyBeans.length; i++) { %>
                    <option basic="<%=currencyBeans[i].getBasic()%>" symbol="<%=currencyBeans[i].getIcon()%>"
                            value="<%=currencyBeans[i].getCurrencyid()%>"><%=currencyBeans[i].getName()%>
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
    <div class="modal-footer" style="margin-top: 10px;">
        <button type="button" class="btn btn-default" id="dismissbutton" data-dismiss="modal" onclick="this.click();">
            დახურვა
        </button>
        <button type="button" class="btn btn-primary" onclick="SaveCurr()">შენახვა</button>
    </div>
</div>
