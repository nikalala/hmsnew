<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../../../includes/init.jsp" %>

<script>
    $(document).ready(function () {
        initializeGrid(pResGrid);
    });
</script>

<div id="nopendingreservations" style="color: red;">მიმდინარე თარიღისთვის არ არსებობს დაუსრულებელი რეზერვაცია</div>
<table id='list_pendingreservations' class="table-striped table-hover" align='center'></table>

