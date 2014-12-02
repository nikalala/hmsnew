var today = new Date();
var tomorrow = new Date();
tomorrow.setDate(tomorrow.getDate() + 1);

var tabcount = 0;
$(document).ready(function () {

    loader = $(".loading-panel");

});

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
                    typeof dialog.getData('callback') === 'function' && dialog.getData('callback')(false);
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

$.fn.serializeObject = function(form){
    var o = {};
    var a = form.serializeArray();
    $.each(a, function() {
        if (o[this.name]) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    console.log(o);
    return o;
};

function savedata(id) {


    var callbackurl = $("#callbackurl").val();
    var callbackdata = $("#callbackdata").val();
    var action = $("#action").val();
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
            //BootstrapDialog.info("ოპერაცია წარმატებით შესრულდა");
        }
    }, "json");

}

function savedataprefix(id, prefix) {
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
        }
    }, "json");

}

function infopage(fname, title, qr) {
    $.post("content/" + fname + ".jsp?" + qr, {}, function (data) {
        $("#ismheader").html(title);
        $("#ismbody").html(data);
        $('#infomodal').modal();
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
        newWindow(cm.attr('id'), cm.text(), "reservationid=" + id);
}

$(function () {
    var $contextMenu = $("#contextMenu");
    var choosedid = 0;

    $("body").on("contextmenu click", "#roomlist tr, .sch-event", function (e) {
        choosedid = $(this).attr('id');
        if (choosedid.indexOf("schedulergrid") == 0) {
            var nms = choosedid.split("-");
            choosedid = nms[3];
        }
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
    $.post("content/" + fname + ".jsp", {}, function (data) {
        $("#mheader").html(title);
        $("#mbody").html(data);
        $('#myModal').modal();
        loader.hide();
    });
}

function extramodal0(fname, title) {
    $.post("content/" + fname + ".jsp", {}, function (data) {
        $("#extramodal0header").html(title);
        $("#extramodal0body").html(data);
        $('#extramodal0').modal();
    });
}

function extramodal0(fname, title, qr) {
    $.post("content/" + fname + ".jsp?" + qr, {}, function (data) {
        $("#extramodal0header").html(title);
        $("#extramodal0body").html(data);
        $('#extramodal0').modal();
    });
}

function newWindow1(fname, title, qr) {
    $.post("content/" + fname + ".jsp?" + qr, {}, function (data) {
        $("#mheader").html(title);
        $("#mbody").html(data);
        $('#myModal').modal();
    });
}

function newsWindow(fname, title) {
    $.post("content/" + fname + ".jsp", {}, function (data) {
        $("#smheader").html(title);
        $("#smbody").html(data);
        $('#smallmodal').modal();
    });
}

function newsWindow1(fname, title, qr) {
    $.post("content/" + fname + ".jsp?" + qr, {}, function (data) {
        $("#smheader").html(title);
        $("#smbody").html(data);
        $('#smallmodal').modal();
    });
}

function newmWindow(fname, title) {
    $.post("content/" + fname + ".jsp", {}, function (data) {
        $("#mdheader").html(title);
        $("#mdbody").html(data);
        $('#mediummodal').modal();
    });
}

function newmWindow1(fname, title, qr) {
    loader.show();
    $.post("content/" + fname + ".jsp?" + qr, {}, function (data) {
        $("#mdheader").html(title);
        $("#mdbody").html(data);
        $('#mediummodal').modal();
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

function checkTabs(pageName) {
    if ($('.nav-tabs li').size() > 0) {
        console.log($('.nav-tabs li'));
    }
    if (pageName !== "stayview") {
        console.log("opening tab > " + pageName);
    }
}

function getBody(fname1, fname2, name, id, param) {

    checkTabs(fname2);

    loader.show();
    console.log("started method getBody");
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
    removeTab(id);
    var reqParam = "";
    if (!isNullOrEmpty(param)) {
        reqParam = param;
    }
    console.log(reqParam);

    addTab("content/" + fname2 + ".jsp" + reqParam, name, id);
}

function removeTab(id) {
    $("#" + id).remove();
    if ($('.nav-tabs li').size() == 0) {
        //loadMainBody();
    }
}

function removeAllTabs() {
    /*$('.tab-pane ul li').remove();*/
    $('.nav-tabs li').remove();
}

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
    console.log(fname2);
    $.get(fname2, function (data) {
        console.log("#" + id);
        $("#" + id).html(data);
        loader.hide();
    });
    $(this).tab('show');
    showTab(id);
    registerCloseEvent();
    tabcount++;
    loader.hide();
}

function registerCloseEvent() {
    $(".closeTab").click(function () {
        var tabContentId = $(this).parent().attr("href");
        $(this).parent().parent().remove();
        $('#maintabs a:last').tab('show');
        $(tabContentId).remove();
        tabcount--;
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
    extramodal0("contactSearch", "კონტაქტის ძებნა", "id=" + id + "&term=" + term + "&cid=" + cid);
    //}
}

function editNameSearch(id, cid, prefix) {
    var type = $("#" + id).get(0).tagName;
    var term = "";
    if (type == 'INPUT') term = $("#" + id).val();
    if (type == 'SELECT' && $("#" + id).val() > 0) term = $('#' + id).find(":selected").text();
    //if(term.length == 0)    BootstrapDialog.alert("შეიყვანეთ საძებნი სიტყვა");
    //else {
    extramodal0("contactSearch", "კონტაქტის ძებნა", "id=" + id + "&term=" + term + "&cid=" + cid + "&prefix=" + prefix);
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

var hmsDaysMin = ["კვი", "ორშ", "სამ", "ოთხ", "ხუთ", "პარ", "შაბ", "კვი"];
var hmsMonthsMin = ["იან", "თებ", "მარ", "აპრ", "მაი", "ივნ", "ივლ", "აგვ", "სექ", "ოქტ", "ნოე", "დეკ"];

function initializeGrid(grid) {
    console.log("initializing grid named > " + grid.id);
    jQuery("#" + grid.id).jqGrid(
        {
            url: grid.url,
            datatype: grid.type,
            colNames: grid.cols,
            colModel: grid.model,
            gridComplete: grid.gridComplete,
            beforeRequest: grid.beforeRequest,
            rowNum: 2000,
            height: 400,
            autowidth: true,
            sortname: grid.sort,
            viewrecords: true,
            sortorder: grid.order,
            loadComplete: function () {
                $("#" + grid.id + " td:last-child").removeAttr("title");
                reInitializeGrid(grid.id, grid.isPopup);
                $(".ui-jqgrid-htable").css("background", "#FFF").css("border-bottom", "solid 1px #D1D1D1");
                console.log("initializing grid named > " + grid.id + " is completed successfully");
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
}

function reInitializeGrid(gridId, isPopup) {
    if (!isPopup) {
        console.log("Loading params for desktop grid named > " + gridId);
        var ftWidth = $("#filter-form").width();
        $(".first-table").css("width", ftWidth, "!important");
        $("#grid-table .ui-jqgrid-bdiv").css("width", ftWidth, "!important");
        $("#grid-table #gview_" + gridId).css("width", ftWidth, "!important");
        $("#grid-table  #gbox_" + gridId).css("width", ftWidth, "!important");
        $("#grid-table  .ui-jqgrid-bdiv").css("width", ftWidth, "!important");
        $("#grid-table .ui-jqgrid-hdiv").css("width", ftWidth, "!important");
        $("#grid-table .ui-jqgrid-htable").css("width", ftWidth, "!important");
        $("#grid-table #" + gridId).css("width", ftWidth, "!important");
        console.log("Load completed for desktop grid named > " + gridId);
    } else {
        console.log("Loading params for popup grid named > " + gridId);
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
        console.log("Load completed for popup grid named > " + gridId);
    }
    $(".ui-jqgrid-bdiv").css("overflow-x","hidden","!important");
}

function reloadGrid(gridId, pgUrl, isPopup) {
    console.log(pgUrl);
    jQuery("#" + gridId).jqGrid().setGridParam({
        url: pgUrl,
        loadComplete: function () {
            reInitializeGrid(gridId, isPopup);
        }
    }).trigger("reloadGrid");

}

function checkIfScrollBarExist(divId) {
    var val = $('#' + divId).hasScrollBar();
    console.log(val);
    return true;
}

(function ($) {
    $.fn.hasScrollBar = function () {
        return this.get(0).scrollHeight > this.height();
    }
})(jQuery);

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
    function()
    {
        return this.each(function()
        {
            $(this).keydown(function(e)
            {
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