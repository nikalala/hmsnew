/* -------------------------------- Reservation List Model ------------------------------------*/
var resGridModel = [];
resGridModel.push(
    colModelGenerator(50, 'reservationroomid', 0),
    colModelGenerator(60, 'arraivaldate', 0),
    colModelGenerator(60, 'departuredate', 0),
    colModelGenerator(120, 'guest', 0),
    colModelGenerator(90, 'roomcode', 0),
    colModelGenerator(90, 'bsourcename', 0),
    colModelGenerator(85, 'companyname', 0),
    colModelGenerator(60, 'price', 0),
    colModelGenerator(80, 'paid', 0),
    colModelGenerator(110, 'user', 0),
    colModelGenerator(94, 'reservationtype', 0),
    colModelGenerator(40, 'action', 0));
resGrid = {
    id: 'list_reservs',
    url: 'content/getreservationlist.jsp',
    type: 'xml',
    cols: ['რეზ#', 'ჩამოსვლა', 'წასვლა', 'სტუმრის სახელი', 'ოთახი', 'წყარო',
        'კომპანია', 'ჯამი', 'დეპოზიტი', 'მომხმარებელი', 'რეზ.ტიპი', ''],
    model: resGridModel,
    sort: 'arraivaldate',
    order: 'asc',
    limit: 5,
    offset: 0,
    isPopup: false,
    page: 1,
    gridComplete: function () {
        ReDrawTable(resGrid);
        //Line below makes the height of the row to be 38 px!!!
        $("#grid-table .ui-widget-content").css("height", "38px");
        /*<div align="center" id="grid-footer" style="background: transparent; margin-left: -4px; width: 100%;height: 33px;line-height: 33px; position: absolute;bottom: 0;">*/

    },
    beforeRequest: function () {
    }
};
/* -------------------------------- Reservation List Model ------------------------------------*/



/* -------------------------------- Reservation List Model ------------------------------------*/
var depGridModel = [];
depGridModel.push(
    colModelGenerator(50, 'reservationroomid', 0),
    colModelGenerator(60, 'arraivaldate', 0),
    colModelGenerator(60, 'departuredate', 0),
    colModelGenerator(120, 'guest', 0),
    colModelGenerator(90, 'roomcode', 0),
    colModelGenerator(90, 'bsourcename', 0),
    colModelGenerator(85, 'companyname', 0),
    colModelGenerator(60, 'price', 0),
    colModelGenerator(80, 'paid', 0),
    colModelGenerator(110, 'user', 0),
    colModelGenerator(94, 'reservationtype', 0),
    colModelGenerator(40, 'action', 0));
depGrid = {
    id: 'list_reservs',
    url: 'content/getdeplist.jsp',
    type: 'xml',
    cols: ['რეზ#', 'ჩამოსვლა', 'წასვლა', 'სტუმრის სახელი', 'ოთახი', 'წყარო',
        'კომპანია', 'ჯამი', 'დეპოზიტი', 'მომხმარებელი', 'რეზ.ტიპი', ''],
    model: depGridModel,
    multiselect: true,
    multikey: "ctrlKey",
    altRows: true,
    altclass: 'altrow',
    sort: 'arraivaldate',
    order: 'asc',
    isPopup: false,
    gridComplete: function () {
        ReDrawTable(depGrid);
        //Line below makes the height of the row to be 38 px!!!
        $("#grid-table .ui-widget-content").css("height", "38px");
        /*<div align="center" id="grid-footer" style="background: transparent; margin-left: -4px; width: 100%;height: 33px;line-height: 33px; position: absolute;bottom: 0;">*/

    },
    beforeRequest: function () {
    }
};
/* -------------------------------- Reservation List Model ------------------------------------*/



/* -------------------------------- Reservation List Model ------------------------------------*/
var arrivalGridModel = [];
arrivalGridModel.push(
    colModelGenerator(50, 'reservationroomid', 0),
    colModelGenerator(60, 'arraivaldate', 0),
    colModelGenerator(60, 'departuredate', 0),
    colModelGenerator(120, 'guest', 0),
    colModelGenerator(90, 'roomcode', 0),
    colModelGenerator(90, 'bsourcename', 0),
    colModelGenerator(85, 'companyname', 0),
    colModelGenerator(60, 'adult', 0),
    colModelGenerator(80, 'child', 0),
    colModelGenerator(80, 'reservationtype', 0),
    colModelGenerator(40, 'action', 0));
