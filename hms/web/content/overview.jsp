<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>
<%
    
String[] stats1 = {
    "მიმდინარე დაკავებული ოთახები",
    "უფასო ოთახები",
    "გასაწერი ოთახები",
    "ვადაგადაცილებული ოთახები",
    "მომსვლელები (დადასტურებული)",
    "მომსვლელები (დაუდასტურებული)",
    "გასაყიდი ოთახები (სულ)",
    "გეგმიურად დაკავებული ოთახები",
    "დაგეგმილი განთავსება",
    "დაგეგმილი ADR",
    "დაგეგმილი RevPar"
};
double[] pars1 = new double[stats1.length];
String[] stats2 = {"ამჟამად სასტუმროში","წამსვლელი","ვადაგადაცილებული","ჩამომსვლელი","მოსალოდნელი"};
int[][] pars2 = new int[stats2.length][3];
String[] stats3 = {"დღეს მოსული","რეზერვაციის გარეშე შემოსული","მომსვლელი","გაწერილი","წამსვლელი","დღიური გამოყენება"};
int[] pars3 = new int[stats3.length];
String[] stats4 = {"ოთახები სასტუმროში","მწყობრიდან გამოსული","ხელმისაწვდომი ოთახები (სულ)"};
int[] pars4 = new int[stats4.length];


RoomBean[] rooms = RoomManager.getInstance().loadByWhere("where active = true and deleted = false");

int blockedrooms = (int)getSum("select count(roomid) from blockroom where blockstart::date <= to_date('"+df.format(dclosedate)+"','DD/MM/YYYY') and blockend::date >= to_date('"+df.format(dclosedate)+"','DD/MM/YYYY')");

pars1[4] = (int)getSum("select count(reservationid) from reservation where arraivaldate::date = to_date('"+df.format(dclosedate)+"','DD/MM/YYYY') and status = 0 and reservationtypeid in (select reservationtypeid from reservationtype where confirmed = true)");
pars1[5] = (int)getSum("select count(reservationid) from reservation where arraivaldate::date = to_date('"+df.format(dclosedate)+"','DD/MM/YYYY') and status = 0 and reservationtypeid in (select reservationtypeid from reservationtype where confirmed = false)");
pars1[6] = rooms.length-blockedrooms;
pars1[7] = (int)getSum("select count(reservationid) from reservation where arraivaldate::date <= to_date('"+df.format(dclosedate)+"','DD/MM/YYYY') and departuredate::date >= to_date('"+df.format(dclosedate)+"','DD/MM/YYYY') and status in (-1,0)");
pars1[8] = pars1[7]*100/rooms.length;
pars1[9] = getSum("select avg(amount) from folioitem where particular = 6 and itemdate = to_date('"+df.format(dclosedate)+"','DD/MM/YYYY')");

pars2[0][0] = (int)getSum("select sum(t.adult) from reservation r, reservationroom t where r.reservationid = t.reservationid and r.arraivaldate::date <= to_date('"+df.format(dclosedate)+"','DD/MM/YYYY') and r.departuredate::date >= to_date('"+df.format(dclosedate)+"','DD/MM/YYYY') and r.status = -1");
pars2[0][1] = (int)getSum("select sum(t.child) from reservation r, reservationroom t where r.reservationid = t.reservationid and r.arraivaldate::date <= to_date('"+df.format(dclosedate)+"','DD/MM/YYYY') and r.departuredate::date >= to_date('"+df.format(dclosedate)+"','DD/MM/YYYY') and r.status = -1");
pars2[0][2] = pars2[0][0] + pars2[0][1];

pars2[1][0] = (int)getSum("select sum(adult) from reservationroom where roomid is not null and getroomstatus(roomid,'"+df.format(dclosedate)+"') = 3");
pars2[1][1] = (int)getSum("select sum(child) from reservationroom where roomid is not null and getroomstatus(roomid,'"+df.format(dclosedate)+"') = 3");
pars2[1][2] = pars2[1][0] + pars2[1][1];

