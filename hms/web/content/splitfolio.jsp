<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
FolioBean folio = FolioManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("folioid")));

FolioBean[] folios1 = FolioManager.getInstance().loadByWhere("where guestid not in (select guestid from sharer where reservationroomid = "+folio.getReservationroomid()+") and folioid != "+folio.getFolioid()+" and guestid in (select t.guestid from reservationroom t, reservation r where t.reservationid = r.reservationid and r.status = -1)");
FolioBean[] folios2 = FolioManager.getInstance().loadByWhere("where guestid not in (select guestid from sharer where reservationroomid = "+folio.getReservationroomid()+") and folioid != "+folio.getFolioid()+" and guestid in (select t.guestid from reservationroom t, reservation r where t.reservationid = r.reservationid and r.status = 0)");
FolioBean[] folios3 = FolioManager.getInstance().loadByWhere("where guestid not in (select guestid from sharer where reservationroomid = "+folio.getReservationroomid()+") and folioid != "+folio.getFolioid()+" and guestid in (select t.guestid from reservationroom t, reservation r where t.reservationid = r.reservationid and r.status = 4)");
FolioBean[] folios4 = FolioManager.getInstance().loadByWhere("where guestid in (select guestid from sharer where reservationroomid = "+folio.getReservationroomid()+") and folioid != "+folio.getFolioid()+"");
//SharerBean[] sharers = SharerManager.getInstance().loadByWhere("where reservationroomid = "+folio.getReservationroomid()+" order by guestid");
%>
<script>
    
    function chFolioSplit(){
        var rrr = $("#foliolists").val().split("_");
        var gid = 0;
        if(rrr.length == 3)
            gid = rrr[2];
        jQuery("#listfoliosplit1").jqGrid().setGridParam({url: 'content/getfoliolist1.jsp?reservationroomid='+rrr[0]+'&itemize=true&folioid='+rrr[1]+'&hideunposted=false&hidevoid=false&guestid='+gid}).trigger("reloadGrid");
    }
    
    function moveFolioitem(ids){
        
        var rrr = $("#foliolists").val().split("_");
        if(ids.length == 0) BootstrapDialog.alert("აირჩიეთ ჩანაწერები მარცხენა ცხრილიდან");
        else if(rrr.length == 1) BootstrapDialog.alert("აირჩიეთ საბოლოო ფოლიო");
        else{
            var gid = 0;
            if(rrr.length == 3) gid = rrr[2];
            $.post("content/ajax/movefolio.jsp",{ fromfolio: <%=folio.getFolioid()%>, ids: ids.join(","), tofolio: rrr[1], gid: gid },function(data){
                if(data.result == 0)    BootstrapDialog.alert(data.error);
                else {
                    jQuery("#listfoliosplit").jqGrid().trigger("reloadGrid");
                    jQuery("#listfoliosplit1").jqGrid().trigger("reloadGrid");
                    jQuery('#listfolio').jqGrid().trigger("reloadGrid");
                }
            },"json");
        }
    }
    
    $(document).ready(function(){
        $("#mediummodalsave").remove();

        
    
    jQuery('#listfoliosplit').jqGrid(
    {
        url:'content/getfoliolist1.jsp?reservationroomid=<%=folio.getReservationroomid()%>&itemize=true&folioid=<%=folio.getFolioid()%>&hideunposted=false&hidevoid=false',
        datatype: 'xml',
        colNames:['ოთახი', 'თარიღი', 'ნომერი', 'ტიპი', 'აღწერა', 'მომხმარებელი','მოქმედება','','ფასი','st','z'],
        colModel:[
            {width: 65, hidden:false, name:'roomnumber', index:'roomnumber', align:'left'},
            {width: 85, hidden:false, name:'itemdate', index:'itemdate', align:'left'},
            {width: 85, hidden:true, name:'number', index:'number', align:'center'},
            {width: 135, hidden:false, name:'type', index:'type', align:'left'},
            {width: 185, hidden:true, name:'descr', index:'descr', align:'left'},
            {width: 105, hidden:true, name:'regby', index:'regby', align:'left'},
            {width: 85, hidden:true, name:'act', index:'act', align:'center'},
            {width: 25, hidden:false, name:'curr', index:'curr', align:'right'},
            {width: 35, hidden:false, name:'price', index:'price', align:'right'},
            {hidden:true, name:'st', index:'st'},
            {hidden:true, name:'z', index:'z'}
        ],
        rowNum:2000,
        height: 400,
        autowidth: true,
        sortname: 'name',
        viewrecords: true,
        sortorder: 'asc',
        //altRows: true,
        //altclass: 'altrow',
        multiselect: true,
        loadComplete: function() {
            var rows = $("#listfoliosplit").getDataIDs();
            var totbal = 0;
            for (var i = 0; i < rows.length; i++)
            {
                var z = Number($("#listfoliosplit").getCell(rows[i],"z"));
                if(z == 0){
                    $("#listfoliosplit").jqGrid('setRowData',rows[i],false, {'text-decoration': 'line-through'});
                    jQuery("#jqg_listfoliosplit_"+rows[i]).hide();
                }
                var st = $("#listfoliosplit").getCell(rows[i],"st");
                if(st == "0"){
                    $("#listfoliosplit").jqGrid('setRowData',rows[i],false, {color: '#949090'});
                    jQuery("#jqg_listfoliosplit_"+rows[i]).hide();
                }
                var price = Number($("#listfoliosplit").getCell(rows[i],"price"));
                
                if(z == 1)  totbal += price;
            }
            $("#listfoliosplit td").css('border-right-style', 'none').css('border-left-style', 'none');
            
            //$("#folio_total_balance").html(totbal.toFixed(2));
        }
        })
        .jqGrid('bindKeys')


jQuery('#listfoliosplit1').jqGrid(
    {
        url:'content/getfoliolist1.jsp?reservationroomid=0&itemize=true&folioid=0&hideunposted=false&hidevoid=false',
        datatype: 'xml',
        colNames:['ოთახი', 'თარიღი', 'ნომერი', 'ტიპი', 'აღწერა', 'მომხმარებელი','მოქმედება','','ფასი','st','z'],
        colModel:[
            {width: 65, hidden:false, name:'roomnumber', index:'roomnumber', align:'left'},
            {width: 85, hidden:false, name:'itemdate', index:'itemdate', align:'left'},
            {width: 85, hidden:true, name:'number', index:'number', align:'center'},
            {width: 135, hidden:false, name:'type', index:'type', align:'left'},
            {width: 185, hidden:true, name:'descr', index:'descr', align:'left'},
            {width: 105, hidden:true, name:'regby', index:'regby', align:'left'},
            {width: 85, hidden:true, name:'act', index:'act', align:'center'},
            {width: 25, hidden:false, name:'curr', index:'curr', align:'right'},
            {width: 35, hidden:false, name:'price', index:'price', align:'right'},
            {hidden:true, name:'st', index:'st'},
            {hidden:true, name:'z', index:'z'}
        ],
        rowNum:2000,
        height: 380,
        autowidth: true,
        sortname: 'name',
        viewrecords: true,
        sortorder: 'asc',
        //altRows: true,
        //altclass: 'altrow',
        //multiselect: true,
        loadComplete: function() {
            var rows = $("#listfoliosplit1").getDataIDs();
            var totbal = 0;
            for (var i = 0; i < rows.length; i++)
            {
                var z = Number($("#listfoliosplit1").getCell(rows[i],"z"));
                if(z == 0){
                    $("#listfoliosplit1").jqGrid('setRowData',rows[i],false, {'text-decoration': 'line-through'});
                    jQuery("#jqg_listfoliosplit1_"+rows[i]).hide();
                }
                var st = $("#listfoliosplit1").getCell(rows[i],"st");
                if(st == "0"){
                    $("#listfoliosplit1").jqGrid('setRowData',rows[i],false, {color: '#949090'});
                    jQuery("#jqg_listfoliosplit1_"+rows[i]).hide();
                }
                var price = Number($("#listfoliosplit1").getCell(rows[i],"price"));
                
                if(z == 1)  totbal += price;
            }
            $("#listfoliosplit1 td").css('border-right-style', 'none').css('border-left-style', 'none');
            
            //$("#folio_total_balance").html(totbal.toFixed(2));
        }
        })
        .jqGrid('bindKeys')


    });

