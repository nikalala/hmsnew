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
</style>
<script>
    
    function reloadPage(d, s){
        $.ajax({
            type: "POST",
            url: "content/stayview.jsp",
            data: { days: d, calstart: s },
            success: function(data)
            {
                $('#res1').html(data);
            },
            async: false
        });
    }
    
    function showDtp(){
        //$( "#stayview_date" ).click();
        $('#stayview_date').datepicker('show');
    }
    
    //Ext.ns('Rooms');
    
    Ext.onReady(function() {

    var height = 540;
    if($("#maincontent").height() > 654)
        height = $("#maincontent").height()-120;
    
    $('#stayview_date').datepicker(<%=pickerformat1%>).on('changeDate', function(e){ reloadPage(<%=days%>, $('#stayview_date').val()); });


    //$(".sch-event").
    
     Sch.preset.Manager.registerPreset("roomReservation", {
            timeColumnWidth   : 35,
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
    var resourceStore = new Sch.data.ResourceStore({
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
    var eventStore = new Sch.data.EventStore({
        //model   : 'Sch.model.Event',
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

    var startDate = new Date(<%=cal1.get(Calendar.YEAR)%>, <%=cal1.get(Calendar.MONTH)%>, <%=cal1.get(Calendar.DATE)%>);
    var endDate = new Date(<%=cal2.get(Calendar.YEAR)%>, <%=cal2.get(Calendar.MONTH)%>, <%=cal2.get(Calendar.DATE)%>);

    var scheduler = new Sch.panel.SchedulerGrid({
        width       : "100%",
        height      : height,
        renderTo    : 'stayview-container',
        
        startDate   : startDate,
        endDate     : endDate,

        viewPreset  : 'roomReservation',

        columns     : [
            { header : 'ოთახები', width : 130, dataIndex : 'Name'}
        ],

        resourceStore   : resourceStore,
        eventStore      : eventStore,
        
        enableDragCreation : false,
        enableEventDragDrop : false,
    
        trackMouseOver: false,
        stripeRows: true,
        startParamName: 'StartDate',
        endParamName: 'EndDate',
        viewConfig: {
            forceFit: true
        },
        
        eventTemplate: new Ext.Template(
            '<div id="{id}" style="width:{width}px;left:{leftOffset}px" class="sch-event {cls}">',
                '<div class="sch-event-inner">{text}</div>',
            '</div>'
        ).compile(),

        tooltipTpl: new Ext.XTemplate(
            '<div class="eventTip">',
            '<div><b>{Description}</b></div>',
            '<div>სტუმარი: {ReservedTo}</div>',
            '</div>'
        ).compile(),
        
        eventRenderer: function (eventRecord, resourceRecord, tplData, row, col) {
            tplData.style = 'background-color: ' + eventRecord.raw.Bgcolor+' !important; color: ' + eventRecord.raw.Color+' !important;';
            //return {
            //  Description : eventRecord.raw.Description,
            //  ReservedTo: eventRecord.raw.ReservedTo
            //};
            return eventRecord.raw.ReservedTo;
          }
    });

    //scheduler.render(Ext.getBody());
    
    
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


