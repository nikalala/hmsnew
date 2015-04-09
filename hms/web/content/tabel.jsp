<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<style>
    .bgweekend { background-color: #ff9999; }
    .bgholliday { background-color: #99ff99; }
    .ui-datepicker-calendar {display: none;}
</style>
<%
Calendar cal0 = Calendar.getInstance();
int year = cal0.get(Calendar.YEAR);
int month = cal0.get(Calendar.MONTH);
DepartamentBean[] departaments = DepartamentManager.getInstance().loadByWhere("order by code");
HallidaytypeBean[] htps = HallidaytypeManager.getInstance().loadByWhere("order by name");
%>
<script type="text/javascript">
    var pyear = <%=year%>;
    var pmonth = <%=month%>;
    function doPost(){
	$.post("content/getcolmodeltabel.jsp", { year: pyear, month: pmonth, deptid: $("#deptid").val() },function(data){$("#tabel").html(data);});
    }

    jQuery().ready(function ()
    {
        $('#repdate').datepicker( {
            changeMonth: true,
            changeYear: true,
            //showButtonPanel: true,
            dateFormat: 'MM yy',
            showOn: "button",
            buttonImage: "images/calendar.gif",
            buttonImageOnly: true,
            monthNames: ['იანვარი','თებერვალი','მარტი','აპრილი','მაისი','ივნისი','ივლისი','აგვისტო','სექტემბერი','ოქტომბერი','ნოემბერი','დეკემბერი'],
            monthNamesShort: ['იან','თებ','მარ','აპრ','მაი','ივნ','ივლ','აგვ','სექ','ოქტ','ნოე','დეკ'],
            //closeText : "არჩევა",
            onChangeMonthYear: function(year, month, inst) { 
                $(this).datepicker('setDate', new Date(year, month-1, 1));
		pyear = year;
		pmonth = month-1;
		doPost();
            }
        });
        
	doPost();
    });
</script>
<table width="100%">
    <tr>
        <td class="gText" nowrap width="20%">
	    <select class="gText" name="deptid" id="deptid" onchange="doPost()">
	    <%for(int i=0;i<departaments.length;i++){%>
		<option class="gText" value="<%=departaments[i].getDepartamentid()%>"><%=departaments[i].getCode()%> <%=departaments[i].getName()%></option>
	    <%}%>
	    </select>
	</td>
	<td class="gText" nowrap>
            <div id="repdate" class="date-picker"></div>
        </td>
    </tr>
    <tr>
        <td class="gText" id="tabel" colspan="2">
            
        </td>
    </tr>
    <tr>
        <td class="gText" colspan="2">
            <table align="left">
                <tr>
                    <td align="left" valign="top" class="gText" colspan="2"><b>ლეგენდა</b>:</td>
                <%
                for(int i=0;i<htps.length;i++){
                %>
                    <td align="left" valign="top" class="gText" colspan="1" style="background-color: <%=htps[i].getColor()%>;"><%=htps[i].getName()%></td>
                <%}%>
                <td align="left" valign="top" class="gText" colspan="1" style="background-color: #99ff99;">დასვენების დღე</td>
                </tr>
            </table>
        </td>
    </tr>
</table>