arrivalGrid = {
    id: 'list_arrival',
    url: 'content/getarrivallist.jsp',
    type: 'xml',
    cols: ['რეზ#', 'ჩამოსვლა', 'წასვლა', 'სტუმრის სახელი', 'ოთახი', 'წყარო',
        'კომპანია', 'უფროსი', 'ბავშვი', 'რეზ.ტიპი', ''],
    model: arrivalGridModel,
    sort: 'arraivaldate',
    order: 'asc',
    multiselect: true,
    multikey: "ctrlKey",
    altRows: true,
    altclass: 'altrow',
    isPopup: false,
    gridComplete: function () {
        ReDrawTable(arrivalGrid);
        $("#grid-table .ui-widget-content").css("height", "38px");
    },
    beforeRequest: function () {

    }
};
/* -------------------------------- Reservation List Model ------------------------------------*/


/* -------------------------------- Geust List Model ------------------------------------*/
var guestGridModel = [];
guestGridModel.push(
    colModelGenerator(120, 'guest', 0),
    colModelGenerator(60, 'city', 0),
    colModelGenerator(60, 'country', 0),
    colModelGenerator(90, 'mobile', 0),
    colModelGenerator(90, 'phone', 0),
    colModelGenerator(90, 'email', 0),
    colModelGenerator(85, 'vipstatus', 0),
    colModelGenerator(57, 'action', 1)
);
guestGrid = {
    id: 'list_guestdblist',
    url: 'content/getguestlistdb.jsp',
    type: 'xml',
    cols: ['სტუმრის სახელი', 'ქალაქი', 'ქვეყანა', 'მობილური',
        'ტელეფონი', 'ელ.ფოსტა', 'ვიპ.სტატუსი', ''],
    model: guestGridModel,
    sort: 'guest',
    multiselect: true,
    multikey: "ctrlKey",
    altRows: true,
    altclass: 'altrow',
    order: 'asc',
    isPopup: false,
    gridComplete: function () {
        ReDrawTable(guestGrid);
    },
    beforeRequest: function () {

    }
};
/* -------------------------------- Geust List Model ------------------------------------*/

/* -------------------------------- tagentsGrid List Model ------------------------------------*/
var tagentsGridModel = [];
tagentsGridModel.push(
    colModelGenerator(120, 'company', 0),
    colModelGenerator(60, 'contragent', 0),
    colModelGenerator(60, 'city', 0),
    colModelGenerator(90, 'country', 0),
    colModelGenerator(90, 'phone', 0),
    colModelGenerator(90, 'email', 0),
    colModelGenerator(57, 'action', 1)
);
tagentsGrid = {
    id: 'list_tagens',
    url: 'content/getcontrlist.jsp',
    type: 'xml',
    cols: ['კომპანია', 'სახელი, გვარი', 'ქალაქი', 'ქვეყანა',
        'ტელეფონი', 'ელ.ფოსტა', ''],
    model: tagentsGridModel,
    multiselect: true,
    multikey: "ctrlKey",
    altRows: true,
    altclass: 'altrow',
    sort: 'company',
    order: 'asc',
    isPopup: false,
    gridComplete: function () {
        ReDrawTable(tagentsGrid);
    },
    beforeRequest: function () {

    }
};
/* -------------------------------- tagentsGrid List Model ------------------------------------*/

/* -------------------------------- NightAudit List NA1 Model ------------------------------------*/
var pResGridModel = [];
pResGridModel.push(
    colModelGenerator(65, 'reservationid', 0),
    colModelGenerator(140, 'guest', 0),
    colModelGenerator(80, 'room', 0),
    colModelGenerator(80, 'rate', 0),
    colModelGenerator(100, 'reservationtype', 0),
    colModelGenerator(100, 'bsource', 0),
    colModelGenerator(80, 'departure', 0),
    colModelGenerator(80, 'total', 0),
    colModelGenerator(100, 'deposit', 0),
    colModelGenerator(80, 'action', 0));
