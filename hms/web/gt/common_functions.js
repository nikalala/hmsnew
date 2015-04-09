/*Bind Stayview right click on mouse down and mouse up*/
 time=0;
 jQuery(document).mousedown(function(e){
			iframe_Left = e.pageX;
			iframe_Top = e.pageY ;			
	 });

function setmenu_time(t)
	{
		var time = t;
	}
	
	
function debugthis(val)
	{
		jQuery('.debugblock').append('<p> output -> '+ val +'</p>');
	}
function jQueryDebug()
	{
		jQuery('.logo').append("<div class='debugblock'></div>");
		jQuery('.debugblock').css({position:'absolute',top:0,left:0,'z-index':'10000','background':'black','color':'#fff'});
	}
	
//setTimeout('ready()','2000');
jQuery(document).ready(function(){	
		//jQuery('.logo').drags();
		flexlayout();
		hideWait();
		if(serverurl.indexOf('live.ipms247') != -1 || serverurl.indexOf('50.17.200.219') != -1)
		{
			jQuery(document).rightClick(function(event)	{		return false;	});
		}
		
/* Increase the value if any operation done on edittransaction  or Night Audti. */		
try{
	jQuery(".btn").click(function(){
		if (window.tabiframe_edittran != undefined || top.tabiframe_edittran != undefined)
		{
		//jQuery(".isPerformOPT",top.tabiframe_edittran.document).val(parseInt(jQuery(".isPerformOPT",top.tabiframe.document).val())+1);
		}
		
		if (window.NightAudit != undefined || top.NightAudit != undefined)
		{
		if (jQuery("input[id$='hidCloseFlag']").length != 0 || jQuery("input[id$='hidCloseFlag']",top.NightAudit.document).length != 0)
			{
			//parent.debugthis("hidCloseFlag : Found");
			btnId= jQuery(this).attr('id');
				if (btnId.indexOf('btnUpdate') != -1 || btnId.indexOf('btnSave') != -1 || btnId.indexOf('btnAppend') != -1)
					{
					//parent.debugthis("isPerformNightAuditOPT : Found-2");
					jQuery("input[id$='hidCloseFlag']").val(parseInt(jQuery(".hidCloseFlag").val())+1);
					jQuery("input[id$='hidCloseFlag']",top.NightAudit.document).val(parseInt(jQuery(".hidCloseFlag",top.NightAudit.document).val())+1);
					}
				
			}
		}
		
	});
	}
catch(e)	
	{
	alert("(btn).Click "+ e);
	}
	});

/*Set Count for Refresh parent page when there is Edit Transaction Opens.*/
jQuery(document).ready(function(){
	try
		{
	sessionStorage.setItem('local_isPerformOPT',0);
	jQuery(".preventclick").click(function(){
	sessionStorage.setItem('local_isPerformOPT',1+parseInt(sessionStorage.getItem("local_isPerformOPT")));	
	});
		}
	catch(e)
		{
		alert(e);
		}
});


/* Function to Initialize  when document load*/
jQuery(document).ready(function(){
		
	//jQuery('.islang_1').remove();// For default language, class islang_1 is applied on various controls. It indicates language settings option is not applicable to users. Please do not remove this line. - Manali [23-July-2011]
	
	//jQuery('.islang_2').show(); //Manali - 1.0.23.28 - 26 Dec 2011, Purpose - On server, if language option default is selected,then while page loading it first displays language image and then removes it.
		
	jQuery(".txtDecimal").keydown(fun_decimal);
	jQuery(".txtDecimal").focusout(fun_Decimal_keyup)

	jQuery(".txtInteger").keydown(fun_Integer);
	jQuery(".txtInteger").focusout(fun_Integer_keyup);
	
	jQuery(".txtIntegerSigned").keydown(fun_IntegerSigned);
	jQuery(".txtDecimalSigned").keydown(fun_DecimalSigned);
	
	jQuery(".txtInteger").rightClick(function(event)	{
		return false;
	});
				
	jQuery(".txtDecimal").rightClick(function(event)	{
		return false;
	});
	jQuery(".txtIntegerSigned").rightClick(function(event)	{
		return false;
	});
	
	jQuery(".txtDecimalSigned").rightClick(function(event)	{
		return false;
	});
	
	});

