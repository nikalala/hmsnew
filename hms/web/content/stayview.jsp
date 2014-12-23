<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
    int barrad = 10;
    int days = 15;
    if(request.getParameter("days") != null)
        days = Integer.parseInt(request.getParameter("days"));
    String startdate = request.getParameter("calstart");
    Calendar cal1 = Calendar.getInstance();
    if(startdate != null)   cal1.setTime(dt.parse(startdate));
    else                    startdate = dt.format(cal1.getTime());
    Calendar cal2 = Calendar.getInstance();
    cal2.setTimeInMillis(cal1.getTimeInMillis());
    cal2.add(Calendar.DATE, days);

    Calendar calb = Calendar.getInstance();
    calb.setTimeInMillis(cal1.getTimeInMillis());
    calb.add(Calendar.DATE, (-1)*days);

    Calendar cala = Calendar.getInstance();
    cala.setTimeInMillis(cal2.getTimeInMillis());
    cala.add(Calendar.DATE, 1);

    StcolorBean[] colors = StcolorManager.getInstance().loadByWhere("where active = true and deleted = false order by roomstatus");
%>
<style>
    .stayview-date-calendar-input{
        background-color:transparent;
        border: 0px solid;
        font-weight: bold;
    }

    <%for(int i=0;i<colors.length;i++){%>
    .sch-event-status-<%=colors[i].getRoomstatus()%> {
        background-color: <%=colors[i].getColor()%> !important;
    }
    <%}%>

    .sch-event
    {
    //border-color:#6699cc;
        text-shadow: 0px 1px 1px #000;
        background: -moz-linear-gradient(32% 96% 90deg, rgba(0, 0, 0, 0.5), transparent 80%) repeat scroll 0% 0% transparent;
        border-style: none;
    //color:#1C417C;
        cursor:pointer;
        text-align: center;
        top:0px;
        -moz-border-radius: <%=barrad%>px;
        -webkit-border-radius: <%=barrad%>px;
        -khtml-border-radius: <%=barrad%>px;
        border-radius: <%=barrad%>px;
    }

    .sch-event-inner
    {
    //background-color: red !important;
        padding:1px;
    }

    .sch-event-selected
    {
        border-color:#3366cc !important;
        border-width:1px !important;
    }

    div.sch-event:hover
    {
        border-color:#3366cc;
    }
    .unavailable .x-grid-cell
    {
        color:#000;
        font-weight:bold;
        background: url('images/graytexture.png') repeat-x left center !important;
    }
</style>
<script>
var totalDays;
function reloadPage(d, s){
    totalDays = d;
    $.ajax({
        type: "POST",
        url: "content/stayview.jsp",
        data: { days: d, calstart: s },
        success: function(data)
        {
            $("#centerTabContent .tab-pane").first().html(data);
        },
        async: false
    });
}

