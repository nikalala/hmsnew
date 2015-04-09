/*
 * jQuery UI Selectable 1.8.4
 * Developer Comments :
 *	Name : Jignesh
 *	File purpose : 
 *	Comments : 
 *	File Summery :  This is imporntent file which affects much to Grid manipulation.
 					There are Checkin and Checkout Date calculation.
					Selected Date Calculation (stay number of night)
 */
var dateFormate;  // value sats from stayview
var jQueryDateFormat;
var displayday; //value sats from stayview
HiddenDate = 	jQuery("input[id$='txtHiddenDate']").val();
var ww;
var wwt;
var cellwidth ;
var dispcheckInDate='';
var dispcheckedOutDate='';
var dbcheckin;
var dbcheckout;
var fc=0;

(function( jQuery, undefined ) {
jQuery.widget("ui.selectable", jQuery.ui.mouse, {
	options: {
		appendTo: 'body',
		autoRefresh: true,
		distance: 0,
		filter: '*',
		tolerance: 'touch'
	},
	
	_create: function() {
		var self = this;
		this.element.addClass("ui-selectable");

		this.dragged = false;

		// cache selectee children based on filter
		var selectees;

		this.refresh = function() {
		selectees = jQuery(self.options.filter, self.element[0]);
			selectees.each(function() {
				var $this = jQuery(this);
				
				var pos = $this.offset();
				jQuery.data(this, "selectable-item", {
					element: this,
					$element: $this,
					left: pos.left,
					top: pos.top,
					right: pos.left + $this.outerWidth(),
					bottom: pos.top + $this.outerHeight(),
					startselected: false,
					//selected: $this.hasClass('ui-selected'),
					
					selecting: $this.hasClass('ui-selecting'),
					unselecting: $this.hasClass('ui-unselecting')
				});
			});
		};

		this.refresh();

		//this.selectees = selectees.addClass("ui-selectee"); // 02 oct 2010 jingesh : testing tran_name
		this._mouseInit();
		this.helper = jQuery("<div class='ui-selectable-helper'></div>");

	},

	destroy: function() {
		
		this.selectees
		
			.removeClass("ui-selectee")
			.removeData("selectable-item");
		this.element
			.removeClass("ui-selectable ui-selectable-disabled")
			.removeData("selectable")
			.unbind(".selectable");
		this._mouseDestroy();

		return this;
	},

	_mouseStart: function(event) {
		var self = this;
		jQuery("#rmdt").text('');
		//this.opos = [event.pageX, event.pageY];
		this.opos = [event.pageX, event.pageY];
		
		fc = event.pageX;
		
		if (this.options.disabled)
			return;
		var options = this.options;
		this.selectees = jQuery(options.filter, this.element[0]);
		this._trigger("start", event);

		jQuery(options.appendTo).append(this.helper);
		// position helper (lasso)
		this.helper.css({
			"left": event.clientX,
			"top": event.clientY,
			"width": 0,
			"height": 0
		});

		if (options.autoRefresh) {
			this.refresh();
			
		}
		jQuery(".arrival_departure_hint").hide();
		jQuery('.ui-state-default').removeClass('ui-selected ui-selecting ui-selectable');
		jQuery('.first_click ').remove(); // clears all content when new click
		jQuery('._first_click ').remove();
		//jQuery('.first_click').hide();
		jQuery('.first_click span').hide();
		
		this.selectees.filter('.ui-selected').each(function() {
		var selectee = jQuery.data(this, "selectable-item");
		selectee.startselected = true;
		if (!event.metaKey) {
				
		jQuery('.ui-state-default').removeClass('ui-selected');
		selectee.selected = false;

		selectee.$element.addClass('ui-unselecting');
		selectee.unselecting = true;
		// selectable UNSELECTING callback
				self._trigger("unselecting", event, {
					unselecting: selectee.element
				});
			}
		});

		jQuery(event.target).parents().andSelf().each(function() {
			var selectee = jQuery.data(this, "selectable-item");
			if (selectee ) {
				var vfromdate = validDate(jQuery.trim(jQuery("input[id$='dtpStartDate']").val()),dateFormate);
				vfromdate = new Date(vfromdate.getTime() + ((86400000)*selectee.element.id.split( "_" )[ 0 ]))
				dispcheckInDate 	=	vfromdate.format(jQueryDateFormat);
				objdate = datepart(vfromdate);
				dbcheckin = objdate.y+"_"+objdate.m+"_"+objdate.d;
				
				//console.log(HiddenDate+"|"+dbcheckin);
				
				if(HiddenDate <= objdate.y+"-"+objdate.m+"-"+objdate.d) 
					{
					var doSelect = !event.metaKey || !selectee.$element.hasClass('ui-selected');
					/* comment 
					selectee.$element
						.removeClass(doSelect ? "ui-unselecting" : "ui-selected")
						.addClass(doSelect ? "ui-selecting" : "ui-unselecting");*/
					selectee.unselecting = !doSelect;
					selectee.selecting = doSelect;
					selectee.selected = doSelect;
					
					// selectable (UN)SELECTING callback
					if (doSelect) {
						self._trigger("selecting", event, {
							selecting: selectee.element
						});
					} else {
						self._trigger("unselecting", event, {
							unselecting: selectee.element
						});
					}
					return false;
					}
				else{
					svMessage('NotAllow');
					return false;
					}
			}
		});

	},

	_mouseDrag: function(event) {	
	//console.log("mouseDrag");
	var booked=0;
	var self = this;
	this.dragged = true;
	var ccount = 0;
	var n = 1;
	var num =0;
	var checkInDate=''
	var checkOutDate = '';
	//var NewcheckInDate = '';
	var selectee_dates = '';
	
	if (this.options.disabled)
		return;
 
	
	var options = this.options;
	var x1 = this.opos[0], y1 = this.opos[1], x2 = event.pageX, y2 = event.pageY;
	if (x2 > fc)
	jQuery(".first_click").width(x2-fc+2);
	
	this.helper.css({left: x1, top: y1, width: x2-x1, height: y2-y1});
	this.selectees.each(function() {
	var selectee = jQuery.data(this, "selectable-item");

	//prevent helper from being selected if appendTo: selectable
	if (!selectee || selectee.element == self.element[0])
	{
		//console.log("1");
		return;
	}
	var hit = false;
			
	if (options.tolerance == 'touch') {
	hit = ( !(selectee.left > x2 || selectee.right < x1 || selectee.top > y2 || selectee.bottom < y1) );
				
	} else if (options.tolerance == 'fit') {
	hit = (selectee.left > x1 && selectee.right < x2 && selectee.top > y1 && selectee.bottom < y2);
	}

	if (hit) {
		// SELECT
		ccount ++;
		num ++;
		
		if (selectee.selected) {
			/* comment 
			selectee.$element.removeClass('ui-selected');
			*/
			if (selectee.$element.attr('title') == ''){
			selectee.$element.html('<span class="first_click" style="width:10px"><span class="nithts">'+n +' night </span></span>'); //Number of Nights Stay
			}
			n ++;
			selectee.selected = false;

		}
		if (selectee.unselecting) {
			/* comment 
			selectee.$element.removeClass('ui-unselecting');
			*/
			selectee.unselecting = false;
			booked=0;
		}
		if (!selectee.selecting) {
			bookedClass = selectee.$element.attr('class');
			// if selectee is past Date than do not select dragged cells
			var vfromdate = validDate(jQuery.trim(jQuery("input[id$='dtpStartDate']").val()),dateFormate);
			objdate = datepart(new Date(vfromdate.getTime() + ((86400000)*selectee.element.id.split( "_" )[ 0 ])));
			if(HiddenDate <= objdate.y+"-"+objdate.m+"-"+objdate.d) 
			{
				
				jQuery('#rm_'+selectee.element.id.split( "_" )[ 1 ]+' .tran_cells').each(function(index){
					/*console.log(jQuery('#'+selectee.element.id));	
					console.log(jQuery(this));	*/															  
					if((jQuery('#'+selectee.element.id).position().left) == jQuery(this).position().left)
						{
							/*console.log(jQuery('#'+selectee.element.id));	
							console.log(jQuery(this));*/
							//console.log(7);
							tmpid= jQuery(this).attr('id');
							if(tmpid.indexOf('CHECKEDOUT') == -1) 
								{
								//console.log( (selectee.left-275) +"=="+jQuery(this).position().left);
								booked = booked+1;
								}
						jQuery(".first_click").attr('class','_first_click');		
						}
								
				});if (booked != 0) return;
						
			}
			else
			{
			//	console.log("2");
				return false;	
			}
			if(HiddenDate <= objdate.y+"-"+objdate.m+"-"+objdate.d) 
			{ 
			selectee.$element.html('<span class="first_click" style="">'+ ccount +'night </span>'); //Number of Nights Stay
			}
			var vfromdate = validDate(jQuery.trim(jQuery("input[id$='dtpStartDate']").val()),dateFormate);
			checkOutDate = new Date(vfromdate.getTime() + ((86400000)*selectee.element.id.split( "_" )[ 0 ]));
			dispcheckedOutDate 	=	checkOutDate.format(jQueryDateFormat);
			var objchekoutdate = datepart(checkOutDate);
			dbcheckout = objchekoutdate.y+"_"+objchekoutdate.m+"_"+objchekoutdate.d;
			cellwidth = ((svGrid.gW/svGrid.displayday)/2) * ccount;
			//jQuery(".first_click").css({'width':cellwidth+'px','position':'Absolute'});
			jQuery(".first_click").css({'position':'Absolute'});
			selhtml_='';

			var offset = selectee.$element.offset();
			if (ccount == 2)
			{
				tmp_mXX=offset.left;
				tmp_mYY=offset.top;
			}

			if(HiddenDate <= objdate.y+"-"+objdate.m+"-"+objdate.d) 
			{
				jQuery("#hintbox").css({left:(tmp_mXX-140),top:(tmp_mYY-60)});
				jQuery(".arrival_departure_hint").show();
				jQuery("#ari").html(dispcheckInDate);
				jQuery("#dep").html(dispcheckedOutDate);
				//jQuery("#rmdt").html(selectee.element.id.split( "_" )[ 1 ]+'_'+selectee.element.id.split( "_" )[ 2 ]);
				jQuery("#rmdt").html(dbcheckin+'_'+selectee.element.id.split( "_" )[ 1 ]+'_'+selectee.element.id.split( "_" )[ 2 ]+','+dbcheckout+'_'+selectee.element.id.split( "_" )[ 1 ]+'_'+selectee.element.id.split( "_" )[ 2 ]);
				var night = (Math.floor(ccount/2) > 1) ? ' ღამე' : ' ღამე';
				selhtml_ += "<span class=nithts ><span>"+Math.floor(ccount/2)+"</span>"+night+"</span>";
				jQuery(".first_click").html(selhtml_);	
			}
			if (ccount >= 2)
			{
				if (selectee.$element.attr('class').indexOf('booked') != -1)
					{
					return;	
					}
				selectee.$element.html('');
			} 
					selectee.selecting = true;
					// selectable SELECTING callback
					self._trigger("selecting", event, {
						selecting: selectee.element
					});
					
				}
			} else {
				// UNSELECT
					 
					
				if (selectee.selecting) {
					if (event.metaKey && selectee.startselected) {
						/* comment 
						selectee.$element.removeClass('ui-selecting');
						
						
						if (selectee.$element.attr('title') == ''){ 
						selectee.$element.html(''); // Clears the cells if Title is blank .
						
						}*/
						selectee.selecting = false;
						
						selectee.selected = true;
						
					} else {
						/* comment 
						selectee.$element.removeClass('ui-selecting');
						*/
						//console.log("3");
						jQuery("._first_click").attr('class','first_click');
						tid = selectee.$element.attr('rel');
						//console.log(tid);
						if(selectee.$element.attr('rel')%2 != 0 && ccount != 0 )
						{
						var vfromdate = validDate(jQuery.trim(jQuery("input[id$='dtpStartDate']").val()),dateFormate);
						checkOutDate= new Date(vfromdate.getTime() + ((86400000)*(selectee.element.id.split( "_" )[ 0 ]-1)));	
						dispcheckedOutDate 	=	checkOutDate.format(jQueryDateFormat);
						
						var objchekoutdate = datepart(checkOutDate);
						dbcheckout = objchekoutdate.y+"_"+objchekoutdate.m+"_"+objchekoutdate.d;
						
						//console.log(objchekoutdate);
						jQuery("#rmdt").html(dbcheckin+'_'+selectee.element.id.split( "_" )[ 1 ]+'_'+selectee.element.id.split( "_" )[ 2 ]+','+dbcheckout+'_'+selectee.element.id.split( "_" )[ 1 ]+'_'+selectee.element.id.split( "_" )[ 2 ]);
						jQuery('#dep').html(dispcheckedOutDate);
						}
						ccount=Math.floor(ccount/2)
						jQuery('.nithts span').html(ccount);
						
						selectee.selecting = false;
						if (selectee.startselected) {
							/* comment 
							selectee.$element.addClass('ui-unselecting');*/
							selectee.unselecting = true;
						}
						// selectable UNSELECTING callback
						self._trigger("unselecting", event, {
							unselecting: selectee.element
						});
					}
				}
				if (selectee.selected) {
				
					if (!event.metaKey && !selectee.startselected) {
						/* comment selectee.$element.removeClass('ui-selected');*/
						selectee.selected = false;

						/* comment selectee.$element.addClass('ui-unselecting');*/
						selectee.unselecting = true;
						// selectable UNSELECTING callback
						self._trigger("unselecting", event, {
							unselecting: selectee.element
						});
					}
				}
			}
		});

		return false;
	},

	_mouseStop: function(event) {
		num =0;
		var self = this;
		
		this.dragged = false;

		var options = this.options;

		jQuery('.ui-unselecting', this.element[0]).each(function() {
			var selectee = jQuery.data(this, "selectable-item");
			/* comment selectee.$element.removeClass('ui-unselecting');*/
			selectee.unselecting = false;
			selectee.startselected = false;
			self._trigger("unselected", event, {
				unselected: selectee.element
			});
		});
		
		selected_dates = '';
		jQuery('.ui-selecting', this.element[0]).each(function() {
			var selectee = jQuery.data(this, "selectable-item");
			/* comment  selectee.$element.removeClass('ui-selecting').addClass('ui-selected');*/
			selectee.selecting = false;
			selectee.selected = true;
			selectee.startselected = true;
			self._trigger("selected", event, {
				selected: selectee.element
			});
		});
		this._trigger("stop", event);
		this.helper.remove();
		this._mouseopenwindow("reservation");		
		return false;
	}
});
jQuery.extend(jQuery.ui.selectable, {
	version: "1.8.4"
});
})(jQuery);