pResGrid = {
    id: 'list_pendingreservations',
    url: 'content/wizards/nightaudit/content/getna1.jsp',
    type: 'xml',
    cols: ['რეზ. #', 'სტუმარი', 'ოთახი', 'ტარიფი', 'რეზ. ტიპი', 'წყარო', 'წასვლა', 'სულ', 'დეპოზიტი', 'მოქმედება'],
    model: pResGridModel,
    sort: 'reservationroomid',
    order: 'asc',
    altRows: true,
    altclass: 'altrow',
    isPopup: true,
    gridComplete: function () {
        var rows = $("#list_pendingreservations").getGridParam("records");
        if (rows > 0) {
            $("#nolist_pendingreservations").hide();
            $("#list_pendingreservations").show();
        } else {
            $("#nolist_pendingreservations").show();
            $("#list_pendingreservations").hide();
        }
        $("#nastp1").val(rows);
        ReDrawTable(pResGrid);
    },
    beforeRequest: function () {

    }
};
/* -------------------------------- NightAudit NA1 List Model ------------------------------------*/

/* -------------------------------- NightAudit NA2 List Model ------------------------------------*/
var finishedResGridModel = [];
finishedResGridModel.push(
    colModelGenerator(65, 'reservationid', 0),
    colModelGenerator(140, 'guest', 0),
    colModelGenerator(80, 'room', 0),
    colModelGenerator(80, 'rate', 2),
    colModelGenerator(100, 'reservationtype', 0),
    colModelGenerator(100, 'relesedate', 0),
    colModelGenerator(80, 'departure', 0),
    colModelGenerator(80, 'total', 0),
    colModelGenerator(100, 'deposit', 0),
    colModelGenerator(140, 'action', 0));
finishedResGrid = {
    id: 'list_relasereservations',
    url: 'content/wizards/nightaudit/content/getna2.jsp',
    type: 'xml',
    cols: ['რეზ. #', 'სტუმარი', 'ოთახი', 'ტარიფი', 'რეზ. ტიპი', 'რელიზი', 'წასვლა', 'სულ', 'დეპოზიტი', 'მოქმედება'],
    model: finishedResGridModel,
    sort: 'reservationroomid',
    order: 'asc',
    altRows: true,
    altclass: 'altrow',
    isPopup: true,
    gridComplete: function () {
        var rows = $("#list_relasereservations").getGridParam("records");
        if (rows > 0) {
            $("#nolist_relasereservations").hide();
            $("#list_relasereservations").show();
        } else {
            $("#norelasereservations").show();
            $("#list_relasereservations").hide();
        }
        $("#nastp2").val(rows);
        ReDrawTable(finishedResGrid);
    },
    beforeRequest: function () {

    }
};
/* -------------------------------- NightAudit NA2 List Model ------------------------------------*/

/* -------------------------------- NightAudit NA3 List Model ------------------------------------*/
var roomStatusGridModel = [];
roomStatusGridModel.push(
    colModelGenerator(65, 'room', 0),
    colModelGenerator(140, 'guest', 0),
    colModelGenerator(80, 'arrival', 0),
    colModelGenerator(80, 'departure', 2),
    colModelGenerator(100, 'total', 0),
    colModelGenerator(100, 'balance', 0),
    colModelGenerator(80, 'status', 0),
    colModelGenerator(80, 'action', 0));
roomStatusGrid = {
    id: 'list_roomstatus',
    url: 'content/wizards/nightaudit/content/getna3.jsp',
    type: 'xml',
    cols: ['ოთახი', 'სტუმარი', 'ჩამოსვლა', 'წასვლა', 'სულ', 'ბალანსი', 'სტატუსი', 'მოქმედება'],
    model: roomStatusGridModel,
    sort: 'reservationid',
    order: 'asc',
    altRows: true,
    altclass: 'altrow',
    isPopup: true,
    height: 500,
    gridComplete: function () {
        var rows = $("#list_roomstatus").getGridParam("records");
        if (rows > 0) {
            $("#nolist_roomstatus").hide();
            $("#list_roomstatus").show();
        } else {
            $("#nolist_roomstatus").show();
            $("#list_roomstatus").hide();
        }
        $("#nastp3").val(rows);
        ReDrawTable(roomStatusGrid);
    },
    beforeRequest: function () {

    }
};
/* -------------------------------- NightAudit NA3 List Model ------------------------------------*/



