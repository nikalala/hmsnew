<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<%

    RoomviewBean[] roomviewBean = RoomviewManager.getInstance().loadByWhere("where roomviewid = 1");
    RoomBean[] rooms = RoomManager.getInstance().loadByWhere("order by roomid ASC");

    int margin = 40;
    int block_width = 87;
    int contentWidth = Integer.valueOf(request.getParameter("width")) - margin;
    int mainHeight = Integer.valueOf(request.getParameter("height"));
    int countOfRowsPerLine = Math.round(contentWidth / block_width);
    String html = "";

    html += "<tr>";
    int rowCounter = 0;
    for (int r = 0; r < rooms.length; r++) {
        if (rowCounter == countOfRowsPerLine) {
            html += "</tr><tr>";
            rowCounter = 0;
        }
        String div = "<div class='drag' id='r_"+ rooms[r].getRoomid() +"'>" + rooms[r].getRoomid() + " - " + rooms[r].getName() + "</div>";
        html += "<td class='tdclass'>" + div + "</td>";
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
<div id="drag" style="height: <%=mainHeight-30%>px; max-height: <%=mainHeight%>px; overflow-y: auto;">
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
            if(!isNullOrEmpty(json)){
                var j = $.parseJSON(json);
                var obj = {};
                var rem = [];
                for(var i = 0; i < j.length; i++){
                    if(j[i].roomid != "null"){

                        var div = $("#"+j[i].roomid).parent().html();
                        obj[j[i].nestid] = div;
                        rem.push($("#"+j[i].roomid));

                    }
                }
                $.each(rem,function(){
                   $(this).remove();
                });
                for (var key in obj) {
                    $( ".drag-table td:eq( "+ key +" )").html(obj[key])
                }
                addIcons();
                drawTable();
            }
        }

        function addIcons(){
            loader.show();
            $.post("content/getroomsforroomview.jsp", function (data) {
                $(data).find('.roomclass').each(function(){
                    var obj = $(this);
                    var id = obj.attr('id').replace("room_", "");
                    var color = obj.attr('color');
                    $("#r_"+id).append($(this).context.innerHTML);
                    if(!isNullOrEmpty(color)){
                        $("#r_"+id).css("background-color",color,"!important");
                        $("#r_"+id).css("color","#FFF","!important");
                        $("#r_"+id).find('i').css("color","#FFF","!important");
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