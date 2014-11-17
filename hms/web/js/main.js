

var today = new Date();
var tomorrow = new Date();
tomorrow.setDate(tomorrow.getDate() + 1);

var tabcount = 0;
$(document).ready(function () {

    loader = $(".loading-panel");

});

function loadMainBody()
{
    getBody("stayviewleft","stayview",'დატვირთულობა','res1');
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
    $.post("content/" + action, {

    }, function (data) {
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
    $.post("content/" + action, {

    }, function (data) {
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
    $.post("content/" + action, {

    }, function (data) {
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
    $.post("content/" + fname + ".jsp?" + qr, {

    }, function (data) {
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

    $("body").on("click",function () {
        $contextMenu.hide();
    }).keyup(function (e) {
            if (e.keyCode == 27)
                $contextMenu.hide();
        });
});

function newWindow(fname, title) {
    loader.show();
    $.post("content/" + fname + ".jsp", {

    }, function (data) {
        $("#mheader").html(title);
        $("#mbody").html(data);
        $('#myModal').modal();
        loader.hide();
    });
}

function extramodal0(fname, title) {
    $.post("content/" + fname + ".jsp", {

    }, function (data) {
        $("#extramodal0header").html(title);
        $("#extramodal0body").html(data);
        $('#extramodal0').modal();
    });
}

function extramodal0(fname, title, qr) {
    $.post("content/" + fname + ".jsp?" + qr, {

    }, function (data) {
        $("#extramodal0header").html(title);
        $("#extramodal0body").html(data);
        $('#extramodal0').modal();
    });
}

function newWindow1(fname, title, qr) {
    $.post("content/" + fname + ".jsp?" + qr, {

    }, function (data) {
        $("#mheader").html(title);
        $("#mbody").html(data);
        $('#myModal').modal();
    });
}

function newsWindow(fname, title) {
    $.post("content/" + fname + ".jsp", {

    }, function (data) {
        $("#smheader").html(title);
        $("#smbody").html(data);
        $('#smallmodal').modal();
    });
}

function newsWindow1(fname, title, qr) {
    $.post("content/" + fname + ".jsp?" + qr, {

    }, function (data) {
        $("#smheader").html(title);
        $("#smbody").html(data);
        $('#smallmodal').modal();
    });
}

function newmWindow(fname, title) {
    $.post("content/" + fname + ".jsp", {

    }, function (data) {
        $("#mdheader").html(title);
        $("#mdbody").html(data);
        $('#mediummodal').modal();
    });
}

function newmWindow1(fname, title, qr) {
    loader.show();
    $.post("content/" + fname + ".jsp?" + qr, {

    }, function (data) {
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
        data: { },
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
        data: { },
        success: function (data) {
            $('#leftcontent').html(data);
        },
        async: false
    });
}

function checkTabs(pageName){
    if($('.nav-tabs li').size() > 0)
    {
        console.log($('.nav-tabs li'));
    }
    if(pageName !== "stayview"){
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
        data: { },
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
    if(!isNullOrEmpty(param))
    {
        reqParam = param;
    }
    console.log(reqParam);

    addTab("content/" + fname2 + ".jsp"+reqParam, name, id);
}

function removeTab(id) {
    $("#" + id).remove();
    if($('.nav-tabs li').size() == 0)
    {
        //loadMainBody();
    }
}

function removeAllTabs() {
    /*$('.tab-pane ul li').remove();*/
    $('.nav-tabs li').remove();
}

function addTab(fname2, name, id) {
    fname2 = fname2.replace(".jsp.jsp",".jsp");
    var tabname = "/content/" + fname2 + ".jsp";
    tabname = tabname.replace(".jsp.jsp",".jsp").replace("content/content/","hms/content/");

    if (tabcount == 0)
        $('#maintabs').append('<li style=""><a src='+tabname+' href="#' + id + '" data-toggle="tab" style="padding-top: 4px; background-color: #F5F5F5;">' + name + '</a></li>');
    else
        $('#maintabs').append('<li style=""><a src='+tabname+' href="#' + id + '" data-toggle="tab" style="padding-top: 3px; background-color: #F5F5F5;"><button class="close closeTab" type="button" >×</button>' + name + '</a></li>');

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
        if (startdate.get('date') == moment().get('date') && startdate.get('month') == moment().get('month') && startdate.get('year') == moment().get('year')) {
            $("#guestinfo_arrivaltime").val(moment().format('HH:mm'));
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

function isNullOrEmpty(value)
{
    if(value === 'NULL' || value === '' || value === null || typeof value === 'undefined')
    {
        return true;
    }
    return false;
}

function urlencode(str) {
  return str.replace(' ', '!!!');
}

var hmsDaysMin = ["კვი", "ორშ", "სამ", "ოთხ", "ხუთ", "პარ", "შაბ", "კვი"];
var hmsMonthsMin = ["იან", "თებ", "მარ", "აპრ", "მაი", "ივნ", "ივლ", "აგვ", "სექ", "ოქტ", "ნოე", "დეკ"];

    function initializeGrid(grid)
    {
        $("#load_list_reservs").removeAttr("class");
        $("#load_list_reservs").html('');
        $("#load_list_reservs").addClass( 'loading-panel' );
        $("#load_list_reservs").css('display','block');
        jQuery("#"+grid.id).jqGrid(
            {
                url: grid.url,
                datatype: grid.type,
                colNames: grid.cols,
                colModel: grid.model,
                loadComplete: function(){
                    $("#" +grid.id+ " td:last-child").removeAttr("title");
                    reInitializeGrid(grid.id);
                    for(var i = 0; i < grid.model.length; i++)
                    {
                        $("#" + grid.id + "_" + grid.model[i].name).css("text-align", grid.model[i].align).css("width",grid.model[i].width);
                        console.log($("[aria-describedby="+grid.id+"_"+grid.model[i].name+"]"));
                        $("[aria-describedby="+grid.id+"_"+grid.model[i].name+"]").width(grid.model[i].width);
                    }
                    $(".ui-jqgrid .ui-jqgrid-htable th").css({"height":"22px"},{"padding":"0 2px 0 6px"});
                    $("#" + grid.id + " td").css("padding-top","0","!important");
                },
                rowNum: 2000,
                height: 400,
                autowidth: true,
                sortname: grid.sort,
                viewrecords: true,
                sortorder: grid.order
            }).jqGrid('bindKeys');
    }

    function reInitializeGrid(gridId)
    {
        var ftWidth = $("#filter-form").width();
        $(".first-table").width(ftWidth);
        $("#ui-jqgrid-bdiv").width(ftWidth);
        $("#gview_"+gridId).width(ftWidth);
        $("#gbox_"+gridId).width(ftWidth);

        $(".ui-jqgrid-bdiv").css("width",ftWidth,"!important");
        $(".ui-jqgrid-hdiv").css("width",ftWidth,"!important");
        $(".ui-jqgrid-htable").css("width",ftWidth,"!important");
        $("#"+gridId).width(ftWidth);
        //$("#"+gridId).css("margin-left","10px");
        //$(".jqgfirstrow").remove();
    }

    function reloadGrid(gridId,pgUrl)
    {
        console.log(pgUrl);
        jQuery("#"+gridId).jqGrid().setGridParam({
            url: pgUrl,
            loadComplete: function(){
                reInitializeGrid(gridId);
            }
        }).trigger("reloadGrid");

    }

    function checkIfScrollBarExist(divId)
    {
        var val = $('#'+divId).hasScrollBar();
        console.log(val);
        return true;
    }

    (function($) {
        $.fn.hasScrollBar = function() {
            return this.get(0).scrollHeight > this.height();
        }
    })(jQuery);

    function colModelGenerator(width,colName,alligment)
    {
       var pos = "left";
       switch(alligment)
       {
           case 1:
               pos = "center";
               break;
           case 2:
               pos = "right";
               break;
       }
       return {width: width, hidden: false, name: colName, index: colName, align: pos};
    }


