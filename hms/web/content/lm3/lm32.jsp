<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%
%>
<script type="text/javascript">
    
    function addMethod()
    {
        $("#methodform").dialog(
            {
                width: 500,
                height: 260,
                show: 'slide',
                resizable: false,
                modal: true,
                draggable: false,
                closeOnEscape: true,
                buttons: { 
                  "დამატება": function() {
                    $.post(
                        "content/updmethodform.jsp", 
                        $("#methodfrm").serialize(),
                        function(data)
                        { 
                            if(data.indexOf("შეცდომა") >= 0)
                                {
                                    $("#methodformerror").html(data);
                                }
                            else
                                $("#methodform").dialog("close");
                        });
                  },
                  "დახურვა": function() {
                    $("#methodform").dialog("close");
                  }
                },
                open: function(event, ui) { $.post("content/methodform.jsp", {  },function(data){ $("#methodform1").html(data); });}

            });
    }
    
    function editMethod(id)
    {
        if(id > 0)
        $("#methodform").dialog(
            {
                width: 660,
                height: 300,
                show: 'slide',
                resizable: false,
                modal: true,
                draggable: false,
                closeOnEscape: true,
                buttons: { 
                  "განახლება": function() {
                    $.post(
                        "content/updmethodform.jsp", 
                        $("#methodfrm").serialize(),
                        function(data)
                        { 
                            if(data.indexOf("შეცდომა") >= 0)
                                {
                                    $("#methodformerror").html(data);
                                }
                            else
                                $("#methodform").dialog("close");
                        });
                  },
                  "დახურვა": function() {
                    $("#methodform").dialog("close");
                  }
                },
                open: function(event, ui) { $.post("content/methodform.jsp", { id: id },function(data){ $("#methodform1").html(data); });}

            });
    }
    
    jQuery().ready(function ()
    {
        jQuery("#list32").jqGrid(
            {
                url:'content/lm3/getlm32.jsp',
                datatype: "xml",
                colNames:['სახელწოდება','მოკლე სახელი','შექმნილია','განახლებულია','სტატუსი'],
                colModel:[
                    {name:'name',index:'name', editable:true, sortable:false, align:"left", width:150, edittype:"text", editoptions:{size:"30"}, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']}},
                    {name:'nickname',index:'nickname', editable:true, sortable:false, align:"left", width:100, edittype:"text", editoptions:{size:"30"}, searchoptions:{sopt:['bw','bn','in','ni','ew','en','cn','nc']}},
                    {name:'created',index:'created', sortable:true, align:"left", width:140, editable:false, sortable:true, search:false},
                    {name:'updated',index:'updated', sortable:true, align:"center", width:120, editable:false, sortable:true, search:false},
                    {name:'status',index:'status', sortable:true, align:"center", width:80, editable:true, sortable:true, edittype:"checkbox", editoptions:{value:"აქტიური:გაუქმებული"}, search:false}
                ],
                rowNum:20,
                height: 400,
                width:1000,
                autowidth: false,
                rowList:[20,50,100],
                pager: jQuery('#pager32'),
                sortname: 'name',
                viewrecords: true,
                sortorder: "asc",
                editurl:"content/lm3/updlm32.jsp",
                caption:"გადახდის მეთოდების სია"
            })
            .navGrid('#pager32',{edit:false,add:false,del:true,view:false,search:false},
                        {dataheight:100,width:350,closeAfterEdit:true,reloadAfterSubmit:false,afterSubmit:checkStatus}, //  default settings for edit
                        {dataheight:100,width:350,closeAfterAdd:true,reloadAfterSubmit:true,afterSubmit:checkStatus}, //  default settings for add
                        {dataheight:100,width:350,reloadAfterSubmit:false,afterSubmit:checkStatus},  // delete instead that del:false we need this
                        {multipleSearch:true}, // search options
                        {dataheight:100,width:350,labelswidth:"68%",closeOnEscape:true} /* view parameters*/
                )
            .navButtonAdd('#pager32',{caption:"",    buttonicon:"ui-icon-plus", onClickButton: function(){addMethod();},position:"last"})
            .navButtonAdd('#pager32',{caption:"",    buttonicon:"ui-icon-pencil", onClickButton: function(){editMethod(jQuery('#list32').jqGrid('getGridParam','selrow'));},position:"last"})
             ;
    $(".ui-jqgrid-sortable").css('white-space', 'normal');
    $(".ui-jqgrid-sortable").css('height', 'auto');
    
//    jQuery("#list1").sortableRows({ update: function(event, ui) { $.post("content/sortmenu.jsp", { neworder: $("#list1").jqGrid("getDataIDs").join(",") }, function(data){ }); } });
    });


</script>

<table id="list32" width="100%" align="center"></table>
<div id="pager32"></div>
<table id="search" width="100%" align="center"></table>
<div id="methodform" title="გადახდის მეთოდი"><div id="methodform1"></div></div>
    