<%-- 
    Document   : test
    Created on : Aug 18, 2014, 1:18:58 PM
    Author     : djorj
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        
        <script type="text/javascript">

        Ext.ns('ConfRooms');

        Ext.onReady(function() {

            Ext.BLANK_IMAGE_URL = 'ext3/images/default/s.gif';




            ConfRooms.nextId = function() {
                var t = String(new Date().getTime()).substr(4);
                var s = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
                for (var i = 0; i < 4; i++) {
                    t += s.charAt(Math.floor(Math.random() * 26));
                }
                return t;
            }


            // Resource store
            ConfRooms.confRoomStore = new Ext.data.JsonStore({
                fields: ['Id', 'name'],
                data: [
                    { Id: '1', name: 'Conference Room A' },
                    { Id: '2', name: 'Conference Room B' },
                    { Id: '3', name: 'Conference Room C' },
                    { Id: '4', name: 'Conference Room D' },
                    { Id: '5', name: 'Conference Room E' }
                ]
            });

            // Event store
            ConfRooms.reservationsStore = new Ext.data.JsonStore({
                url: 'reservations.aspx',
                autoLoad: true,
                root: 'records',
                idProperty: 'Id',
                fields: [
                // Mandatory
                    {name: 'Id' },
                    { name: 'StartDate', type: 'date', dateFormat: 'Y-m-d G:i:s' },
                    { name: 'EndDate', type: 'date', dateFormat: 'Y-m-d G:i:s' },
                    { name: 'ResourceId', type: 'string', mapping: 'RoomId' },

                // Application-specific
                    {name: 'ReservedTo', type: 'string', mapping: 'ReservedTo' },
                    { name: 'Description', type: 'string', mapping: 'Description' }
                ],
                writer: new Ext.data.JsonWriter({
                    autoSave: false,
                    encode: true
                })
            });


            //Sch.ColumnFactory.headerRenderers.hour = function(a) { return a.format("g:i A") };

//            Ext.apply(Sch.ViewBehaviour.HourView.prototype, {
//                getFormattedDate: function(a) { return a.format("g:i A"); },
//                getFormattedDateSpan: function(a, b) { return { start: a.format("g:i A"), end: b.format("g:i A") }; }
//            });



            ConfRooms.start = new Date(2009, 11, 16, 8, 00, 00);
            ConfRooms.end = new Date(2009, 11, 16, 18, 00, 00);

            ConfRooms.sch = new Sch.SchedulerPanel({
                height: 300,
                width: 800,
                renderTo: 'conf-rooms-1',
                title: 'Conference Room Reservations',
                trackMouseOver: false,
                stripeRows: true,
                store: ConfRooms.confRoomStore,
                eventStore: ConfRooms.reservationsStore,
                startParamName: 'StartDate',
                endParamName: 'EndDate',
                viewConfig: {
                    forceFit: true
                },
                columns: [
                    { header: 'Room Name', sortable: true, width: 150, dataIndex: 'name' }
                ],                
                eventTemplate: new Ext.Template(
                    '<div id="{id}" style="width:{width}px;left:{leftOffset}px" class="sch-event {cls}">',
                        '<div class="sch-event-inner">{text}</div>',
                    '</div>'
                ).compile(),
                tooltipTpl: new Ext.Template(
                    '<div class="eventTip">',
                    '<div><b>{Description}</b></div>',
                    '<div>Reserved by: {ReservedTo}</div>',
                    '</div>'
                ).compile(),
                

            });

            // This is the public method to manually set/change "view"
            ConfRooms.sch.setView(ConfRooms.start, ConfRooms.end, 'hour', Sch.ViewBehaviour.HourView, function(item, m, r, row, col, ds, index) {
                return {
                    text: item.get('Description')
                };
            });


        });
    
    </script>
<div id="conf-rooms-1" style="padding:20px"></div>
        
        
        
    </body>
</html>
