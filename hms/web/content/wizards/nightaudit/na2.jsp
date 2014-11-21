<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../../includes/init.jsp"%>
<%

%>
<script>
    $(document).ready(function() {
        initializeGrid(finishedResGrid);
    });
</script>
<div id="norelasereservations" style="color: red !important;">მიმდინარე თარიღისთვის არ არსებობს დასრულებელი რეზერვაცია</div>
<table id='list_relasereservations' class="table-striped table-hover" align='center'></table>
