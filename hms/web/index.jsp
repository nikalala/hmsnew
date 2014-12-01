<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="includes/init.jsp" %>
<%
    boolean loggedon = false;
    if (request.getParameter("login") != null) {
        try {
            PersonnelBean[] tuser = PersonnelManager.getInstance().loadByWhere("where deleted = false and upper(loginid) = '" + request.getParameter("loginid").toUpperCase().replaceAll("'", "''") + "' and password = '" + request.getParameter("password").replaceAll("'", "''") + "'");
            if (tuser != null && tuser.length > 0) {
                user.copy(tuser[0]);
                loggedon = true;
                HotelBean[] hotels = HotelManager.getInstance().loadByWhere("");
                hotel.copy(hotels[0]);
            }
        } catch (Exception ign) {
        }
    } else if (request.getParameter("logout") != null) {
        PersonnelBean tuser = PersonnelManager.getInstance().createPersonnelBean();
        user.copy(tuser);
        loggedon = false;
    }

    String cmenufiles[] = {"TAB_EditTransaction", "RoomMove", "AmendStay", "CheckIn", "CheckOut", "Cancel", "MarkNoShow", "AssignRoom", "UnblockRoom", "VoidTransaction", "UndoCheckin", "SetMessages", "SetTasks", "SetPreference", "StopRoomMove", "UndoStopRoomMove", "ExchangeRoom", "MoveGuestPhysically"};
    String cmenunames[] = {"რედაქტირება", "ოთახის შეცვლა", "გახანგრძლივება", "შესვლა", "გამოსვლა", "გაუქმება", "არ მოსვლა", "ოთახის მინიჭება", "ოთახის განბლოკვა", "რეზერვაციის გაუქმება", "შესვლის გაუქმება", "შეტყობინებების დაყენება", "სამუშაოების მინიჭება", "პარამეტრები", "ოთახის გადატანის შეჩერება", "ოთახის გადატანის შეჩერების გაუქმება", "ოთახის გაცვლა", "სტუმრის გადაყვანა ფიზიკურად"};
    String cmenuicons[] = {"saved", "ოთახის შეცვლა", "გახანგრძლივება", "შესვლა", "გამოსვლა", "გაუქმება", "არ მოსვლა", "ოთახის მინიჭება", "ოთახის განბლოკვა", "რეზერვაციის გაუქმება", "შესვლის გაუქმება", "შეტყობინებების დაყენება", "სამუშაოების მინიჭება", "პარამეტრები", "ოთახის გადატანის შეჩერება", "ოთახის გადატანის შეჩერების გაუქმება", "ოთახის გაცვლა", "სტუმრის გადაყვანა ფიზიკურად"};

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

    <script>

        var dateglobalformat = "<%=dateformats2[dff]%>";
        var dateglobalformat1 = "<%=dateformats1[dff]%>";

        var globalpars = <%=jschs%>;
        
        var lclosedate = <%=lclosedate%>;

        $(document).ready(function () {




            //loadMainBody();
            getBody("stayviewleft", "stayview", 'დატვირთულობა', 'res1');

            if ($("#maincontent").height() > 652)
                $("#mainpanel0").height($("#maincontent").height() - 2);


            $("[data-toggle='tooltip']").tooltip({
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

<body>
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
                <div class="panel-heading  panel-title"
                     style="text-align: center; height: 31px; background-color: darkgray !important;">
                        <span class="pull-left">
                            <ul class="nav nav-tabs toptab" role="tablist" id='maintabs'
                                style="padding-top: 0px; padding-left: 0px; padding-bottom: 0px;"></ul>
                        </span>
                </div>
                <div class="tab-content" id="centerTabContent" style="height: 95%; background-color: <%=bgcol%>;"></div>
            </div>
        </div>
    </div>
    <%@include file="includes/footer.jsp" %>
    <%} else {%>
    <div class="row" style="margin-top: 100px;">
        <div class="col-md-5"></div>
        <div class="col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">რეგისტრაცია</h3>
                </div>
                <div class="panel-body">
                    <form role="form" method="post">
                        <div class="form-group">
                            <input class="form-control" placeholder="სარეგისტრაციო სახელი" type="text" name="loginid"
                                   id="loginid">
                        </div>
                        <div class="form-group">
                            <input class="form-control" id="password" name="password" placeholder="პაროლი"
                                   type="password">
                        </div>
                        <button type="submit" name="login" id="login" class="active btn btn-block btn-lg btn-primary">
                            შესვლა
                        </button>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-md-5"></div>
    </div>
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
        <li class="roomlistitm"><a id="<%=cmenufiles[i]%>" icon="<%=cmenuicons[i]%>" href="#"><%=cmenunames[i]%>
        </a></li>
        <%
            }
        %>
    </ul>
</div>
<div class="loading-panel"></div>
</body>

</html>