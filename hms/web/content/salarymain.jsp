<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<style>
    .ui-datepicker-calendar {display: none;}
</style>
<%
Calendar cal0 = Calendar.getInstance();
int year = cal0.get(Calendar.YEAR);
int month = cal0.get(Calendar.MONTH);
PersonellBean[] pers = PersonellManager.getInstance().loadByWhere("where deleted = false order by lname, fname");
DepartamentBean[] departaments = DepartamentManager.getInstance().loadByWhere("order by code");
%>
<script type="text/javascript">
    var pyear = <%=year%>;
    var pmonth = <%=month%>;
    function doPost(){
        jQuery("#list1").jqGrid().setGridParam({
                    url:"content/getsalarylist.jsp?year="+pyear+"&month="+pmonth+"&deptid="+$("#deptid").val()
                }).trigger("reloadGrid");
    }

    jQuery().ready(function ()
    {
        $('#repdate1').datepicker( {
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
        
        jQuery("#list1").jqGrid(
            {
                url:'content/getsalarylist.jsp?year=<%=year%>&month=<%=month%>&deptid=<%=departaments[0].getDepartamentid()%>',
                datatype: "xml",
                colNames:[
                    'კოდი',
                    'გვარი',
                    'სახელი',
                    'თანამდებობა',
                    'დარიცხ. ხელფასი (საშტატო)',
                    'პრემია (საშ. ჩათვლით)',
                    'პრემია რეალიზებულ 1000 ბოთლზე',
                    'პრემია ჩარიცხვებიდან',
                    'ზეგანაკ. დანამატი',
                    'შვებულება',
                    'ჯამური ხელფასი',
                    
                    'დაზღვევა',
                    'წინასწარ აღებული',
                    'სულ დარიცხვით',
                    'საშემ. გადას.',
                    'ხელზე ასაღები თანხა'
                ],
                colModel:[
                    {name:'code',index:'code', editable:true, align:"left", width:100},
                    {name:'lname',index:'lname', editable:true, align:"left", width:150},
                    {name:'fname',index:'fname', editable:true, align:"left", width:150},
                    {name:'personelltype',index:'personelltype', editable:true, align:"left", width:200},
                    {name:'salary',index:'salary', editable:true, align:"right", width:100},
                    {name:'premium',index:'premium', editable:true, align:"right", width:100},
                    {name:'add2',index:'add2', editable:true, align:"right", width:100},
                    {name:'payprem',index:'payprem', editable:true, align:"right", width:100},
                    {name:'add1',index:'add1', editable:true, align:"right", width:100},
                    {name:'holliday',index:'holliday', editable:true, align:"right", width:100},
                    {name:'wsalary',index:'wsalary', editable:true, align:"right", width:100},
                    
                    {name:'insurance',index:'insurance', editable:true, align:"right", width:100},
                    {name:'avance',index:'avance', editable:true, align:"right", width:100},
                    {name:'total1',index:'total1', editable:true, align:"right", width:100},
                    {name:'tax',index:'tax', editable:true, align:"right", width:100},
                    {name:'hand',index:'hand', editable:true, align:"right", width:100}
                ],
                rowNum:<%=pers.length%>,
                height: 500,
                width:900,
                autowidth: true,
                rowList:[20,50,100],
                pager: jQuery('#pager1'),
                sortname: 'lname',
                viewrecords: true,
                sortorder: "asc",
                caption:"ხელფასები",
                ondblClickRow: function(id, ri, ci) {
                    
                }
            })
            .jqGrid('bindKeys')
            .navGrid('#pager1',{edit:false,add:false,del:false,view:false},
                        {dataheight:320,width:400,closeAfterEdit:true,reloadAfterSubmit:false,afterSubmit:checkStatus}, //  default settings for edit
                        {dataheight:320,width:400,closeAfterAdd:true,reloadAfterSubmit:true,afterSubmit:checkStatus}, //  default settings for add
                        {closeAfterDelete:true,reloadAfterSubmit:true,afterSubmit:checkStatus},  // delete instead that del:false we need this
                        {multipleSearch:true}, // search options
                        {dataheight:320,width:400,labelswidth:"68%",closeOnEscape:true} /* view parameters*/
                )
             ;
    $(".ui-jqgrid-sortable").css('white-space', 'normal');
    $(".ui-jqgrid-sortable").css('height', 'auto');
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
            <div id="repdate1" class="date-picker"></div>
        </td>
    </tr>
    <tr>
        <td class="gText" id="salarymain" colspan="2">
            <table id="list1" width="100%" align="center"></table>
            <div id="pager1"></div>
            <table id="search" width="100%" align="center"></table>
        </td>
    </tr>
</table>


