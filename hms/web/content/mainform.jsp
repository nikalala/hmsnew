<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
    
    
%>
<style type="text/css">

</style>
<script type="text/javascript">
var ganttData = [
	{
		id: 1, name: "Feature 1", series: [
			{ name: "Planned", start: new Date(2010,00,01), end: new Date(2010,00,03) },
			{ name: "Actual", start: new Date(2010,00,02), end: new Date(2010,00,05), color: "#f0f0f0" }
		]
	}, 
	{
		id: 2, name: "Feature 2", series: [
			{ name: "Planned", start: new Date(2010,00,05), end: new Date(2010,00,20) },
			{ name: "Actual", start: new Date(2010,00,06), end: new Date(2010,00,17), color: "#f0f0f0" },
			{ name: "Projected", start: new Date(2010,00,06), end: new Date(2010,00,17), color: "#e0e0e0" }
		]
	}
];

$(function () {
    $("#ganttChart").ganttView({ 
            data: ganttData,
            slideWidth: 900,
            behavior: {
                    onClick: function (data) { 
                            var msg = "You clicked on an event: { start: " + data.start.toString("M/d/yyyy") + ", end: " + data.end.toString("M/d/yyyy") + " }";
                            $("#eventMessage").text(msg);
                    },
                    onResize: function (data) { 
                            var msg = "You resized an event: { start: " + data.start.toString("M/d/yyyy") + ", end: " + data.end.toString("M/d/yyyy") + " }";
                            $("#eventMessage").text(msg);
                    },
                    onDrag: function (data) { 
                            var msg = "You dragged an event: { start: " + data.start.toString("M/d/yyyy") + ", end: " + data.end.toString("M/d/yyyy") + " }";
                            $("#eventMessage").text(msg);
                    }
            }
    });


    $("#ganttChart").ganttView("setSlideWidth", 600);
});


</script>
<div id="ganttChart"></div>
<br/><br/>
<div id="eventMessage"></div>