/* -------------------------------- NightAudit NA4 List Model ------------------------------------*/
var unsettledFolioGridModel = [];
unsettledFolioGridModel.push(
    colModelGenerator(65, 'reservationid', 0),
    colModelGenerator(120, 'guest', 0),
    colModelGenerator(80, 'room', 0),
    colModelGenerator(100, 'rate', 2),
    colModelGenerator(100, 'reservationtype', 0),
    colModelGenerator(100, 'bsource', 0),
    colModelGenerator(100, 'departure', 0),
    colModelGenerator(100, 'total', 0),
    colModelGenerator(100, 'deposit', 0),
    colModelGenerator(100, 'action', 0));
unsettledFolioGrid = {
    id: 'list_unsettledfolio',
    url: 'content/wizards/nightaudit/content/getna4.jsp',
    type: 'xml',
    cols: ['რეზ. #', 'სტუმარი', 'ოთახი', 'ტარიფი', 'რეზ. ტიპი', 'წყარო', 'წასვლა', 'სულ', 'დეპოზიტი', 'მოქმედება'],
    model: unsettledFolioGridModel,
    sort: 'reservationid',
    order: 'asc',
    altRows: true,
    altclass: 'altrow',
    isPopup: true,
    gridComplete: function () {
        var rows = $("#list_unsettledfolio").getGridParam("records");
        if (rows > 0) {
            $("#nolist_unsettledfolio").hide();
            $("#list_unsettledfolio").show();
        } else {
            $("#nolist_unsettledfolio").show();
            $("#list_unsettledfolio").hide();
        }
        $("#nastp4").val(rows);
        ReDrawTable(unsettledFolioGrid);
    },
    beforeRequest: function () {

    }
};
/* -------------------------------- NightAudit NA4 List Model ------------------------------------*/

/* -------------------------------- NightAudit NA5 List Model ------------------------------------*/
var postchargesGridModel = [];
postchargesGridModel.push(
    colModelGenerator(65, 'room', 0),
    colModelGenerator(120, 'guest', 0),
    colModelGenerator(80, 'folio', 0),
    colModelGenerator(100, 'description', 2),
    colModelGenerator(100, 'amount', 0)
    //colModelGenerator(100, 'net', 0)
);
postchargesGrid = {
    id: 'list_postcharges',
    url: 'content/wizards/nightaudit/content/getna5.jsp',
    type: 'xml',
    cols: ['ოთახი', 'სტუმარი', 'ფოლიო', 'აღწერა', 'თანხა'], //'Net'],
    model: postchargesGridModel,
    sort: 'folioitemid',
    order: 'asc',
    altRows: true,
    altclass: 'altrow',
    isPopup: true,
    gridComplete: function () {
        var rows = $("#list_postcharges").getGridParam("records");
        if (rows > 0) {
            $("#nolist_postcharges").hide();
            $("#list_postcharges").show();
        } else {
            $("#nolist_postcharges").show();
            $("#list_postcharges").hide();
        }
        ReDrawTable(postchargesGrid);
    },
    beforeRequest: function () {

    }
};
/* -------------------------------- NightAudit NA5 List Model ------------------------------------*/

/* -------------------------------- closedayGrid List Model ------------------------------------*/
var closedayGridModel = [];
closedayGridModel.push(
    colModelGenerator(65, 'reservationid', 0),
    colModelGenerator(120, 'guest', 0),
    colModelGenerator(80, 'room', 0),
    colModelGenerator(100, 'rate', 0),
    colModelGenerator(100, 'reservationtype', 0),
    colModelGenerator(100, 'bsource', 0),
    colModelGenerator(100, 'departure', 0),
    colModelGenerator(100, 'total', 0),
    colModelGenerator(100, 'deposit', 0),
    colModelGenerator(80, 'action', 0));

