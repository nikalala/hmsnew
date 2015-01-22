<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="includes/init.jsp" %>

<%

    if (request.getParameter("logout") != null) {
        PersonnelBean tuser = PersonnelManager.getInstance().createPersonnelBean();
        user.copy(tuser);
    }

%>
<!DOCTYPE html>
<html lang="en-us" id="extr-page">
<head>
    <meta charset="utf-8">
    <title>Selfin LLC Login Screen</title>
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <!-- #CSS Links -->
    <!-- Basic Styles -->
    <link rel="stylesheet" type="text/css" media="screen" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" media="screen" href="css/font-awesome.css">

    <!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
    <link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-production.min.css">
    <link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-skins.min.css">

    <!-- SmartAdmin RTL Support is under construction
         This RTL CSS will be released in version 1.5
    <link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-rtl.min.css"> -->

    <!-- We recommend you use "your_style.css" to override SmartAdmin
         specific styles this will also ensure you retrain your customization with each SmartAdmin update.
    <link rel="stylesheet" type="text/css" media="screen" href="css/your_style.css"> -->

    <!-- Demo purpose only: goes with demo.js, you can delete this css when designing your own WebApp -->
    <link rel="stylesheet" type="text/css" media="screen" href="css/demo.min.css">

    <!-- #FAVICONS -->
    <link rel="shortcut icon" href="img/favicon/favicon.ico" type="image/x-icon">
    <link rel="icon" href="img/favicon/favicon.ico" type="image/x-icon">

    <!-- #GOOGLE FONT -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">

    <!-- #APP SCREEN / ICONS -->
    <!-- Specifying a Webpage Icon for Web Clip
         Ref: https://developer.apple.com/library/ios/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html -->
    <link rel="apple-touch-icon" href="img/sptouch-icon-iphone.png">
    <link rel="apple-touch-icon" sizes="76x76" href="img/splash/touch-icon-ipad.png">
    <link rel="apple-touch-icon" sizes="120x120" href="img/splash/touch-icon-iphone-retina.png">
    <link rel="apple-touch-icon" sizes="152x152" href="img/splash/touch-icon-ipad-retina.png">

    <!-- iOS web-app metas : hides Safari UI Components and Changes Status Bar Appearance -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <!-- Startup image for web apps -->
    <link rel="apple-touch-startup-image" href="img/splash/ipad-landscape.png"
          media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
    <link rel="apple-touch-startup-image" href="img/splash/ipad-portrait.png"
          media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
    <link rel="apple-touch-startup-image" href="img/splash/iphone.png" media="screen and (max-device-width: 320px)">

</head>

<body class="animated fadeInDown">

<header id="header" style="height: 91px;">

    <div id="logo-group">
        <span id="logo"> <img src="img/logo.png" style="width: 47px;" alt="Selfin AdminK"> </span>
    </div>

    <span id="extr-page-header-space"> <span class="hidden-mobile">არ ხარ რეგისტრირებული?</span> <a href="#" onclick="gotoadmin()"
                                                                                              class="btn btn-danger">აკაუნტის შექმნა</a> </span>

</header>

<div id="main" role="main">

    <!-- MAIN CONTENT -->
    <div id="content" class="container">

        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-7 col-lg-8 hidden-xs hidden-sm">
                <h1 class="txt-color-red login-header-big">Selfin Smart პანელი</h1>

                <div class="hero">

                    <div class="pull-left login-desc-box-l">

                        <h4 class="paragraph-header">
                            <img src="img/logo.png" alt="Selfin AdminK">
                        </h4>

                        <div class="login-app-icons">
                            <a href="javascript:void(0);" class="btn btn-danger btn-sm">ჩვენი ბლოგი</a>
                            <a href="javascript:void(0);" class="btn btn-danger btn-sm">ვიდეო ტუტორიალი</a>
                        </div>
                    </div>

                    <img src="img/iphoneview.png" class="pull-right display-image" alt="" style="width:210px">

                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-5 col-lg-4">
                <div class="well no-padding">
                    <form role="form" method="post" id="loginfrm" class="smart-form client-form">
                        <header>
                            Sign In
                        </header>

                        <fieldset>

                            <section>
                                <label class="label">მომხმარებელი</label>
                                <label class="input"> <i class="icon-append fa fa-user"></i>
                                    <input name="loginid" id="loginid">
                                </label>
                            </section>

                            <section>
                                <label class="label">პაროლი</label>
                                <label class="input"> <i class="icon-append fa fa-lock"></i>
                                    <input class="form-control" id="password" name="password" placeholder="პაროლი"
                                           type="password">
                                    <input class="form-control" id="login" name="login" type="hidden">
                                </label>

                                <div class="note">
                                    <a href="#">პაროლი დაგავიწყდა?</a>
                                </div>
                            </section>
                        </fieldset>
                        <footer>
                            <button type="button" name="login" id="login" class="btn btn-primary">
                                შესვლა
                            </button>
                        </footer>
                    </form>

                </div>
            </div>
        </div>
    </div>

</div>

<script src="js/jquery-1.8.0.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap-dialog.min.js"></script>
<script type="text/javascript" src="js/main.js"></script>

<script>
    $(document).on("click","#login",function(){
        login();
    });
    function login() {
        var formData = $("#loginfrm").serializeArray();
        var pass = $("#password");
        var uname = $("#loginid");
        pass.removeClass("required");
        uname.removeClass("required");
        if (pass.val() == "") {
            pass.addClass("required");
            return;
        } else {
            pass.removeClass("required");
        }
        if (uname.val() == "") {
            uname.addClass("required");
            return;
        } else {
            uname.removeClass("required");
        }

        $.post("content/checkuser.jsp", formData, function (result) {
            if (typeof result !== "undefined") {
                if (result.trim() === "true") {
                    window.location.href = "index.jsp";
                } else {
                    BootstrapDialog.alert("არასწორი სახელი ან პაროლი");
                }
            }
        });
    }
    function gotoadmin()
    {
        BootstrapDialog.alert("ახალი ანგარიშის შესაქმნელად დაუკავშირდით ადმინისტრატორს!!!");
    }
</script>

</body>
</html>