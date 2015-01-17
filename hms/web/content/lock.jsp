<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>
<%
    String username = user.getLoginid();
    String namecreds = user.getFname() + " " + user.getLname();
    PersonnelBean tuser = PersonnelManager.getInstance().createPersonnelBean();
    user.copy(tuser);
%>
<!DOCTYPE html>
<html lang="en-us" id="lock-page">
<head>
    <meta charset="utf-8">
    <title>Selfin LLC Lock Screen</title>
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <!-- #CSS Links -->
    <!-- Basic Styles -->
    <link rel="stylesheet" type="text/css" media="screen" href="../css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" media="screen" href="../css/font-awesome.css">

    <!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
    <link rel="stylesheet" type="text/css" media="screen" href="../css/smartadmin-production.min.css">
    <link rel="stylesheet" type="text/css" media="screen" href="../css/smartadmin-skins.min.css">

    <!-- Demo purpose only: goes with demo.js, you can delete this css when designing your own WebApp -->
    <link rel="stylesheet" type="text/css" media="screen" href="../css/demo.min.css">

    <!-- page related CSS -->
    <link rel="stylesheet" type="text/css" media="screen" href="../css/lockscreen.min.css">

    <!-- #FAVICONS -->
    <link rel="shortcut icon" href="../img/favico.ico" type="image/x-icon">
    <link rel="icon" href="../img/favico.ico" type="image/x-icon">

    <!-- #GOOGLE FONT -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">

    <!-- #APP SCREEN / ICONS -->
    <!-- Specifying a Webpage Icon for Web Clip
         Ref: https://developer.apple.com/library/ios/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html -->
    <link rel="apple-touch-icon" href="../img/sptouch-icon-iphone.png">
    <link rel="apple-touch-icon" sizes="76x76" href="../img/touch-icon-ipad.png">
    <link rel="apple-touch-icon" sizes="120x120" href="../img/touch-icon-iphone-retina.png">
    <link rel="apple-touch-icon" sizes="152x152" href="../img/touch-icon-ipad-retina.png">

    <!-- iOS web-app metas : hides Safari UI Components and Changes Status Bar Appearance -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <!-- Startup image for web apps -->
    <link rel="apple-touch-startup-image" href="../img/ipad-landscape.png"
          media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
    <link rel="apple-touch-startup-image" href="../img/ipad-portrait.png"
          media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
    <link rel="apple-touch-startup-image" href="../img/iphone.png" media="screen and (max-device-width: 320px)">

</head>

<body>

<div id="main" role="main">

    <div id="dialog_simple" style="display: none;">
        <p>
            პაროლი არასწორია
        </p>
    </div>
    <% if (!CodeHelpers.isNullOrEmpty(username)) {%>
    <form class="lockscreen animated flipInY" role="form" id="lockform" method="post" action="../index.jsp">
        <div class="logo">
            <h1 class="semi-bold"><img src="../img/logo.png" alt=""/> Selfin LLC</h1>
        </div>
        <div>
            <img src="../img/sunny-big.png" alt="" width="120" height="120"/>

            <div>
                <h1 style="font-family: 'BGMtavr'; font-size: 19px;"><i
                        class="fa fa-user fa-3x text-muted air air-top-right hidden-mobile"></i><%=namecreds%>
                    <small style="font-family: 'BGMtavr'; font-size: 17px;"><i class="fa fa-lock text-muted"></i> &nbsp;დაბლოკილია
                    </small>
                </h1>
                <p class="text-muted">
                    <a><%=username%>
                    </a>
                </p>

                <div class="input-group">

                    <input class="form-control" name="loginid" id="loginid" value="<%=username%>" type="hidden">
                    <input class="form-control" name="password" id="password" type="password"
                           placeholder="Password" required="required">
                    <input type="hidden" name="login">

                    <div class="input-group-btn">
                        <button class="btn btn-primary loginbtn" name="login" type="button">
                            <i class="fa fa-key"></i>
                        </button>
                    </div>

                </div>
                <p class="no-margin margin-top-5" style="font-family: 'BGMtavr'; font-size: 11px;">
                    გსურთ სხვა მომხმარებლით შესვლა? <a href="../index.jsp"> დააჭირეთ აქ</a>
                </p>
            </div>


        </div>
        <p class="font-xs margin-top-5">
            Copyright Selfin LLC 2012-2015.
        </p>
    </form>
    <% } %>
</div>
<!--================================================== -->

<!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
<script src="../js/pace.min.js"></script>
<script src="../js/jquery-1.8.2.js"></script>
<script src="../js/jquery-ui.js"></script>
<script>

    var loginInfo = '<%=CodeHelpers.ifIsNullOrEmptyReturnEmptryString(username)%>';
    if (loginInfo === '') {
        window.location.href = '../index.jsp';
    }
    $('#dialog_simple').dialog({
        autoOpen: false,
        width: 600,
        resizable: false,
        modal: true,
        title: "<div class='widget-header'><h4><i class='fa fa-warning'></i> ყურადღება!!!</h4></div>"
    });

    $(document).on("click", ".loginbtn", function () {
        var formData = $("#lockform").serializeArray();
        var pass = $("#password");
        if (pass.val() == "") {
            pass.addClass("required");
            return;
        } else {
            pass.removeClass("required");
        }
        $.post("checkuser.jsp", formData, function (result) {
            if (typeof result !== "undefined") {
                if (result.trim() === "true") {
                    $("#lockform").submit();
                } else {
                    $('#dialog_simple').dialog('open');
                }
            }
        });
    });
</script>
</body>
</html>