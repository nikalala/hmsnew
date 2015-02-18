<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
int cid = Integer.parseInt(request.getParameter("cid"));
long fid = Long.parseLong(request.getParameter("fid"));
FolioBean folio = FolioManager.getInstance().loadByPrimaryKey(fid);
String term = request.getParameter("term").replaceAll("'", "''").toUpperCase();
//System.out.println("select * from guest where upper(fname) || ' ' || upper(lname) like '%"+term+"%' or upper(lname) || ' ' || upper(fname) like '%"+term+"%'");
ContragentBean[] contrs = ContragentManager.getInstance().loadByWhere("where type = "+cid+" and upper(name) like '%"+term+"%' or upper(fname) || ' ' || upper(lname) like '%"+term+"%' or upper(lname) || ' ' || upper(fname) like '%"+term+"%'");
GuestBean[] guests = GuestManager.getInstance().loadByWhere("where upper(fname) || ' ' || upper(lname) like '%"+term+"%' or upper(lname) || ' ' || upper(fname) like '%"+term+"%'");
%>
<style>
    table.scrollsrch tbody,
    table.scrollsrch thead { display: block; }

    table.scrollsrch tbody {
        overflow-y: auto;
        overflow-x: hidden;
    }

    table.scrollsrch tr {
        height: 20px;
    }
    
    table.scrollsrch1 tbody,
    table.scrollsrch1 thead { display: block; }

    table.scrollsrch1 tbody {
        overflow-y: auto;
        overflow-x: hidden;
    }

    table.scrollsrch1 tr {
        height: 20px;
    }
    
</style>
<script>
    
    function selGuestFolio(id){
        $.post("content/newfolio.jsp",{ fid: <%=fid%>, id: id, act: 1 },function(data){
            if(data.status == 0) BootstrapDialog.alert(data.error);
            else {
                //$(".specialTab").tabs("refresh");
                $('#extramodal0').modal('hide');
            }
        },"json");
        
    }
    
    function selGuest(id){
        $.post("content/newfolio.jsp",{ fid: <%=fid%>, id: id, act: 0 },function(data){
            if(data.status == 0) BootstrapDialog.alert(data.error);
            else {
                $.post("content/folio.jsp",{ reservationroomid: <%=folio.getReservationroomid()%>, fid: data.id },function(data){ $("#foliodetail").html(data) });
                $('#extramodal0').modal('hide');
            }
        },"json");
        
    }
    
    function contact_search(){
        $.post(
        "content/ajax/getContactSearch2.jsp",
        { 
            cid : <%=cid%>,
            contact_search_name : $("#contact_search_name").val(),
            contact_search_phone : $("#contact_search_phone").val(),
            contact_search_idno : $("#contact_search_phone").val(),
            contact_search_mobile : $("#contact_search_mobile").val()
        },
        function(data){
            $("#search_table_body").html(data);
           }
        ,"html");
    }
    
    $(document).ready(function() {
        
        var $table = $('table.scrollsrch'),
            $bodyCells = $table.find('tbody tr:first').children(),
            colWidth;

            
        $(window).resize(function() {
            
            colWidth = $bodyCells.map(function() {
                var wd = $(this).width();
                //alert(wd);
                return wd;
            }).get();

            $table.find('thead tr').children().each(function(i, v) {
                $(v).width(colWidth[i]);
            });    
        }).resize();
    });
