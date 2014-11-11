
    /* -------------------------------- Reservation List Model ------------------------------------*/
    var resGridModel = [];
    resGridModel.push(
        colModelGenerator(50,'reservationroomid',0),
        colModelGenerator(60,'arraivaldate',0),
        colModelGenerator(60,'departuredate',0),
        colModelGenerator(120,'guest',0),
        colModelGenerator(90,'roomcode',1),
        colModelGenerator(90,'bsourcename',0),
        colModelGenerator(85,'companyname',0),
        colModelGenerator(60,'price',2),
        colModelGenerator(80,'paid',2),
        colModelGenerator(110,'user',1),
        colModelGenerator(94,'reservationtype',1),
        colModelGenerator(40,'action',1));
    resGrid = {
        id : 'list_reservs',
        url : 'content/getreservationlist.jsp',
        type : 'xml',
        cols : ['რეზ#', 'ჩამოსვლა','წასვლა','სტუმრის სახელი','ოთახი','წყარო',
            'კომპანია','ჯამი','დეპოზიტი','მომხმარებელი','რეზ.ტიპი',''],
        model : resGridModel,
        sort : 'name',
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
