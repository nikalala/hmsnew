<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../../includes/init.jsp"%>
<script>
    $(document).ready(function() {
        initializeGridNa(roomStatusGrid);
    });
</script>
<div id="nolist_roomstatus" style="color: red;">მიმდინარე თარიღისთვის არ არსებობს დაუსრულებელი რეზერვაცია</div>
<table id='list_roomstatus' class="table-striped table-hover" align='center'></table>
