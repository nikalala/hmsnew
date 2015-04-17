var today = new Date();
var tomorrow = new Date();
tomorrow.setDate(tomorrow.getDate() + 1);

var tabcount = 0;
$(document).ready(function () {

    loader = $(".loading-panel");
    registerModalFunctions();
    
});

$(document).keydown(function (e) {
    if (e.keyCode == 76 && e.ctrlKey) {
        launchLockScreen();
    }
    if (e.keyCode == 116) {
        return false;
    }
});

function registerModalFunctions() {
    //This should not happen if there is at least one error message...
    $(document).on("click", "#myModalCancel, #myModalSave, #myModalCheckin", function () {
        //removeModal();
    });
}



function launchLockScreen() {
    $("#mainbody").append('<div id="lockscreen"></div>');
    $("#lockscreen").css("width", $(document).width());
    $("#lockscreen").css("height", $(document).height());
    $("#lockscreen").css("z-index", "1000000000");
    $("#lockscreen").css("background", "url(img/mybg.png) #fff");
    $("#lockscreen").css("min-height", "100%");
    $("#lockscreen").load("content/lock.jsp");
    $("#lockscreen").fadeIn();
}

function removelockscr() {
    $("#lockscreen").remove();
}

function loadMainBody() {
    getBody("stayviewleft", "stayview", 'დატვირთულობა', 'res1');
}

function sleep(milliseconds) {
    var start = new Date().getTime();
    for (var i = 0; i < 1e7; i++) {
        if ((new Date().getTime() - start) > milliseconds) {
            break;
        }
    }
}

function checkAll(ct, cl) {
    if (ct.prop('checked')) $("." + cl).prop('checked', true);
    else                   $("." + cl).prop('checked', false);
}

BootstrapDialog.alert = function (message, callback) {
    new BootstrapDialog({
        title: 'შეცდომა',
        type: 'type-danger',
        message: message,
        data: {
            'callback': callback
        },
        closable: false,
        buttons: [
            {
                label: 'OK',
                action: function (dialog) {
                    typeof dialog.getData('callback') === 'function' && dialog.getData('callback')(true);
                    dialog.close();
                }
            }
        ]
    }).open();
};

BootstrapDialog.info = function (message, callback) {
    new BootstrapDialog({
        title: 'შეტყობინება',
        type: 'type-info',
        message: message,
        data: {
            'callback': callback
        },
        closable: false,
        buttons: [
            {
                label: 'OK',
                cssClass: 'btn-primary',
                action: function (dialog) {
                    typeof dialog.getData('callback') === 'function' && dialog.getData('callback')(true);
                    dialog.close();
                }
            }
        ]
    }).open();
};

BootstrapDialog.confirm = function (message, callback) {
    new BootstrapDialog({
        title: 'გაფრთხილება',
        message: message,
        type: 'type-warning',
        closable: false,
        data: {
            'callback': callback
        },
        buttons: [
            {
                label: 'Cancel',
                action: function (dialog) {
                    //typeof dialog.getData('callback') === 'function' && dialog.getData('callback')(false);
                    dialog.close();
                }
            },
            {
                label: 'OK',
                cssClass: 'btn-primary',
                action: function (dialog) {
                    typeof dialog.getData('callback') === 'function' && dialog.getData('callback')(true);
                    dialog.close();
                }
            }
        ]
    }).open();
};

