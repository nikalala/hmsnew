<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="includes/init.jsp" %>
<%
    boolean loggedon = false;
    if (user.getPersonnelid() == null) {
        loggedon = false;
%>
<script>
    function redirectifnotloggedin() {
        window.location.href = "login.jsp";
    }
    redirectifnotloggedin();
</script>
<%
    } else {
        loggedon = true;
    }

    if (request.getParameter("logout") != null) {
        PersonnelBean tuser = PersonnelManager.getInstance().createPersonnelBean();
        user.copy(tuser);
        loggedon = false;
%>

<script>
    function redirectifnotloggedin() {
        window.location.href = "login.jsp";
    }
    redirectifnotloggedin();
</script>


<% }

    String cmenufiles[] = {
        "TAB_EditTransaction",          //  0 
        "roommove",                     //  1
        "amendstay",                    //  2
        "checkin",                      //  3
        "undocheckin",                  //  4
        "checkout",                     //  5
        "cancel",                       //  6
        "noshow",                       //  7
        "assignroom",                   //  8
        "unassignroom",                 //  9
        "remarks",                      // 10
        "SetTasks",                     // 11
        "SetPreference",                // 12
        "StopRoomMove",                 // 13
        "ExchangeRoom",                 // 14
        "void"                          // 15
    };
    
    String cmenunames[] = {
        "რედაქტირება",                  //  0
        "ოთახის გადატანა",              //  1
        "გახანგრძლივება",               //  2
        "მიღება",                       //  3
        "მიღების გაუქმება",             //  4
        "გაწერა",                       //  5
        "გაუქმება",                     //  6
        "არ მოსვლა",                    //  7
        "ოთახის მინიჭება",              //  8
        "ოთახის მოხსნა",                //  9
        "შეტყობინება",                  // 10
        "დავალება",                     // 11
        "უპირატესობა",                  // 12
        "ოთახის გადატანის შეჩერება",    // 13
        "ოთახის შეცვლა",                // 14
        "ტრანზაქციის გაუქმება"          // 15
    };
    String cmenuicons[] = {
        "რედაქტირება",                  //  0
        "ოთახის გადატანა",              //  1
        "გახანგრძლივება",               //  2
        "მიღება",                       //  3
        "მიღების გაუქმება",             //  4
        "გაწერა",                       //  5
        "გაუქმება",                     //  6
        "არ მოსვლა",                    //  7
        "ოთახის მინიჭება",              //  8
        "ოთახის მოხსნა",                //  9
        "შეტყობინება",                  // 10
        "დავალება",                     // 11
        "უპირატესობა",                  // 12
        "ოთახის გადატანის შეჩერება",    // 13
        "ოთახის შეცვლა",                // 14
        "ტრანზაქციის გაუქმება"          // 15
    };

    boolean[][] statusmenu = {
            //0     1      2     3     4      5     6     7     8     9     10     11     12    13    14     15   
            // დადასტურებული რეზერვაცია  0 + roomid is not null
            {true, true, true, true, false, false, true, true, false, true, true, true, true, false, true, true},                  //  0
            // დადასტურებული რეზერვაცია  0 + roomid is null
            {true, false, true, false, false, false, true, true, true, false, true, true, true, false, true, true},                //  1
            // მცხოვრები 1 + arraivaldate = closedate
            {true, true, true, false, true, false, false, false, false, false, true, true, true, false, true, true},                //  2
            // მცხოვრები 1 + arraivaldate <> closedate
            {true, true, true, false, false, false, false, false, false, false, true, true, true, false, true, true},               //  3
            // ვადაგადაცილებული 2
            {true, true, true, false, false, false, false, false, false, false, true, true, true, false, true, true},               //  4
            // წამსვლელი 3
            {true, true, true, false, false, true, false, false, false, false, true, true, true, false, true, true},                //  5
            // გაწერილი 4
            {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false},       //  6
            // დაბლოკილი 5
            {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false},       //  7
            // დღიური გამოყენება 6
            {true, true, true, false, true, true, false, false, false, false, true, true, true, false, true, true},                 //  8
            // დაუდასტურებელი რეზერვაცია 7 + roomid is not null
            {true, true, true, true, false, false, true, true, false, true, true, true, true, false, true, true},                   //  9
            // დაუდასტურებელი რეზერვაცია 7 + roomid is null
            {true, false, true, false, false, false, true, true, true, false, true, true, true, false, true, true},                 // 10
            // თავისუფალი 8
            {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false},       // 11
            // დღიური რეზერვაცია 9 + roomid is not null
            {true, true, true, true, false, false, true, true, false, true, true, true, true, false, true, true},                   // 12
            // დღიური რეზერვაცია 9 + roomid is null
            {true, true, true, true, false, false, true, true, true, false, true, true, true, false, true, true}                    // 13

    };

    String bgcol = "#F5F5F5";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>მართვის სისტემა</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="css/bootstrap3.min.css" rel="stylesheet">
    <link href="css/bootstrap-dialog.min.css" rel="stylesheet">
    <link href="css/bootstrap-checkbox.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/ui.daterangepicker.css">
    <link rel="stylesheet" type="text/css" href="css/datepicker.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" type="text/css" href="css/jquery.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="css/ui.jqgrid.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap-select.min.css">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.css">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap3.min.js"></script>
    <script type="text/javascript" src="js/daterangepicker.jQuery.compressed.js"></script>
    <script type="text/javascript" src="js/bootstrap-dialog.min.js"></script>
    <script type="text/javascript" src="js/bootstrap-checkbox.js"></script>
    <script type="text/javascript" src="js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="js/moment.js"></script>
    <script type="text/javascript" src="js/main.js"></script>
    <script type="text/javascript" src="js/grids.js"></script>
    <script type="text/javascript" src="js/filter-panel.js"></script>
    <script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="js/i18n/grid.locale-ka.js"></script>
    <script type="text/javascript" src="js/jquery.jqGrid.min.js"></script>
    <script type="text/javascript" src="js/dataTables.bootstrap.js"></script>
    <script type="text/javascript" src="js/locales/bootstrap-datepicker.ka.js"></script>
    <script type="text/javascript" src="js/bootstrap-select.js"></script>
    <script src="js/plugins/jquery.bootstrap.wizard.min.js" type="text/javascript"></script>
    <script src="js/bootstrap-combobox.js" type="text/javascript"></script>


    <%--link href="js/ext/ext-theme-classic-all.css" rel="stylesheet" type="text/css" />
    <link href="js/ext/resources/css/sch-all.css" rel="stylesheet" type="text/css" />
    <script src="js/ext/ext-all.js" type="text/javascript"></script>
    <script src="js/ext/sch-all.js" type="text/javascript"></script--%>

    <link href="js/ext/1/ext-all.css" rel="stylesheet" type="text/css"/>
    <link href="js/ext/1/sch-all.css" rel="stylesheet" type="text/css"/>
    <%--script src="js/ext/1/ext-all.js" type="text/javascript"></script--%>
    <script src="js/ext/1/ext-all-src.js" type="text/javascript"></script>
    <script src="js/ext/1/sch-all.js" type="text/javascript"></script>

    <script src="js/tabulous.js" type="text/javascript"></script>

    <script>

        var dateglobalformat = "<%=dateformats2[dff]%>";
        var dateglobalformat1 = "<%=dateformats1[dff]%>";

        var globalpars = <%=jschs%>;

        var lclosedate = <%=lclosedate%>;

        var statusmenu = [
            //0     1      2     3     4      5     6     7     8     9     10     11     12    13    14     15   
            // დადასტურებული რეზერვაცია  0 + roomid is not null
            [true, true, true, true, false, false, true, true, false, true, true, true, true, false, true, true],                  //  0
            // დადასტურებული რეზერვაცია  0 + roomid is null
            [true, false, true, false, false, false, true, true, true, false, true, true, true, false, true, true],                //  1
            // მცხოვრები 1 + arraivaldate = closedate
            [true, true, true, false, true, false, false, false, false, false, true, true, true, false, true, true],                //  2
            // მცხოვრები 1 + arraivaldate <> closedate
            [true, true, true, false, false, false, false, false, false, false, true, true, true, false, true, true],               //  3
            // ვადაგადაცილებული 2
            [true, true, true, false, false, false, false, false, false, false, true, true, true, false, true, true],               //  4
            // წამსვლელი 3
            [true, true, true, false, false, true, false, false, false, false, true, true, true, false, true, true],                //  5
            // გაწერილი 4
            [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false],       //  6
            // დაბლოკილი 5
            [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false],       //  7
            // დღიური გამოყენება 6
            [true, true, true, false, true, true, false, false, false, false, true, true, true, false, true, true],                 //  8
            // დაუდასტურებელი რეზერვაცია 7 + roomid is not null
            [true, true, true, true, false, false, true, true, false, true, true, true, true, false, true, true],                   //  9
            // დაუდასტურებელი რეზერვაცია 7 + roomid is null
            [true, false, true, false, false, false, true, true, true, false, true, true, true, false, true, true],                 // 10
            // თავისუფალი 8
            [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false],       // 11
            // დღიური რეზერვაცია 9 + roomid is not null
            [true, true, true, true, false, false, true, true, false, true, true, true, true, false, true, true],                   // 12
            // დღიური რეზერვაცია 9 + roomid is null
            [true, true, true, true, false, false, true, true, true, false, true, true, true, false, true, true]                    // 13

    ];
        var stmn = [
            [0,1,2,0],
            [0,0,2,1],
            [1,2,1,2],
            [1,2,0,3],
            [2,2,2,4],
            [3,2,2,5],
            [4,2,2,6],
            [5,2,2,7],
            [6,2,2,8],
            [7,1,2,9],
            [7,0,2,10],
            [8,2,2,11],
            [9,1,2,12],
            [9,0,2,13]
        ];
        
        function changeContextMenu(st,hr,sd, mn) {
            var k = -1;
            for(var i=0;i<stmn.length;i++){
                if(stmn[i][0] == st){
                    if(stmn[i][1] == 2 || stmn[i][1] == hr){
                        if(stmn[i][2] == 2 || stmn[i][2] == sd){
                            k = stmn[i][3];
                            break;
                        }
                    }
                }
            }
            
            if(k >= 0){
                $("#contextMenu ul").find('li').each(function () {
                    var n = $(this).attr('num');
                    if (statusmenu[k][n]) $(this).show();
                    else                $(this).hide();
                });
            }
        }

        function changeContextMenu1(st,hr,sd, mn) {
            var sts = new Array();
            <%for(int i=0;i<statusmenu.length;i++){
                %>
            sts[<%=i%>] = new Array();
            <%
            for(int j=0;j<statusmenu[i].length;j++){
                int v = 0;
                if(statusmenu[i][j])    v = 1;
                %>
            sts[<%=i%>][<%=j%>] = <%=v%>;
            <%
        }
    }
    %>
            $("#contextMenu ul").find('li').each(function () {
                var n = $(this).attr('num');
                if (sts[st][n] == 0) $(this).hide();
                else                $(this).show();
            });

        }


        $(document).ready(function () {


            $('#tabs').tabulous({
                effect: 'scale'
            });

            getBody("stayviewleft", "stayview", 'დატვირთულობა', 'res1', '', true);

            if ($("#maincontent").height() > 652)
                $("#mainpanel0").height($("#maincontent").height() - 2);


            /*  $("[data-toggle='tooltip']").tooltip({
             //html: true,
             placement: "bottom"
             });

             $('[data-toggle="tab"]').click(function (e) {
             e.preventDefault();
             var $this = $(this),
             loadurl = $this.attr('src'),
             targ = $this.attr('href');

             $.get(loadurl, function (data) {
             $(targ).html(data);
             });
             $this.tab('show');
             return false;
             });

             registerCloseEvent();
             */
            $('#myModal').on('hidden.bs.modal', function () {
                $("#callbackurl").remove();
                $("#callbackdata").remove();
                $("#action").remove();
                $("#controls").remove();
            });
            $('#smallmodal').on('hidden.bs.modal', function () {
                $("#callbackurl").remove();
                $("#callbackdata").remove();
                $("#action").remove();
                $("#controls").remove();
            });

        });


    </script>
