<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../../includes/init.jsp"%>
<script>
    $(document).ready(function() {
        initializeGrid(postchargesGrid);
    });
</script>
<div id="noroomstatus" style="color: red;">მიმდინარე თარიღისთვის არ არსებობს დაუსრულებელი რეზერვაცია</div>
<table id='list_postcharges' class="table-striped table-hover" align='center'></table>