pars2[2][0] = (int)getSum("select sum(adult) from reservationroom where roomid is not null and getroomstatus(roomid,'"+df.format(dclosedate)+"') = 2");
pars2[2][1] = (int)getSum("select sum(child) from reservationroom where roomid is not null and getroomstatus(roomid,'"+df.format(dclosedate)+"') = 2");
pars2[2][2] = pars2[2][0] + pars2[2][1];

pars2[3][0] = (int)getSum("select sum(t.adult) from reservation r, reservationroom t where r.reservationid = t.reservationid and r.arraivaldate::date = to_date('"+df.format(dclosedate)+"','DD/MM/YYYY') and r.status = -1")-pars2[0][0];
pars2[3][1] = (int)getSum("select sum(t.child) from reservation r, reservationroom t where r.reservationid = t.reservationid and r.arraivaldate::date = to_date('"+df.format(dclosedate)+"','DD/MM/YYYY') and r.status = -1")-pars2[0][1];
pars2[3][2] = pars2[3][0] + pars2[3][1];

pars2[4][0] = (int)getSum("select sum(t.adult) from reservation r, reservationroom t where r.reservationid = t.reservationid and r.arraivaldate::date = to_date('"+df.format(dclosedate)+"','DD/MM/YYYY') and r.status = 0");
pars2[4][1] = (int)getSum("select sum(t.child) from reservation r, reservationroom t where r.reservationid = t.reservationid and r.arraivaldate::date = to_date('"+df.format(dclosedate)+"','DD/MM/YYYY') and r.status = 0");
pars2[4][2] = pars2[4][0] + pars2[4][1];

pars3[0] = (int)getSum("select count(distinct r.reservationid) from reservation r, reservationroom t where r.reservationid = t.reservationid and r.arraivaldate::date = to_date('"+df.format(dclosedate)+"','DD/MM/YYYY') and r.status = -1");
pars3[1] = 0;   //(int)getSum("select sum(t.adult+t.child) from reservation r, reservationroom t where r.reservationid = t.reservationid and r.arraivaldate::date = to_date('"+df.format(dclosedate)+"','DD/MM/YYYY') and r.status = -1");
pars3[2] = (int)getSum("select count(r.reservationid) from reservation r, reservationroom t where r.reservationid = t.reservationid and r.arraivaldate::date = to_date('"+df.format(dclosedate)+"','DD/MM/YYYY') and r.status = 0");
pars3[3] = (int)getSum("select count(r.reservationid) from reservation r, reservationroom t where r.reservationid = t.reservationid and r.arraivaldate::date = to_date('"+df.format(dclosedate)+"','DD/MM/YYYY') and r.status = 4");
pars3[4] = (int)getSum("select count(r.reservationid) from reservation r, reservationroom t where r.reservationid = t.reservationid and r.departuredate::date = to_date('"+df.format(dclosedate)+"','DD/MM/YYYY') and r.status = -1");
pars3[5] = (int)getSum("select count(distinct reservationid) from reservationroom where roomid is not null and getroomstatus(roomid,'"+df.format(dclosedate)+"') = 6");
pars3[0] -= pars3[5];

pars4[0] = rooms.length;
pars4[1] = (int)getSum("select count(roomid) from blockroom where blockstart::date <= to_date('"+df.format(dclosedate)+"','DD/MM/YYYY') and blockend::date >= to_date('"+df.format(dclosedate)+"','DD/MM/YYYY')");
pars4[2] = pars4[0] - pars4[1];


for(int i=0;i<rooms.length;i++){
    int status = (int)getSum("select getroomstatus("+rooms[i].getRoomid()+",'"+df.format(dclosedate)+"')");
    if(status == 1 || status == 2 || status == 3 || status == 6)  pars1[0]++;
    if(status == 3) pars1[2]++;
    if(status == 2) pars1[3]++;
    //if(status == 1 || status == 3 || status == 6)  pars1[6]++;
}
pars1[6] -= pars1[7];
%>
<link rel="stylesheet" type="text/css" href="css/grid-filter.css">