/* Functions to accept input to text box */ 

		function fun_decimal(event){ 
				var regex = /^[\w]+(\.[\w]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$/ ;
									
				if (event.keyCode==110 || event.keyCode==190) {
					if(jQuery(this).val().indexOf('.')==-1)
					{
						if(jQuery(this).val().trim()=='')
						{
							jQuery(this).val('0');
						}
						return true;
					}
				}
				if ((event.keyCode >= 48 & event.keyCode <= 57) || (event.keyCode >= 96 & event.keyCode <= 105)) {
					return true;
				}
				if (event.keyCode >= 37 & event.keyCode <= 40) {
					return true;
				}
				if (event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 46) {
					return true;
				}
				return false;
			}

			function fun_Integer(event){ 
				if ((event.keyCode >= 48 & event.keyCode <= 57) || (event.keyCode >= 96 & event.keyCode <= 105)) {
					return true;
				}
				if (event.keyCode >= 37 & event.keyCode <= 40) {
					if (event.keyCode == 38 )
					{
						if(parseInt(jQuery(this).val()) > 0)
						{
							jQuery(this).val(parseInt(jQuery(this).val())-1);
						}
					}
					if (event.keyCode == 40 )
					{
						if(parseInt(jQuery(this).val()) < 1000)
						{
							jQuery(this).val(parseInt(jQuery(this).val())+1);
						}
					}
					return true;
				}
				if (event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 46) {
					return true;
				}
				return false;
			}
			
	var fun_Integer_keyup = function()
		{
		Nna = parseInt(jQuery(this).val(),10)	;
		if(isNaN(Nna))
			{
			jQuery(this).val('');
			}
		else{
			jQuery(this).val(Nna);
			}	
		}
	
	var fun_Decimal_keyup = function()
		{
		Nna = parseFloat(jQuery(this).val())	;
		if(isNaN(Nna))
			{
			jQuery(this).val('');
			}
		else{
			jQuery(this).val(Nna);
			}	
		}

	function fun_IntegerSigned(event){ 
					if (event.keyCode==109 || event.keyCode==189) {
						if(jQuery(this).val().trim()=='')
						{
							jQuery(this).val('-');
						}
						else
						{
							if(jQuery(this).val().trim()!='-')
								jQuery(this).val(jQuery(this).val()*-1);
						}
						return false;
					}
					if ((event.keyCode >= 48 & event.keyCode <= 57) || (event.keyCode >= 96 & event.keyCode <= 105)) {
						return true;
					}
					if (event.keyCode >= 37 & event.keyCode <= 40) {
						if (event.keyCode == 38 )
						{
							if(parseInt(jQuery(this).val()) > 0)
							{
								jQuery(this).val(parseInt(jQuery(this).val())-1);
							}
						}
						if (event.keyCode == 40 )
						{
							if(parseInt(jQuery(this).val()) < 1000)
							{
						 		jQuery(this).val(parseInt(jQuery(this).val())+1);
							}
						}
						return true;
					}
					if (event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 46) {
						return true;
					}
					return false;
				}

	function fun_DecimalSigned(event){ 
					
					if (event.keyCode==109 || event.keyCode==189) {
						if(jQuery(this).val().trim()=='')
						{
							jQuery(this).val('-');
						}
						else
						{
							if(jQuery(this).val().trim()!='-')
								jQuery(this).val(jQuery(this).val()*-1);
						}
						return false;
					}
					
					if (event.keyCode==110 || event.keyCode==190) {
						if(jQuery(this).val().indexOf('.')==-1)
						{
							if(jQuery(this).val().trim()=='')
							{
								jQuery(this).val('0');
							}
							return true;
						}
					}
					if ((event.keyCode >= 48 & event.keyCode <= 57) || (event.keyCode >= 96 & event.keyCode <= 105)) {

						return true;
					}
					if (event.keyCode >= 37 & event.keyCode <= 40) {
						return true;
					}
					if (event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 46) {
						return true;
					}
					return false;
				}
/* Function to get mouse position*/
var mXX=0;
var mYY=0;
jQuery(document).mousedown(function(e){
			//Logger.info('XX : '+e.pageX+' YY : '+e.pageY);
			mXX=e.pageX;
			mYY=e.pageY;
			xx = e.pageX -230;
			yy = e.pageY -110;
	 });
/* Function For Reload Ifrem*/
function reloadIframe (iframename) 
{
	try
	{
	var f = document.getElementById(iframename);
	f.src = f.src;
	}
	catch(e)
	{
	alert("reloadIframe >> "+e)
	}
}

/*Function Unload Tab*/
function unloadTab(tabId,divId)
{
	try{
	
	isfromunload = true;
	//liN= jQuery('.main-tabs li').length;
	//liN =liN-2;
	currentTabIndex = jQuery("#"+tabId).index();
	liN=currentTabIndex -1;
	
	jQuery('.main-tabs li:eq('+liN+')').addClass('ui-tabs-selected ui-state-active');
	currunt_tabid = jQuery('.main-tabs li:eq('+liN+')').attr('id');
	isfromunload=false;
	showMe(currunt_tabid);
	
	var CdivTabId='div_'+currunt_tabid.split('_')[ 1 ];
	frameName = "parent."+jQuery('#'+divId).attr('name');
	jQuery('#'+divId).remove();
	jQuery('#'+tabId).remove();
	eval('delete '+frameName);
	
	if(tabId == "pre_EditTran")
		ready();
	
	}
	catch(e)
	{
		alert ("unloadTab >> "+e);	
	}
}
/*Function closeTab*/
function closeTab(tabid)
{
	try
	{
		//alert(tabid);
	var preTabId='pre_'+tabid;
	var divTabId='div_'+tabid;
	unloadTab(preTabId,divTabId);
	return;
	}
	catch(e)
	{
	alert ("closeTab >> "+e);
	}
}
/* close righclick menu. */	
function closetranmenu(){
	try{
		jQuery('.overlay').hide();
		jQuery('#jqContextMenu').hide();
		jQuery('.contextMenu').hide();
		}
	catch(e)
		{
		alert("closetranmenu >> "+ e);	
		}
 }
/*Function for check all checkbox*/
function check_all()
{
	try
	{
	jQuery(".checkbox_datalist_child").attr('checked', jQuery('.checkbox_datalist_master').is(':checked'));
	}
	catch(e)
	{
	alert("check_all >> "+ e);
	}
}
<!-- Jignesh - 1.0.22.28 - 02 Jan 2012 - START  -->
<!-- Purpose : check matched list -->
function _check_all(t)
{
	try
	{
	jQuery("."+t+"_checkbox_datalist_child").attr('checked', jQuery('.'+t+'_checkbox_datalist_master').is(':checked'));
	}
	catch(e)
	{
	alert("check_all >> "+ e);
	}
}
<!-- Jignesh - 1.0.22.28 - 02 Jan 2012 - END  -->
/* Show Tab content of Clicked Tab */
function showMe(li){
	try{
		if (!isfromunload){
			jQuery('.tabcontent').hide();
			jQuery('.tabcontent',top.document).hide();
			if (li == 'frontDesk')
			{
				jQuery('.ui-state-default').removeClass('ui-tabs-selected ui-state-active');
				jQuery('#frontDesk').addClass('ui-tabs-selected ui-state-active');
				jQuery('.tabmain').attr("style","");
				jQuery('.datepicker').show();
				jQuery(".reportframe").attr('style','visibility:hidden;height:0');

			}
			else
			{
			divid ="div_"+li.split('_')[ 1 ];
			liid ="pre_"+li.split('_')[ 1 ];
			jQuery('.datepicker',top.document).hide();
			jQuery('.ui-state-default').removeClass('ui-tabs-selected ui-state-active');
			jQuery('#'+liid).addClass('ui-tabs-selected ui-state-active');
			reportfrm= jQuery('#'+divid).attr('class');
			if (reportfrm.indexOf('tabiframe_edittran') == -1)
				{
				jQuery(".reportframe").attr('style','visibility:hidden');
				jQuery(".reportframe").attr('style','visibility:hidden;height:0');
				}
			else{
				jQuery(".tabiframe_edittran").hide();
				jQuery(".reportframe").attr('style','visibility:hidden;height:0');
			}
					
			jQuery('#'+divid).attr("style","display:");
			jQuery('.'+divid).show();
			jQuery('.'+divid).attr('style','visibility:');
			}
		return;	
		}
		else
		{
		isfromunload=false;
		}
	}
	catch(e)
	{
	alert("showMe >>"+e)	
	}
	
}

//HRK - START
function clientSize(win) {
    try
	{
		var width, height;
        if(win.innerWidth || win.innerHeight) {
                width = win.innerWidth;
                height = win.innerHeight;
        } else {
                var doc = win.document;
                width = doc.documentElement.clientWidth || doc.body.clientWidth;
                height = doc.documentElement.clientHeight || doc.body.clientHeight;
        }

        return { width:width, height:height }
	}
	catch(e)
	{
	alert("clientSize >> "+ e);	
	}
}


/*Function Unload popup*/
function unLoadPopup(popupid,refreshgrid)
{	
	try
	{	
		jQuery('#'+popupid).remove();
		frameName ="parent."+popupid;
		jQuery('#iframecontainer_'+popupid).remove();
		jQuery('#popupclose_'+popupid).remove();		
		jQuery('.hintbox').hide();	
		jQuery('.popuptransbg_'+popupid).remove();
		eval('delete '+frameName);
		jQuery(".transbg").css({'opacity':'0.2','filter':'alpha(opacity=20)','-moz-opacity':'0.2'});
		
		if(refreshgrid=='NightAudit')
		{
			showjQloading();
			try
			{
				refreshGridForNightAudit();
			}
			catch(e)
			{
				//ignore error if function not found	
			}
			hidejQloading(5000);
		}
		else if(refreshgrid)
		{
			//console.log(1);
			var parenturl=(window.self.location).toString();
			var urlarr=parenturl.split("front.");
			
			if(urlarr.length >1)
			{
				//console.log(2);
				if(urlarr[1].indexOf("stayview")!=-1)
				{
					//console.log(3);
					showjQloading();
					//refreshGrid();
					loadgridfirsttime(1);
					
				}
				else if(urlarr[1].indexOf("roomview")!=-1)
				{
					//console.log(4);
					showjQloading();
					addWalkin();
					//refreshGrid();
					//refreshArrivalList(); // note needed as clitent side alist implimented there .
				}
				else
				{
					//console.log(5);
					showjQloading();
					refreshArrivalList();
					hidejQloading(3000);
				}
			}
		}		
	}
	catch(e)
	{
		hidejQloading(0);
		alert ("common_functions >> unLoadPopup >> "+e);
	}
}

/*from loading to display transbg on uniFrame Popup*/	
function frmLoading(action)
		{
			try
			{
				 
				switch (action) 
				{
				case ('show'):
				frmId = jQuery('.frm_Popup').attr('id');

				var loader  = {
   					html: loadingDiv(),
					width: jQuery('.frm_Popup').width(),
					top:0
				 };
				 
				jQuery('.frm_Popup').append("<div class='transbg "+frmId +"'>"+loader.html+"</div>");
				rotate();
				jQuery(".cssloading").css({position:'relative','top':loader.top,left:Math.round(loader.width/2.6)});
				frmHeight= jQuery('.frm_Popup').height();
				frmWidth= jQuery('.frm_Width').width();
				jQuery('.'+frmId).css({left : '0px', top : '0px',position: 'absolute', width: '100%', height: frmHeight+'px', zIndex: '900'});
				break;
				case ('hide'):
					jQuery('.'+frmId).remove();
					
				}
			}
			catch(e)
			{
				alert("common_functions >> frmLoading "+e);
			}
		}
/*Function Show Dynamic Loading requier to pass loading name.*/
function NewshowjQloading(id)
{
	try{
	var htmlHeight =clientSize(this).height;
	var htmlloading = "<span class='loadspan'></span>";
	 jQuery("<div id='temp' class='transbg_"+id+"' >"+htmlloading+"</div>").css({left : '0px', top : '0px',position: 'absolute', width: '100%',opacity:'0.5', height: htmlHeight+'px', zIndex: '900',cursor:'wait' }).appendTo(document.body);
	}catch(e){
	alert("NewshowjQloading >> "+ e);
	}
}
/*Function Hide Dynamic Loading requier to pass loading name.*/
function NewhidejQloading(id)
{
	try{
	jQuery('.transbg_'+id).remove();
	//setTimeout('ready()','100');
	}catch(e){
	alert("NewhidejQloading >> "+ e);	
	}
} 

/*Function Show Loading*/
function showjQloading()
{
	try{
		var htmlHeight = document.documentElement.clientHeight;
		jQuery('.transbg').attr('style','display:block');
		jQuery('.transbg').css({left : '0px', top : '0px',position: 'absolute', width: '100%', height: htmlHeight+'px', zIndex: '900',"cursor":"wait"});
	}
	catch(e){
	alert("showjQloading >> "+ e);
	}
}

/*Function Hide Loading*/
function hidejQloading(time)
{
	try{
		jQuery('.transbg').fadeOut(time);
		jQuery('.transbg').css({"cursor":"default"});
		setTimeout('ready()','100'); 
	}
	catch(e){
	alert("hidejQloading >> "+ e);
	}
} 
/*Function Get Current page name.*/
function get_pagename()
	{
	try
		{
		var page=window.location.pathname;
		var idx = page.lastIndexOf('.')+1;
		return (page.substr(idx))
		}
	catch(e)
		{
		alert ('get_pagename >> '+e);
		}
	}
function flexlayout()
	{
		try{
		Header = jQuery('header').height();
		Footer = jQuery('footer').height();
		var Screen = document.documentElement.clientHeight;
		
		flexHeight = Screen-(parseInt(Header)+2)-Footer; 
		flexHeight = (flexHeight < 650) ? 650 : flexHeight;
		jQuery('.container_outer').css("height",flexHeight+'px');
		}catch(e){
		alert("flexlayout >> "+ e);
		}
	}	
		
/*==============================================================================
Function Name : jMessage 
Defination : Notificaton Message 
===============================================================================*/
function jMessage(msg,type,hposition,vposition)
	{
	try{	
		switch (type) 
		{
		case ('Success'):
			jSuccess(msg,{
			  autoHide : true,
			  clickOverlay : false,
			  HorizontalPosition : hposition,
			  VerticalPosition : vposition,
			  icnClass  :'success1',
			  TimeShown : 3000
			});
			break;
		case ('Warning'): 
			console.log(123);
			jNotify(msg,{
			  autoHide : true,
			  clickOverlay : true,
			  HorizontalPosition : hposition,
			  VerticalPosition : vposition,
			  ShowOverlay : false,
			  icnClass  :'jInfo',
			  TimeShown : 3000
			});
			break;
		case ('Error'): 
			jError(msg,{
			  autoHide : true,
			  clickOverlay : true,
			  HorizontalPosition : hposition,
			  VerticalPosition : vposition,
			  ShowOverlay : false,
			  icnClass  :'jError',
			  TimeShown : 3000
			});
			break;	
		case ('WarningO'): 
			console.log(msg+"|"+hposition+"|"+vposition+"|"+type);			
			jNotify(msg,{
			  autoHide : true,
			  clickOverlay : true,
			  HorizontalPosition : hposition,
			  VerticalPosition : vposition,
			  ShowOverlay : true,
			  icnClass  :'jInfo',
			  TimeShown : 5000
			});
			break;
		case ('ErrorO'): 
			jError(msg,{
			  autoHide : true,
			  clickOverlay : true,
			  HorizontalPosition : hposition,
			  VerticalPosition : vposition,
			  ShowOverlay : true,
			  icnClass  :'jError',
			  TimeShown : 3000
			});
			break;
		 }
			 
	   }
	 catch(e)
		{
		alert("common :: jMessage " + e);
		}
	} 
/* End jNotify.jquery*/	
function hideWait()
	{
		try
		{
		jQuery("#jNotify").remove();
		jQuery("#jOverlay").remove();
		}
		catch(e)
		{
		alert("common :: hideWait " + e);
		}
	}	



function showNotification(msg)
{
	jSuccess(msg,{
	  autoHide : true,
	  clickOverlay : true,
	  HorizontalPosition : 'center',
	  VerticalPosition : 'center',
	  icnClass  :'success1',
	  TimeShown : 5000
	});
}
function Wait()
	{
	 document.body.style.cursor = "progress";
	}
function NoWait()
	{
	document.body.style.cursor = "auto";
	}
function setTooltip(localclass)
	{
	if(get_pagename() == 'dashboard')
		{
		jQuery('.'+localclass).attr('title','Click for more details');
		}else{
		jQuery('.'+localclass).attr('title','Right click for more option');	
		}
	}	
	


/*-----------------------------------------------------------------------------------------------------
File name : common_Functions.js
Created By : Jignesh
Date : 22th April 2011
Defination  : css3 Autogenerate Loading
-------------------------------------------------------------------------------------------------------*/
function loadingDiv() 
	{
	try	{
		var html= '<ul id="cssloading" class="cssloading" style="-webkit-transform: scale(0.5) rotate(90deg); ">';
		html +=	'<li class="bar1"></li>';
		html += '<li class="bar2"></li>';
		html += '<li class="bar3"></li>';
		html += '<li class="bar4"></li>';
		html += '<li class="bar5"></li>';
		html += '<li class="bar6"></li>';
		html += '<li class="bar7"></li>';
		html += '<li class="bar8"></li>';
		html += '</ul>';
		return(html);
		}
	catch(e)
		{
		alert("common_function >> loadingDiv" + e);	
		}
	}	

var count = 0;
function rotate()
	{
	var elem2 = document.getElementById('cssloading');
	if(elem2 != null)
		{
		elem2.style.MozTransform = 'scale(0.5) rotate('+count+'deg)';
		elem2.style.WebkitTransform = 'scale(0.5) rotate('+count+'deg)';
		if (count==360) { count = 0 }
		count+=45;
		window.setTimeout(rotate, 100);
		}
	}
/*Start Right Click ui*/
	if(jQuery) (function(){
	jQuery.extend(jQuery.fn, {
		
		rightClick: function(handler) {
			jQuery(this).each( function() {
				jQuery(this).mousedown( function(e) {
					var evt = e;
					jQuery(this).mouseup( function() {
						jQuery(this).unbind('mouseup');
						if( evt.button == 2 ) {
							handler.call( jQuery(this), evt );
							return false;
						} else {
							return true;
						}
					});
				});
				jQuery(this)[0].oncontextmenu = function() {
					return false;
				}
			});
			return jQuery(this);
		},		
		
		rightMouseDown: function(handler) {
			jQuery(this).each( function() {
				jQuery(this).mousedown( function(e) {
					if( e.button == 2 ) {
						handler.call( jQuery(this), e );
						return false;
					} else {
						return true;
					}
				});
				jQuery(this)[0].oncontextmenu = function() {
					return false;
				}
			});
			
			return jQuery(this);
		},
		
		rightMouseUp: function(handler) {
			jQuery(this).each( function() {
				jQuery(this).mouseup( function(e) {
					if( e.button == 2 ) {
						handler.call( jQuery(this), e );
						return false;
					} else {
						return true;
					}
				});
				jQuery(this)[0].oncontextmenu = function() {
					return false;
				}
			});
			
			return jQuery(this);
		},
		
		noContext: function() {
			jQuery(this).each( function() {
				jQuery(this)[0].oncontextmenu = function() {
					return false;
				}
			});
			return jQuery(this);
		}
		
	});
	
})(jQuery);	
/*Edn Right Click ui*/

/* Start jNotify.jquery*/
(function($){
	var win='';
	$.jNotify = {
		defaults: {
			/** VARS - OPTIONS **/
			autoHide : true,				// Notify box auto-close after 'TimeShown' ms ?
			clickOverlay : false,			// if 'clickOverlay' = false, close the notice box on the overlay click ?
			MinWidth : 200,					// min-width CSS property
			TimeShown : 1500, 				// Box shown during 'TimeShown' ms
			ShowTimeEffect : 200, 			// duration of the Show Effect
			HideTimeEffect : 200, 			// duration of the Hide effect
			LongTrip : 15,					// in pixel, length of the move effect when show and hide
			HorizontalPosition : 'right', 	// left, center, right
			VerticalPosition : 'bottom',	 // top, center, bottom
			ShowOverlay : true,				// show overlay behind the notice ?
			ColorOverlay : '#000',			// color of the overlay
			OpacityOverlay : 0.3,			// opacity of the overlay
			icnClass : '',
			
			/** METHODS - OPTIONS **/
			onClosed : null,
			onCompleted : null,
			isConfirm : false,
			isAlert : false,
			isErrorValid:false
		},
		
		/*****************/
		/** Init Method **/
		/*****************/
		init:function(msg, options, id) {
			opts = $.extend({}, $.jNotify.defaults, options);

			/** Box **/
			if($("#"+id).length == 0)
				$Div = $.jNotify._construct(id, msg);

			// Width of the Brower
			WidthDoc = parseInt($(window).width());
			HeightDoc = parseInt($(window).height());

			// Scroll Position
			ScrollTop = parseInt($(window).scrollTop());
			ScrollLeft = parseInt($(window).scrollLeft());

			// Position of the jNotify Box
			posTop = $.jNotify.vPos(opts.VerticalPosition);
			posLeft = $.jNotify.hPos(opts.HorizontalPosition);
			
		 	 // Jignesh 30 sep 2011 -- Start
			$Div
			.css({
				top: posTop,
				left : posLeft,
				opacity : 1
			}); 
			// Jignesh 30 sep 2011 -- End

			// Show the jNotify Box
			if(opts.ShowOverlay && $("#jOverlay").length == 0)
				{
				$.jNotify._showOverlay($Div);
				}

			$.jNotify._show(msg);
		},

		/*******************/
		/** Construct DOM **/
		/*******************/
	 
		_construct:function(id, msg) {
			
			if($.jNotify.isAlert)
			{
				
				var  msg1 = "<h2 class='alert_head'>	";
					 msg1 += "	Alert ";
					 msg1 += "	</h2>";
					 msg1 += "	<div class='jAlert_container'>";
					 msg1 += "	<p>";
					 msg1 += msg
					 msg1 += "	</p>";
					 msg1 += "	</div>	";
					 msg1 += "	<ul class='btn_bar'>";
					 msg1 += "	<li>	";			
					 msg1 += "		<input type='submit' class='btn btnpad btnexsm btn_notify' value='OK' onclick=='return true' />";
					 msg1 += "	</li>";
					 msg1 += "	</ul>";
					 
					 msg=msg1;
			}
			else if($.jNotify.isConfirm)
			{
				var  msg1 = "<h2 class='alert_head'>	";
					 msg1 += "	Confirm ";
					 msg1 += "	</h2>";
					 msg1 += "	<div class='jConfirm_container'>";
					 msg1 += "	<p>";
					 msg1 += msg
					 msg1 += "	</p>";
					 msg1 += "	</div>	";
					 msg1 += "	<ul class='btn_bar'>";
					 msg1 += "	<li>	";			
					 msg1 += "		<input type='submit' class='btn btnpad btnexsm btn_notify' value='Yes' onclick=='return true' />";
					 msg1 += "		<input type='submit' class='btn btnpad btnexsm btn_notify' value='No' onclick=='return false'/>";					
					 msg1 += "	</li>";
					 msg1 += "	</ul>";
					 
					 msg=msg1;
			}
			if($.jNotify.isErrorValid)
			{
				msg="<div class='messageSummery'>"+msg+"</div>";
			}
			$Div = 
			$('<div id="'+id+'" class="notifyicon"/>')
			.css({opacity : 0,minWidth : opts.MinWidth})
			.html("<span class="+opts.icnClass +"><a/></span>"+msg)
			.appendTo('body');
			return $Div;
		},

		/**********************/
		/** Postions Methods **/
		/**********************/
		vPos:function(pos) {
			switch(pos) {
				case 'top':
					var vPos = ScrollTop + parseInt($Div.outerHeight(true)/2);
					break;
				case 'center':
					var vPos = ScrollTop + (HeightDoc/2) - (parseInt($Div.outerHeight(true))/2);
					break;
				case 'bottom':
					var vPos = ScrollTop + HeightDoc - parseInt($Div.outerHeight(true));
					break;
			}
			return vPos;
		},

		hPos:function(pos) {
			switch(pos) {
				case 'left':
					var hPos = ScrollLeft;
					break;
				case 'center':
					var hPos = ScrollLeft + (WidthDoc/2) - (parseInt($Div.outerWidth(true))/2);
					break;
				case 'right':
					var hPos = ScrollLeft + WidthDoc - parseInt($Div.outerWidth(true));
					break;
			}
			return hPos;
		},

		/*********************/
		/** Show Div Method **/
		/*********************/
		_show:function(msg) {
			$Div
			.css({
				top: posTop,
				left : posLeft
			});
			switch (opts.VerticalPosition) {
				case 'top':
					$Div.animate({
						top: posTop + opts.LongTrip,
						opacity:1
					},opts.ShowTimeEffect,function(){
						if(opts.onCompleted) opts.onCompleted();
					});
					if(opts.autoHide)
						$.jNotify._close();
					else
					{
						if($.jNotify.isConfirm || $.jNotify.isAlert)
						{
							$('.btn_notify').click(function(e){
								$.jNotify._close();
							});
						}
						else
						{
							$Div.css('cursor','pointer').click(function(e){
								$.jNotify._close();
							});
						}
					}
					break;
				case 'center':
					$Div.animate({
						opacity:1
					},opts.ShowTimeEffect,function(){
						if(opts.onCompleted) opts.onCompleted();
					});
					if(opts.autoHide)
						$.jNotify._close();
					else
						{
						if($.jNotify.isConfirm || $.jNotify.isAlert)
						{
							$('.btn_notify').click(function(e){
								$.jNotify._close();
							});
						}
						else
						{
							$Div.css('cursor','pointer').click(function(e){
								$.jNotify._close();
							});
						}
					}
					break;
				case 'bottom' :
					$Div.animate({
						top: posTop - opts.LongTrip,
						opacity:1
					},opts.ShowTimeEffect,function(){
						if(opts.onCompleted) opts.onCompleted();
					});
					if(opts.autoHide)
						$.jNotify._close();
					{
						if($.jNotify.isConfirm || $.jNotify.isAlert)
						{
							$('.btn_notify').click(function(e){
								$.jNotify._close();
							});
						}
						else
						{
							$Div.css('cursor','pointer').click(function(e){
								$.jNotify._close();
							});
						}
					}
					break;
			}
		},

		_showOverlay:function(el){
			var overlay = 
			$('<div id="jOverlay" />')
			.css({
				backgroundColor : opts.ColorOverlay,
				opacity: opts.OpacityOverlay
			})
			.appendTo('body')
			.show();

			el.appendTo('body'); // Jignesh 30 sep 2011
			
			if(opts.clickOverlay)
			overlay.click(function(e){
				e.preventDefault();
				$.jNotify._close();
			});
		},


		_close:function(){
				switch (opts.VerticalPosition) {
					case 'top':
						if(!opts.autoHide)
							opts.TimeShown = 0;
						$Div.delay(opts.TimeShown).animate({
							top: posTop-opts.LongTrip,
							opacity:0
						},opts.HideTimeEffect,function(){
							$(this).remove();
							if(opts.ShowOverlay && $("#jOverlay").length > 0)
								$("#jOverlay").remove();
								if(opts.onClosed) opts.onClosed();
						});
						break;
					case 'center':
						if(!opts.autoHide)
							opts.TimeShown = 0;
						$Div.delay(opts.TimeShown).animate({
							opacity:0
						},opts.HideTimeEffect,function(){
							$(this).remove();
							if(opts.ShowOverlay && $("#jOverlay").length > 0)
								$("#jOverlay").remove();
								if(opts.onClosed) opts.onClosed();
						});
						break;
					case 'bottom' :
						if(!opts.autoHide)
							opts.TimeShown = 0;
						$Div.delay(opts.TimeShown).animate({
							top: posTop+opts.LongTrip,
							opacity:0
						},opts.HideTimeEffect,function(){
							$(this).remove();
							if(opts.ShowOverlay && $("#jOverlay").length > 0)
								$("#jOverlay").remove();
								if(opts.onClosed) opts.onClosed();
						});
						break;
				}
		},

		_isReadable:function(id){
			if($('#'+id).length > 0)
				return false;
			else
				return true;
		}
	};

	/** Init method **/
	jNotify = function(msg,options) {
		if($.jNotify._isReadable('jNotify'))
			$.jNotify.init(msg,options,'jNotify');
	};

	jSuccess = function(msg,options) {
		if($.jNotify._isReadable('jSuccess'))
			$.jNotify.init(msg,options,'jSuccess');
	};

	jError = function(msg,options) {
		if($.jNotify._isReadable('jError'))
			$.jNotify.init(msg,options,'jError');
	};
	
	jConfirm = function(msg,options) {
		$.jNotify.isConfirm=true;
		$.jNotify.isAlert=false;
		if($.jNotify._isReadable('jConfirm'))
			$.jNotify.init(msg,options,'jConfirm');
	};
	
	jAlert = function(msg,options) {
		$.jNotify.isAlert=true;
		$.jNotify.isConfirm=false;
		if($.jNotify._isReadable('jAlert'))
			$.jNotify.init(msg,options,'jAlert');
	};
	
	jErrorValid = function(msg,options) {
		$.jNotify.isErrorValid=true;
		if($.jNotify._isReadable('jErrorValid'))
			$.jNotify.init(msg,options,'jErrorValid');
	};

})(jQuery);

/* Start Custome jQError Error message */
var fun_AppendTooltip = function(thisId,id,msg,position,style)
	{
		
		if(jQuery("#"+id).length == 0 )
		{
		cssStyle = 	(style != null) ? 'style='+style : '' ;
		jQuery("#"+thisId).after("<span "+cssStyle+ " id="+id+" class=validation_control_span>"+msg+"</span>");
		//jQuery("#"+id).css({'position':'absolute','float':'left','visibility':'visible'}).html(msg);
		jQuery("#"+id).addClass('validation_control');
			if(position != undefined)
				{
					jQuery("#"+id).addClass(position);
				}
		jQuery("#"+thisId).addClass('validfailed');
		}
	}
var fun_RemoveTooltip = function(thisId,id,msg,position,style)
	{
		try
		{
		jQuery("#"+thisId).change(function(){
			if (jQuery(this).val() != '')
				{
				jQuery("#"+id).remove();
				jQuery("#"+thisId).removeClass('validfailed');
				}
				else
				{
				fun_AppendTooltip(thisId,id,msg,position);
				}
			});
		}
		catch(e)
		{
		alert(e);
		}
	}
/* End Custome jQError Message*/
/* Start contextmenu ui */
//dbl click cout  // var c_count =0;
if (jQuery) (function() {
    jQuery.extend(jQuery.fn, {
        contextMenu: function(o, callback) {
            // Defaults
            if (o.menu == undefined) return false;
            if (o.inSpeed == undefined) o.inSpeed = 150;
            if (o.outSpeed == undefined) o.outSpeed = 75;
            if (o.leftButton == undefined) o.leftButton = false;
            // 0 needs to be -1 for expected results (no fade)
            if (o.inSpeed == 0) o.inSpeed = -1;
            if (o.outSpeed == 0) o.outSpeed = -1;
			 
            // Loop each context menu
            jQuery(this).each(function() {
									   
                var el = jQuery(this);
                var offset = jQuery(el).offset();
                // Add contextMenu class
                jQuery('#' + o.menu).addClass('contextMenu');
                // Simulate a true right click
                jQuery(this).mousedown(function(e) {
                    var evt = e;
					//console.log(el);
					 checkstatus(el,jQuery(this)); // fucntion to filer menu .
		 			 
					 
                    jQuery(this).mouseup(function(e) {
						//dbl click cout  // c_count++;
                        var srcElement = jQuery(this);
                        jQuery(this).unbind('mouseup');
                        if (evt.button == 2 || o.leftButton == true) {
                            // Hide context menus that may be showing
                            jQuery(".contextMenu").hide();
                            // Get this context menu
							
                    	  	var menu = jQuery('#' + o.menu);
					
					        if (jQuery(el).hasClass('disabled')) return false;

                            // Detect mouse position
                            var d = {}, x, y;
                            if (self.innerHeight) {
                                d.pageYOffset = self.pageYOffset;
                                d.pageXOffset = self.pageXOffset;
                                d.innerHeight = self.innerHeight;
                                d.innerWidth = self.innerWidth;
                            } else if (document.documentElement &&
								document.documentElement.clientHeight) {
                                d.pageYOffset = document.documentElement.scrollTop;
                                d.pageXOffset = document.documentElement.scrollLeft;
                                d.innerHeight = document.documentElement.clientHeight;
                                d.innerWidth = document.documentElement.clientWidth;
                            } else if (document.body) {
                                d.pageYOffset = document.body.scrollTop;
                                d.pageXOffset = document.body.scrollLeft;
                                d.innerHeight = document.body.clientHeight;
                                d.innerWidth = document.body.clientWidth;
                            }
                            (e.pageX) ? x = e.pageX : x = e.clientX + d.scrollLeft;
                            (e.pageY) ? y = e.pageY : x = e.clientY + d.scrollTop;

                            var client_width = document.documentElement.clientWidth;
							var client_height = document.documentElement.clientHeight;
							

							
							// Show the menu
                            jQuery(document).unbind('click');
						  //dbl click cout  // 
                          /* if (c_count <= 2)
						  	{*/
							   	var conextmenu_width = jQuery(".contextMenu").width()+12;
							  	var conextmenu_height = jQuery(".contextMenu").height()+12;
								x= ((x+conextmenu_width)  > client_width) ? x-(conextmenu_width) : x ;
								y= ((y+conextmenu_height)  > client_height) ? y-(conextmenu_height) : y ;
							   
							   jQuery(menu).css({ top: y, left: x+2 }).fadeIn(o.inSpeed);
							   jQuery('#tInfo').hide(1);
							/*}
							else if (c_count == 4)
							{
								var conextmenu_width = jQuery("#tInfo").width()+12;
								var conextmenu_height = jQuery("#tInfo").height()+12;
								x= ((x+conextmenu_width)  > client_width) ? x-(conextmenu_width) : x ;
								y= ((y+conextmenu_height)  > client_height) ? y-(conextmenu_height) : y ;
								jQuery('#' + o.menu).hide(1);
								
								getTransactiondata(el);
								jQuery('#tInfo').css({ top: y, left: x+2 }).fadeIn(o.inSpeed);
							}*/
						  
						   
						   // Hover events
                            jQuery(menu).find('A').mouseover(function() {
                                jQuery(menu).find('LI.hover').removeClass('hover');
                                jQuery(this).parent().addClass('hover');
                            }).mouseout(function() {
                                jQuery(menu).find('LI.hover').removeClass('hover');
                            });

                            // Keyboard
                            jQuery(document).keypress(function(e) {
                                switch (e.keyCode) {
                                    case 38: // up
                                        if (jQuery(menu).find('LI.hover').size() == 0) {
                                            jQuery(menu).find('LI:last').addClass('hover');
                                        } else {
                                            jQuery(menu).find('LI.hover').removeClass('hover').prevAll('LI:not(.disabled)').eq(0).addClass('hover');
                                            if (jQuery(menu).find('LI.hover').size() == 0) jQuery(menu).find('LI:last').addClass('hover');
                                        }
                                        break;
                                    case 40: // down
                                        if (jQuery(menu).find('LI.hover').size() == 0) {
                                            jQuery(menu).find('LI:first').addClass('hover');
                                        } else {
                                            jQuery(menu).find('LI.hover').removeClass('hover').nextAll('LI:not(.disabled)').eq(0).addClass('hover');
                                            if (jQuery(menu).find('LI.hover').size() == 0) jQuery(menu).find('LI:first').addClass('hover');
                                        }
                                        break;
                                    case 13: // enter
                                        jQuery(menu).find('LI.hover A').trigger('click');
                                        break;
                                    case 27: // esc
                                        jQuery(document).trigger('click');
                                        break
                                }
                            });

                            // When items are selected
                            jQuery('#' + o.menu).find('A').unbind('click');
                            jQuery('#' + o.menu).find('LI:not(.disabled) A').click(function() {
                                jQuery(document).unbind('click').unbind('keypress');
                                jQuery(".contextMenu").hide();
                                // Callback
                                if (callback) callback(jQuery(this).attr('href').substr(1), jQuery(srcElement), { x: x - offset.left, y: y - offset.top, docX: x, docY: y });
                                return false;
                            });

                            // Hide bindings
                            setTimeout(function() { // Delay for Mozilla
                                jQuery(document).click(function() {
                                    jQuery(document).unbind('click').unbind('keypress');
                                    jQuery(menu).fadeOut(o.outSpeed);
                                    return false;
                                });
                            }, 0);
						   
                        }
						
                   }); // end of mouseup
				   
				   
                }); // End of mouseDown

                // Disable text selection
                if (jQuery.browser.mozilla) {
                    jQuery('#' + o.menu).each(function() { jQuery(this).css({ 'MozUserSelect': 'none' }); });
                } else if (jQuery.browser.msie) {
                    jQuery('#' + o.menu).each(function() { jQuery(this).bind('selectstart.disableTextSelect', function() { return false; }); });
                } else {
                    jQuery('#' + o.menu).each(function() { jQuery(this).bind('mousedown.disableTextSelect', function() { return false; }); });
                }
                // Disable browser context menu (requires both selectors to work in IE/Safari + FF/Chrome)
                jQuery(el).add('UL.contextMenu').bind('contextmenu', function() { return false; });

            });
            return jQuery(this);
        },

        // Disable context menu items on the fly
        disableContextMenuItems: function(o) {
            if (o == undefined) {
                // Disable all
                jQuery(this).find('LI').addClass('disabled');
                return (jQuery(this));
            }
            jQuery(this).each(function() {
                if (o != undefined) {
                    var d = o.split(',');
                    for (var i = 0; i < d.length; i++) {
                        jQuery(this).find('A[href="' + d[i] + '"]').parent().addClass('disabled');

                    }
                }
            });
            return (jQuery(this));
        },

        // Enable context menu items on the fly
        enableContextMenuItems: function(o) {
            if (o == undefined) {
                // Enable all
                jQuery(this).find('LI.disabled').removeClass('disabled');
                return (jQuery(this));
            }
            jQuery(this).each(function() {
                if (o != undefined) {
                    var d = o.split(',');
                    for (var i = 0; i < d.length; i++) {
                        jQuery(this).find('A[href="' + d[i] + '"]').parent().removeClass('disabled');

                    }
                }
            });
            return (jQuery(this));
        },

        // Disable context menu(s)
        disableContextMenu: function() {
			//console.log("disableContextMenu");
            jQuery(this).each(function() {
                jQuery(this).addClass('disabled');
            });
            return (jQuery(this));
        },

        // Enable context menu(s)
        enableContextMenu: function() {
			//console.log("enableContextMenu");
            jQuery(this).each(function() {
                jQuery(this).removeClass('disabled');
            });
            return (jQuery(this));
        },

        // Destroy context menu(s)
        destroyContextMenu: function() {
            // Destroy specified context menus
			//console.log("destroyContextMenu");
            jQuery(this).each(function() {
                // Disable action
                jQuery(this).unbind('mousedown').unbind('mouseup');
            });
            return (jQuery(this));
        },
		
		_canDrag: function(){
			//console.log("_canMove");
			},
		_canMove: function(){
			//console.log("_canMove");
			},
		_canLClick:	function(){
			//console.log("_canLClick");
			}

    });
})(jQuery);

var checkstatus = function(el,selobj) 
{
	jQuery("#myMenu").hide();
	console.log(jQuery(el));
	tmpId= jQuery(el).attr('id');	
	
	console.log(tmpId);
	nameId = tmpId.split(",")[0]+'_'+tmpId.split(",")[1];
	
	if(jQuery("input[id$='hidPageName']").val()=="stayview")
		dragdropresizetransaction('_'+tmpId.split(",")[0]+'_'+tmpId.split(",")[1]); //Manali - 1.0.35.40 - 22 Jul 2013,Purpose : Enhancement - Resize Drag drop transaction
	
	var chkparameters='';
	
	//Manali - 1.0.37.42 - 23 Nov 2013 - START
	//Purpose : Enhancement : Part Of Advance Room Move	
	chkparameters = selobj.find(".hidden").text();
	//console.log(jQuery("#_"+tmpId.split(",")[0]+"_"+tmpId.split(",")[1]+" .hidden").length);
	/*	Commented below code - Checked clicked paramater span value
		if (jQuery("#_"+tmpId.split(",")[0]+"_"+tmpId.split(",")[1]+" .hidden").length)
		{
		chkparamters=jQuery("#_"+tmpId.split(",")[0]+"_"+tmpId.split(",")[1]+" .hidden").text();
		}
		else
		{
		//Jignesh - 15 sep 2011
		//Reason - get chkparamters from arrival list if room is not assigne to transaction.
		chkparamters=jQuery("#list_"+tmpId.split(",")[0]+"_"+tmpId.split(",")[1]+" .hidden").text();
		}
	*/
	//Manali - 1.0.37.42 - 23 Nov 2013 - END
	
	htmlHeight= jQuery('#outer').height();
	
	if (chkparameters != "")
	{
		console.log(chkparameters);
		htmlHeight= jQuery('#outer').height();				
		var todaysdate = jQuery("input[id$='txtHiddenDate']").val();				
		var splitparameters=chkparameters.split("|");	
		var rentaldate=splitparameters[2];//Manali - 1.0.37.42 - 24 Oct 2013, Purpose : Enhancement : Part Of Advance Room Move	
		var status=splitparameters[4];
		var arrival=splitparameters[7];
		var departure=splitparameters[8];
		var splitarrivalDate = arrival.split(" ")[0];
		var splitdepartureDate = departure.split(" ")[0];
		var roomid = splitparameters[12];
		var stoproommove_flag = splitparameters[17];
		var stoproommove_by = splitparameters[18];		
		var isSplitFlag = splitparameters[21]; //Manali - 1.0.37.42 - 24 Oct 2013, Purpose : On transactions where advance rom move is done, exchange room is not possible.
		var isphysicallymoved = splitparameters[22]; //Manali - 1.0.37.42 - 24 Oct 2013, Purpose : Enhancement : Part Of Advance Room Move	
		
		jQuery('.contextMenu li').attr("style","display:none");
		
		if(status != "CHECKEDOUT"){	
			if(status!='UNCONFRESERV' && roomid!='0') //Manali - 1.0.37.42 - 15 Oct 2013, Purpose : Room Move should not be applicable for unconfirmed reservation
				jQuery(".contextMenu #2").removeClass("hide_important");
			else
				jQuery(".contextMenu #2").addClass("hide_important");
			
			jQuery(".contextMenu #3").removeClass("hide_important");
			jQuery(".contextMenu #4").removeClass("hide_important");
			jQuery(".contextMenu #5").removeClass("hide_important");
			jQuery(".contextMenu #6").removeClass("hide_important");			
			show_hide_StopRoomMove(stoproommove_flag,0);					
		}
		else
		{
			jQuery(".contextMenu #2").addClass("hide_important");
			jQuery(".contextMenu #3").addClass("hide_important");
			jQuery(".contextMenu #4").addClass("hide_important");
			jQuery(".contextMenu #5").addClass("hide_important");
			jQuery(".contextMenu #6").addClass("hide_important");
			jQuery(".contextMenu #15").addClass("hide_important");
			jQuery(".contextMenu #16").addClass("hide_important");
			show_hide_StopRoomMove(stoproommove_flag,1);
		}
								 
		if((status == "CONFRESERV" || status == "DAYUSERESERV") && todaysdate == splitarrivalDate && roomid!='0')						
			jQuery(".contextMenu #8").removeClass("hide_important");
		else
			jQuery(".contextMenu #8").addClass("hide_important");	
		
		if(status == "CONFRESERV" || status == "DAYUSERESERV")
			jQuery(".contextMenu #9").removeClass("hide_important");						
		else
			jQuery(".contextMenu #9").addClass("hide_important");
		
		if ((status=='CONFRESERV' || status=='UNCONFRESERV' || status == "DAYUSERESERV") && todaysdate == splitarrivalDate)
			jQuery(".contextMenu #11").removeClass("hide_important");	
		else			
			jQuery(".contextMenu #11").addClass("hide_important");	
									
		if ((status=='CONFRESERV' || status=='UNCONFRESERV' || status == 'DAYUSERESERV') && todaysdate == splitarrivalDate && roomid=='0')
			jQuery(".contextMenu #10").removeClass("hide_important");	
		else
			jQuery(".contextMenu #10").addClass("hide_important");	
		
		if (status=='MAINTENBLOCK')
		{
			jQuery(".menuopt").attr('style',"display:none !important;");
			jQuery(".contextMenu #13").attr('style',"display:block");				
			show_hide_StopRoomMove(stoproommove_flag,1);
		}
		else
		{
			jQuery(".menuopt").attr('style',"display:block");
			jQuery(".contextMenu #13").attr('style',"display:none !important;");							
		}
		
		if (status=='ARRIVAL' || status=='STAYOVER' || status == 'DUEOUT' || status == 'DAYUSE' || status == 'CHECKEDOUT')
			jQuery(".contextMenu #14").removeClass("hide_important");		
		else
			jQuery(".contextMenu #14").addClass("hide_important");	
		
		if (status=='ARRIVAL' || status == 'DAYUSE')
			jQuery(".contextMenu #15").removeClass("hide_important");	
		else
			jQuery(".contextMenu #15").addClass("hide_important");	
		
		if (status=='DAYUSE' || status == 'DUEOUT')
			jQuery(".contextMenu #16").removeClass("hide_important");	
		else
			jQuery(".contextMenu #16").addClass("hide_important");	
			
		if(stoproommove_flag==1 && stoproommove_by==jQuery("input[id$='user']").val())
			jQuery(".contextMenu #18").removeClass("hide_important");
		else
			jQuery(".contextMenu #18").addClass("hide_important");
			
		//Manali - 1.0.37.42 - 28 Sep 2013 - START
		//Purpose : Enhancement : Exchange Room Feature, when advance room move is performed on any transaction, exchange room feature is not applicable on that same transaction 						
		if ((status=='ARRIVAL' || status=='STAYOVER' || status == 'DUEOUT' || status == 'DAYUSE' || status=='CONFRESERV' || status == "DAYUSERESERV")  && roomid!='0' && isSplitFlag==0)  //Manali - 1.0.37.42 - 26 Oct 2013, Purpose : Unconfirmed transaction should not be allowed for exchange rooms feature 
			jQuery(".contextMenu #19").removeClass("hide_important");	
		else
			jQuery(".contextMenu #19").addClass("hide_important");	
		//Manali - 1.0.37.42 - 28 Sep 2013 - END
		
		//Manali - 1.0.37.42 - 24 Oct 2013 - START 
		//Purpose : Enhancement : Part Of Advance Rom Move	
		console.log(splitarrivalDate+"|"+todaysdate+"|"+splitdepartureDate+"|"+isphysicallymoved+"|"+rentaldate);
		if ((isphysicallymoved==0 && isphysicallymoved!='') && (status=='ARRIVAL' || status=='STAYOVER' || status == 'DUEOUT' ) && (rentaldate==todaysdate))
			jQuery(".contextMenu #20").removeClass("hide_important");
		else
			jQuery(".contextMenu #20").addClass("hide_important");	
		//Manali - 1.0.37.42 - 24 Oct 2013 - END
	}
}

function show_hide_StopRoomMove(stoproommove_flag,hideflag)
{
	if(stoproommove_flag==0 && hideflag==0)
		jQuery(".contextMenu #17").removeClass("hide_important");
	else
		jQuery(".contextMenu #17").addClass("hide_important");	
}	

/* After changing language variables from its relevant page, page needs to refreshed to apply the change - Added By Manali[23-July-2011]  - Start */
function refreshPage()
{
	url = parent.window.location.href;
	url = url.replace("#", "");	
	parent.window.location=url;	
}
/* After changing language variables from its relevant page, page needs to refreshed to apply the change - Added By Manali[23-July-2011] - End */

/* Load SetModuleLanguage popup from its relevant module - Added By Manali[23-July-2011]  - Start */

function showLanguageSettings()
{	
	if(jQuery('#div_EditGroupTran').length)
		page_name="front_editgrouptran,front_guestinformation,front_amendgrouproomcharges,front_amendgroupfoliodetail,common_newfdleftpanel";	
	else if(jQuery('#div_EditTran').length)
		page_name="front_edittran,front_guestinformation,front_amendroomcharges,front_amendfoliodetail,common_newfdleftpanel";
	else if(jQuery('#report_iframe').length)
	{	
		page_name="report_"+reportpagename;
	}
	else 
	{
		var page=get_pagename().split("/");
		
		if(page[0]=="folios")
			page_name="front_"+page[0]+","+"common_folioleft";
		else
		{
			if(page[0]=="dashboard")
				page_name="front_"+page[0]+","+"front_guestinformation"+","+"common_newfdleftpanel";
			else				
				page_name="front_"+page[0]+","+"common_newfdleftpanel";
		}
	}
		
	loadPopup('SetModuleLanguage','setmodulelanguage/module/'+page_name,500,900);			
}

function showPopupLanguageSettings(pageurl)
{
	var page=pageurl.split("/");
	loadPopup('SetModuleLanguage','setmodulelanguage/module/front_'+page[0],500,900);			
}
/* Load SetModuleLanguage popup from its relevant module - Added By Manali[23-July-2011]  - End */

/*Added By Flora - Start - sept 21st 2011*/
function call_xcharge(pagename,type,paymentid,tranunkid,lstFolio,lstMaster,txtDateFD,lstCurrency,txtAmount,txtRecVouNo,txtComment,transactiontype)
{	
	switch(transactiontype)
	{		
	case 'CreditSaleTransaction':
			//alert(txtDateFD);
	  		xchargeLoadPopup1(pagename,type,paymentid,tranunkid,lstFolio,lstMaster,txtDateFD,lstCurrency,txtAmount,txtRecVouNo,txtComment,transactiontype);
			break;
	// Flora - 1.0.22.27 - 18 Oct 2011 - START 
	// Purpose - For X-Charge Payment Gatway Add one more case			
	case 'ExtendSaleTransaction':
	  		xchargeLoadPopup1(pagename,type,paymentid,tranunkid,lstFolio,lstMaster,txtDateFD,lstCurrency,txtAmount,txtRecVouNo,txtComment,transactiontype);
			break;	
	// Flora - 1.0.22.27 - 18 Oct 2011 - END
	
	// Flora - 1.0.22.27 - 12 Oct 2011 - START 
	// Purpose - For X-Charge Payment Gatway Add one more case	
	case 'ConvertToSaleTransaction':	
			xchargeLoadPopup3(pagename,txtAmount,paymentid,txtRecVouNo,tranunkid,transactiontype);
			break;
	// Flora - 1.0.22.27 - 12 Oct 2011 - END		
	case 'CreditReturnTransaction':
	  		xchargeLoadPopup1(pagename,type,paymentid,tranunkid,lstFolio,lstMaster,txtDateFD,lstCurrency,txtAmount,txtRecVouNo,txtComment,transactiontype);
			break;
	case 'CreditVoidTransaction':
			if(pagename=='capturedetails')
				xchargeLoadPopup3(pagename,txtAmount,paymentid,txtRecVouNo,tranunkid,transactiontype);
			else
	  		xchargeLoadPopup1(pagename,type,paymentid,tranunkid,lstFolio,lstMaster,txtDateFD,lstCurrency,txtAmount,txtRecVouNo,txtComment,transactiontype);
	 		break;
	case 'CreditAuthTransaction':			
	  		xchargeLoadPopup2(pagename,txtAmount,paymentid,transactiontype,txtRecVouNo);
			break;
	// Flora - 1.0.22.27 - 14 Oct 2011 - START 
	// Purpose : For X-Charge Payment Gatway Add one more case			
	case 'CreditAuthAliasTransaction':
	  		xchargeLoadPopup3(pagename,txtAmount,paymentid,txtRecVouNo,tranunkid,transactiontype);
			break;		
	// Flora - 1.0.22.27 - 14 Oct 2011 - END
	case 'CreditCaptureTransaction':	  		
	xchargeLoadPopup1(pagename,type,paymentid,tranunkid,lstFolio,lstMaster,txtDateFD,lstCurrency,txtAmount,txtRecVouNo,txtComment,transactiontype);
	break;
	case 'AliasCreateTransaction':
		xchargeLoadPopup4(pagename,txtAmount,paymentid,txtRecVouNo,txtComment,transactiontype);
			break;
	/*case 'CreditUpdateTransaction':
			xchargeLoadPopup2(pagename,txtAmount,paymentid,transactiontype);
			break;*/
	}
}//function end

function xchargeLoadPopup1(pagename,type,paymentid,tranunkid,lstFolio,lstMaster,txtDateFD,lstCurrency,txtAmount,txtRecVouNo,txtComment,transactiontype)
{
	if(lstFolio=='' && pagename!='walkin')
	{
		alert("Folio not generated");	
		return false;
	}
	if(txtComment=='' || txtComment==null)
		txtComment='X_NONE';

	if(txtRecVouNo=='' || txtRecVouNo==null)
	{
		alert("Rec/Voucher Number is empty");	
		return false;
	}
	if(pagename=='walkin')
	{
		parent.loadPopup('XChargePayment','payment/PaymentTypeUnkId/'+paymentid+'/tranunkid/'+tranunkid+'/lstMaster/'+lstMaster+'/lstCurrency/'+lstCurrency+'/txtAmount/'+txtAmount+'/txtRecVouNo/'+txtRecVouNo+'/txtComment/'+txtComment+'/pagename/'+pagename+'/type/'+type+'/transactiontype/'+transactiontype,370,492);
	}
	else	
	{
	parent.loadPopup('XChargePayment','payment/PaymentTypeUnkId/'+paymentid+'/tranunkid/'+tranunkid+'/lstFolio/'+lstFolio+'/lstMaster/'+lstMaster+'/txtDateFD/'+txtDateFD+'/lstCurrency/'+lstCurrency+'/txtAmount/'+txtAmount+'/txtRecVouNo/'+txtRecVouNo+'/txtComment/'+txtComment+'/pagename/'+pagename+'/type/'+type+'/transactiontype/'+transactiontype,370,492);
	}
}

function xchargeLoadPopup2(pagename,txtAmount,PaymentTypeUnkId,transactiontype,txtRecVouNo)
{
if(txtRecVouNo!='')
parent.loadPopup('XChargePayment','payment/PaymentTypeUnkId/'+PaymentTypeUnkId+'/txtAmount/'+txtAmount+'/pagename/'+pagename+'/transactiontype/'+transactiontype+'/txtRecVouNo/'+txtRecVouNo,370,492);
else
parent.loadPopup('XChargePayment','payment/PaymentTypeUnkId/'+PaymentTypeUnkId+'/txtAmount/'+txtAmount+'/pagename/'+pagename+'/transactiontype/'+transactiontype,370,492);
}

// Flora - 1.0.22.27 - 12 Oct 2011 - START 
// Purpose - For X-Charge Payment Gatway Add one more case	
function xchargeLoadPopup3(pagename,txtAmount,PaymentTypeUnkId,txtRecVouNo,tranunkid,transactiontype)
{
parent.loadPopup('XChargePayment','payment/PaymentTypeUnkId/'+PaymentTypeUnkId+'/txtAmount/'+txtAmount+'/pagename/'+pagename+'/transactiontype/'+transactiontype+'/txtRecVouNo/'+txtRecVouNo+'/tranunkid/'+tranunkid,370,492);
}
// Flora - 1.0.22.27 - 12 Oct 2011 - END

// Flora - 1.0.22.27 - 12 Oct 2011 - START 
// Purpose - For X-Charge Payment Gatway Add one more case	
function xchargeLoadPopup4(pagename,txtAmount,PaymentTypeUnkId,txtRecVouNo,txtComment,transactiontype)
{
parent.loadPopup('XChargePayment','payment/PaymentTypeUnkId/'+PaymentTypeUnkId+'/txtAmount/'+txtAmount+'/pagename/'+pagename+'/txtRecVouNo/'+txtRecVouNo+'/txtComment/'+txtComment+'/transactiontype/'+transactiontype,370,492);
}
// Flora - 1.0.22.27 - 12 Oct 2011 - END

/*Added By Flora - End - sept 21st 2011*/	

/* End Context menu ui */

//Manali - 1.0.35.40 - 22 Jul 2013 - START
//Purpose : Enhancement - Resize Drag drop transaction
var dragdropresizetransaction = function(val){	
		//alert(val);
	//console.log("dragdropresizetransaction");
	var transaction = jQuery("#"+val);
	var resizetrandata = transaction.find("span.hidden").text();
	var chkParameters = resizetrandata.split("|");
	
	var oldarrival = chkParameters[7];
	var olddeparture = chkParameters[8];
	var transactionid = chkParameters[5];
	var status = chkParameters[4];
	var isTransactionSplitted = chkParameters[21]; //Manali - 1.0.37.42 - 17 Oct 2013, Purpose : Part Of Advance Room Move
	var stoproommove_flag = chkParameters[17];//Manali - 1.0.37.42 - 30 Nov 2013, Purpose : Part Of Advance Room Move
	var roomid = chkParameters[12];
	console.log(oldarrival+"|"+olddeparture+"|"+status+"|"+isTransactionSplitted);
	
	if(isTransactionSplitted==1)
	{
		jQuery("#"+val+".tran_cells").click(function(e,element){		
			jQuery(".tran_cells").removeClass('transelect');
			jQuery("#"+val+".tran_cells").addClass('transelect');
		 });
	}
	else
	{
		//Manali - 1.0.37.42 - 07 Dec 2013 - START
		//Purpose : Fixed Bug - Past date transaction, splitted ones, full transaction selection on click was not allowed 
		/*transaction.click(function(e,element){			
			//alert(val);
			jQuery(".tran_cells").removeClass('transelect');
			
			transaction.addClass('transelect');*/
		
		jQuery("#"+val+".tran_cells").click(function(e,element){		
				jQuery(".tran_cells").removeClass('transelect');
				jQuery("#"+val+".tran_cells").addClass('transelect');
		//Manali - 1.0.37.42 - 07 Dec 2013 - END
		
			//Check transaction status for avoid resizing
			var chkResizeTranStatus = ['CHECKEDOUT','DAYUSERESERV','MAINTENBLOCK'];
			var chkResizeStatus=0;
			
			if(jQuery.inArray(status,chkResizeTranStatus)>=0)	
				chkResizeStatus=1;	
			//console.log(chkResizeStatus);
			
			//Check transaction status for drag/drop
			var chkDragTranStatus = ['CHECKEDOUT'];
			var chkDragStatus=0;
			
			if(jQuery.inArray(status,chkDragTranStatus)>=0)	
				chkDragStatus=1;
			//console.log(chkDragStatus);
			
			//Resize Transaction
			if(chkResizeStatus==0 && transaction.hasClass('transelect')==true)
			{
				//console.log(transaction);
				//console.log(transaction.hasClass('transelect'));
				var position_val_right = new Array();
				var position_val_left = new Array();
				var check_right_tran_position = "-1";
				var check_left_tran_position = "-1";
				var dayuse_left_date = '';
				var dayuse_right_date = '';
				
				var originaltran_left = parseInt(transaction.position().left);
				//console.log("Selected Tran left : "+originaltran_left);
				
				transaction.parent().find(".tran_cells").each(function(index){
					 var t_id = jQuery(this).attr('id');
					 
					 var split_othertran = (jQuery("#"+t_id).find("span.hidden").text()).split("|");
					 var othertran_roomid = split_othertran[12];
					 
					 if(t_id!=val && roomid==othertran_roomid)
					 {
						 var chkother_trans = t_id.split("_");
						 
						 var other_tran_position = parseInt(jQuery("#"+t_id).position().left);
						 
						 //console.log(t_id+" : "+other_tran_position);
						 
						 if(parseInt(other_tran_position) > parseInt(originaltran_left))
						 {
							 if(chkother_trans[1]=="DAYUSERESERV")
							 {
								var dayusetrandata = jQuery("#"+t_id).find("span.hidden").text();
								var dayusechkParameters = dayusetrandata.split("|");
								
								dayuse_right_date = dayusechkParameters[7];	
								other_tran_position = parseInt(other_tran_position)-3;
							 }
								
							 position_val_right.push(parseInt(other_tran_position));
						 }
						 
						 if(other_tran_position<originaltran_left)
						 {
							 if(other_tran_position=="0")
								other_tran_position = parseInt(jQuery("#"+t_id).width());
							 else if(chkother_trans[1]=="DAYUSERESERV" || chkother_trans[1]=="DAYUSE")
							 {
								var dayusetrandata = jQuery("#"+t_id).find("span.hidden").text();
								var dayusechkParameters = dayusetrandata.split("|");
								
								dayuse_left_date = dayusechkParameters[7];	
								other_tran_position = parseInt(jQuery("#"+t_id).width())+parseInt(other_tran_position)+3;
							 }
							 else
								other_tran_position = parseInt(jQuery("#"+t_id).width())+parseInt(other_tran_position);
							 
							  position_val_left.push(parseInt(other_tran_position));				 
						 }
					 }
				});
				
				var tran_maxwidth="-1";
				var tran_minwidth="-1";
				if(position_val_right.length>0)
				{
					check_right_tran_position = position_val_right.min();					
					tran_maxwidth = parseInt(check_right_tran_position)-originaltran_left-5;		
				}
					
				if(position_val_left.length>0)
				{
					check_left_tran_position = position_val_left.max();					
					var tran_minwidth = (originaltran_left-parseInt(check_left_tran_position))+transaction.width();		
				}
					
				console.log("Right Position :"+check_right_tran_position+"|"+tran_maxwidth);
				console.log("Left Position :"+check_left_tran_position+"|"+tran_minwidth);
				
				if(jQuery.inArray(status,['DAYUSE','ARRIVAL','STAYOVER','DUEOUT'])>=0)
				{					
					var allowresizing = "e";
					var min_width=28;
				}
				else
				{
					var allowresizing = "e,w";
					if(status=="CONFRESERV")
						var min_width=56;
					else
						var min_width=28;
				}
				
				console.log(min_width);
				
				transaction.resizable({
							handles: allowresizing,	
							minWidth: min_width,
							resize: function(event, ui){ 
								jQuery("#myMenu").hide();
								
								//console.log(ui.position.left+"|"+ui.originalPosition.left+"|"+ui.size.width);	
								if(jQuery.inArray(status,['DAYUSE','ARRIVAL','STAYOVER','DUEOUT'])>=0 && (parseInt(ui.position.left)+parseInt(ui.size.width)==check_right_tran_position && check_right_tran_position!="-1"))
									jQuery(this).resizable('widget').trigger('mouseup');
								
								if(tran_minwidth!="-1" && ui.position.left<ui.originalPosition.left)
								{
									transaction.resizable({ maxWidth: tran_minwidth });
									if(ui.size.width == tran_minwidth)
										jQuery(this).resizable('widget').trigger('mouseup');
								}
								else
								{
									console.log("Tran Max Width : "+tran_maxwidth+"|"+ui.size.width+"|"+ui.originalSize.width);
									if(tran_maxwidth!="-1")
									{
										transaction.resizable({ maxWidth: tran_maxwidth });
										
										if(ui.size.width>=ui.originalSize.width)
										{
											if(ui.size.width == tran_maxwidth)
												jQuery(this).resizable('widget').trigger('mouseup');
										}
									}
								}
								
								if(ui.size.width == min_width && parseInt(ui.size.width)<=parseInt(ui.originalSize.width))
									jQuery(this).resizable('widget').trigger('mouseup');
								
							},
						stop: function(e, ui) {		
								
								var resize_not_proper = 0;
								console.log(ui.position.left+"|"+check_left_tran_position+"|"+ui.size.width+"|"+ui.originalSize.width+"|"+check_right_tran_position);
								if((check_left_tran_position!="-1" && check_right_tran_position!="-1" && check_left_tran_position!="28" && parseInt(ui.position.left)-parseInt(check_left_tran_position)<=10 && parseInt(ui.size.width)<=parseInt(ui.originalSize.width)) || ((parseInt(ui.position.left)+parseInt(ui.size.width)>=check_right_tran_position && check_right_tran_position!="-1")) || (jQuery.inArray(status,['DAYUSE','ARRIVAL','STAYOVER','DUEOUT'])>=0 && (parseInt(ui.position.left)+parseInt(ui.size.width)==check_right_tran_position && check_right_tran_position!="-1"))) 
									resize_not_proper = 1;								
								else
								{	
									//console.log("Stop :"+ui.originalPosition.left);
									//console.log("Stop :"+ui.position.left);						
									//console.log(ui.originalSize.width);
									//console.log(ui.size.width);
									showWait();	
									var resizedate ='';
									var resize_arrival = '';
									var resize_departure = '';
									var staychange=0;
									var currday = jQuery(".rowhover").find(".bdate").text();
												
									if(currday<10)
										var currday="0"+currday;
									
									var dates= transaction.parent().find(".ui-selectable");
									dates.children('li').each(function(){
										var myclass = jQuery(this).attr("class").split(" ");
										
										if(myclass.length>5)
										{
											var date_val = myclass[5].split("_");
											
											if(date_val[2]==currday)
												resizedate = myclass[5].replace(/_/g,"-");
										}
																				
										if(resizedate!='')
											return false;
									});
									
									//console.log(resizedate);
									
									if(resizedate!='')
									{
										//console.log("Day Use Left Date : "+dayuse_left_date+"| Resize Date : "+resizedate+"|"+"Day Use Right Date : "+dayuse_right_date)
										if((dayuse_left_date!='' && resizedate<=dayuse_left_date) || (dayuse_right_date!='' && resizedate>dayuse_right_date))
											resize_not_proper = 1;
										else
										{
											if(ui.position.left<ui.originalPosition.left)
											{
												//console.log("moved in left direction");
												resize_arrival = resizedate;
												
												if(oldarrival!=resize_arrival)
													staychange=1;
											}
											else if(ui.position.left>ui.originalPosition.left)
											{
												//console.log("moved whole tran towards right direction with departure same");
												resize_arrival = resizedate;
												
												if(oldarrival!=resize_arrival)
													staychange=2;
											}
											else
											{
												resize_departure = resizedate;
												//console.log("moved in right direction");
												
												if(oldarrival!=resize_arrival)
												{
													if(ui.originalSize.width>ui.size.width)
													{
														//console.log("stay decreased"+oldarrival+"|"+resizedate);
														staychange=3;
													}
													else
													{
														//console.log("stay increased");
														staychange=4;	
													}
												}								
											}
											//console.log(resize_arrival+"|"+resize_departure+"|"+staychange);
										}
										
										var newarrival='';
										var newdeparture='';
										if(staychange>0)
										{
											if(resize_arrival!='')
												newarrival = resize_arrival;
											else
												newarrival = oldarrival;
												
											if(resize_departure!='')
												newdeparture = resize_departure;
											else
												newdeparture = olddeparture;
											
											if(newarrival==newdeparture)
												resize_not_proper = 2;
											else
											{
												hideWait();
												resize_not_proper = amend_stay(transactionid,'TransactionResize',newarrival,newdeparture,isTransactionSplitted,stoproommove_flag); //Manali - 1.0.37.42 - 30 Nov 2013, Purpose : Customization, Part Of Advance Room Move
												if(typeof(resize_not_proper)=='undefined')
													resize_not_proper = 0; 
											}
										}
										else
											resize_not_proper = 1;
									}
									else
										resize_not_proper = 1;
								}
								
								console.log(resize_not_proper);
								
								if(resize_not_proper!=0)
								{
									if(resize_not_proper!=3)
									{
										if(resize_not_proper==1)
											displayDataNotProcessedMsg();
										else
											displayStayviewMsg(1);
									}
										
									addRemoveTransaction(status,transactionid,true,'','amendStay');	
									hideWait();
								}
							}
				 	 });	
			}	
			
			//Drag/Drop Transaction
			/*if(chkDragStatus==0)
			{
				console.log("DragDrop");
				
				//transaction.draggable();
		
				transaction.droppable({
					drop: function( event, ui ) {
						console.log("Dropped");				
					}
				});
			}*/
		});
	}
}
//Manali - 1.0.35.40 - 22 Jul 2013 - END

jQuery(function(){
	jQuery("input[name='leftclick']").click(function(){
		/*jQuery(".tran_cells").resizable({
				handles: 'e',				
			});*/ //Manali - 1.0.35.40 - 22 Jul 2013,Purpose : Enhancement - Resize Drag drop transaction
		ready(); 
	});			
});



var ready = function()
{
	var bindval = jQuery("input[name='leftclick']:checked").val();
	
	switch (bindval) 
	{
		
	case ('canRClick'):
		{
		jQuery(".newrightmenu").unbind();
		jQuery(".newrightmenu").contextMenu({ menu: 'myMenu', leftButton: true}, 
		function(action, el, pos) { 
		contextMenuWork(action, el, pos); 
		});			
		break;	
		}
	case ('canLClick'):
		{
			jQuery(".newrightmenu").unbind();
			jQuery(".newrightmenu").destroyContextMenu();
			jQuery(".newrightmenu").contextMenu({ menu: 'myMenu', leftButton: false}, 
			function(action, el, pos) { 
			contextMenuWork(action, el, pos); 
			});	
			jQuery(".newrightmenu").click(function(){
												    getTransactiondata(this);
												   });
		break;	
		}
	case ('canMove'):
		{
			//jQuery(".newrightmenu").destroyContextMenu();
			jQuery(".newrightmenu").unbind();
			jQuery(".newrightmenu").contextMenu({ menu: 'myMenu', leftButton: false}, 
			function(action, el, pos) { 
			contextMenuWork(action, el, pos); 
			});	 
			
			jQuery(".newrightmenu").mousedown(function(e){
								eid = jQuery(this).parent().attr('id');					   
												    dragStart(e, eid);
												   });
			
		break;	
		}
	case ('canDragg'):
		{
			jQuery(".newrightmenu").unbind();
			jQuery(".newrightmenu").contextMenu({ menu: 'myMenu', leftButton: false});
			
		break;	
		}	
	default :
		{
		jQuery(".newrightmenu").contextMenu({ menu: 'myMenu', leftButton: true}, 
		function(action, el, pos) { 
		contextMenuWork(action, el, pos); 
		});
			
		}		
	}
	//Manali - 1.0.33.38 - 03 May 2013, Commented Code - END	
}


//========Prevent Javascript Infection  ============//
var disableHtml = function (element) {   
  if(element.value!= undefined)
  	element.value = element.value.replace(/[<>]/g, '');
}

jQuery(document).ready(function(){
    jQuery('.txtarea').focusout(function(){
            disableHtml(this);
        });
	
	jQuery('.txtbox').focusout(function(){
            disableHtml(this);
        });
});

function fsq895()
	{
		if(window.console && window.console.firebug )
		{
			alert("Sorry! This system does not support Firebug.\nClick OK to log out.");
       		window.location = serverurl+'index.php/page/newfront.logout';
			return;
    	}
	}
setTimeout("scyios4587()",1000*60);
function scyios4587()
{
	try
	{
		var status=0;
		if(serverurl.indexOf('live.ipms247') != -1 || serverurl.indexOf('50.17.200.219') != -1)
			{
			fsq895();
			}
		else
			{
			return;	
			}
		
		/*jQuery.ajax({
				async: true,
				data: { 
						opcode: "sc"
						},
				url: serverurl+'index.php/page/newfront.service',
				success: function(data)
				{
					status=data;
					if (data == 1)
						{
						setTimeout("scyios4587()",1000*60);
						}
					else{
						window.location = serverurl+'index.php/page/newclient.frontlogin';
						}
				}
			});*/
	}
	catch(e)
	{
	alert("common_functions :: checkRights " + e);
	}
}
// HRK - Common function object - Contact me before edit this.

// Jignesh - 1.0.22.28 - 26 Dec 2011 - START 
// Purpose - check row
jQuery(".checkrow").live('click',function(e){
	if(e.target.type)
	{
	// allow defalut functionality of checkbox.
	}
	else{
	var chk = jQuery(this).children().children('input[type=checkbox]').is(':checked');
	chk = (chk == false)? true : false;
	jQuery(this).children().children('input[type=checkbox]').attr('checked',eval(chk));
	} 
});

// Jignesh - 1.0.22.28 - 26 Dec 2011 - END 
var validDate = function (date,format)
{
	try
	{	
		date = date.replace(/-/g,"/");
		format = (format.replace(/-/g,"/")).trim();
	
		/*Format_0 = strFormate.split( "/" )[ 0 ];
		Format_1 = strFormate.split( "/" )[ 1 ];
		Format_2 = strFormate.split( "/" )[ 2 ]; 
		
		Date_0 = strDate.split( "/" )[ 0 ];
		Date_1 = strDate.split( "/" )[ 1 ];
		Date_2 = strDate.split( "/" )[ 2 ];
		var x='';
		var strDay='';
		var strMonth='';
		var strYear=''
		for (var i=0;i<=2;i++)
		{
			x = eval("Format_"+i); 
			if( (x.match(/d/gi)) != null)
			{
			   strDay = eval("Date_"+i);
			}
			if( (x.match(/m/gi)) != null)
			{
			   strMonth = eval("Date_"+i);
			}
			if( (x.match(/y/gi)) != null)
			{
			   strYear = eval("Date_"+i);
			}
		}*/
		

		var f2 = format.replace(/y*y/gi,'y').replace(/m*m/gi,'m').replace(/d*d/gi,'d');
		var f=f2.split("/");
		var d = date.split("/");
		eval("var vobj ={'"+f[0]+"':'"+d[0]+"','"+f[1]+"':'"+d[1]+"','"+f[2]+"':'"+d[2]+"'};");
		
		try{
		var strYear = (vobj['y'].length == 2) ? (2000+eval(vobj['y'])) : vobj['y'];
		}catch(e){alert("--"+e)};
		
		return (new Date(vobj['m']+"/"+vobj['d']+"/"+strYear)); // NEW DATE NEED FULL DATE FORMATE.
		
		//strYear = (strYear.length == 2) ? (2000+eval(strYear)) : strYear;
		//return (new Date(strMonth+"/"+strDay+"/"+strYear)); // NEW DATE NEED FULL DATE FORMATE.
	}
	catch(e)	
	{
	alert("common_functions :: validDate " + e);
	}
}
var timeFormat = function(tm,format)
	{
		try
		{
		var tm = tm;
		if(format == "h:i:s A")
			{
			var suffix = " AM";
			var hours = tm.split(":")[0];
			var minute = tm.split(":")[1];
			var second = tm.split(":")[2];
			if (hours  >= 12) 
				{
				suffix = " PM";
				hours = (hours - 12);
				}
			else{
				hours = hours;
				}
			if(hours == 0)
			  {
				hours=12;
			  }
		 return(hours+":"+minute+":"+second+suffix);
		}else 
		{
		return(tm);
		}
		}catch(e)
		{
		alert("common_functions>>"+e);
		}
	}

Date.prototype.format = function (formate) {
	settings={};
	return(jQuery.datepicker.formatDate(formate,this,settings));
};

var fun_guestsearchreturn;
var fun_MoveClickedResponse;
var fun_tabIframe_refreshSharerList;
var fun_tabIframe_refreshList;
var fun_tabIframe_foliolist;
var val_ownership;
var val_chkedrows_for_groupcheckout; //Added by Manali - 23 June 2011
var fun_refreshafterxchargepayment; //Added by Flora - 10 Aug 2011
var val_refreshafterxchargepayment; //Added by Flora - 10 Aug 2011
var fun_balancetransferfoliounkid; //Added by Flora - 19 Aug 2011
var fun_refreshafterxchargepayment_void; //Added by Flora - 16th Septmeber
var fun_refreshafterxchargepayment_auth; //Added by Flora - 16th Septmeber
var val_refreshafterxchargedetailunkid; //Added by Flora - 16th Septmeber

<!-- Flora - 1.0.22.27 - 22 Nov 2011 - START -->
<!-- Purpose :  Card Varification-->	
var fun_refreshafterxchargepaymentCard;
<!-- Flora - 1.0.22.27 - 22Nov 2011 - END -->

var val_swipecardflag; //Added by Manali - 24th Septmeber 2011
<!-- Jignesh - 1.0.22.27 - 8 Nov 2011 - START -->
<!-- Purpose :  search company functionality on Reservation screen.-->	
var is_wkn;
<!-- Jignesh - 1.0.22.27 - 8 Nov 2011 - END -->

<!-- Jignesh - 1.0.22.27 - 21 Nov 2011 - START -->
<!-- Purpose :  set value for edit transaction tab(0=Guest Info,1=Room Charge,2=Folio Detail).-->	
var val_checkout;
<!-- Jignesh - 1.0.22.27 - 21 Nov 2011 - END -->

// Stayview  -> walking close event //


/*Purpose : Load Default Combos*/
function loadDefaultCombos(executepage,action,field_key,field_value,controlName,selectedValue,isPromptText,PromptText)
{
	var controls=controlName.split("-");
	var field_keys=field_key.split("-");
	var field_values=field_value.split("-");
	var selectedValues=selectedValue.split("-");
	var isprompttext=isPromptText.split("-");
	var prompttext=PromptText.split("|");
	var url=serverurl+'index.php/page/newfront.'+executepage;
	var passDataAsStr="request="+action;
	jQuery.ajax({
		type: "POST", 
		url: url,
		data: passDataAsStr , 
		success: function(response) {			
			//console.log(response);			
			var JSONobject = eval(response);
			
			controlCnt=0;
			jQuery.each(JSONobject, function(jsonKey, jsonValue) {	
					
					/*if(isprompttext[controlCnt]==1 && prompttext[controlCnt]!='')
						prompttext[controlCnt] = '-- '+prompttext[controlCnt]+' --';*/
											 
					//if(selectedValue[controlCnt]==1)				
						fillCombo(jsonValue,isprompttext[controlCnt],prompttext[controlCnt],field_keys[controlCnt],field_values[controlCnt],controls[controlCnt],selectedValues[controlCnt]);
					//else
						//fillCombo(jsonValue,0,"<%=glang::$MSELECT%>",field_keys[controlCnt],field_values[controlCnt],controls[controlCnt],selectedValues[controlCnt]);	
					controlCnt++;
				});					
				//hideLoadingBar();
		}
	});	
}

/*Purpose : Fill Combos Data*/
function fillCombo(DataAsObj,isMultiSelect,isMultiSelectText,key,value,controlName,selectedValue)
{		
	var comboArr = [];
	if(isMultiSelect==1)
		comboArr.push('<option value="">'+isMultiSelectText+'</option>');	
	jQuery.each(DataAsObj, function(DataObjIndex, DataArray) {
			jQuery.each(DataArray, function(datainx, dataval) {
					comboArr.push('<option value="'+ dataval[key] +'">'+ dataval[value]  +'</option>');
			});
		});
		
	jQuery("select[id$='"+controlName+"']").html(comboArr.join(''));	
	if(selectedValue!='')
		jQuery("select[id$='"+controlName+"']").val(selectedValue);
}

function addCommas(nStr)
{
  nStr += '';
  x = nStr.split('.');
  x1 = x[0];
  x2 = x.length > 1 ? '.' + x[1] : '';
  var rgx = /(\d+)(\d{3})/;
  while (rgx.test(x1)) {
	x1 = x1.replace(rgx, '$1' + ',' + '$2');
  }
  return x1 + x2;
}	

//Chandrakant - 1.0.36.41 - 17 Aug 2013 - START
function call_slimcd(pagename,type,paymentid,tranunkid,lstFolio,lstMaster,txtDateFD,lstCurrency,txtAmount,txtRecVouNo,txtComment,transactiontype)
{
	//alert(pagename+', '+type+', '+paymentid+', '+tranunkid+', '+lstFolio+', '+lstMaster+', '+txtDateFD+', '+lstCurrency+', '+txtAmount+', '+txtRecVouNo+', '+txtComment+', '+transactiontype);

	switch(transactiontype)
	{		
		case 'SALE':
			slimcdLoadPopup1(pagename,type,paymentid,tranunkid,lstFolio,lstMaster,txtDateFD,lstCurrency,txtAmount,txtRecVouNo,txtComment,transactiontype);
			break;
		case 'AUTH':
			slimcdLoadPopup2(pagename,tranunkid,txtAmount,paymentid,transactiontype,txtRecVouNo);
			break;
		case 'FORCE':
			slimcdLoadPopup1(pagename,type,paymentid,tranunkid,lstFolio,lstMaster,txtDateFD,lstCurrency,txtAmount,txtRecVouNo,txtComment,transactiontype);
			break;
		case 'VOID':
			if(pagename=='slimcdcapturedetails')
				slimcdLoadPopup3(pagename,txtAmount,paymentid,txtRecVouNo,tranunkid,transactiontype);
			else
	  			slimcdLoadPopup1(pagename,type,paymentid,tranunkid,lstFolio,lstMaster,txtDateFD,lstCurrency,txtAmount,txtRecVouNo,txtComment,transactiontype);
			break;
		case 'CREDIT':
			slimcdLoadPopup1(pagename,type,paymentid,tranunkid,lstFolio,lstMaster,txtDateFD,lstCurrency,txtAmount,txtRecVouNo,txtComment,transactiontype);
			break;
	}
}

function slimcdLoadPopup1(pagename,type,paymentid,tranunkid,lstFolio,lstMaster,txtDateFD,lstCurrency,txtAmount,txtRecVouNo,txtComment,transactiontype)
{
	if(lstFolio=='' && pagename!='walkin')
	{
		alert("Folio not generated");	
		return false;
	}
	if(txtComment=='' || txtComment==null)
		txtComment='X_NONE';

	if(txtRecVouNo=='' || txtRecVouNo==null)
	{
		alert("Rec/Voucher Number is empty");	
		return false;
	}

	if(pagename=='walkin')
	{
		parent.loadPopup('XChargePayment','payment/PaymentTypeUnkId/'+paymentid+'/tranunkid/'+tranunkid+'/lstMaster/'+lstMaster+'/lstCurrency/'+lstCurrency+'/txtAmount/'+txtAmount+'/txtRecVouNo/'+txtRecVouNo+'/txtComment/'+txtComment+'/pagename/'+pagename+'/type/'+type+'/transactiontype/'+transactiontype,370,492);
	}
	else	
	{
		parent.loadPopup('XChargePayment','payment/PaymentTypeUnkId/'+paymentid+'/tranunkid/'+tranunkid+'/lstFolio/'+lstFolio+'/lstMaster/'+lstMaster+'/txtDateFD/'+txtDateFD+'/lstCurrency/'+lstCurrency+'/txtAmount/'+txtAmount+'/txtRecVouNo/'+txtRecVouNo+'/txtComment/'+txtComment+'/pagename/'+pagename+'/type/'+type+'/transactiontype/'+transactiontype,370,492);
		
		
	}
}

function slimcdLoadPopup2(pagename,tranunkid,txtAmount,PaymentTypeUnkId,transactiontype,txtRecVouNo)
{
	if(txtRecVouNo!='')
		parent.loadPopup('XChargePayment','payment/PaymentTypeUnkId/'+PaymentTypeUnkId+'/txtAmount/'+txtAmount+'/pagename/'+pagename+'/transactiontype/'+transactiontype+'/txtRecVouNo/'+txtRecVouNo+'/tranunkid/'+tranunkid,370,492);
	else
		parent.loadPopup('XChargePayment','payment/PaymentTypeUnkId/'+PaymentTypeUnkId+'/txtAmount/'+txtAmount+'/pagename/'+pagename+'/transactiontype/'+transactiontype+'/tranunkid/'+tranunkid,370,492);
}

function slimcdLoadPopup3(pagename,txtAmount,PaymentTypeUnkId,txtRecVouNo,tranunkid,transactiontype)
{
parent.loadPopup('XChargePayment','payment/PaymentTypeUnkId/'+PaymentTypeUnkId+'/txtAmount/'+txtAmount+'/pagename/'+pagename+'/transactiontype/'+transactiontype+'/txtRecVouNo/'+txtRecVouNo+'/tranunkid/'+tranunkid,370,492);
}

//Chandrakant - 1.0.36.41 - 17 Aug 2013 - END

/*(function(jQuery) {
    jQuery.fn.drags = function(opt) {

        opt = jQuery.extend({handle:".logo",cursor:"move"}, opt);

        if(opt.handle === "") {
            var _el = this;
        } else {
            var _el = this.find(opt.handle);
        }

        return _el.css('cursor', opt.cursor).live("mousedown", function(e) {
            if(opt.handle === "") {
                var _drag = jQuery(this).addClass('draggable');
            } else {
                var _drag = jQuery(this).addClass('active-handle').parent().addClass('draggable');
            }
            var z_idx = _drag.css('z-index'),
                drg_h = _drag.outerHeight(),
                drg_w = _drag.outerWidth(),
                pos_y = _drag.offset().top + drg_h - e.pageY,
                pos_x = _drag.offset().left + drg_w - e.pageX;
            _drag.css('z-index', 10000).parents().live("mousemove", function(e) {
                jQuery('.draggable').offset({
                    top:e.pageY + pos_y - drg_h,
                    left:e.pageX + pos_x - drg_w
                }).live("mouseup", function() {
                    jQuery(this).removeClass('draggable').css('z-index', z_idx);
                });
            });
            e.preventDefault(); // disable selection
        }).live("mouseup", function() {
            if(opt.handle === "") {
                jQuery(this).removeClass('draggable');
            } else {
                jQuery(this).removeClass('active-handle').parent().removeClass('draggable');
            }
        });

    }
})(jQuery); */


/*Flora : Its for while customer opened multiple property url in same browser tab & accessing saving options - Start*/
function _CheckSessionHotelCode(){
	//alert("2");
    var value=_getSessionHotelcode();
	console.log("value " + value);
    if(value==false)
   		return false;
	else
		return true;	
}
function _getSessionHotelcode(){
	
    var ret='';
	
	if (window.localStorage)
	{
		if(window.localStorage.getItem("front_hotel_code")!=null)
		{
			var response = window.localStorage.getItem('front_hotel_code');
			console.log("storage code "+ response);
			
			if(jQuery("#front_hotel_code").val()!=response)
			{
				console.log("false condition ..." +jQuery("#front_hotel_code").val() + " != "+response );
				ret = false;	
			}
			else
				ret=true;
		}
		else
		{
			jQuery.ajax({
				async:false,
				type: "GET",	
				data: 'opcode=gethotelcode' ,
				url:serverurl+'index.php/page/newfront.service',
				success : function(response){
					console.log(jQuery("#front_hotel_code").val() + " != "+response );
					if(jQuery("#front_hotel_code").val()!=response)
					{
						//console.log("false condition ..." +jQuery("#front_hotel_code").val() + " != "+response );
						ret = false;	
					}
					else
						ret=true;
				}
			});
		}
	}
	else
	{
			jQuery.ajax({
				async:false,
				type: "GET",	
				data: 'opcode=gethotelcode' ,
				url:serverurl+'index.php/page/newfront.service',
				success : function(response){
					console.log(jQuery("#front_hotel_code").val() + " != "+response );
					if(jQuery("#front_hotel_code").val()!=response)
					{
						//console.log("false condition ..." +jQuery("#front_hotel_code").val() + " != "+response );
						ret = false;	
					}
					else
						ret=true;
				}
			});
	}
	return ret;
}
/*Flora : Its for while customer opened multiple property url in same browser tab & accessing saving options - End*/

//Chandrakant - 1.0.39.44 - 14 Feb 2014 - START
function openJavascriptPopupWindow(url, name, width, height)
{
	var myPopupWindow = '';
	//Remove special characters from name
	name = name.replace(/\/|\-|\./gi, "");

	//Remove whitespaces from name
	var whitespace = new RegExp("\\s","g");
	name = name.replace(whitespace,"");

	//If it is already open
	if (!myPopupWindow.closed && myPopupWindow.location)
	{
		myPopupWindow.location.href = encodeUrl(url);
	}
	else
	{
		myPopupWindow= window.open(encodeUrl(url),name, "location=no, scrollbars=yes, resizable=yes, toolbar=no, menubar=no, width=" + width + ", height=" + height );
		if (!myPopupWindow.opener) myPopupWindow.opener = self;
	}

	//If my main window has focus - set it to the popup
	if (window.focus) {myPopupWindow.focus()}
}

function encodeUrl(url)
{
 	if (url.indexOf("?")>0)
 	{
		encodedParams = "?";
 		parts = url.split("?");
 		params = parts[1].split("&");
 		for(i = 0; i < params.length; i++)
 		{
			if (i > 0)
	 		{
				encodedParams += "&";
			}
			if (params[i].indexOf("=")>0) //Avoid null values
			{
				p = params[i].split("=");
				encodedParams += (p[0] + "=" + escape(encodeURI(p[1])));
			}
			else
			{
				encodedParams += params[i];
			}
		}
		url = parts[0] + encodedParams;
	}
	return url;
}
//Chandrakant - 1.0.39.44 - 14 Feb 2014 - END