</script>
<table width="100%">
    <tr>
        <td width="48%" valign="top" align="center">
            <table id='listfoliosplit' width='100%' align='center'></table>
        </td>
        <td width="4%" align="center">
            <button style="width: 20px; margin: 2px;" onclick="moveFolioitem(jQuery('#listfoliosplit').jqGrid('getGridParam','selarrrow'))" type="button" class="btn btn-sm btn-danger navbar-btn">&nbsp;>>&nbsp;</button>
        </td>
        <td width="48%" valign="top" align="center">
            <select id="foliolists" style="width: 200px;" onchange="chFolioSplit()">
                <option value="-1">-- აირჩიეთ --</option>
                <optgroup label="შარერები">
                <%
                for(int i=0;i<folios4.length;i++){
                    String sel = "";
                    GuestBean gs = GuestManager.getInstance().loadByPrimaryKey(folios4[i].getGuestid());
                    String gname = "";
                    SalutationBean salutation = SalutationManager.getInstance().loadByPrimaryKey(gs.getSalutationid());
                    gname += salutation.getName()+" ";
                    gname += gs.getFname() + " " + gs.getLname();
                    String gendername = "?";
                    if(gs.getGender() != null){
                        gendername = gender[gs.getGender().intValue()];
                    }
                %>
                <option value="<%=folios4[i].getReservationroomid()%>_<%=folios4[i].getFolioid()%>" <%=sel%>><%=folios4[i].getNum()%> <%=gname%></option>
                <%
                }
                %>
                <%--
                for(int i=0;i<sharers.length;i++){
                    String sel = "";
                    GuestBean gs = GuestManager.getInstance().loadByPrimaryKey(sharers[i].getGuestid());
                    String gname = "";
                    SalutationBean salutation = SalutationManager.getInstance().loadByPrimaryKey(gs.getSalutationid());
                    gname += salutation.getName()+" ";
                    gname += gs.getFname() + " " + gs.getLname();
                    String gendername = "?";
                    if(gs.getGender() != null){
                        gendername = gender[gs.getGender().intValue()];
                    }
                %>
                <option value="<%=folio.getReservationroomid()%>_0_<%=sharers[i].getGuestid()%>" <%=sel%>><%=gname%></option>
                <%
                }
                --%>
                </optgroup>
                <optgroup label="მცხოვრები სტუმრები">
                <%
                for(int i=0;i<folios1.length;i++){
                    String sel = "";
                    GuestBean gs = GuestManager.getInstance().loadByPrimaryKey(folios1[i].getGuestid());
                    String gname = "";
                    SalutationBean salutation = SalutationManager.getInstance().loadByPrimaryKey(gs.getSalutationid());
                    gname += salutation.getName()+" ";
                    gname += gs.getFname() + " " + gs.getLname();
                    String gendername = "?";
                    if(gs.getGender() != null){
                        gendername = gender[gs.getGender().intValue()];
                    }
                %>
                <option value="<%=folios1[i].getReservationroomid()%>_<%=folios1[i].getFolioid()%>" <%=sel%>><%=folios1[i].getNum()%> <%=gname%></option>
                <%
                }
                %>
                </optgroup>
                <optgroup label="დარეზერვებული სტუმრები">
                <%
                for(int i=0;i<folios2.length;i++){
                    String sel = "";
                    GuestBean gs = GuestManager.getInstance().loadByPrimaryKey(folios2[i].getGuestid());
                    String gname = "";
                    SalutationBean salutation = SalutationManager.getInstance().loadByPrimaryKey(gs.getSalutationid());
                    gname += salutation.getName()+" ";
                    gname += gs.getFname() + " " + gs.getLname();
                    String gendername = "?";
                    if(gs.getGender() != null){
                        gendername = gender[gs.getGender().intValue()];
                    }
                %>
                <option value="<%=folios2[i].getReservationroomid()%>_<%=folios2[i].getFolioid()%>" <%=sel%>><%=folios2[i].getNum()%> <%=gname%></option>
                <%
                }
                %>
                </optgroup>
                <optgroup label="გაწერილი სტუმრები">
                <%
                for(int i=0;i<folios3.length;i++){
                    String sel = "";
                    GuestBean gs = GuestManager.getInstance().loadByPrimaryKey(folios3[i].getGuestid());
                    String gname = "";
                    SalutationBean salutation = SalutationManager.getInstance().loadByPrimaryKey(gs.getSalutationid());
                    gname += salutation.getName()+" ";
                    gname += gs.getFname() + " " + gs.getLname();
                    String gendername = "?";
                    if(gs.getGender() != null){
                        gendername = gender[gs.getGender().intValue()];
                    }
                %>
                <option value="<%=folios3[i].getReservationroomid()%>_<%=folios3[i].getFolioid()%>" <%=sel%>><%=folios3[i].getNum()%> <%=gname%></option>
                <%
                }
                %>
                </optgroup>
            </select><br>
            <table id='listfoliosplit1' width='100%' align='center'></table>
        </td>
    </tr>
</table>