jQuery(document).ready(function($){
	//jQuery(".selectablecls").selectable();
	jQuery('.hintbox').remove();

	jQuery("select[id$='lstGuestSortBy']").change(function(){
		showjQloading();
		if (jQuery(this).val() == "GN")
		{
			setTimeout("refresh_aList('GName')",2);
		}
		else if (jQuery(this).val() == "RT")
		{
			setTimeout("refresh_aList('roomtypename')",2);
		}
		else if (jQuery(this).val() == "RM")
		{
			setTimeout("refresh_aList('roomname')",2);
		}		
		else if (jQuery(this).val() == "ST")
		{
			setTimeout("refresh_aList('Status')",2);
		}		
	});
	
}); 

var bindHkstatus = function()
{
	var pagename = get_pagename();
	if (pagename == "roomview")
	{
		jQuery(".hkstatus").bind("click",function(){
		var roomId = jQuery(this).parent().parent().attr('id');		
		hkstatus_operation('Roomview','null',roomId);
		});
	}
	
	if (pagename == "stayview")
	{
		jQuery(".hkstatus").live("click",function(){
		var roomId = (jQuery(this).parent().parent().attr('id')).split("_")[1];
		
		var roomhkunit = getRoomHkunit(roomId);
		var tranId='';
		if (roomhkunit['roomopt'].length > 0)
			tranId = roomhkunit['roomopt'][0]['tranunkid'];
		
		hkstatus_operation('Stayview',tranId,roomId);
		});
	}
}


var getRoomHkunit = function(roomunkid)
{
	try
	{
		var operation=0;
		jQuery.ajax({
				async: false,
				data: { 
						opcode: "hku",
						roomunkid:roomunkid
						},
				url: 'newfront.json',
				success: function(data)
				{
					operation=data;
				}
			});
			
			return jQuery.parseJSON(operation);
	}
	catch(e)
	{
		alert("styview :: getRoomHkunit " + e);
	}
}
// Note : function to short Arrilal list from client side.
var sort_by = function(field, reverse, primer){

   reverse = (reverse) ? -1 : 1;

   return function(a,b){

       a = a[field];
       b = b[field];

       if (typeof(primer) != 'undefined'){
           a = primer(a);
           b = primer(b);
       }

       if (a<b) return reverse * -1;
       if (a>b) return reverse * 1;
       return 0;

   }
}
	
// Note : Function to create arrival list from dashboard dao query.
function fun_create_arrivalList(Listdata)
{
	try
		{

		jQuery("#vmenu").empty();
		dataLen = Listdata.length;
		for(var stCnt=0;stCnt<dataLen;stCnt++)
			{
				//console.log (Listdata[stCnt]["roomname"]);
				
				//Manali - 1.0.37.42 - 28 Oct 2013 - START					  
				//Purpose : 3rd parameter in below data variable was trandate from left panel, but on stayview and roomview, it was rental date, so changed here also to rental date
				// Shweta - 1.0.37.42 - 14 Dec 2013,Purpose : Blank two param after StopRoomMove_Flag - Listdata[stCnt]["StopBy"],Listdata[stCnt]["StopByReason"] as data getting from new query
				var data = "checkin"+"|"+Listdata[stCnt]["roomname"]+"|"+Listdata[stCnt]["RentalDate"]+"||"+Listdata[stCnt]["ChkStatus"]+"|"+Listdata[stCnt]["TranId"]+"|"+Listdata[stCnt]["StatusId"]+"|"+Listdata[stCnt]["ArrivalDate"]+"|"+Listdata[stCnt]["DepartureDate"]+"|"+Listdata[stCnt]["GuestName"]+"|"+Listdata[stCnt]["StatusId"]+"|"+Listdata[stCnt]["ReservationNo"]+"|"+Listdata[stCnt]["RoomId"]+"|"+Listdata[stCnt]["RoomTypeId"]+"|"+Listdata[stCnt]["Ownership"]+"|"+Listdata[stCnt]["GroupId"]+"|"+Listdata[stCnt]["RoomType"]+"|"+Listdata[stCnt]["StopRoomMove_Flag"]+"|"+''+"|"+''+"|"+Listdata[stCnt]["groupcolor"]+"|"+Listdata[stCnt]["isSplitFlag"]+"|"+Listdata[stCnt]["isPhysicallyMoved"];//Manali - 1.0.37.42 - 18 Oct 2013, Purpose : Part Of Advance Room Move	
				//Manali - 1.0.37.42 - 28 Oct 2013 - END
				
				data = data.toString().replace(/,/g, "");//Manali - 1.0.37.42 - 22 Nov 2013, Purpose : Fixed bug - If ,(comma) added in room name then in resize transaction, amend stay wrong parameters are counting from statyview.
				
				var li = jQuery('<li/>',{className:'list1 leftrow_lis',id:"list_"+Listdata[stCnt]["ChkStatus"]+"_"+Listdata[stCnt]["TranId"]}).appendTo(jQuery('#vmenu'));
				li.css({'position':'relative','width':'100%'});
				li.attr("title","Right Click");
				
				var vmenu = jQuery('<div/>',{className:'vmenu',id:Listdata[stCnt]["ChkStatus"]+","+Listdata[stCnt]["TranId"]}).appendTo(li);
				vmenu.css({'position':'relative','z-index:':'101',float:'left',padding:'5px 0 4px 5px'});
				
				var gname = jQuery('<span/>',{className:'guest_name'}).appendTo(vmenu);
				
				<!-- Manali - 1.0.36.41 - 07 Aug 2013 - START -->
				<!-- Purpose : Enhancement - Group Transaction Indication by adding group color-->
				if(Listdata[stCnt]["groupcolor"]!='' && Listdata[stCnt]["groupcolor"]!="0")
					var groupcolor = jQuery('<span/>',{className:'groupcolor',title:'Group',style:'display:inline-block;color:'+Listdata[stCnt]["groupcolor"]+';margin: 2px 3px 0px 1px;'}).appendTo(gname);
				else
					var groupcolor = jQuery('<span/>',{className:'groupcolor',title:'Group',style:'display:none;'}).appendTo(gname);
				<!-- Manali - 1.0.36.41 - 07 Aug 2013 - END -->
				
				<!-- Manali - 1.0.34.39 - 30 May 2013 - START -->
				<!-- Purpose : Enhancement - Group leader indication -->
				if(Listdata[stCnt]["Ownership"]==1)
					var groupleader = jQuery('<span/>',{className:'groupleader',title:'Group Leader',style:'display:'}).appendTo(gname);
				else
					var groupleader = jQuery('<span/>',{className:'groupleader',title:'Group Leader',style:'display:none'}).appendTo(gname);
				<!-- Manali - 1.0.34.39 - 30 May 2013 - END -->	
				
				var gstatus = jQuery('<span/>',{className:'guest_status',text:Listdata[stCnt]["Status"]}).appendTo(vmenu);
				var name =  jQuery('<span/>',{className:'link',text:' '+Listdata[stCnt]["GuestName"]}).appendTo(gname);
							jQuery('<br/>').appendTo(gname);
				var hidden =  jQuery('<span/>',{className:'hidden',text:data,id:Listdata[stCnt]["ChkStatus"]+"_"+Listdata[stCnt]["TranId"]}).appendTo(gname);			
				var room = jQuery('<span/>',{className:'room_no',text:Listdata[stCnt]["Room"]}).appendTo(gname);
			}
			jQuery(".vmenu").contextMenu({ menu: 'myMenu', leftButton: true }, 
			function(action, el, pos) { 			
			contextMenuWork(action, el, pos); 
			});
			hidejQloading(100);
		}
	catch(e)
		{
		alert(e);
		}
} 