closedayGrid = {
    id: 'list_closeday',
    url: 'content/wizards/nightaudit/content/getna6.jsp',
    type: 'xml',
    cols: ['რეზ. #', 'სტუმარი', 'ოთახი', 'ტარიფი', 'რეზ. ტიპი', 'წყარო', 'წასვლა', 'სულ', 'დეპოზიტი', 'მოქმედება'],
    model: closedayGridModel,
    sort: 'reservationid',
    order: 'asc',
    altRows: true,
    altclass: 'altrow',
    isPopup: true,
    gridComplete: function () {
        var rows = $("#postcharges").getGridParam("reccount");
        if (rows > 0) {
            $("#nopostcharges").hide();
            $("#postchargestbl").show();
        } else {
            $("#nopostcharges").show();
            $("#postchargestbl").hide();
        }
        ReDrawTable(closedayGrid);
    },
    beforeRequest: function () {

    }
};
/* -------------------------------- closedayGrid List Model ------------------------------------*/


/* -------------------------------- chargesGrid List Model ------------------------------------*/
var chargesGridModel = [];
chargesGridModel.push(
    colModelGenerator(120, 'srno', 0),
    colModelGenerator(120, 'refno', 0),
    colModelGenerator(120, 'particular', 0),
    colModelGenerator(160, 'comment', 0),
    colModelGenerator(120, 'amount', 0));

chargesGrid = {
    id: 'list_chargesGrid',
    url: 'content/getcharges.jsp',
    type: 'xml',
    cols: ['Sr. #', 'RefNo', 'Particular', 'Comment', 'Amount'],
    model: chargesGridModel,
    sort: 'srno',
    order: 'asc',
    altRows: true,
    altclass: 'altrow',
    isPopup: false,
    gridComplete: function () {
        var rows = $("#postcharges").getGridParam("reccount");
        if (rows > 0) {
            $("#nopostcharges").hide();
            $("#postchargestbl").show();
        } else {
            $("#nopostcharges").show();
            $("#postchargestbl").hide();
        }
        ReDrawTable(closedayGrid);
    },
    beforeRequest: function () {

    }
};
/* -------------------------------- chargesGrid List Model ------------------------------------*/


/* --------------------------------  consGrid List Model ------------------------------------*/
var consGridModel = [];
consGridModel.push(
    colModelGenerator(30, 'consguest', 0),
    colModelGenerator(120, 'guest', 0),
    colModelGenerator(120, 'city', 0),
    colModelGenerator(120, 'country', 0),
    colModelGenerator(120, 'phone', 0),
    colModelGenerator(120, 'email', 0)
);

consGrid = {
    id: 'list_consgrid',
    url: 'content/getconsguestlist.jsp',
    type: 'xml',
    cols: ['', 'სტუმრის სახელი', 'ქალაქი', 'ქვეყანა', 'ტელეფონი', 'ელ.ფოსტა'],
    model: consGridModel,
    sort: 'guest',
    order: 'asc',
    altRows: true,
    altclass: 'altrow',
    isPopup: true,
    gridComplete: function () {
        ReDrawTable(consGrid);
    },
    beforeRequest: function () {

    }
};
/* -------------------------------- consGrid List Model ------------------------------------*/


/* --------------------------------  tagentscons List Model ------------------------------------*/
var constagentGridModel = [];
constagentGridModel.push(
    colModelGenerator(30, 'conscontr', 0),
    colModelGenerator(120, 'company', 0),
    colModelGenerator(120, 'contragent', 0),
    colModelGenerator(120, 'city', 0),
    colModelGenerator(120, 'country', 0),
    colModelGenerator(120, 'phone', 0),
    colModelGenerator(120, 'email', 0)
);

constagentGrid = {
    id: 'list_contrgrid',
    url: 'content/getconscontrlist.jsp',
    type: 'xml',
    cols: ['', 'კომპანია', 'სახელი,გვარი', 'ქალაქი', 'ქვეყანა', 'ტელეფონი', 'ელ.ფოსტა'],
    model: constagentGridModel,
    sort: 'contragent',
    order: 'asc',
    altRows: true,
    altclass: 'altrow',
    isPopup: true,
    gridComplete: function () {
        ReDrawTable(constagentGrid);
    },
    beforeRequest: function () {

    }
};


/* --------------------------------  List Model ------------------------------------*/


