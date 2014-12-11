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
    isPopup: false,
    gridComplete: function () {

        ReDrawTable(resGrid);
        //Line below makes the height of the row to be 38 px!!!
        $("#grid-table .ui-widget-content").css("height","38px");
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
    isPopup: false,
    gridComplete: function () {
        ReDrawTable(arrivalGrid);
        $("#grid-table .ui-widget-content").css("height","38px");
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
        var rows = $("#pendingreservations").getGridParam("reccount");
        if (rows > 0) {
            $("#nopendingreservations").hide();
            $("#pendingreservationstbl").show();
        } else {
            $("#nopendingreservations").show();
            $("#pendingreservationstbl").hide();
        }
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
        var rows = $("#relasereservations").getGridParam("reccount");
        if (rows > 0) {
            $("#norelasereservations").hide();
            $("#relasereservationstbl").show();
        } else {
            $("#norelasereservations").show();
            $("#relasereservationstbl").hide();
        }
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
    gridComplete: function () {
        var rows = $("#roomstatus").getGridParam("reccount");
        if (rows > 0) {
            $("#noroomstatus").hide();
            $("#roomstatustbl").show();
        } else {
            $("#noroomstatus").show();
            $("#roomstatustbl").hide();
        }
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
    colModelGenerator(100, 'amount', 0),
    colModelGenerator(100, 'net', 0));
postchargesGrid = {
    id: 'list_postcharges',
    url: 'content/wizards/nightaudit/content/getna5.jsp',
    type: 'xml',
    cols: ['ოთახი', 'სტუმარი', 'ფოლიო', 'აღწერა', 'მოცულობა', 'Net'],
    model: postchargesGridModel,
    sort: 'folioitemid',
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
        ReDrawTable(postchargesGrid);
    },
    beforeRequest: function () {

    }
};
/* -------------------------------- NightAudit NA5 List Model ------------------------------------*/

/* -------------------------------- NightAudit NA6 List Model ------------------------------------*/
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
/* -------------------------------- NightAudit NA5 List Model ------------------------------------*/


/* -------------------------------- NightAudit NA6 List Model ------------------------------------*/
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
/* -------------------------------- NightAudit NA5 List Model ------------------------------------*/