<script>
    $(document).ready(function () {
        $('#dtp').datepicker(<%=pickerFormatForDatePickers%>).on('changeDate', function (e) {
            e.preventDefault();
            var dt = e.target.value;
            if (!isNullOrEmpty(dt)) {
                finGrid.url = 'content/getfinventory.jsp?dt=' + dt;
                reloadGrid(finGrid.id, finGrid.url);
            }
        });
        $('#dtp1').datepicker(<%=pickerFormatForDatePickers%>).on('changeDate', function (e) {
            e.preventDefault();
            var dt = e.target.value;
            finGrid2.url = "content/overviewpopup.jsp?dt=" + dt;
            reloadGrid(finGrid2.id, finGrid2.url);
        });

        var dt = $('#dtp').val();
        if (!isNullOrEmpty(dt)) {
            finGrid.url = 'content/getfinventory.jsp?dt=' + dt;
        }
        initializeGrid(finGrid);
        initializeGrid(qohsGrid);

    });

    $(document).on("click", "#dismissbutton,#smallmodalbtn", function () {
        $("#updatehs").fadeOut();
    });

    var initialized = false;
    function displayTable() {
        var dt = $('#dtp').val();
        finGrid2.url = "content/overviewpopup.jsp?dt=" + dt;
        if (!initialized) {
            initializeGrid(finGrid2);
            initialized = true;
        } else {
            reloadGrid(finGrid2.id, finGrid2.url);
        }
        $("#updatehs").fadeIn();
    }

</script>

<link rel="stylesheet" type="text/css" href="css/grid-filter.css">

<style>
    .q-main-div {
        float: left;
        margin: 7px 0 0 0px;
        color: #428BCA;
        font-family: 'bgmtavr';
        width: 100%;
    }

    .q-statusbar-div {
        width: 100%;
        float: left;
    }

    .q-statusbar-span {
        float: left;
        margin: 11px 0 0 10px;
    }

    .q-table-div {
        background: #fff;
        border: solid 1px #DADADA;
        height: 270px;
        color: #545454;
    }

    .t-s-table {
        width: 100%;
        margin: 6px 0 0 0;
        font-family: BaseFont;
        color: #646464;
    }

    .t-s-table td span {
        padding-left: 20px;
    }

    .t-s-table td {
        height: 20px;
    }

    .t-s-table tr:last-child > td {
        height: 26px;
        vertical-align: middle;
    }

    .t-s-table tr:last-child {
        height: 26px;
        vertical-align: middle;
    }

    .t-s-table tr {
        border-bottom: solid 1px #E4E4E4;
    }

    .t-s-table tr:nth-child(even) {
        background: #E4E4E4;
    }

    .t-s-table td:last-child {
        text-align: right;
        padding-right: 10px;
    }

    .t-s-table tr th {
        height: 20px;
    }

    .t-s-table tr th:last-child {
        text-align: right;
        padding-right: 6px;
    }

    .q-s-dt {
        position: absolute;
        left: 107px;
        top: 1px;
        width: 24px;
        height: 24px;
        background: none !important;
        border: 0 !important;
    }

    .q-s-search {
        float: right;
        margin: 2px 14px 0px 0px;
        background-color: #eeeeee;
        border: 1px solid #ccc;
        padding: 6px;
        cursor: pointer;
    }

    .q-s-search:hover {
        background-color: #3A94DF;
        border: solid 1px #fff;
        color: #fff;
    }

    .q-s-dt-box {
        position: relative;
        float: right;
        margin: 2px 4px 0px 0px;
    }

</style>

<div class="modal-custom-content" id="updatehs" style="position: absolute; z-index: 10; display: none;">
    <div class="modal-custom-header" style="background-color: gray; color: white; height: 30px;">
        <button type="button" id="smallmodalbtn" class="close" data-dismiss="modal" aria-hidden="true"
                style="margin-top: -6px;">×
        </button>
        <h4 style="margin-top: -4px;"></h4>
    </div>
    <div class="modal-custom-body">
        <div style="width: 300px; height: 35px;">
            <div class="input-append date q-s-dt-box" id="dt1" style="float: left !important;">
                <input type="text" class="span2 " id="dtp1" style="height: 26px; width: 133px;">
                    <span class="add-on q-s-dt">
                        <i class="glyphicon glyphicon-calendar"></i>
                    </span>
            </div>
        </div>
        <table id='list_fin2' class="table-striped table-hover" align='center'></table>
    </div>
    <div class="modal-footer" style="margin-top: 10px;">
        <button type="button" class="btn btn-default" id="dismissbutton" data-dismiss="modal" onclick="this.click();">
            დახურვა
        </button>
        <button type="button" class="btn btn-primary" onclick="" style="display: none;">შენახვა</button>
    </div>
