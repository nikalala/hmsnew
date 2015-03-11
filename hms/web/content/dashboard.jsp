<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<script src="js/zabuto_calendar.js"></script>
<link rel="stylesheet" type="text/css" href="css/zabuto_calendar.css">


<div id="dash-calendar"></div>


<script type="application/javascript">
  $(document).ready(function () {
    $("#dash-calendar").zabuto_calendar({
      ajax: {
        url: "content/getdashdata.jsp",
        modal: true
      }
    });
  });
</script>