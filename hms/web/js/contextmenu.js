
var statusmenu = [
//0     1      2     3     4      5     6     7     8     9     10     11     12    13    14     15
// დადასტურებული რეზერვაცია  0 + roomid is not null
    [true, true, true, true, false, false, true, true, false, true, true, true, true, false, true, true],                  //  0
// დადასტურებული რეზერვაცია  0 + roomid is null
    [true, false, true, false, false, false, true, true, true, false, true, true, true, false, true, true],                //  1
// მცხოვრები 1 + arraivaldate = closedate
    [true, true, true, false, true, false, false, false, false, false, true, true, true, false, true, true],                //  2
// მცხოვრები 1 + arraivaldate <> closedate
    [true, true, true, false, false, false, false, false, false, false, true, true, true, false, true, true],               //  3
// ვადაგადაცილებული 2
    [true, true, true, false, false, false, false, false, false, false, true, true, true, false, true, true],               //  4
// წამსვლელი 3
    [true, true, true, false, false, true, false, false, false, false, true, true, true, false, true, true],                //  5
// გაწერილი 4
    [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false],       //  6
// დაბლოკილი 5
    [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false],       //  7
// დღიური გამოყენება 6
    [true, true, true, false, true, true, false, false, false, false, true, true, true, false, true, true],                 //  8
// დაუდასტურებელი რეზერვაცია 7 + roomid is not null
    [true, true, true, true, false, false, true, true, false, true, true, true, true, false, true, true],                   //  9
// დაუდასტურებელი რეზერვაცია 7 + roomid is null
    [true, false, true, false, false, false, true, true, true, false, true, true, true, false, true, true],                 // 10
// თავისუფალი 8
    [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false],       // 11
// დღიური რეზერვაცია 9 + roomid is not null
    [true, true, true, true, false, false, true, true, false, true, true, true, true, false, true, true],                   // 12
// დღიური რეზერვაცია 9 + roomid is null
    [true, true, true, true, false, false, true, true, true, false, true, true, true, false, true, true]                    // 13

];
var stmn = [
    [0, 1, 2, 0],
    [0, 0, 2, 1],
    [1, 2, 1, 2],
    [1, 2, 0, 3],
    [2, 2, 2, 4],
    [3, 2, 2, 5],
    [4, 2, 2, 6],
    [5, 2, 2, 7],
    [6, 2, 2, 8],
    [7, 1, 2, 9],
    [7, 0, 2, 10],
    [8, 2, 2, 11],
    [9, 1, 2, 12],
    [9, 0, 2, 13]
];

function changeContextMenu(st, hr, sd, mn) {
    var k = -1;
    for (var i = 0; i < stmn.length; i++) {
        if (stmn[i][0] == st) {
            if (stmn[i][1] == 2 || stmn[i][1] == hr) {
                if (stmn[i][2] == 2 || stmn[i][2] == sd) {
                    k = stmn[i][3];
                    break;
                }
            }
        }
    }

    if (k >= 0) {
        $("#contextMenu ul").find('li').each(function () {
            var n = $(this).attr('num');
            if (statusmenu[k][n]) $(this).show();
            else                $(this).hide();
        });
    }
}

function doContextMenuAction(cm, id) {
    var fl = cm.attr('id').split("_");
    if (fl.length == 2 && fl[0] == 'TAB') {
        $.post(
            "content/getroomparambyid.jsp",
            {
                param: "name,roomtype",
                reservationroomid: id
            },
            function (data) {
                var num = '<span class="glyphicon glyphicon-' + cm.attr('icon') + '"></span>' + '&nbsp;&nbsp;' + data.name + ' - ' + data.roomtype;
                addTab("content/" + fl[1] + ".jsp?reservationroomid=" + id, num, cm.attr('id') + "_" + id);
            }, "json");

    }
    else
        newWindow1(cm.attr('id'), cm.text(), "reservationid=" + id);
}

$(function () {
    var $contextMenu = $("#contextMenu");
    var choosedid = 0;

    $("body").on("contextmenu click", "#roomlist tr, .sch-event", function (e) {
        choosedid = $(this).attr('id');
        var status = 0;
        var hasroom = 0;
        var samedate = 0;
        if (choosedid.indexOf("schedulergrid") == 0) {
            var nms = choosedid.split("-");
            choosedid = nms[3];
            status = nms[4];
        } else {
            status = $(this).attr('status');
            hasroom = $(this).attr('hasroom');
            samedate = $(this).attr('samedate');
        }
        changeContextMenu(status, hasroom, samedate, $contextMenu);
        $contextMenu.css({
            display: "block",
            left: e.pageX,
            top: e.pageY
        });
        return false;
    });

    $contextMenu.on("click", "a", function () {
        $contextMenu.hide();
        doContextMenuAction($(this), choosedid);
    });

    $("body").on("click", function () {
        $contextMenu.hide();
    }).keyup(function (e) {
        if (e.keyCode == 27)
            $contextMenu.hide();
    });
});