</head>

<body id="mainbody">
<div class="container-fluid" style="height: 100%">
    <%
        if (loggedon) {
    %>
    <%@include file="includes/menu.jsp" %>
    <div class="row" id="maincontent" style="margin-top: 5px; height: 99%">
        <div class="col-md-3" id="leftcontent" style="background-color: white; height: 100%">
        </div>
        <div class="col-md-13" id="centercontent" style="height: 100%;">
            <div class="panel panel-default" id='mainpanel0' style="height: 654px; background-color: <%=bgcol%>;">
                <div class="panel-heading  panel-title" style="text-align: center;height: 31px;background-color: #474544 !important;">
                        <span class="pull-left">
                            <div id="tabs">
                                <ul class="nav nav-tabs toptab" role="tablist" id='maintabs'
                                    style="padding-top: 0px; padding-left: 0px; padding-bottom: 0px;"></ul>
                            </div>
                        </span>
                </div>
                <div class="tab-content" id="centerTabContent" style="height: 95%; background-color: <%=bgcol%>;"></div>
            </div>
        </div>
    </div>
    <%@include file="includes/footer.jsp" %>
    <%}%>
</div>


<div class="modal fade modal-vertical-centered" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header" style="background-color: gray; color: white; height: 30px;">
                <button type="button" id="myModalbtn" class="close" data-dismiss="modal" aria-hidden="true"
                        style='margin-top: -6px;'>&times;</button>
                <h4 id="mheader" style='margin-top: -4px;'></h4>
            </div>
            <div class="modal-body" id="mbody"></div>
            <div class="modal-footer" id="myModalFooter">
                <button type="button" class="btn btn-default" id="myModalCancel" data-dismiss="modal">დახურვა</button>
                <button type="button" class="btn btn-primary" id="myModalSave" onclick="savedata('myModal')">შენახვა
                </button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade modal-vertical-centered" id="smallmodal" tabindex="-1" role="dialog" aria-labelledby=""
     aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header" style="background-color: gray; color: white; height: 30px;">
                <button type="button" id="smallmodalbtn" class="close" data-dismiss="modal" aria-hidden="true"
                        style='margin-top: -6px;'>&times;</button>
                <h4 id="smheader" style='margin-top: -4px;'></h4>
            </div>
            <div class="modal-body" id="smbody"></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">დახურვა</button>
                <button type="button" class="btn btn-primary" onclick="savedata('smallmodal')">შენახვა</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade modal-vertical-centered" id="mediummodal" tabindex="-1" role="dialog" aria-labelledby=""
     aria-hidden="true">
    <div class="modal-dialog modal-ex">
        <div class="modal-content">
            <div class="modal-header" style="background-color: gray; color: white; height: 30px;">
                <button type="button" id="mediummodalbtn" class="close" data-dismiss="modal" aria-hidden="true"
                        style='margin-top: -6px;'>&times;</button>
                <h4 id="mdheader" style='margin-top: -4px;'></h4>
            </div>
            <div class="modal-body" id="mdbody"></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id='mediummodalclose' data-dismiss="modal">დახურვა
                </button>
                <button type="button" class="btn btn-primary" id='mediummodalsave' onclick="savedata('mediummodal')">
                    შენახვა
                </button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade modal-vertical-centered" id="infomodal" tabindex="-1" role="dialog" aria-labelledby=""
     aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header" style="background-color: gray; color: white; height: 30px;">
                <button type="button" id="infomodal" class="close" data-dismiss="modal" aria-hidden="true"
                        style='margin-top: -6px;'>&times;</button>
                <h4 id="ismheader" style='margin-top: -4px;'></h4>
            </div>
            <div class="modal-body" id="ismbody"></div>
        </div>
    </div>
</div>

<div class="modal fade modal-vertical-centered" id="extramodal0" tabindex="-1" role="dialog"
     aria-labelledby="extramodal0Label" aria-hidden="true">
    <div class="modal-dialog modal-ex">
        <div class="modal-content">
            <div class="modal-header" style="background-color: green; color: white; height: 30px;">
                <button type="button" id="extramodal0" class="close" data-dismiss="modal" aria-hidden="true"
                        style='margin-top: -6px;'>&times;</button>
                <h4 id="extramodal0header" style='margin-top: -4px;'></h4>
            </div>
            <div class="modal-body" id="extramodal0body"></div>
        </div>
    </div>
</div>

<div id="contextMenu" class="dropdown clearfix" style="z-index: 300000;">
    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu"
        style="display:block;position:static;margin-bottom:5px;">
        <%
            for (int i = 0; i < cmenunames.length; i++) {
        %>
        <li class="roomlistitm" num="<%=i%>"><a id="<%=cmenufiles[i]%>" icon="<%=cmenuicons[i]%>"
                                                href="#"><%=cmenunames[i]%>
        </a></li>
        <%
            }
        %>
    </ul>
</div>
<div class="loading-panel"></div>
</body>

</html>