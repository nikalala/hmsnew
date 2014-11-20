
    /* -------------------------------- Reservation List Model ------------------------------------*/
    var resGridModel = [];
    resGridModel.push(
        colModelGenerator(50,'reservationroomid',0),
        colModelGenerator(60,'arraivaldate',0),
        colModelGenerator(60,'departuredate',0),
        colModelGenerator(120,'guest',0),
        colModelGenerator(90,'roomcode',0),
        colModelGenerator(90,'bsourcename',0),
        colModelGenerator(85,'companyname',0),
        colModelGenerator(60,'price',0),
        colModelGenerator(80,'paid',0),
        colModelGenerator(110,'user',0),
        colModelGenerator(94,'reservationtype',0),
        colModelGenerator(40,'action',0));
    resGrid = {
        id : 'list_reservs',
        url : 'content/getreservationlist.jsp',
        type : 'xml',
        cols : ['რეზ#', 'ჩამოსვლა','წასვლა','სტუმრის სახელი','ოთახი','წყარო',
            'კომპანია','ჯამი','დეპოზიტი','მომხმარებელი','რეზ.ტიპი',''],
        model : resGridModel,
        sort : 'arraivaldate',
        order : 'asc'
    };
    /* -------------------------------- Reservation List Model ------------------------------------*/


    /* -------------------------------- Geust List Model ------------------------------------*/
    var guestGridModel = [];
    guestGridModel.push(
        colModelGenerator(120,'guest',0),
        colModelGenerator(60,'city',0),
        colModelGenerator(60,'country',0),
        colModelGenerator(90,'mobile',0),
        colModelGenerator(90,'phone',0),
        colModelGenerator(90,'email',0),
        colModelGenerator(85,'vipstatus',0),
        colModelGenerator(57,'action',1)
    );
    guestGrid = {
        id : 'list_guestdblist',
        url : 'content/getguestlistdb.jsp',
        type : 'xml',
        cols : ['სტუმრის სახელი','ქალაქი','ქვეყანა','მობილური',
                'ტელეფონი','ელ.ფოსტა','ვიპ.სტატუსი',''],
        model : guestGridModel,
        sort : 'guest',
        order : 'asc'
    };
    /* -------------------------------- Geust List Model ------------------------------------*/

    /* -------------------------------- tagentsGrid List Model ------------------------------------*/
    var tagentsGridModel = [];
    tagentsGridModel.push(
        colModelGenerator(120,'company',0),
        colModelGenerator(60,'contragent',0),
        colModelGenerator(60,'city',0),
        colModelGenerator(90,'country',0),
        colModelGenerator(90,'phone',0),
        colModelGenerator(90,'email',0),
        colModelGenerator(57,'action',1)
    );
    tagentsGrid = {
        id : 'list_tagens',
        url : 'content/getcontrlist.jsp',
        type : 'xml',
        cols : ['კომპანია','სახელი, გვარი','ქალაქი','ქვეყანა',
            'ტელეფონი','ელ.ფოსტა',''],
        model : tagentsGridModel,
        sort : 'company',
        order : 'asc'
    };
    /* -------------------------------- tagentsGrid List Model ------------------------------------*/

    /* -------------------------------- NightAudit List Model ------------------------------------*/
    var pResGridModel = [];
    pResGridModel.push(
        colModelGenerator(80,'reservationid',0),
        colModelGenerator(140,'guest',0),
        colModelGenerator(120,'room',0),
        colModelGenerator(100,'rate',2),
        colModelGenerator(100,'reservationtype',0),
        colModelGenerator(100,'bsource',0),
        colModelGenerator(100,'departure',0),
        colModelGenerator(100,'total',0),
        colModelGenerator(100,'deposit',0),
        colModelGenerator(140,'action',0));
    pResGrid = {
        id : 'list_pendingreservations',
        url : 'content/wizards/nightaudit/content/getna1.jsp',
        type : 'xml',
        cols : ['რეზ. #', 'სტუმარი', 'ოთახი', 'ტარიფი', 'რეზ. ტიპი', 'წყარო','წასვლა','სულ','დეპოზიტი','მოქმედება'],
        model : pResGridModel,
        sort : 'reservationroomid',
        order : 'asc',
        altRows: true,
        altclass: 'altrow',
        gridComplete: function() {
            var rows = $("#pendingreservations").getGridParam("reccount"); 
            if(rows > 0){
                $("#nopendingreservations").hide();
                $("#pendingreservationstbl").show();
            } else {
                $("#nopendingreservations").show();
                $("#pendingreservationstbl").hide();
            }
        }
    };
    /* -------------------------------- NightAudit List Model ------------------------------------*/
