<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>
<%
    //Getting full reservation List From DB
    VReservationlistBean[] ReservationBeanList = VReservationlistManager.getInstance().loadByWhere("");
%>



<script type="text/javascript">
    $(document).ready(function () {
        console.log("hi");
        jQuery('#list_reservs').jqGrid(
                {
                    datatype: 'local',
                    colNames: ['რეზ#', 'ჩამოსვლა', 'წასვლა', 'სტუმრის სახელი', 'ოთახი', 'წყარო', 'კომპანია', 'ჯამი', 'დეპოზიტი', 'მომხმარებელი', 'რეზ.ტიპი'],
                    colModel: [
                        {width: 80, hidden: false, name: 'reservationid', index: 'reservationid', align: 'left'},
                        {width: 100, hidden: false, name: 'arraivaldate', index: 'arraivaldate', align: 'left'},
                        {width: 100, hidden: false, name: 'departuredate', index: 'departuredate', align: 'center'},
                        {width: 150, hidden: false, name: 'type', index: 'type', align: 'left'},
                        {width: 200, hidden: false, name: 'descr', index: 'descr', align: 'left'},
                        {width: 120, hidden: false, name: 'regby', index: 'regby', align: 'left'},
                        {width: 100, hidden: false, name: 'act', index: 'act', align: 'center'},
                        {width: 40, hidden: false, name: 'curr', index: 'curr', align: 'right'},
                        {width: 50, hidden: false, name: 'price', index: 'price', align: 'right'},
                        {width: 50, hidden: false, name: 'price', index: 'price', align: 'right'}
                    ],
                    rowNum: 2000,
                    height: 40,
                    autowidth: true,
                    sortname: 'name',
                    viewrecords: true,
                    sortorder: 'asc',
                    multiselect: true
                })
                .jqGrid('bindKeys');

        var data = <%=ReservationBeanList%>;
        <% for(int i=0;i<=ReservationBeanList.length;i++){ %>
            //jQuery("#list_reservs").jqGrid('addRowData', <%=i + 1%>, <%=ReservationBeanList[i]%>);
        <% } %>
    });
</script>


<table id='list_reservs' width='100%' align='center'></table>