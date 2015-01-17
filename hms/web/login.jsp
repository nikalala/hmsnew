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
    </script>

    <div class="row" id="loginpanel" style="margin-top: 100px;">
        <div class="col-md-5"></div>
        <div class="col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">რეგისტრაცია</h3>
                </div>
                <div class="panel-body">
                    <form role="form" method="post" id="loginfrm">
                        <div class="form-group">
                            <input class="form-control" placeholder="სარეგისტრაციო სახელი" type="text" name="loginid"
                                   id="loginid">
                        </div>
                        <div class="form-group">
                            <input class="form-control" id="password" name="password" placeholder="პაროლი"
                                   type="password">
                            <input class="form-control" id="login" name="login" type="hidden">
                        </div>
                        <button type="button" name="login" id="login" class="active btn btn-block btn-lg btn-primary">
                            შესვლა
                        </button>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-md-5"></div>
    </div>

