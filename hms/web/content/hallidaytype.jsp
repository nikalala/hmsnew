<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%

%>
<script type="text/javascript">
    function chcolor(id){
        $('#colorselector_'+id).ColorPicker({
            onShow: function (colpkr) {
                    $(colpkr).fadeIn(500);
                    return false;
            },
            onHide: function (colpkr) {
                    $(colpkr).fadeOut(500);
                    return false;
            },
            onSubmit: function(hsb, hex, rgb, el) {
                $.post("content/updhallidaytype.jsp", { oper: 'chcolor', id: id, color: hex},function(data){ 
                    $(el).val(hex);
                    $(el).ColorPickerHide();
                });
            },
            onChange: function (hsb, hex, rgb) {
                    $('#colorselector_'+id+' div').css('backgroundColor', '#' + hex);
            }
        });
    }


    

    function chcolor1(id,color)
    {
        $("#chcol").dialog(
            {
                width: 400,
                height: 400,
                show: 'slide',
                resizable: false,
                modal: true,
                draggable: true,
                closeOnEscape: true,
                buttons: {
                "შენახვა": function() {
                    $.post(
                        "content/updhallidaytype.jsp", 
                        {
                            "id":id,
                            "color":$("#color").val()
                        },
                        function(data){
                            jQuery("#list1").trigger("reloadGrid");
                            $("#chcol").dialog("close");
                            }
                    );
                },
                "დახურვა": function() { $("#chcol").dialog("close"); }
                },
                open: function(event, ui) { 
                    $.post("content/matin.jsp", { id: id},function(data){ 
                        $("#matin").html(data); 
                        });
                }

            });
    }
    
    jQuery().ready(function ()
    {
        jQuery("#list1").jqGrid(
            {
                url:'content/gethallidaytypelist.jsp',
                datatype: "xml",
                colNames:['დასახელება','დარიცხვა %','ფერი'],
                colModel:[
                    {name:'name',index:'name', editable:true, align:"left", width:200, edittype:"text", editoptions:{size:"30"}},
                    {name:'perc',index:'perc', editable:true, align:"right", width:100, edittype:"text", editoptions:{size:"10",class:"gTextBtn"}, editrules:{required:true,number:true}},
                    {name:'color',index:'color', editable:false, align:"center", width:100, edittype:"text", editoptions:{size:"10"}, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']}, editrules: {edithidden:true, required:true}}
                ],
                rowNum:20,
                height: 400,
                width:1000,
                autowidth: false,
                rowList:[20,50,100],
                pager: jQuery('#pager1'),
                sortname: 'name',
                viewrecords: true,
                sortorder: "asc",
                editurl:"content/updhallidaytype.jsp",
                caption:"გაცდენის ტიპები",
                ondblClickRow: function(id, ri, ci) {
                    jQuery("#list1").jqGrid('editGridRow',id,{height:150,width:350,closeAfterEdit:true,reloadAfterSubmit:false,afterSubmit:checkStatus});
                    return;
                }
            })
            .jqGrid('bindKeys')
            .navGrid('#pager1',{edit:true,add:true,del:true,view:false},
                        {dataheight:150,width:350,closeAfterEdit:true,reloadAfterSubmit:false,afterSubmit:checkStatus}, //  default settings for edit
                        {dataheight:150,width:350,closeAfterAdd:true,reloadAfterSubmit:true,afterSubmit:checkStatus}, //  default settings for add
                        {dataheight:150,width:350,reloadAfterSubmit:false,afterSubmit:checkStatus},  // delete instead that del:false we need this
                        {multipleSearch:true}, // search options
                        {dataheight:150,width:350,labelswidth:"68%",closeOnEscape:true} /* view parameters*/
                )
             ;
    $(".ui-jqgrid-sortable").css('white-space', 'normal');
    $(".ui-jqgrid-sortable").css('height', 'auto');
    });
    
</script>

<table id="list1" width="100%" align="center"></table>
<div id="pager1"></div>
<table id="search" width="100%" align="center"></table>