</div>

<div class="q-main-div">
    <div class="col-md-5">
        <div id="status_bar" class="first-status-bar" align='center'>
            <div class="q-statusbar-div">
                <span class="q-statusbar-span">დღის სტატისტიკა</span>
            </div>
        </div>
        <div class="q-table-div">
            <table class="t-s-table table-striped table-hover">
                <%for(int i=0;i<stats1.length;i++){%>
                <tr>
                    <td><span><%=stats1[i]%></span></td>
                    <td><%=(i > 7) ? dc.format(pars1[i]):dcint.format(pars1[i])%></td>
                </tr>
                <%}%>
            </table>
        </div>
    </div>
    <div class="col-md-6">
        <div id="status_bar" class="first-status-bar" align='center'>
            <div class="q-statusbar-div">
                <span class="q-statusbar-span">სტუმრების რაოდენობა (სულ)</span>
            </div>
        </div>
        <div class="q-table-div">
            <table class="t-s-table table-striped table-hover">
                <tr>
                    <th>&nbsp;</th>
                    <th>უფროსი</th>
                    <th>ბავშვი</th>
                    <th>სულ</th>
                </tr>
                <%for(int i=0;i<stats2.length;i++){%>
                <tr>
                    <td><span><%=stats2[i]%></span></td>
                    <%for(int j=0;j<pars2[i].length;j++){%>
                    <td><span><%=pars2[i][j]%></span></td>
                    <%}%>
                </tr>
                <%}%>
            </table>
        </div>
    </div>
    <div class="col-md-5">
        <div id="status_bar" class="first-status-bar" align='center'>
            <div class="q-statusbar-div">
                <span class="q-statusbar-span">დღის აქტიურობა (სულ)</span>
            </div>
        </div>
        <div class="q-table-div">
            <table class="t-s-table table-striped table-hover">
                <%for(int i=0;i<stats3.length;i++){%>
                <tr>
                    <td><span><%=stats3[i]%></span></td>
                    <td><span><%=pars3[i]%></span></td>
                </tr>
                <%}%>
            </table>
        </div>
    </div>
</div>
<div class="q-main-div">
    <div class="col-md-5">
        <div id="status_bar" class="first-status-bar" align='center'>
            <div class="q-statusbar-div">
                <span class="q-statusbar-span">სასტუმროს ინვენტარი</span>
            </div>
        </div>
        <div class="q-table-div">
            <table class="t-s-table table-striped table-hover">
                <%for(int i=0;i<stats4.length;i++){%>
                <tr>
                    <td><span><%=stats4[i]%></span></td>
                    <td><span><%=pars4[i]%></span></td>
                </tr>
                <%}%>
            </table>
        </div>
    </div>
    <div class="col-md-6">
        <div id="status_bar" class="first-status-bar" align='center'>
            <div class="q-statusbar-div">
                <span class="q-statusbar-span" style="float: left;">სამომავლო ინვენტარი</span>

                <i onclick="displayTable()" class="fa fa-search q-s-search"></i>

                <div class="input-append date q-s-dt-box" id="dt">
                    <input type="text" class="span2 " id="dtp" style="height: 26px; width: 133px;">
                    <span class="add-on q-s-dt">
                        <i class="glyphicon glyphicon-calendar"></i>
                    </span>
                </div>

            </div>
        </div>
        <div class="q-table-div q-table-div1">
            <table id='list_fin' class="table-striped table-hover" align='center'></table>
        </div>
    </div>
    <div class="col-md-5">
        <div id="status_bar" class="first-status-bar" align='center'>
            <div class="q-statusbar-div">
                <span class="q-statusbar-span">დასუფთავების სტატუსი</span>
            </div>
        </div>
        <div class="q-table-div q-table-div2">
            <table id='list_qohs' class="table-striped table-hover" align='center'></table>
        </div>
    </div>
</div>