$.fn.serializeObject = function (form) {
    var o = {};
    var a = form.serializeArray();
    $.each(a, function () {
        if (o[this.name]) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    //console.log(o);
    return o;
};

function savedata(id) {
    loader.show();

    var callbackurl = $("#callbackurl").val();
    var callbackdata = $("#callbackdata").val();
    var action = $("#action").val();
    var callbackmethod = $("#callbackmethod").val();
    var params;
    var maindiv = $("#maindiv").val();

    if (maindiv === undefined || maindiv == '') {
        params = $("#controls").val().split(",");
    } else {
        params = $('#' + maindiv + ' [id]').map(function () {
            return this.id;
        }).get();
        //params = ids.join(',');
    }
    for (var i = 0; i < params.length; i++) {
        var ch = $("#" + params[i]).is(':checkbox');
        var ra = $("#" + params[i]).is(':radio');
        if (ch)    action += "&" + params[i] + "=" + $("#" + params[i]).is(':checked');
        else if (ra)    action += "&" + params[i] + "=" + $("#" + params[i]).is(':checked');
        else action += "&" + params[i] + "=" + $("#" + params[i]).val();
    }
    $.post("content/" + action, {}, function (data) {
        loader.hide();
        if (data.result == 0)    BootstrapDialog.alert(data.error);
        else {
            if (callbackurl.indexOf('script:') >= 0) {
                eval(callbackurl.substring(7));
            }
            if (callbackurl != '') {
                $.post(callbackurl, {}, function (data) {
                    $("#" + callbackdata).html(data);
                });
            }
            $("#" + id).modal('hide');
            $("#callbackurl").remove();
            $("#callbackdata").remove();
            $("#action").remove();
            $("#controls").remove();
            if (!isNullOrEmpty(callbackmethod)) {
                eval(callbackmethod);
            }
            removeModal();
            //BootstrapDialog.info("ოპერაცია წარმატებით შესრულდა");
        }
    }, "json");

}

function savedataprefix(id, prefix) {
    loader.show();
    var callbackurl = $("#" + prefix + "callbackurl").val();
    var callbackdata = $("#" + prefix + "callbackdata").val();
    var action = $("#" + prefix + "action").val();
    var params;
    var maindiv = $("#" + prefix + "maindiv").val();
    if (maindiv === undefined || maindiv == '') {
        params = $("#" + prefix + "controls").val().split(",");
    } else {
        params = $('#' + maindiv + ' [id]').map(function () {
            return this.id;
        }).get();
        //params = ids.join(',');
    }
    for (var i = 0; i < params.length; i++) {
        var ch = $("#" + params[i]).is(':checkbox');
        var ra = $("#" + params[i]).is(':radio');
        if (ch)    action += "&" + params[i] + "=" + $("#" + params[i]).is(':checked');
        else if (ra)    action += "&" + params[i] + "=" + $("#" + params[i]).is(':checked');
        else action += "&" + params[i] + "=" + $("#" + params[i]).val();
    }
    $.post("content/" + action, {}, function (data) {
        loader.hide();
        if (data.result == 0)    BootstrapDialog.alert(data.error);
        else {
            if (callbackurl.indexOf('script:') >= 0) {
                eval(callbackurl.substring(7));
            }
            if (callbackurl != '') {
                $.post(callbackurl, {}, function (data) {
                    $("#" + callbackdata).html(data);
                });
            }
            $("#" + id).modal('hide');
            $("#" + prefix + "callbackurl").remove();
            $("#" + prefix + "callbackdata").remove();
            $("#" + prefix + "action").remove();
            $("#" + prefix + "controls").remove();
            //BootstrapDialog.info("ოპერაცია წარმატებით შესრულდა");
        }
    }, "json");

}

function savedata1(id, param) {
    loader.show();
    var callbackurl = $("#callbackurl").val();
    var callbackdata = $("#callbackdata").val();
    var action = $("#action").val();
    var params;
    var maindiv = $("#maindiv").val();

    if (maindiv == '') {
        params = $("#controls").val().split(",");
    } else {
        params = $('#' + maindiv + ' [id]').map(function () {
            return this.id;
        }).get();
        //params = ids.join(',');
    }
    for (var i = 0; i < params.length; i++) {
        var ch = $("#" + params[i]).is(':checkbox');
        var ra = $("#" + params[i]).is(':radio');
        if (ch)    action += "&" + params[i] + "=" + $("#" + params[i]).is(':checked');
        else if (ra)    action += "&" + params[i] + "=" + $("#" + params[i]).is(':checked');
        else action += "&" + params[i] + "=" + $("#" + params[i]).val();
    }
    if (param.length > 0) action += "&" + param;
    $.post("content/" + action, {}, function (data) {
        loader.hide();
        if (data.result == 0)    BootstrapDialog.alert(data.error);
        else {
            if (callbackurl != '') {
                $.post(callbackurl, {}, function (data) {
                    $("#" + callbackdata).html(data);
                });
            }
            $("#" + id).modal('hide');
            $("#callbackurl").remove();
            $("#callbackdata").remove();
            $("#action").remove();
            $("#controls").remove();
            //BootstrapDialog.info("ოპერაცია წარმატებით შესრულდა");
            removeModal();
        }
    }, "json");

}

function infopage(fname, title, qr) {
    $.post("content/" + fname + ".jsp?" + qr, {}, function (data) {
        $("#ismheader").html(title);
        $("#ismbody").html(data);
        $('#infomodal').modal({backdrop: 'static', keyboard: true});
    });
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
        changeContextMenu(status,hasroom,samedate,$contextMenu);
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

function newWindow(fname, title) {
    loader.show();
    loadModalDefs();
    $.post("content/" + fname + ".jsp", {}, function (data) {
        $("#mheader").html(title);
        $("#mbody").html(data);
        $('#myModal').modal({
            backdrop: 'static',
            keyboard: true
        });
        loader.hide();
    });
}

function extramodal0(fname, title) {
    $.post("content/" + fname + ".jsp", {}, function (data) {
        $("#extramodal0header").html(title);
        $("#extramodal0body").html(data);
        $('#extramodal0').modal({backdrop: 'static', keyboard: true});
    });
}

function extramodal00(fname, title, qr) {
    registerModalFunctions();
    $.post("content/" + fname + ".jsp?" + qr, {}, function (data) {
        $("#extramodal0header").html(title);
        $("#extramodal0body").html(data);
        $('#extramodal0').modal({backdrop: 'static', keyboard: true});
    });
}

function newWindow1(fname, title, qr) {
    loadModalDefs();
    registerModalFunctions();
    $.post("content/" + fname + ".jsp?" + qr, {}, function (data) {
        $("#mheader").html(title);
        $("#mbody").html(data);
        $('#myModal').modal({backdrop: 'static', keyboard: true});
        try {
            getBody("stayviewleft", "stayview", 'დატვირთულობა', 'res1', '', true);
        } catch (e) {
        }
    });
}

function newsWindow(fname, title) {
    loadModalDefs();
    registerModalFunctions();
    $.post("content/" + fname + ".jsp", {}, function (data) {
        $("#smheader").html(title);
        $("#smbody").html(data);
        $('#smallmodal').modal({backdrop: 'static', keyboard: true});
    });
}

function newsWindow1(fname, title, qr) {
    loadModalDefs();
    registerModalFunctions();
    $.post("content/" + fname + ".jsp?" + qr, {}, function (data) {
        $("#smheader").html(title);
        $("#smbody").html(data);
        $('#smallmodal').modal({backdrop: 'static', keyboard: true});
    });
}

function modalWindow(fname, title, qr, callback, callbackparam) {
    loadModalDefs();
    $.post("content/" + fname + ".jsp?" + qr, {}, function (data) {
        callback(callbackparam);
        BootstrapDialog.alert(data.trim()); 
    });
}

function newmWindow(fname, title) {
    loadModalDefs();
    registerModalFunctions();
    $.post("content/" + fname + ".jsp", {}, function (data) {
        $("#mdheader").html(title);
        $("#mdbody").html(data);
        $('#mediummodal').modal({backdrop: 'static', keyboard: true});
    });
}

function newmWindow1(fname, title, qr) {
    loader.show();
    loadModalDefs();
    registerModalFunctions();
    $.post("content/" + fname + ".jsp?" + qr, {}, function (data) {
        $("#mdheader").html(title);
        $("#mdbody").html(data);
        $('#mediummodal').modal({backdrop: 'static', keyboard: true});
        loader.hide();
    });
}

function getBody(fname) {
    loader.show();
    $.ajax({
        type: "POST",
        url: "content/" + fname + ".jsp",
        data: {},
        success: function (data) {
            $('#centercontent').html(data);
            loader.hide();
        },
        error: function () {
            loader.hide();
        },
        async: false
    });
}

function getLBody(fname) {
    $.ajax({
        type: "POST",
        url: "content/" + fname + ".jsp",
        data: {},
        success: function (data) {
            $('#leftcontent').html(data);
        },
        async: false
    });
}

function search(){
    var frm = $("#filterbyfrm").serialize();
    var params = encodeURIComponent(frm);
    getBody('stayviewleft', 'trsearch', 'ტრანზაქციების ძიება', 'res1', '?' + params,true);

}

function getBody(fname1, fname2, name, id, param, isFirst) {
    loader.show();
    $.ajax({
        type: "POST",
        url: "content/" + fname1 + ".jsp",
        data: {},
        success: function (data) {
            $('#leftcontent').html(data);
            loader.hide();
        },
        error: function () {
            loader.hide();
        },
        async: false
    });
    /*removeTab(id);*/
    var reqParam = "";
    if (!isNullOrEmpty(param)) {
        reqParam = param;
    }
    addTab("content/" + fname2 + ".jsp" + reqParam, name, id, isFirst);
}

function removeTab(id) {
    $("#" + id).remove();
    if ($('.nav-tabs li').size() == 0) {
        //loadMainBody();
    }
}

function removeAllTabs() {
    $('.nav-tabs li').remove();
}


function addTab(fname2, name, itemId, isFirst) {

    //Davit aq araferi ar shecvalo gtxov :D:D:D:D

    $('.nav-tabs').css('float', null);

    var tabItems = $("#tabs li");

    if (tabItems.size() > 1 && !isFirst) {
        BootstrapDialog.alert("გთხოვთ დაასრულეთ წინამდებარე ტრანზაცია")
        return false;
    }

    fname2 = fname2.replace(".jsp.jsp", ".jsp");

    var tabname = "/content/" + fname2 + ".jsp";
    tabname = tabname.replace(".jsp.jsp", ".jsp").replace("content/content/", "hms/content/");

    var id = "#tabs-" + makeid(name);
    if (!isFirst) {
        var lastLi = tabItems.last();
        if (lastLi && lastLi.length > 0) {
            $('<li><a href="' + id + '" data-toggle="tab" style="padding-top: 4px; background-color: #F5F5F5;" title="' + name + '">' + name + '</a></li>').insertAfter(lastLi);
        } else {
            $("#tabs ul").append('<li><a href="' + id + '" data-toggle="tab" style="padding-top: 4px; background-color: #F5F5F5;" title="' + name + '">' + name + '</a></li>');
        }
        var lastDiv = $("#centerTabContent .tab-pane").last();
        if (lastDiv && lastDiv.length > 0) {
            $('<div class="tab-pane" id="' + id.replace("#", "") + '"></div>').insertAfter(lastDiv);
        } else {
            $("#centerTabContent").append('<div class="tab-pane" id="' + id.replace('#', '') + '"></div>');
        }
    } else {

        var firstLi = $("#tabs ul li")[0];
        if (firstLi) {
            $("#tabs ul li").first().html('<a href="' + id + '" data-toggle="tab" style="padding-top: 4px; background-color: #F5F5F5;" title="' + name + '">' + name + '</a>');
            $('#tabs').tabulous();
            $("#centerTabContent").children().first().attr('id', id.replace('#', ''));

            $("#tabs li").first().find('a').click();
            $.get(fname2, function (data) {
                $(id).html(data);
                reloadMenu();
                $(id).css('display', 'block', '!important');
                loader.hide();

            });
            reloadMenu();
            return;
        } else {
            $("#tabs ul").first().html('<li><a href="' + id + '" data-toggle="tab" style="padding-top: 4px; background-color: #F5F5F5;" title="' + name + '">' + name + '</a></li>');
            $("#centerTabContent").html('<div class="tab-pane" id="' + id.replace('#', '') + '"></div>');
        }

    }

    $('#tabs').tabulous();

    $("#tabs li a").each(function (index, obj) {
        if (index != 0) {
            var html = $(this).html();
            var closeBtn = $(this).find('.closeTab');
            if (closeBtn && closeBtn.size() > 0) {

            } else {
                html += '<button class="close closeTab" contentid="' + id + '" type="button" >×</button>';
                $(this).html(html);
            }
        }
    });

    $("#tabs li").last().find('a').click();
    loader.show();

    $.get(fname2, function (data) {
        $(id).html(data);
        reloadMenu();
        loader.hide();
    });
    reloadMenu();
    registerCloseEvent();
    loader.hide();
}

function reloadMenu() {
    $('.nav li').css("float", null);
    $('.nav li').css("float", "left");
}

function loadStats(page,heading){
    loader.show();
    $.ajax({
        type: "POST",
        //url: "content/reports/heading" + heading + "/" + page + ".jsp",
        url: "content/reports/getreport.jsp?reportid=" + page,
        data: {},
        success: function (data) {
            $($("#centerTabContent").children()[0]).html(data);
            loader.hide();
        },
        error: function () {
            loader.hide();
        },
        async: false
    });
}

/*
 function addTab(fname2, name, id) {
 fname2 = fname2.replace(".jsp.jsp", ".jsp");
 var tabname = "/content/" + fname2 + ".jsp";
 tabname = tabname.replace(".jsp.jsp", ".jsp").replace("content/content/", "hms/content/");

 if (tabcount == 0)
 $('#maintabs').append('<li style=""><a src=' + tabname + ' href="#' + id + '" data-toggle="tab" style="padding-top: 4px; background-color: #F5F5F5;">' + name + '</a></li>');
 else
 $('#maintabs').append('<li style=""><a src=' + tabname + ' href="#' + id + '" data-toggle="tab" style="padding-top: 3px; background-color: #F5F5F5;"><button class="close closeTab" type="button" >×</button>' + name + '</a></li>');

 $('#centerTabContent').append('<div class="tab-pane" id="' + id + '"></div>');
 loader.show();
 //console.log(fname2);
 $.get(fname2, function (data) {
 //console.log("#" + id);
 $("#" + id).html(data);
 loader.hide();
 });
 $(this).tab('show');
 showTab(id);
 registerCloseEvent();
 tabcount++;
 loader.hide();
 }*/

function registerCloseEvent() {
    $(".closeTab").click(function () {
        var li = $(this).parent().parent();
        var id = $(this).attr("contentid");
        var prev = li.prev();
        li.remove();
        $(id).remove();
        prev.find('a').click();
    });
}

function showTab(tabId) {
    $('#maintabs a[href="#' + tabId + '"]').tab('show');
}

function showButtons(btn, st, html) {
    if (st) {
        $("#" + btn).remove();
        var r = $(html);
        $("#myModalFooter").append(r);
    } else $("#" + btn).remove();
}

function makeid() {
    var text = "";
    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    for (var i = 0; i < 10; i++)
        text += possible.charAt(Math.floor(Math.random() * possible.length));
    return text;
}

function updateWalkinStayInfo(t) {
    var startdate = moment($("#guestinfo_arrivaldate").val() + " " + $("#guestinfo_arrivaltime").val(), dateglobalformat + " HH:mm");
    var enddate = moment($("#guestinfo_departuredate").val() + " " + $("#guestinfo_departuretime").val(), dateglobalformat + " HH:mm");
    var startdate1 = moment($("#guestinfo_arrivaldate").val(), dateglobalformat);
    var nights = $("#guestinfo_night").val();
    if (isNaN(nights) || nights == '') {
        nights = 1;
        $("#guestinfo_night").val(nights);
    }
    if (t == 1) {
        if (startdate.get('date') == moment.unix(lclosedate).get('date') && startdate.get('month') == moment.unix(lclosedate).get('month') && startdate.get('year') == moment.unix(lclosedate).get('year')) {
            $("#guestinfo_arrivaltime").val(moment.unix(lclosedate).format('HH:mm'));
            showButtons("myModalCheckin", true, '<button type="button" class="btn btn-danger" id="myModalCheckin" onclick="savedata1(\'myModal\',\'checkin=true\')">მიღება</button>');
        } else {
            $("#guestinfo_arrivaltime").val(globalpars.Checkintime);
            showButtons("myModalCheckin", false, '');
        }
        startdate = moment($("#guestinfo_arrivaldate").val() + " " + $("#guestinfo_arrivaltime").val(), dateglobalformat + " HH:mm");
        enddate = startdate.add(nights, 'days');

        $('#guestinfo_departuredate').off('changeDate');
        $("#guestinfo_departuredate").val(enddate.format(dateglobalformat));
        $('#guestinfo_departuredate').datepicker('setStartDate', startdate1.clone().toDate());
        $('#guestinfo_departuredate').on('changeDate', function (e) {
            updateWalkinStayInfo(2);
        });
        //$("#guestinfo_departuredate").datepicker('remove');
        //$('#guestinfo_departuredate').datepicker({format: dateglobalformat1, weekStart: 1, startDate: startdate1.clone().toDate(), autoclose: true, language: 'ka', todayHighlight: true, allowEmpty: false}).on('changeDate', function(e){updateWalkinStayInfo(2);});
        if (globalpars.Hours24)  $("#guestinfo_departuretime").val($("#guestinfo_arrivaltime").val());
        else                    $("#guestinfo_departuretime").val(globalpars.Checkouttime);
    } else if (t == 2) {
        if (startdate.get('date') == enddate.get('date') && startdate.get('month') == enddate.get('month') && startdate.get('year') == enddate.get('year')) {
            $("#guestinfo_departuretime").val('23:59');
            nights = 0;
        } else {
            if (globalpars.Hours24)  $("#guestinfo_departuretime").val($("#guestinfo_arrivaltime").val());
            else                    $("#guestinfo_departuretime").val(globalpars.Checkouttime);
            nights = enddate.diff(startdate, 'days');
            if (!globalpars.Hours24) nights++;
        }
        $("#guestinfo_night").val(nights);
    } else if (t == 3) {
        enddate = startdate.add(nights, 'days');
        $("#guestinfo_departuredate").val(enddate.format(dateglobalformat));
    }
}

function walkinNameSearch(id, cid) {
    var type = $("#" + id).get(0).tagName;
    var term = "";
    if (type == 'INPUT') term = $("#" + id).val();
    if (type == 'SELECT' && $("#" + id).val() > 0) term = $('#' + id).find(":selected").text();
    //if(term.length == 0)    BootstrapDialog.alert("შეიყვანეთ საძებნი სიტყვა");
    //else {
    extramodal00("contactSearch", "კონტაქტის ძებნა", "id=" + id + "&term=" + term + "&cid=" + cid);
    //}
}

function editNameSearch(id, cid, prefix) {
    var type = $("#" + id).get(0).tagName;
    var term = "";
    if (type == 'INPUT') term = $("#" + id).val();
    if (type == 'SELECT' && $("#" + id).val() > 0) term = $('#' + id).find(":selected").text();
    //if(term.length == 0)    BootstrapDialog.alert("შეიყვანეთ საძებნი სიტყვა");
    //else {
    extramodal00("contactSearch", "კონტაქტის ძებნა", "id=" + id + "&term=" + term + "&cid=" + cid + "&prefix=" + prefix);
    //}
}

function isNullOrEmpty(value) {
    if (value === 'NULL' || value === '' || value === null || typeof value === 'undefined') {
        return true;
    }
    return false;
}

function urlencode(str) {
    return str.replace(' ', '!!!');
}

String.prototype.replaceAll = function(str1, str2, ignore)
{
    return this.replace(new RegExp(str1.replace(/([\/\,\!\\\^\$\{\}\[\]\(\)\.\*\+\?\|\<\>\-\&])/g,"\\$&"),(ignore?"gi":"g")),(typeof(str2)=="string")?str2.replace(/\$/g,"$$$$"):str2);
}

var hmsDaysMin = ["კვი", "ორშ", "სამ", "ოთხ", "ხუთ", "პარ", "შაბ", "კვი"];
var hmsMonthsMin = ["იან", "თებ", "მარ", "აპრ", "მაი", "ივნ", "ივლ", "აგვ", "სექ", "ოქტ", "ნოე", "დეკ"];

function initializeGrid(grid) {
    //console.log("initializing grid named > " + grid.id);

    var gridHeight = $("#centercontent").height() - 40 - $(".first-table").height();
    if ($("#centercontent").height() <= gridHeight) {
        gridHeight -= 300;
    }
    griddata = null;
    jQuery("#" + grid.id).jqGrid(
        {
            url: grid.url,
            datatype: grid.type,
            colNames: grid.cols,
            colModel: grid.model,
            gridComplete: grid.gridComplete,
            beforeRequest: grid.beforeRequest,
            rowNum: 2000,
            height: gridHeight,
            multiselect: grid.multiselect,
            multikey: "ctrlKey",
            altRows: grid.altRows,
            autowidth: true,
            sortname: grid.sort,
            //viewrecords: true,
            sortorder: grid.order,
            footerrow: grid.footerrow,
            userDataOnFooter: grid.userDataOnFooter,
            loadComplete: function (data) {
                griddata = $(data);
                $("#" + grid.id + " td:last-child").removeAttr("title");
                reInitializeGrid(grid.id, grid.isPopup);
                $(".ui-jqgrid-htable").css("background", "#FFF").css("border-bottom", "solid 1px #D1D1D1");
                $("#cb_" + grid.id).css("margin-top", "-3px");
            }
        }).jqGrid('bindKeys');

}

function drawFooter() {
    $(".ui-jqgrid-bdiv").height($(".ui-jqgrid-bdiv").height() - 50);
    var html = '<div class="gridfooter" >' +        '<div>' +
        '<span style="margin: 15px 10px 0 10px; float: left;">ჩანაწერების რაოდენობა გვერდზე</span>' +
        '<select id="limitselectbox" style="float: left; margin: 15px 10px 0 10px;">' +
        '<option value="5">5</option>' +
        '<option value="15">15</option>' +
        '<option value="25">25</option>' +
        '<option value="50">50</option>' +
        '</select>' +
        '<button type="button" class="btn btn-default" id="btnNext" style="font-weight: bold; float: right; margin: 9px 10px 0 0;">' +
        'შემდეგი</button>' +
        '<button type="button" class="btn btn-danger" id="btnPrev" style="font-weight: bold; float: right; margin: 9px 10px 0 0;">' +
        'წინა</button>' +
        '</div></div>';
    //$(".ui-jqgrid-view").find(".gridfooter").remove();
    var panel = $("#centercontent .panel")[0];
    var pwidth = $(panel).width();
    $(".gridfooter").remove();
    var panelheading = $(panel).find(".panel-heading")[0];
    $("#centerTabContent").css("height",$(panel).height()-panelheading);
    $("#centerTabContent").append(html);
    $(".gridfooter").css("width",pwidth+"px","!important");
}

function getSelectedRowIds(id) {
    var ids = "";
    $(jQuery("#" + id + " .jqgrow")).each(function (index, item) {
        var c = $(item).find('.cbox');
        if ($(c).prop('checked')) {
            ids += $(item).prop('id') + ",";
        }
    });
    return ids.substring(0, ids.trim().lastIndexOf(","));
}

function getArrayOfSelectedRowIds(id) {
    var ids = getSelectedRowIds(id);
    if(!isNullOrEmpty(ids)){
        return ids.split(',');
    }else{
        return null;
    }
}

function getRadioRowIds(id) {
    var ids = "";
    var idstodelete = "";
    $(jQuery("#" + id + " .jqgrow")).each(function (index, item) {
        var c = $(item).find('.consguest');
        if ($(c).prop('checked')) {
            ids += $(item).prop('id') + ",";
        } else {
            idstodelete += $(item).prop('id') + ",";
        }
    });
    return idstodelete.substring(0, idstodelete.trim().lastIndexOf(","));
}

function initializeGridNa(grid) {
    //console.log("initializing grid named > " + grid.id);

    var gridHeight = $("#centerTabContent").height() - 40 - $(".first-table").height();
    if ($("#centercontent").height() <= gridHeight) {
        gridHeight -= 300;
    }
    jQuery("#" + grid.id).jqGrid(
        {
            url: grid.url,
            datatype: grid.type,
            colNames: grid.cols,
            colModel: grid.model,
            gridComplete: grid.gridComplete,
            beforeRequest: grid.beforeRequest,
            rowNum: 2000,
            height: 360,
            autowidth: true,
            sortname: grid.sort,
            //viewrecords: true,
            sortorder: grid.order,
            loadComplete: function () {
                $("#" + grid.id + " td:last-child").removeAttr("title");
                reInitializeGrid(grid.id, grid.isPopup);
                $(".ui-jqgrid-htable").css("background", "#FFF").css("border-bottom", "solid 1px #D1D1D1");

            }
        }).jqGrid('bindKeys');

}

function ReDrawTable(grid) {
    for (var i = 0; i < grid.model.length; i++) {
        $("#" + grid.id + "_" + grid.model[i].name).css("text-align", grid.model[i].align).css("width", grid.model[i].width);
        $("[aria-describedby=" + grid.id + "_" + grid.model[i].name + "]").width(grid.model[i].width);
    }
    $(".ui-jqgrid .ui-jqgrid-htable th").css({"height": "22px"}, {"padding": "0 2px 0 6px"});
    $("#" + grid.id + " td").css("padding-top", "0", "!important");
    $("#grid-table .ui-jqgrid-hbox").css("border-left", "solid 4px transparent")
        .css("border-right", "solid 4px transparent");
    $("#" + grid.id).css("border-left", "solid 4px transparent")
        .css("border-right", "solid 4px transparent");
}

function reInitializeGrid(gridId, isPopup) {
    if (!isPopup) {
        //console.log("Loading params for desktop grid named > " + gridId);
        var ftWidth = $("#filter-form").width();
        $(".first-table").css("width", ftWidth, "!important");
        $("#grid-table .ui-jqgrid-bdiv").css("width", ftWidth, "!important");
        $("#grid-table #gview_" + gridId).css("width", ftWidth, "!important");
        $("#grid-table  #gbox_" + gridId).css("width", ftWidth, "!important");
        $("#grid-table  .ui-jqgrid-bdiv").css("width", ftWidth, "!important");
        $("#grid-table .ui-jqgrid-hdiv").css("width", ftWidth, "!important");
        $("#grid-table .ui-jqgrid-htable").css("width", ftWidth, "!important");
        $("#grid-table #" + gridId).css("width", ftWidth, "!important");
        //console.log("Load completed for desktop grid named > " + gridId);
    } else {
        //console.log("Loading params for popup grid named > " + gridId);
        var ftWidth = 953;
        $("#rootwizard-table .ui-jqgrid-bdiv").css("width", ftWidth, "!important");
        $("#rootwizard-table #gview_" + gridId).css("width", ftWidth, "!important");
        $("#rootwizard-table #gbox_" + gridId).css("width", ftWidth, "!important");
        $("#rootwizard-table #gbox_" + gridId).css("margin-top", "15px", "!important");
        $("#rootwizard-table .ui-jqgrid-bdiv").css("width", ftWidth, "!important");
        $("#rootwizard-table .ui-jqgrid-hdiv").css("width", ftWidth, "!important");
        $("#rootwizard-table .ui-jqgrid-htable").css("width", ftWidth, "!important");
        $("#rootwizard-table #" + gridId).css("width", ftWidth, "!important");
        $("#rootwizard-table").find('.panel-heading').each(function () {
            $(this).css({
                'position': 'absolute',
                'top': '10px',
                'width': '953px'
            });
        });
        $("#rootwizard-table #" + gridId).prev().css({
            'position': 'absolute',
            'top': '10px',
            'width': '953px'
        });

        $('#rootwizard-table .ui-jqgrid tr.jqgrow td').css({
            'height': '20px',
            'line-height': '19px',
            'white-space': 'normal'
        });
        //console.log("Load completed for popup grid named > " + gridId);
    }
    $(".ui-jqgrid-bdiv").css("overflow-x", "hidden", "!important");
}

function reloadGrid(gridId, pgUrl, isPopup) {
    //console.log(pgUrl);
    jQuery("#" + gridId).jqGrid().setGridParam({
        url: pgUrl,
        loadComplete: function () {
            reInitializeGrid(gridId, isPopup);
        }
    }).trigger("reloadGrid");

}

function checkIfScrollBarExist(divId) {
    var val = $('#' + divId).hasScrollBar();
    //console.log(val);
    return true;
}

(function ($) {
    $.fn.hasScrollBar = function () {
        return this.get(0).scrollHeight > this.height();
    }
})(jQuery);

function strReplace(str,replaceWhat,replaceTo){
    replaceWhat = replaceWhat.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&');
    var re = new RegExp(replaceWhat, 'g');
    return str.replace(re,replaceTo);
}

function colModelGenerator(width, colName, alligment) {
    var pos = "left";
    switch (alligment) {
        case 1:
            pos = "center";
            break;
        case 2:
            pos = "right";
            break;
    }
    return {width: width, hidden: false, name: colName, index: colName, align: pos};
}

// Numeric only control handler
jQuery.fn.ForceNumericOnly =
    function () {
        return this.each(function () {
            $(this).keydown(function (e) {
                var key = e.charCode || e.keyCode || 0;
                // allow backspace, tab, delete, enter, arrows, numbers and keypad numbers ONLY
                // home, end, period, and numpad decimal
                return (
                key == 8 ||
                key == 9 ||
                key == 13 ||
                key == 46 ||
                key == 110 ||
                key == 190 ||
                (key >= 35 && key <= 40) ||
                (key >= 48 && key <= 57) ||
                (key >= 96 && key <= 105)
                );
            });
        });
    };
function isValidEmailAddress(emailAddress) {
    var pattern = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
    return pattern.test(emailAddress);
};

function newWindowWithParams(fname, title, params) {
    loader.show();
    loadModalDefs();
    registerModalFunctions();
    $.post("content/" + fname + ".jsp" + params, {}, function (data) {
        $("#mheader").html(title);
        $("#mbody").html(data);
        $('#myModal').modal({backdrop: 'static', keyboard: true});
        loader.hide();
    });
}

function removeModal() {
    //$(".modal-body").html('');
    //$('.modal-dialog').hide();
}

function loadModalDefs() {
    $('.modal-dialog,#myModalFooter').removeAttr('style');
    //$("#maindiv").remove();
}

function checkOut(rid, reloadid) {
    $.post("content/checkout.jsp", {rid: rid}, function (data) {
        if (data.result == 0)    BootstrapDialog.alert(data.error);
        else {
            reloadGrid(reloadid);
            BootstrapDialog.info("ოპერაცია წარმატებით შესრულდა");
        }
    }, "json");
}

function checkOut1(rid, reloadid) {
    $.post("content/amendstay.jsp", {rid: rid}, function (data) {
        if (data.result == 0)    BootstrapDialog.alert(data.error);
        else {
            reloadGrid(reloadid);
            BootstrapDialog.info("ოპერაცია წარმატებით შესრულდა");
        }
    }, "json");
}

function checkIn(rid, reloadid) {
    $.post("content/checkin.jsp?"+rid, {}, function (data) {
        if (data.result == 0)    BootstrapDialog.alert(data.error);
        else {
            reloadGrid(reloadid);
            BootstrapDialog.info("ოპერაცია წარმატებით შესრულდა");
        }
    }, "json");
}

function showHideFooter(){
    if($(".gridfooter").length > 0){
        if($(".gridfooter").is(':visible')){
            $(".gridfooter").hide();
        }else{
            $(".gridfooter").show();
        }
    }
}

function toggleFullScreen() {
    if ((document.fullScreenElement && document.fullScreenElement !== null) ||
        (!document.mozFullScreen && !document.webkitIsFullScreen)) {
        if (document.documentElement.requestFullScreen) {
            document.documentElement.requestFullScreen();
        } else if (document.documentElement.mozRequestFullScreen) {
            document.documentElement.mozRequestFullScreen();
        } else if (document.documentElement.webkitRequestFullScreen) {
            document.documentElement.webkitRequestFullScreen(Element.ALLOW_KEYBOARD_INPUT);
        }
    } else {
        if (document.cancelFullScreen) {
            document.cancelFullScreen();
        } else if (document.mozCancelFullScreen) {
            document.mozCancelFullScreen();
        } else if (document.webkitCancelFullScreen) {
            document.webkitCancelFullScreen();
        }
    }
}
