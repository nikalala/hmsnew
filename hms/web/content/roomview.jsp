<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<%

    int roomCount = RoomManager.getInstance().countAll();

    RoomviewBean[] roomviewBean = RoomviewManager.getInstance().loadByWhere("where roomviewid = 1");
    RoomBean[] rooms = RoomManager.getInstance().loadByWhere("order by roomid ASC");

    int margin = 40;
    int block_width = 87;
    int block_height = 87;
    int tdmargin = 3;
    int contentWidth = Integer.valueOf(request.getParameter("width")) - margin;
    int mainHeight = Integer.valueOf(request.getParameter("height"));
    int countOfRowsPerLine = Math.round(contentWidth / block_width);
    String html = "";

    html += "<tr>";
    int roomCounter = 0;
    int rowCounter = 0;
    for (int r = 0; r < roomCount; r++) {
        if (rowCounter == countOfRowsPerLine) {
            html += "</tr><tr>";
            rowCounter = 0;
        }
        String div = "<div class='drag' id="+ rooms[r].getRoomid() +">" + rooms[r].getRoomid() + " - " + rooms[r].getName() + "</div>";
        html += "<td class='tdclass'>" + div + "</td>";
        roomCounter++;
        rowCounter++;
    }
    if (countOfRowsPerLine > rowCounter) {
        int filltheline = countOfRowsPerLine - rowCounter;
        for (int i = 0; i < filltheline; i++) {
            html += "<td class='tdclass'></td>";
        }
    }
    html += "</tr>";

    for (int i = 0; i < roomviewBean[0].getExtrarow(); i++) {
        html += "<tr>";
        for (int j = 0; j < countOfRowsPerLine; j++) {
            html += "<td class='tdclass'></td>";
        }
        html += "</tr>";
    }

%>
<style>
    .truncate {
        width: 68px !important;
        white-space: nowrap !important;
        overflow: hidden !important;
        text-overflow: ellipsis !important;
    }
</style>
<script>

    function tblToJson (){
        var table = $('#table1 td').map(function(i, v) {
            var $td =  $('td', this);
            var prop = $($td.context).html();
            var id = "null";
            if (typeof prop !== "undefined" && !isNullOrEmpty(prop)) {
                id = $(prop).attr('id');
            }
            return {
                roomid: id,
                nestid: i
            }
        }).get();
        var json = JSON.stringify(table);
        var sql = "UPDATE roomview SET json = N'" + json + "'";
        loader.show();
        $.post("content/execute.jsp?query=" + encodeURIComponent(sql), {}, function () {

            loader.hide();

        });

        return json;
    }

    $(document).ready(function () {

        $(".gridfooter, .footer2").remove();
        $(".datepicker").datepicker();

        function reDrawTable(){
            var json = '<%=roomviewBean[0].getJson()%>';
            var jsonObj;
            if(!isNullOrEmpty(json)){
                console.log("Starting...");
                jsonObj = JSON.parse(json);
                $.each(jsonObj, function (boxindex, object) {
                    if(object.roomid != "null"){
                        var div = $("#"+object.roomid).parent().html();
                        $("#"+object.roomid).remove();
                        $($("#table1 td")[object.nestid]).html(div);
                    }
                });
                drawTable();
                addIcons();
            }
        }

        function addIcons(){
            loader.show();
            $.post("content/getroomsforroomview.jsp", function (data) {
                $(data).find('.roomclass').each(function(){
                    var obj = $(this);
                    var id = obj.attr('id').replace("room_", "");
                    var color = obj.attr('color');
                    $("#"+id).append($(this).context.innerHTML);
                    if(!isNullOrEmpty(color)){
                        $("#"+id).css("background-color",color,"!important");
                        $("#"+id).css("color","#FFF","!important");
                        $("#"+id).find('i').css("color","#FFF","!important");
                    }
                });
                loader.hide();
            });
        }

        function drawTable() {
            var counter = 0;
            var rd = REDIPS.drag;
            // initialization
            rd.init();
            // set mode option to "shift"
            rd.dropMode = 'shift';
            // set animation loop pause
            rd.animation.pause = 20;
            // enable shift.animation
            rd.shift.animation = true;
            // set TD for overflow elements (initially)
            rd.shift.overflow = document.getElementById('overflow');
            // add counter to cloned element name
            // (after cloned DIV element is dropped to the table)
            rd.event.clonedDropped = function () {
                // increase counter
                counter++;
                // append to the DIV element name
                rd.obj.innerHTML += counter;
            };
        }

        <% if(CodeHelpers.isNullOrEmpty(roomviewBean[0].getJson())){ %>
            drawTable();
        <% }else{ %>
            reDrawTable();
        <% } %>

    });




</script>
<div id="drag" style="height: <%=mainHeight%>px; max-height: <%=mainHeight%>px; overflow-y: auto;">
    <table style="float: right;  margin-top: 0;  margin-bottom: 0;  margin-right: 0;">
        <tr>
            <td style="height: 30px;width: 20px;  border: 0 !important;"><i class="fa fa-save" onclick="tblToJson()"></i></td>
            <td style="height: 30px;  border: 0 !important;"><input type="text" id="dt" class="datepicker"></td>
        </tr>
    </table>
    <br/>
    <table id="table1" class="drag-table">
        <%=html%>
    </table>
</div>
