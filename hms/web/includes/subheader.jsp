<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
	<title>Hotel Management System</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="title" content="HMS">
	<meta name="DC.Title" content="HMS">
	<meta name="author" content="MySoft Ltd.">
	<meta name="DC.Creator" content="MySoft Ltd.">
	<meta name="publisher" content="MySoft Ltd.">
	<meta name="DC.Publisher" content="MySoft Ltd.">
	<meta http-equiv="reply-to" content="webmaster@mysoft.ge">
	<meta name="copyright" content="MySoft Ltd.">
	<meta name="DC.Rights" content="MySoft Ltd.">
	<meta name="page-topic" content="MySoft Ltd.">
	<meta name="robots" content="INDEX,FOLLOW">
	<meta name="description" content="HMS">
	<meta name="abstract" content="HMS">
	<meta name="keywords" content="HMS">
	<link rel="stylesheet" type="text/css" href="../css/mysoft.css">
        <link rel="stylesheet" type="text/css" href="../css/jquery-ui.css">
        <link rel="stylesheet" type="text/css" href="../css/menu.css">
        <link rel="stylesheet" type="text/css" href="../css/ui.jqgrid.css">
        <link rel="stylesheet" type="text/css" href="../css/ui.spinner.css">
        <script language="javascript" src="../js/jquery.js"></script>
        <script language="javascript" src="../js/jquery-ui.js"></script>
        <script language="javascript" src="../js/ui.spinner.js"></script>
        <script language="javascript" src="../js/i18n/grid.locale-ka.js"></script>
        <script language="javascript" src="../js/jquery.jqGrid.js"></script>
        <script language="javascript" src="../js/jquery.dropdownPlain.js"></script>
        <script language="javascript" src="../js/jquery-ui-timepicker-addon.js"></script>
        <script language="javascript" src="../js/tiny_mce/jquery.tinymce.js"></script>
</head>

<body>

<script type='text/javascript'>
<!--
function popupwin(url, name, features) {
		
	var defaultfeatures='scrollbars=yes,resizable=yes,width=480,height=200,left=200,top=200'
		if (features == null ) { 
			features = defaultfeatures;
			}
		if (name == null ) {
			name = 'popup'
			}
		window.open(url, name, features);
	}

checkStatus = function(response, postdata)
    {
       var retval = true;
       var msg = "";
       var id = 0;
       var json = eval('(' + response.responseText + ')');
       if(json.result == 0)
           {
           msg = json.error;
           retval = false;
           }
       else
           id = json.id;
       return [retval,msg,id];
    }
    
function getBodyOld(fname)
{
    $.ajax({
      type: "POST",
      url: "content/"+fname+".jsp",
      data: { },
      success: function(data)
      {
          $("#mainbody").html(data);
          $("ul.dropdown li ul").css('visibility', 'hidden');
      },
      async: false
    });
}
//-->
</script>

