<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%

%>
<script type="text/javascript">
    jQuery().ready(function ()
    {
        jQuery("#list041").jqGrid(
            {
                url:'content/getpictlist.jsp?id=',
                datatype: "xml",
                colNames:['თარიღი','ვინ ატვირთა','ნახვა'],
                colModel:[
                    {name:'uploaddate',index:'uploaddate', editable:true, sortable:true, align:"center", width:100},
                    {name:'personellid',index:'personellid', editable:false, sortable:false, align:"left", width:200},
                    {name:'action',index:'action', editable:true, sortable:false, align:"center", width:200}
                ],
                rowNum:20,
                height: 400,
                width:600,
                autowidth: false,
                rowList:[20,50,100],
                pager: jQuery('#pager041'),
                sortname: 'uploaddate',
                viewrecords: true,
                sortorder: "desc",
                editurl:"content/updpics.jsp",
                caption:"ოთახის სურათები"
            })
            .navGrid('#pager041',{edit:false,add:false,del:true,view:false,search:false},
                        {dataheight:140,width:360,closeAfterEdit:true,reloadAfterSubmit:true,afterSubmit:checkStatus}, //  default settings for edit
                        {dataheight:140,width:360,closeAfterAdd:true,reloadAfterSubmit:true,afterSubmit:checkStatus}, //  default settings for add
                        {reloadAfterSubmit:true,afterSubmit:checkStatus},  // delete instead that del:false we need this
                        {multipleSearch:true}, // search options
                        {dataheight:140,width:460,labelswidth:"68%",closeOnEscape:true} /* view parameters*/
                )
            .navButtonAdd('#pager041',{caption:"ატვირთვა", buttonicon:"ui-icon-circle-arrow-n", onClickButton: function(){ popupwin('content/upload_picture.jsp?roomid=','სურათის დამატება','scrollbars=yes,resizable=yes,width=400,height=200,left=200,top=200'); },position:"last"})
            ;
    $(".ui-jqgrid-sortable").css('white-space', 'normal');
    $(".ui-jqgrid-sortable").css('height', 'auto');
    
    });


</script>

<table id="list041" width="100%" align="center"></table>
<div id="pager041"></div>

 