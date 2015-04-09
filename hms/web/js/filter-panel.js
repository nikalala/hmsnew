var fPanelStart = '<div id="filter-panel"><div id="filter-panel-top"></div><div id="filter-panel-body"></div></div>';
var div_full_width = '';

function makeDatePicker(divid, inputId, inputplaceholder) {
    var datePickerBox = '<div class="input-append date" id="' + divid + '">' +
        '<input type="text" class="span2 " id="' + inputId + '" placeholder="' + inputplaceholder + '">' +
        '<span class="add-on" style="position:absolute !important; right : 4px  !important;background : none  !important;border: none !important;top: 1px;">' +
        '<i class="glyphicon glyphicon-calendar"></i></span></div>';
    return datePickerBox;
}
function addViewToRow(view) {
    view.each(function () {

    });
}
function makeSelect(arr, id, classname, colmd) {
    /*
     var arr = [
     {val : 1, text: 'One'},
     {val : 2, text: 'Two'},
     {val : 3, text: 'Three'}
     ];
     */
    var sel = $('<select id="' + id + '" class="' + classname + '" >');
    $(arr).each(function () {
        sel.append($("<option>").attr('value', this.val).text(this.text));
    });
    var col = "col-md-" + colmd;
    var html = '<div class=' + col + '>' + sel + '</div>';
    return html;
}
function makeView(id, type, placeh, colmd) {
    var input = $("<input/>",
        {   type: type,
            placeholder: placeh,
            name: id,
            id: id,
            style: 'width: 100% !important; height: 27px;'
        }
    )
    var col = "col-md-" + colmd;
    var html = '<div class=' + col + '>' + input + '</div>';
    return html;
}
function makeButton(id, classname, text) {
    var html = '<button type="button" class="' + classname + '" id="' + classname + '" style="border: 0; font-weight: bold;">'
        + text + '</button>';
    return html;
}
function generateFloatElement(element) {
    return '<div style="width: 100%;float: left;">' + element + '</div>';
}

/* -------------------------------- Reservation Filter Panel ------------------------------------*/


function createReservationFilter() {
    var headerElements = '<div style="float: left; margin-left:10px;"><span>ძიების კრიტერიუმები</span></div>';
    var button = '<div style="float: right; margin-right:10px;">' +
        makeButton("btnExport", "btn btn-default", "ექსპორტი") + '</div>';
    var html =
        '<form name="filter-form" id="filter-form">' +
            '<table id="grid-table">' +
            '<tr>' +
            '<td>' +
            generateFloatElement(headerElements + button) +
            '</td>' +
            '</tr>' +
            '<tr>' +
            '<td>' +
            generateFloatElement(headerElements + button) +
            '</td>' +
            '</tr>' +
            '</table>' +
            '</form>';
}

/* -------------------------------- Reservation Filter Panel ------------------------------------*/