/* --------------------------------  List Model ------------------------------------*/
var hsGridModel = [];
hsGridModel.push(
    colModelGenerator(130, 'unitroom', 0),
    colModelGenerator(120, 'roomtype', 0),
    colModelGenerator(150, 'status', 0),
    colModelGenerator(120, 'aval', 0),
    colModelGenerator(120, 'remarks', 0),
    colModelGenerator(120, 'housekeeper', 0)
);

hsGrid = {
    id: 'list_hsgrid',
    url: 'content/gethotelstatus.jsp',
    type: 'xml',
    cols: ['დასალაგებელი ადგილები', 'ოთახის ტიპი', 'სტატუსი', 'ხელმისაწვდომობა', 'შენიშვნა', 'დამლაგებელი'],
    model: hsGridModel,
    sort: 'contragent',
    order: 'asc',
    multiselect: true,
    multikey: "ctrlKey",
    altRows: true,
    altclass: 'altrow',
    isPopup: false,
    gridComplete: function () {
        ReDrawTable(hsGrid);
        $("[aria-describedby=list_hsgrid_status]").each(function (i, o) {
            var color = $(o).find(".status-color").attr("color");
            $(o).parent().css("height", "29px");
            if (!isNullOrEmpty(color)) {
                $(o).parent().css("border-left", "solid 5px " + $(o).find(".status-color").attr("color"));
            }
        });
    },
    beforeRequest: function () {

    }
};


/* --------------------------------  List Model ------------------------------------*/
var finGridModel = [];
finGridModel.push(
    colModelGenerator(130, 'type', 0),
    colModelGenerator(60, 'dt1', 1),
    colModelGenerator(60, 'dt2', 1),
    colModelGenerator(60, 'dt3', 1)
);

finGrid = {
    id: 'list_fin',
    url: 'content/getfinventory.jsp',
    type: 'xml',
    cols: ['Type', 'dt1', 'dt2', 'dt3'],
    model: finGridModel,
    sort: 'type',
    order: 'asc',
    isPopup: false,
    altRows: true,
    altclass: 'altrow',
    footerrow : true,
    userDataOnFooter:true,
    gridComplete: function () {
        ReDrawTable(finGrid);
        var width = $(".q-table-div1 .ui-jqgrid").width();
        $(".q-table-div1 .ui-jqgrid-labels").hide();
        $("#gbox_list_fin").width(width-3);
        $("#list_fin").width(width-10);
        $(".q-table-div1 .ui-jqgrid-sdiv").width(width);
        $(".q-table-div1 .ui-jqgrid-ftable").width(width);
        $(".footrow td").css("border-right","0");
        $(".q-table-div1 .ui-jqgrid-bdiv").css("height","244px");
    },
    beforeRequest: function () {

    }
};


/* --------------------------------  List Model ------------------------------------*/
var qohsGridModel = [];
qohsGridModel.push(
    colModelGenerator(80, 'status', 0),
    colModelGenerator(100, 'vacant', 0),
    colModelGenerator(100, 'occupied', 0),
    colModelGenerator(100, 'total', 0)
);

qohsGrid = {
    id: 'list_qohs',
    url: 'content/getqohs.jsp',
    type: 'xml',
    cols: ['', 'თავისუფალი', 'დაკავებული', 'სულ'],
    model: qohsGridModel,
    sort: 'type',
    order: 'asc',
    isPopup: false,
    altRows: true,
    altclass: 'altrow',
    footerrow : true,
    userDataOnFooter:true,
    gridComplete: function () {
        ReDrawTable(qohsGrid);
        var width = $(".q-table-div2 .ui-jqgrid").width();
        $("#list_qohs").width(width-10);
        $("#gbox_list_qohs").width(width-3);
        $(".q-table-div2 .ui-jqgrid-labels").css("width","100%");
        $(".q-table-div2 .ui-jqgrid-sdiv").width(width-10);
        $(".q-table-div2 .ui-jqgrid-ftable").width(width-10);
        $(".footrow td").css("border-right","0");
        $(".q-table-div2 .ui-jqgrid-bdiv").css("height","222px");
    },
    beforeRequest: function () {

    }
};