function showDtp(){
    //$( "#stayview_date" ).click();
    $('#stayview_date').datepicker('show');
}
Ext.require([
    'Sch.mixin.*'
]);
//Ext.ns('Rooms');
Ext.onReady(function() {
    Ext.QuickTips.init();
    var height = 500;
    if($("#maincontent").height() > 654)
        height = $("#maincontent").height()-120;

    $('#stayview_date').datepicker(<%=pickerformat1%>).on('changeDate', function(e){ reloadPage(<%=days%>, $('#stayview_date').val()); });


    //$(".sch-event").

    Sch.preset.Manager.registerPreset("roomReservation", {
        timeColumnWidth   : 350,
        rowHeight         : 25,
        displayDateFormat : 'd/m/Y',
        shiftIncrement    : 1,
        shiftUnit         : "DAY",
        timeResolution    : {
            unit      : "HOUR",
            increment : 12
        },
        defaultSpan       : 12,
        headerConfig      : {
            middle : {
                unit      : "DAY",
                increment : 1,
                renderer  : function (startDate, endDate, headerConfig, cellIdx) {
                    // Setting align on the header config object
                    headerConfig.align = 'center';
                    var dt = "<b>"+Ext.Date.format(startDate, 'd')+"</b>";
                    dt += "<br><span style='font-size: 9px;'>"+hmsMonthsMin[moment(startDate).month()];
                    dt += "<br>"+hmsDaysMin[moment(startDate).day()]+"</span>";
                    return dt;
                }
            }
        }
    });

    Ext.BLANK_IMAGE_URL = 'images/blank.gif';

    // Store holding all the resources
    resourceStore = new Sch.data.ResourceStore({
        model   : 'Sch.model.Resource',
        autoLoad: true,
        proxy: {
            type: 'ajax',
            url: 'content/getstayview.jsp',
            reader: {
                type: 'json'
            }
        }
    });

    // Store holding all the events
    eventStore = new Sch.data.EventStore({
        model   : 'Sch.model.Event',
        proxy: {
            type: 'ajax',
            url: 'content/getstayviewevents.jsp',
            reader: {
                type: 'json'
            }
        },
        autoLoad: true,
        fields: [
            // Mandatory
            { name: 'Id' },
            { name: 'StartDate', type: 'date', dateFormat: 'Y-m-d G:i' },
            { name: 'EndDate', type: 'date', dateFormat: 'Y-m-d G:i' },
            { name: 'ResourceId', type: 'string', mapping: 'RoomId' },

            // Application-specific
            { name: 'ReservedTo' },
            { name: 'Description' }
        ]
    });

    startDate = new Date(<%=cal1.get(Calendar.YEAR)%>, <%=cal1.get(Calendar.MONTH)%>, <%=cal1.get(Calendar.DATE)%>);
    endDate = new Date(<%=cal2.get(Calendar.YEAR)%>, <%=cal2.get(Calendar.MONTH)%>, <%=cal2.get(Calendar.DATE)%>);
    var onEventContextMenu = function(s, rec, e){
        e.stopEvent();

        if (!s.ctx) {
            s.ctx = new Ext.menu.Menu({
                items: [{
                    text: 'Delete event',
                    iconCls: 'icon-delete',
                    handler : function() {
                        s.eventStore.remove(s.ctx.rec);
                    }
                }]
            });
        }
        s.ctx.rec = rec;
        s.ctx.showAt(e.getXY());
    }


    scheduler = Ext.create("Sch.panel.SchedulerGrid",{
        width       : "100%",
        height      : height,
        renderTo    : 'stayview-container',
        startDate   : startDate,
        endDate     : endDate,
        loadMask  : { store : eventStore },
        viewPreset  : 'roomReservation',

        columns     : [
            { header : 'ოთახები', width : 130, dataIndex : 'Name',menuDisabled: true,sortable: false,align:"center"},
            {
                header : '',
                width : 25,
                dataIndex : 'smoker',
                menuDisabled: true,
                align:"center",
                sortable: false,
                renderer: function (a,b,record) {
                    var id = record.get('Id');
                    var ids = id.split('_');
                    if(ids.length > 1){
                        return '<img src="https://cdn0.iconfinder.com/data/icons/prohibited-and-warning/78/Prohibition_icons-03-16.png"/>';
                    }
                    return '';
                }
            },
            {
                header : '',
                width : 25,
                dataIndex : 'cleaned',
                align:"center",
                menuDisabled: true,
                sortable: false,
                renderer: function (a,b,record) {
                    var id = record.get('Id');
                    var ids = id.split('_');
                    if(ids.length > 1) {
                        return '<img src="https://cdn2.iconfinder.com/data/icons/fugue/icon/broom.png"/>';
                    }
                    return '';
                }
            },
            {
                header : '',
                width : 25,
                align:"center",
                dataIndex : 'available',
                menuDisabled: true,
                sortable: false,
                renderer: function (a,b,record) {
                    var id = record.get('Id');
                    var ids = id.split('_');
                    if(ids.length > 1) {
                        return '<img src="https://cdn3.iconfinder.com/data/icons/business-101-1/512/Message-16.png"/>';
                    }
                    return '';
                }
            }
        ],

        resourceStore   : resourceStore,
        eventStore      : eventStore,
        enableDragCreation : true,
        eventResizeHandles : 'none',
        enableEventDragDrop : false,
        allowOverlap:false,
        viewConfig: {
            forceFit: true,
            stripeRows: true,
            trackOver   : true,
            getRowClass : function(resourceRecord) {
                var id = resourceRecord.get('Id');
                var ids = id.split('_');
                if (ids.length<2) {
                    return 'unavailable';
                }
                if(resourceRecord.dirty == true) return 'bg-row-edited';
                return '';
            }
        },

        // Simple template with header and footer
        eventBodyTemplate : new Ext.Template(
                '<span class="sch-event-header">{ReservedTo}</span>'
        ),

        tooltipTpl: new Ext.XTemplate(
                '<div class="eventTip">',
                '<div>თარიღიდან: {[Ext.Date.format(values.StartDate, "d.m.Y")]}</div>',
                '<div>თარიღამდე: {[Ext.Date.format(values.EndDate, "d.m.Y")]}</div>',
                '<div>სტუმარი: {Name}</div>',
                '</div>'
        ).compile(),

        eventRenderer: function (eventRecord, resourceRecord, tplData, row, col) {
            if(eventRecord.raw){
                tplData.style = 'background-color: ' + eventRecord.raw.Bgcolor+' !important; color: ' + eventRecord.raw.Color+' !important;';
            }

            return {
                ReservedTo : eventRecord.data.Name
            };

        },
        onEventCreated : function (newEventRecord) {
            newEventRecord.set({
                Name : "სტუმარი"
            });
        },
        listeners       : {
            beforedragcreate : function(s, resource) {
                // console.log(s.dragCreator)
                var avalable = false;
                var id = resource.get('Id');
                var ids = id.split('_');
                if(ids.length > 1){
                    avalable=true;
                }
                if(!avalable){
                    return false;
                }
            },
            eventcontextmenu    : onEventContextMenu,
            beforedragcreatefinalize : function (sched, data) {
                var start = Ext.Date.format(data.start, "d.m.Y");
                var end = Ext.Date.format(data.end, "d.m.Y");
                var originalStart = Ext.Date.format(sched.originalStart, "d.m.Y");
                if(Ext.Date.parse(originalStart,'d.m.Y')>Ext.Date.parse(start,'d.m.Y')){
                    data.finalize();
                    return false;
                }
                var roomAndType = data.resourceRecord.data.Id;
                var tempArr = roomAndType.split('_');
                var type = tempArr[0];
                var roomId = tempArr[1];

                newWindowWithParams('walkin','dasdasdada','?req_roomId='+roomId+'&req_dtStart='+start+'&req_dtEnd='+end);
                data.finalize();

            }
        }
    });
    // Set up a model to use in our Store
    statisticsModel = Ext.define('StatisticsModel', {
        extend: 'Ext.data.Model',
        fields: [
            {name: 'name', type: 'string'}
        ]
    });

    statisticsStore = Ext.create('Ext.data.Store', {
        model: 'StatisticsModel'
    });
    statisticsGrid = Ext.create("Ext.grid.Panel",{
        height:50,
        hideHeaders: true,
        width: '100%',
        renderTo:'stayview-statistics-grid',
        store:statisticsStore,
        columns     : []

    });
    eventStore.on('load',function(){
        var totalRoomsCount = 0;
        Ext.each(resourceStore.getRange(),function(row){

            if(row.data.Id.indexOf("_") > -1) totalRoomsCount++;
        });

        var events = eventStore.getEventsInTimeSpan(startDate,endDate);
        var freeRoomsCount = [];

        var columns =  [{header: '',width:206,dataIndex:'name',align:"center"}];
        var colWidth;
        if(!totalDays) totalDays=15;
        if(totalDays==15){
            colWidth = 57;
        } else if (totalDays==7){
            colWidth = 114;
        } else if (totalDays==30){
            colWidth = 28;
        }
        for(i=0;i<totalDays;i++){
            freeRoomsCount[i]=0;
            var column = Ext.create('Ext.grid.column.Column', {header: '',
                                                                width:colWidth,
                                                                menuDisabled: true,
                                                                align:"center",
                                                                sortable: false,
                                                                dataIndex:'statistic-column-'+i});
            columns.push(column);
            if(i==0){
                var curDate = startDate;
            }else{
                var curDate = new Date(startDate.setDate(startDate.getDate() + 1))
            }


            Ext.each(events.items, function(event){

                var start = Ext.Date.format(event.getStartDate(),'d.m.Y');
                var end = Ext.Date.format(event.getEndDate(),'d.m.Y');

                if (curDate>=Ext.Date.parse(start,'d.m.Y') && curDate<= Ext.Date.parse(end,'d.m.Y')) {
                    var overlaps = false;
                    Ext.each(events.items, function(val){
                        var overStart = Ext.Date.parse(start,'d.m.Y').getTime();
                        var overEnd = Ext.Date.parse(Ext.Date.format(val.data.EndDate,'d.m.Y'),'d.m.Y').getTime();
                       if( overStart==overEnd && val.data.ResourceId == event.data.ResourceId && event.data.Id!=val.data.Id && curDate.getTime()==overStart){
                           overlaps = true;
                           return false;
                       }
                    });
                    if(!overlaps){
                        freeRoomsCount[i]++;
                    }

                }
            });

        }


        var freeRooms = {};
        var traffic = {};
        var fields = [{name:'name'}];

        freeRooms.name='<b>თავისუფალი ოთახები</b>';
        traffic.name='<b>დატვირთულობის %</b>';
        Ext.each(freeRoomsCount,function(item,index){
            traffic['statistic-column-'+index] = (item*100/totalRoomsCount).toFixed(1);
            freeRooms['statistic-column-'+index] = totalRoomsCount-item;
            fields.push({name:'statistic-column-'+index});
        });
        statisticsStore.model.setFields(fields);
        statisticsGrid.reconfigure(statisticsStore,columns)
        statisticsStore.loadRawData([freeRooms,traffic], false);


    });


});
</script>
<table width="100%" style="border-color: #BEBEBE; border-style: solid; border-width: 1px;">
    <tr style="height: 30px;">
        <td class='pseudobutton' onclick="reloadPage(<%=days%>, '<%=dt.format(calb.getTime())%>')" style="cursor: pointer; background-color: #F9F9F9; text-align: center; width: 70px; border-right-color: #BEBEBE; border-right-style: solid; border-right-width: 1px;">
            <button type="button" class="btn btn-xs btn-primary navbar-btn glyphicon glyphicon-arrow-left"></button>
        </td>
        <td class='pseudobutton' onclick="reloadPage(15, '<%=dt.format(new Date())%>')" style="cursor: pointer; background-color: #F9F9F9; text-align: center; width: 70px; border-right-color: #BEBEBE; border-right-style: solid; border-right-width: 1px;">
            <b>დღეს</b>
        </td>
        <td class='pseudobutton' onclick="reloadPage(7, '<%=startdate%>')" style="cursor: pointer; background-color: #F9F9F9; text-align: center; width: 70px; border-right-color: #BEBEBE; border-right-style: solid; border-right-width: 1px;">
            <b>7 დღე</b>
        </td>
        <td class='pseudobutton' onclick="reloadPage(15, '<%=startdate%>')" style="cursor: pointer; background-color: #F9F9F9; text-align: center; width: 70px; border-right-color: #BEBEBE; border-right-style: solid; border-right-width: 1px;">
            <b>15 დღე</b>
        </td>
        <td class='pseudobutton' onclick="reloadPage(30, '<%=startdate%>')" style="cursor: pointer; background-color: #F9F9F9; text-align: center; width: 90px; border-right-color: #BEBEBE; border-right-style: solid; border-right-width: 1px;">
            <b>30 დღე</b>
        </td>
        <td class='pseudobutton' onclick="reloadPage(<%=days%>, '<%=dt.format(cala.getTime())%>')" style="cursor: pointer; background-color: #F9F9F9; text-align: center; width: 70px; border-right-color: #BEBEBE; border-right-style: solid; border-right-width: 1px;">
            <button type="button" class="btn btn-xs btn-primary navbar-btn glyphicon glyphicon-arrow-right"></button>
        </td>
        <td style="background-color: #E9E9E9; text-align: right; color: red; font-size: 11px; padding-right: 5px;">

        </td>
        <td style="background-color: #E9E9E9; text-align: left; width: 60px; padding-right: 5px;">
            <input class="stayview-date-calendar-input" readonly="" disabled="" type="text" id="stayview_date" style="width: 115px;" value="<%=startdate%>">
        </td>
        <td style="background-color: #E9E9E9; text-align: left; width: 20px; padding-right: 5px;">
            <div class="glyphicon glyphicon-calendar" style="cursor: pointer;" onclick="showDtp()"></div>
        </td>
    </tr>
</table>
<div id="stayview-container"></div>
<div id="stayview-statistics-grid"></div>
<div id="statusColorInformation">
    <div class="pull-left statuses">
        <div id="recievedGuest">მიღებული სტუმარი</div>
    </div>
    <div class="pull-left statuses">
        <div id="outGuest">გაწერილი სტუმარი</div>
    </div>
    <div class="pull-left statuses">
        <div id="willGoGuest">წამსვლელი სტუმარი</div>
    </div>
    <div class="pull-left statuses">
        <div id="checkedGuest">დადასტურებული რეზერვაცია</div>
    </div>
    <div class="pull-left statuses">
        <div id="blockedGuest">დროებით დაბლოკილი</div>
    </div>
    <div class="pull-left statuses">
        <div id="deadlineGuest">გადაცილებული დარჩენა</div>
    </div>
    <div class="pull-left statuses">
        <div id="dailyGuest">დღიური გამოყენება</div>
    </div>

</div>


