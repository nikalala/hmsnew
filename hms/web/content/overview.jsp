<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<link rel="stylesheet" type="text/css" href="css/grid-filter.css">

<script>
    $(document).ready(function () {
        $('#dtp').datepicker(<%=pickerFormatForDatePickers%>).on('changeDate', function(e){
            e.preventDefault();
            var dt = e.target.value;
            if(!isNullOrEmpty(dt)){
                finGrid.url = 'content/getfinventory.jsp?dt='+dt;
                reloadGrid(finGrid.id,finGrid.url);
            }
        });
        $('.datepicker').datepicker()

        var dt = $('#dtp').val();
        if(!isNullOrEmpty(dt)){
            finGrid.url = 'content/getfinventory.jsp?dt='+dt;
        }
        initializeGrid(finGrid);
        initializeGrid(qohsGrid);
    });

</script>

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

<div class="q-main-div">
    <div class="col-md-5">
        <div id="status_bar" class="first-status-bar" align='center'>
            <div class="q-statusbar-div">
                <span class="q-statusbar-span">დღის სტატისტიკა</span>
            </div>
        </div>
        <div class="q-table-div">
            <table class="t-s-table table-striped table-hover">
                <tr>
                    <td><span>მიმდინარე დაკავებული ოთახები</span></td>
                    <td>3</td>
                </tr>
                <tr>
                    <td><span>უფასო ოთახები</span></td>
                    <td>1</td>
                </tr>
                <tr>
                    <td><span>გასაწერი ოთახები</span></td>
                    <td>11</td>
                </tr>
                <tr>
                    <td><span>ვადაგადაცილებული ოთახები</span></td>
                    <td>7</td>
                </tr>
                <tr>
                    <td><span>მომსვლელები (დადასტურებული)</span></td>
                    <td>3</td>
                </tr>
                <tr>
                    <td><span>მომსვლელები (დაუდასტურებული)</span></td>
                    <td>3</td>
                </tr>
                <tr>
                    <td><span>გასაყიდი ოთახები (სულ)</span></td>
                    <td>0</td>
                </tr>
                <tr>
                    <td><span>გეგმიურად დაკავებული ოთახები</span></td>
                    <td>3</td>
                </tr>
                <tr>
                    <td><span>დაგეგმილი განთავსება</span></td>
                    <td>3</td>
                </tr>
                <tr>
                    <td><span>დაგეგმილი ADR</span></td>
                    <td>150</td>
                </tr>
                <tr>
                    <td><span>დაგეგმილი RevPar</span></td>
                    <td>0</td>
                </tr>
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
                <tr>
                    <td><span>ამჟამად სასტუმროში</span></td>
                    <td><span>3</span></td>
                    <td><span>6</span></td>
                    <td><span>9</span></td>
                </tr>
                <tr>
                    <td><span>წამსვლელი</span></td>
                    <td><span>3</span></td>
                    <td><span>6</span></td>
                    <td><span>9</span></td>
                </tr>
                <tr>
                    <td><span>ვადაგადაცილებული</span></td>
                    <td><span>3</span></td>
                    <td><span>6</span></td>
                    <td><span>9</span></td>
                </tr>
                <tr>
                    <td><span>ჩამომსვლელი</span></td>
                    <td><span>3</span></td>
                    <td><span>6</span></td>
                    <td><span>9</span></td>
                </tr>
                <tr>
                    <td><span>მოსალოდნელი</span></td>
                    <td><span>3</span></td>
                    <td><span>6</span></td>
                    <td><span>9</span></td>
                </tr>
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
                <tr>
                    <td><span>მცხოვრები</span></td>
                    <td><span>3</span></td>
                </tr>
                <tr>
                    <td><span>მოსული</span></td>
                    <td><span>6</span></td>
                </tr>
                <tr>
                    <td><span>მომსვლელი</span></td>
                    <td><span>6</span></td>
                </tr>
                <tr>
                    <td><span>გაწერილი</span></td>
                    <td><span>6</span></td>
                </tr>
                <tr>
                    <td><span>წამსვლელი</span></td>
                    <td><span>6</span></td>
                </tr>
                <tr>
                    <td><span>დღიური გამოყენება</span></td>
                    <td><span>6</span></td>
                </tr>
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
                <tr>
                    <td><span>ოთახები სასტუმროში</span></td>
                    <td><span>6</span></td>
                </tr>
                <tr>
                    <td><span>მწყობრიდან გამოსული</span></td>
                    <td><span>6</span></td>
                </tr>
                <tr>
                    <td><span>ხელმისაწვდომი ოთახები (სულ)</span></td>
                    <td><span>6</span></td>
                </tr>
            </table>
        </div>
    </div>
    <div class="col-md-6">
        <div id="status_bar" class="first-status-bar" align='center'>
            <div class="q-statusbar-div">
                <span class="q-statusbar-span" style="float: left;">სამომავლო ინვენტარი</span>

                <i class="fa fa-search q-s-search"></i>

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