var arrivalData= '';
function refresh_aList(orderIdx)
{
    try
    {	
	var aLdata = getaListjson();
        aLdata['alist'].sort(sort_by(orderIdx, false, function(a){return ((a == null)?0 :a.toUpperCase());}));
        var dataLen = aLdata ["alist"].length;
        jQuery("#vmenu").remove();
        if (jQuery("#vmenu").length == 0)
	{
            var vmenu= jQuery('<ul/>',{id:'vmenu'});
            vmenu.css({width:"100%",overflow:"hidden"});
            vmenu.appendTo(jQuery("span[id$='LeftRepeater_Container']"));
	}
	arrivalData = aLdata;
        fun_create_arrivalList(aLdata["alist"]);
    }
    catch(e)
    {
        //alert ("genaList "+e);
    }
}

function getaListjson(tranid)
{
    try
    {
        var status='';
	jQuery.ajax({
            async: false,
            data: { 
                opcode: "alist",
		tranid:tranid
                },
            url: 'json/webfront.jsp',
            success: function(data)
            {
                status=data;
            }
	});
        return jQuery.parseJSON(status);
    }
    catch(e)
    {
        alert("styview :: getaListjson " + e);
    }
}

//
//function getRentalStatus()
//{
//	try
//	{
//		var status='0';
//		/*if(localStorage)
//		{
//				if(eALocalStorage.getItemObject("'LS_RentalStatus'")!=null)
//				{
//					status=eALocalStorage.getItemObject("'LS_RentalStatus'");
//					//alert("data from storage");
//				}
//				else
//				{
//					//alert("data from db");
//					jQuery.ajax({
//							async: false,
//							data: { 
//									opcode: "rs"
//									},
//							url: 'newfront.json',
//							success: function(data)
//							{
//								status=data;
//								eALocalStorage.setItem("'LS_RentalStatus'",status);
//							}
//						});
//				}	
//		}		
//		else
//		{  */ 
//			jQuery.ajax({
//						async: false,
//						data: { 
//								opcode: "rs"
//								},
//						url: 'newfront.json',
//						success: function(data)
//						{
//							status=data;
//						}
//					});
//		/* }	*/ 	
//		
//		return jQuery.parseJSON(status);		
//	}
//	catch(e)
//	{
//		alert("styview :: getRentalStatus " + e);
//	}
//}

// value, json obj , match
function getMatch(id,obj,param1)
	{
	try
		{
			var dataLen = obj.length;
			for(var stCnt=0;stCnt<dataLen;stCnt++)
			{
				if (obj[stCnt][param1] == id)
				{
				return (obj[stCnt]);
				}
			}
		}
	catch(e)
		{
		alert ("getMatch "+e);
		}
	}
	
var datepart = function(vDate)
	{
	
	m = vDate.getMonth()+1;
	m=m+100+" ";
	m = m.substring(1,3);
	m = jQuery.trim( m );
						
	d = vDate.getDate();
	d=d+100+" ";
	d = d.substring(1,3);
	d = jQuery.trim( d );
	
	y=vDate.getFullYear();
	var datepart={'m':m,'d':d,'y':y };
	return (datepart);
	//var dt = vDate.getFullYear()+"-"+(m)+"-"+d;
	}	


var dateDiff = function (d1,d2)	
{
	try
	{	
		var ONE_DAY = 1000 * 60 * 60 * 24
		var	t1= validDate(d1,"m/d/y");
		var	t2= validDate(d2,"m/d/y");
		var tm1= t1.getTime();
		var tm2 = t2.getTime();
		
		var difference_ms = Math.abs(tm1 - tm2);
		return(Math.round(difference_ms/ONE_DAY))	
	}
	catch(e)
	{
		lert("styview :: dateDiff " + e);
	}
}	

