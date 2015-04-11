<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="includes/init.jsp" %>
<%
    String pkfmt = "{autoclose: true, format: '" + dateformats1[dff] + "', maxDate : new Date(" + CodeHelpers.addDays(dclosedate, -1) + "), language: 'ka', todayHighlight: true, allowEmpty: false}";
    
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

    <script type="text/javascript" src="js/redips-drag-min.js"></script>

    <script>

        $(document).ready(function () {


            $('#guestinfo_arrivaldate').datepicker(<%=pkfmt%>).on('changeDate', function (e) {
            
            });

        });


    </script>
    <style>
        .nav-tabs > li > a {
            border-radius: 2px 2px 0 0 !important;
        }
        .btn {
            border-radius: 2px !important;
        }
    </style>
</head>

<body>

    <form class="form-inline" role="form">
                <div class="form-group">
                    <div class="input-group-xs">
                        <div class="input-append date">
                            <input class="span2 form-control" readonly="" size="10" value="<%=dt.format(new Date())%>" type="text" id="guestinfo_arrivaldate">
                        </div>
                    </div>
                </div>
            </form>
    
    
</body>

</html>