</script>
<div class="container-fluid" id="registration" style="padding-top: 4px; height: 100%;">
    <div class="row" style="margin-top: 0px; margin-bottom: 0px; padding-left: 5px;  padding-right: 5px;">
        <div class="col-md-16">
            <div class="panel panel-primary" id='search_control'>
                <div class="panel-heading">
                    <h3 class="panel-title">ძებნა</h3>
                </div>
                <div class="panel-body" style="height: 80px;">
                    <table class="" width='100%'>
                        <tr>
                            <td class="tbllabel" style="width: 110px;">კონტაქტის ტიპი</td>
                            <td>
                                <form class="form-inline" role="form">
                                <div class="form-group">
                                    <div class="input-group-xs">
                                        <select class="form-control dropdown" name="contact_search_contacttypeid" id="contact_search_contacttypeid" style="width: 80px;">
                                            <%
                                            for(int i=0;i<contragenttype.length;i++){
                                                String sel = "";
                                                if(i == cid)
                                                    sel = "selected";
                                            %>
                                            <option value="<%=i%>" <%=sel%>><%=contragenttype[i]%></option>
                                            <%
                                            }
                                            %>
                                        </select>
                                    </div>
                                </div>
                                </form>
                            </td>
                            <td class="tbllabel" style="width: 60px;">სახელი</td>
                            <td>
                                <form class="form-inline" role="form">
                                <div class="form-group">
                                    <div class="input-group-xs">
                                        <input class="form-control" type="text" id="contact_search_name" style="width: 150px;" value="<%=term%>">
                                    </div>
                                </div>
                                </form>
                            </td>
                            <td class="tbllabel" style="width: 80px;">ტელეფონი</td>
                            <td>
                                <form class="form-inline" role="form">
                                <div class="form-group">
                                    <div class="input-group-xs">
                                        <input class="form-control" type="text" id="contact_search_phone" style="width: 120px;">
                                    </div>
                                </div>
                                </form>
                            </td>
                            <td class="tbllabel" style="">
                                <button onclick="contact_search()" type="button" class="btn btn-sm btn-danger navbar-btn">ძებნა</button>
                            </td>
                        </tr>
                        <tr>
                            <td class="tbllabel" style="width: 110px;">საბუთის &numero;</td>
                            <td>
                                <form class="form-inline" role="form">
                                <div class="form-group">
                                    <div class="input-group-xs">
                                        <input class="form-control" type="text" id="contact_search_idno" style="width: 80px;">
                                    </div>
                                </div>
                                </form>
                            </td>
                            <td colspan="2"></td>
                            <td class="tbllabel" style="width: 80px;">მობილური</td>
                            <td>
                                <form class="form-inline" role="form">
                                <div class="form-group">
                                    <div class="input-group-xs">
                                        <input class="form-control" type="text" id="contact_search_mobile" style="width: 120px;">
                                    </div>
                                </div>
                                </form>
                            </td>
                            <td colspan="1"></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="row" style="margin-top: 0px; margin-bottom: 0px; padding-left: 5px;  padding-right: 5px;">
        <div class="col-md-16" style="height: 300px; width: 100%;">
            <table class="scrollsrch" id="search_tbl" width="100%" style="border: #DDDDDD 1px solid !important;">
                <thead>
                    <tr style='font-size: 12px !important; height: 25px;'>
                        <th nowrap align="center" style="width: 110px;">&nbsp;&nbsp;სახელი</th>
                        <th nowrap align="center" style="width: 90px;">&nbsp;&nbsp;ქალაქი</th>
                        <th nowrap align="center" style="width: 110px;">&nbsp;&nbsp;ქვეყანა</th>
                        <th nowrap align="center" style="width: 90px;">&nbsp;&nbsp;VIP სტატუსი</th>
                        <th nowrap align="center" style="width: 55px;">&nbsp;ტელეფონი</th>
                        <th nowrap align="center" style="width: 260px;">&nbsp;&nbsp;მობილური</th>
                        <th nowrap align="center" style="width: 130px;">&nbsp;&nbsp;&nbsp;საბუთის &numero;</th>
                    </tr>
                </thead>

                <tbody id="search_table_body" style="height: 270px;">
                    <%
                    if(cid == 4){
                    for(int i=0;i<guests.length;i++){
                        String guestname = guests[i].getLname()+" "+guests[i].getFname();
                        CountryBean country = CountryManager.getInstance().loadByPrimaryKey(guests[i].getCountryid());
                        String vipstatus = "";
                        if(guests[i].getVipstatusid() != null){
                            VipstatusBean vip = VipstatusManager.getInstance().loadByPrimaryKey(guests[i].getVipstatusid());
                            vipstatus = vip.getName();
                        }
                        String phone = guests[i].getPhone();
                        if(phone == null)   phone = "";
                        String mobile = guests[i].getMobile();
                        if(mobile == null)  mobile = "";
                        String idn = guests[i].getIdn();
                        if(idn == null) idn = "";
                    %>
                    <tr style="cursor: pointer;">
                        <td style="color: #7DA341; font-weight: bold; width: 100px;" onclick="selGuest(<%=guests[i].getGuestid()%>)"><%=guestname%></td>
                        <td style='width: 100px;' onclick="selGuest(<%=guests[i].getGuestid()%>)"><%=guests[i].getCity()%></td>
                        <td style='width: 100px;' onclick="selGuest(<%=guests[i].getGuestid()%>)"><%=country.getName()%></td>
                        <td style='width: 100px;' onclick="selGuest(<%=guests[i].getGuestid()%>)"><%=vipstatus%></td>
                        <td style='width: 100px;' onclick="selGuest(<%=guests[i].getGuestid()%>)"><%=phone%></td>
                        <td style='width: 100px;' onclick="selGuest(<%=guests[i].getGuestid()%>)"><%=mobile%></td>
                        <td style='width: 100px;' onclick="selGuest(<%=guests[i].getGuestid()%>)"><%=idn%></td>
                    </tr>
                    <%}  
                    } else {
                    for(int i=0;i<contrs.length;i++){
                        String guestname = contrs[i].getName();
                        CountryBean country = CountryManager.getInstance().loadByPrimaryKey(contrs[i].getCountryid());
                        String vipstatus = "";
                        String phone = contrs[i].getPhone();
                        if(phone == null)   phone = "";
                        String mobile = contrs[i].getMobile();
                        if(mobile == null)  mobile = "";
                        String idn = contrs[i].getIdn();
                        if(idn == null) idn = "";
                    %>
                    <tr style="cursor: pointer;">
                        <td style="color: #7DA341; font-weight: bold; width: 100px;" onclick="selGuestFolio(<%=contrs[i].getContragentid()%>)"><%=guestname%></td>
                        <td style='width: 100px;' onclick="selGuestFolio(<%=contrs[i].getContragentid()%>)"><%=contrs[i].getCity()%></td>
                        <td style='width: 100px;' onclick="selGuestFolio(<%=contrs[i].getContragentid()%>)"><%=country.getName()%></td>
                        <td style='width: 100px;' onclick="selGuestFolio(<%=contrs[i].getContragentid()%>)"><%=vipstatus%></td>
                        <td style='width: 100px;' onclick="selGuestFolio(<%=contrs[i].getContragentid()%>)"><%=phone%></td>
                        <td style='width: 100px;' onclick="selGuestFolio(<%=contrs[i].getContragentid()%>)"><%=mobile%></td>
                        <td style='width: 100px;' onclick="selGuestFolio(<%=contrs[i].getContragentid()%>)"><%=idn%></td>
                    </tr>
                    <%}}%>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row" style="margin-top: 0px; margin-bottom: 0px; padding-left: 5px;  padding-right: 5px;">
        <div class="col-md-16">
            <div class="panel panel-primary" id='search_details'>
                <div class="panel-heading">
                    <h3 class="panel-title">კონტაქტის ინფორმაცია</h3>
                </div>
                <div class="panel-body" style="height: 80%;" id="walkin_search_contactinfo">
                    <table class="" width='100%'>
                        <tr>
                            <td width='30%' valign='top'>
                                <table class="table table-borderless" width='100%'>
                                    <tr>
                                        <td style="font-size: 12px; width: 110px; color: #7DA341; font-weight: bold;"></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 110px; color: #7DA341;"></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 110px; color: #7DA341;"></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 110px; color: #7DA341;"></td>
                                    </tr>
                                </table>
                            </td>
                            <td width='20%' valign='top'>
                                <table class="table table-borderless" width='100%'>
                                    <tr>
                                        <td class="tbllabel" style="width: 80px;">მობილური</td>
                                        <td style="width: 110px;"></td>
                                    </tr>
                                    <tr>
                                        <td class="tbllabel" style="width: 80px;">ტელეფონი</td>
                                        <td style="width: 110px;"></td>
                                    </tr>
                                    <tr>
                                        <td class="tbllabel" style="width: 80px;">ელფოსტა</td>
                                        <td style="width: 110px;"></td>
                                    </tr>
                                </table>
                            </td>
                            <td width='50%' valign='top' style="border: #DDDDDD 1px solid;">
                                <table class="scrollsrch1" id="search_tbl1" width="100%">
                                    <thead>
                                        <tr style='height: 10px;'>
                                            <th nowrap align="center" style="width: 110px;">&nbsp;&nbsp;ოთახი</th>
                                            <th nowrap align="center" style="width: 90px;">&nbsp;&nbsp;ჩამოსვლა</th>
                                            <th nowrap align="center" style="width: 110px;">&nbsp;&nbsp;წასვლა</th>
                                            <th nowrap align="center" style="width: 90px;">&nbsp;&nbsp;ტარიფი</th>
                                        </tr>
                                    </thead>

                                    
                                </table>
                            </td>
                        </tr>
                        
                        
                        
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>