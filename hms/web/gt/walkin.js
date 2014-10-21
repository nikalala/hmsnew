// JavaScript Document
function change_rates_RoomRow(oprn)
{
	try{
		var curidx=jQuery(".rates_RoomRow").index(jQuery(".current_rates_RoomRow"));
		if(oprn>0) jQuery(".rates_RoomRow:eq("+(curidx+1)+")").trigger('click',{idx:(curidx+1)});
		if(oprn<0) jQuery(".rates_RoomRow:eq("+(curidx-1)+")").trigger('click',{idx:(curidx-1)});
	}catch(e){alert(e);}
}
function bindReleaseDate(date)
{
	jQuery("input[id$='dtpReleaseDate']").removeClass('hasDatepicker');	
	jQuery("input[id$='dtpReleaseDate']").datepicker('option', 'maxDate',date);
}	
function checkType(val)
{
	try{
		if(val==1){jQuery("div[id$='pnlCashRow']").show();jQuery("div[id$='pnlCreditRow']").hide();}
		else{jQuery("div[id$='pnlCreditRow']").show();jQuery("div[id$='pnlCashRow']").hide();}
	}catch(e){alert(e);}
}
function remark_RoomRow(evn) {
	try {
		if(evn==null)parent.loadPopup('WalkInRemark','walkinremark/tranunkid/-1',385,600);
		else
		{
			var idx=0;
			if(evn.data.cnt!='0') idx=jQuery(this).parent().parent().index()+1;	
			parent.loadPopup('WalkInRemark','walkinremark/tranunkid/'+idx,385,600);
		}
	}catch(e) {alert(e);}
}
function remark_resetdata(val,addrow) {
	try {
	var remark = sessionStorage.getItem("remarkinfo");
	var remarkdata = jQuery.parseJSON(remark );	
	if(remarkdata == {} || remarkdata==null) {remarkdata = {};}		
	for(idx=-1;idx<val;idx++)
	{
		if(!remarkdata[idx])
		{
			var newKey = {};
			newKey[idx]=Array();
			jQuery.extend(remarkdata,newKey);
		}
	}
	var inccnt=0;
	for(row in remarkdata)
	{	
		inccnt++;
		if(row=="-1") continue;		
		if(parseInt(row)>(val-1)) {remarkdata[row]=Array();continue;}			
		if(addrow && row<(val-1)) continue;			
		for(i=0;i < remarkdata["-1"].length;i++)
		{
			var len=remarkdata[row].length;
			var found=false;
			for(j=0;j < len;j++){
				if(remarkdata[row][j].unkid==remarkdata["-1"][i].unkid){found=true;break;}}	
			if(!found){
				remarkdata[row].push({unkid:remarkdata["-1"][i].unkid,isglobal:1,tranunkid:row,reasontypeunkid:remarkdata["-1"][i].reasontypeunkid,reasontype:remarkdata["-1"][i].reasontype,reasonunkid:remarkdata["-1"][i].reasonunkid,reason:remarkdata["-1"][i].reason,desc:remarkdata["-1"][i].desc,});}
		}					
	}		
	sessionStorage.setItem("remarkinfo",Prado.JSON.stringify(remarkdata));
	}catch(e) {alert(e);}
}
function inclusion_RoomRow(evn) {
	try {
		if(evn==null)parent.loadPopup('WalkInInclusion','walkininclusion/tranunkid/-1',385,600);
		else
		{
			var idx=0;
			if(evn.data.cnt!='0') idx=jQuery(this).parent().parent().index()+1;	
			parent.loadPopup('WalkInInclusion','walkininclusion/tranunkid/'+idx,385,600);
		}
	}catch(e) {alert(e);}
}	

function inclusion_resetdata(val,addrow) {
	try {		
	var inclusion = sessionStorage.getItem("inclusioninfo");
	var incdata = jQuery.parseJSON(inclusion);	
	if(incdata == {} || incdata==null) {incdata = {};}		
	for(idx=-1;idx<val;idx++)
	{
		if(!incdata[idx])
		{
			var newKey = {};
			newKey[idx]=Array();
			jQuery.extend(incdata,newKey);
		}
	}
	var inccnt=0;
	for(row in incdata)
	{	
		inccnt++;
		if(row=="-1") continue;			
		if(parseInt(row)>(val-1)) {incdata[row]=Array();continue;}			
		if(addrow && row<(val-1)) continue;			
		for(i=0;i < incdata["-1"].length;i++)
		{
			var len=incdata[row].length;
			var found=false;
			for(j=0;j < len;j++){
				if(incdata[row][j].unkid==incdata["-1"][i].unkid){found=true;break;}}				
			if(!found)
			{	
				var addinclusion=1;
				if(incdata["-1"][i].chargeruleunkid=='PERBOOKING' && row>0) addinclusion=0;					
				if(addinclusion==1){		
					incdata[row].push({unkid:incdata["-1"][i].unkid,isglobal:1,tranunkid:row,chargeunkid:incdata["-1"][i].chargeunkid,charge:incdata["-1"][i].charge,currencyunkid:incdata["-1"][i].currencyunkid,currency:incdata["-1"][i].currency,rate:incdata["-1"][i].rate,postingruleunkid:incdata["-1"][i].postingruleunkid,postingrule:incdata["-1"][i].postingrule,chargeruleunkid:incdata["-1"][i].chargeruleunkid,chargerule:incdata["-1"][i].chargerule,qty:incdata["-1"][i].qty,adult:incdata["-1"][i].adult,child:incdata["-1"][i].child});
				}
			}
		}					
	}		
	sessionStorage.setItem("inclusioninfo",Prado.JSON.stringify(incdata));
	}catch(e) {alert(e);}
}
function getDirtyRoomList()
{
	try {		
	jQuery.ajax({
		async: false,
		data: { k: "gdrl"},
		url: serverurl+'index.php/page/newfront.walkin',
		success: function(data) {
				var JSONobject = eval("["+data+"]");					
				jQuery.each(JSONobject,function(JsonIndex,jsonData){
					jQuery.each(jsonData,function(dataindex,datavalue){
						datavalue = JSON.stringify(datavalue);							
						if(dataindex=="dirtyroomlist")
							jQuery("input[id$='drl']").val(datavalue);									
						if(dataindex=="connectedroomslist")
							jQuery("input[id$='crl']").val(datavalue);	
					});											
				});
			}
		});
	}catch(e){alert(e);}
}	
function lstRoomSelect(evt){
	try {
		if(evt.data.idx!='0') evt.data.idx=jQuery(this).parent().parent().index()+1;
		if(jQuery("input[id$='btnCheckIn']:visible").length)
		{				
			if(jQuery.parseJSON(jQuery("input[id$='drl']").val()).indexOf('{"rm": "'+jQuery("select[id$='lstRoom']:eq("+evt.data.idx+")").val()+'"}')!=-1)
				jQuery("select[id$='lstRoom']:eq("+evt.data.idx+")").css({'border':'1px solid red'});
			else
				jQuery("select[id$='lstRoom']:eq("+evt.data.idx+")").css({'border':'1px solid #BEBEBE'});
		}			
		if(jQuery.parseJSON(jQuery("input[id$='crl']").val()).indexOf('{"RoomId": "'+jQuery("select[id$='lstRoom']:eq("+evt.data.idx+")").val()+'",')!=-1)			
			checkSuiteWith(1);				
		else
			checkSuiteWith('');
	}catch(e){alert(e);}
}	
function ShowPanel(id){
	jQuery('.walkinpanel').hide();
	jQuery('.ui-state-default.ui-corner-top').removeClass('ui-tabs-selected ui-state-active');
	jQuery("a[href='#"+id+"']").parent().addClass('ui-tabs-selected ui-state-active');
	jQuery('#'+id).show();
}
function removeObjectItem()
{
	this.items = arrGuest;
	this.remove = function(index){
		delete this.items[index]; }// only deletes the dot notation	
}	
function taselect(value)
{
	if(value > 0)
	{
		jQuery("input[id$='txtTAVoucherNo']").attr('disabled','');
		jQuery("select[id$='lstCommissionPlan']").attr('disabled','');
		jQuery("select[id$='lstCommissionPlan']").focus();
	}	
	else
	{
		jQuery("select[id$='lstCommissionPlan']").attr('disabled','disabled');
		jQuery("input[id$='txtPlanValue']").attr('disabled','disabled');
		jQuery("input[id$='txtTAVoucherNo']").attr('disabled','disabled');
		jQuery("input[id$='txtPlanValue']").val('');
		jQuery("input[id$='txtTAVoucherNo']").val('');
		jQuery("select[id$='lstCommissionPlan']").val('-1');
	}
}
function complanselect(value)
{
	if(value>0)
	{
		jQuery("input[id$='txtPlanValue']").attr('disabled','');
		jQuery("input[id$='txtPlanValue']").focus();
	}	
	else
		jQuery("input[id$='txtPlanValue']").attr('disabled','disabled');
	return true;
}	
function releasedateselect(checked)
{
		jQuery("input[id$='txtReleaseTerm']").val('');
		jQuery("input[id$='dtpReleaseDate']").val('');
		jQuery("input[id$='txtReleaseTerm']").attr('disabled','disabled');
}
function exempttaxchecked(checked,roomrevenuetax)
{
	if(checked)
	{
		jQuery("input[id$='txtTaxExemptRefNo']").attr('disabled','');
		jQuery("input[id$='txtTaxExemptRefNo']").focus();
		if(roomrevenuetax) jQuery("#taxexemption").show(); <!--Manali - 1.0.37.42 - 26 Nov 2013, Purpose : Enhancement - Select taxes for assign -->		
	}	
	else
	{
		jQuery("input[id$='txtTaxExemptRefNo']").attr('disabled','disabled');
		<!--Manali - 1.0.37.42 - 26 Nov 2013 - START-->
		<!--Purpose : Enhancement - Select taxes for assign -->
		jQuery("#taxexemption").hide(); 
		sessionStorage.removeItem("taxassignlist");
		jQuery("input[id$='exempttaxlist']").val("");
		jQuery("input[id$='assigntaxlist']").val("");
		<!--Manali - 1.0.37.42 - 26 Nov 2013 - END-->
	}
}	
function unloadMe(cancel)
{
	try{
		if(parent.traninfo)
		{ parent.traninfo = trandata; }
		jQuery('.ui-selectee',top.document).removeClass('ui-selected');
		jQuery('.first_click',top.document).hide();
		jQuery('.grdborder .first_click',top.document).remove();
		jQuery('.first_click span',top.document).hide();	
		if(cancel)
		{
			jQuery("#day_select",top.document).val('');
			jQuery("input[id$='txtRange']",top.document).val('');
			parent.hideWait();
			parent.unLoadPopup('WalkIn',cancel);
		}
		else
		{
			if(document.location.href.indexOf('/reload')!=-1)
			{
				jQuery("#day_select",top.document).val('');
				jQuery("input[id$='txtRange']",top.document).val('');
				parent.hideWait();
				parent.unLoadPopup('WalkIn',true);
			}
			else
			{
				jQuery("#day_select",top.document).val('');
				jQuery("input[id$='txtRange']",top.document).val('');
				parent.hideWait();
				parent.unLoadPopup('WalkIn',cancel);
			}
		}
	}
	catch(e){alert(e);}
}
function isPaymentMethod()
{
	try{
		jQuery("#pmtMethod").remove();
		jQuery(".paymentmethod").removeClass('validfailed');
	}
	catch(e){alert(e);}
}
function rate_setting(rad)
{
	if(rad==1)
	{
		contractrate(false);
		manualrate(false);
	}
	if(rad==2)
	{
		contractrate(true);
		manualrate(false);
	}
	if(rad==3)
	{
		contractrate(false);
		manualrate(true);
	}
}
function setdiscountCurrency()
{
	try{jQuery("select[id$='lstDisCurrency']").val(jQuery("select[id$='lstCurrency']").val());}
	catch(e){alert(e);}
}
function contractrate(checked)
{
	try{
		if(checked)
			jQuery("select[id$='lstSource']").show();
		else
			jQuery("select[id$='lstSource']").hide();
	}
	catch(e){alert(e);}
}
function copy_RoomRow(evn)
{
	try{
		if(evn.data.cnt!='0') evn.data.cnt=jQuery(this).parent().parent().index()+1;
		parent.showWait();
		for(idx=evn.data.cnt+1;idx <= jQuery(".roomrow").length;idx++)
		{
			jQuery("select[id$='lstRateType']:eq("+idx+")").html(jQuery("select[id$='lstRateType']:eq("+evn.data.cnt+")").html());
			jQuery("select[id$='lstRoom']:eq("+idx+")").html(jQuery("select[id$='lstRoom']:eq("+evn.data.cnt+")").html());
			jQuery("select[id$='lstAdult']:eq("+idx+")").html(jQuery("select[id$='lstAdult']:eq("+evn.data.cnt+")").html());
			jQuery("select[id$='lstChild']:eq("+idx+")").html(jQuery("select[id$='lstChild']:eq("+evn.data.cnt+")").html());
			jQuery("select[id$='lstSalutation']:eq("+idx+")").html(jQuery("select[id$='lstSalutation']:eq("+evn.data.cnt+")").html());
			jQuery("select[id$='lstIdentityType']:eq("+idx+")").html(jQuery("select[id$='lstIdentityType']:eq("+evn.data.cnt+")").html());
			jQuery("input[id$='txtGuestName']:eq("+idx+")").val(jQuery("input[id$='txtGuestName']:eq("+evn.data.cnt+")").val());
			jQuery("input[id$='txtIdentityNo']:eq("+idx+")").val(jQuery("input[id$='txtIdentityNo']:eq("+evn.data.cnt+")").val());
			jQuery("input[id$='createnewprofile']:eq("+idx+")").val(jQuery("input[id$='createnewprofile']:eq("+evn.data.cnt+")").val());
			jQuery("input[id$='guestunkid']:eq("+idx+")").val(jQuery("input[id$='guestunkid']:eq("+evn.data.cnt+")").val());				
			jQuery("select[id$='lstRoomType']:eq("+idx+")").val(jQuery("select[id$='lstRoomType']:eq("+evn.data.cnt+")").val());
			jQuery("select[id$='lstRateType']:eq("+idx+")").val(jQuery("select[id$='lstRateType']:eq("+evn.data.cnt+")").val());
			jQuery("select[id$='lstAdult']:eq("+idx+")").val(jQuery("select[id$='lstAdult']:eq("+evn.data.cnt+")").val());
			jQuery("select[id$='lstChild']:eq("+idx+")").val(jQuery("select[id$='lstChild']:eq("+evn.data.cnt+")").val());
			jQuery("select[id$='lstSalutation']:eq("+idx+")").val(jQuery("select[id$='lstSalutation']:eq("+evn.data.cnt+")").val());
			jQuery("select[id$='lstIdentityType']:eq("+idx+")").val(jQuery("select[id$='lstIdentityType']:eq("+evn.data.cnt+")").val());
			if(jQuery("input[id$='createnewprofile']:eq("+(idx)+")").val()==0)
			{
				jQuery("select[id$='lstSalutation']:eq("+idx+")").attr('disabled', 'disabled');
				jQuery("input[id$='txtGuestName']:eq("+idx+")").attr('disabled', 'disabled');
			}
		}			
		jQuery(".rates_RoomRow").hide();
		setTimeout('getofferedrate()',1000);			
		parent.hideWait();			
	}
	catch(e){alert(e);}
}
function remove_RoomRow(evn)
{
	try{
		parent.showWait();
		jQuery('#tr_'+evn.data.cnt).remove();
		if(guestcounter == jQuery(".txtNoRooms").val())
		{
			removeItemFromObject = new removeObjectItem();
			removeItemFromObject.remove(evn.data.cnt);
			guestcounter--;
			sessionStorage.setItem("guestinfo_array", JSON.stringify(arrGuest));
		}						
		jQuery('.remove_RoomRow:eq(0)').attr('style','display:none');
		jQuery('.copy_RoomRow:eq('+(jQuery(".roomrow").length)+')').attr('style','display:none');			
		jQuery('.row_counter').each(function(i){jQuery(this).html(i+1)});			
		jQuery('.txtNoRooms').val(jQuery(".roomrow").length+1);			
		jQuery(".rates_RoomRow").hide();
		setTimeout('getofferedrate()',1000);			
		inclusion_resetdata(jQuery('.txtNoRooms').val(),false);			
		remark_resetdata(jQuery('.txtNoRooms').val(),false);			
		parent.hideWait();
	}
	catch(e){alert(e);}
}
function fillmainguestdata()
{
	try {
		var guestArr = jQuery.parseJSON(sessionStorage.getItem("guestinfo_array"));
		if(guestArr!=null) // Null, search is not initiated
		{
			if(guestArr[0]) // Main guest searched from guest
			{
				if(guestArr[0].contactunkid!='-1') // Main guest searched from guest
					return;
			}
		}
		var Guestobj = new Object();
		if(jQuery("input[id$='radMale']").attr('checked')==true)
			Guestobj.gender = 'Male';
		else if(jQuery("input[id$='radFemale']").attr('checked')==true)
			Guestobj.gender = 'Female';
		else 
			Guestobj.gender = 'Other';		
		Guestobj.ischild = '0';				
		Guestobj.contactunkid			= 	-1;
		Guestobj.salutation 			= 	jQuery("select[id$='lstSalutation']:eq(0)").val();
		Guestobj.name					= 	jQuery("input[id$='txtGuestName']:eq(0)").val();
		Guestobj.address				= 	jQuery("textarea[id$='txtAddress']:eq(0)").val();
		Guestobj.city					= 	jQuery("input[id$='txtCity']:eq(0)").val();
		Guestobj.state					=	jQuery("input[id$='txtState']:eq(0)").val();
		Guestobj.zipcode				= 	jQuery("input[id$='txtZip']:eq(0)").val();
		Guestobj.country				= 	jQuery("select[id$='lstCountry']:eq(0)").val();
		Guestobj.phone					= 	jQuery("input[id$='txtContactPhone']:eq(0)").val();
		Guestobj.mobile					= 	jQuery("input[id$='txtContactMobile']:eq(0)").val();
		Guestobj.fax					= 	jQuery("input[id$='txtContactFax']:eq(0)").val();
		Guestobj.birthdate				= 	'';				
		Guestobj.email					= 	jQuery("input[id$='txtContactEmail']:eq(0)").val();
		Guestobj.identityunkid			= 	jQuery("select[id$='lstIdentityType']:eq(0)").val();;
		Guestobj.exp_date				= 	'';
		Guestobj.identity_no			= 	jQuery("input[id$='txtIdentityNo']:eq(0)").val();
		Guestobj.nationality			= 	jQuery("select[id$='lstNationality']:eq(0)").val();
		Guestobj.anniversary			= 	'';
		Guestobj.citizenship			= 	'';
		Guestobj.spousebirthdate		= 	'';
		Guestobj.vipstatusunkid			= 	jQuery("select[id$='lstVIPStatus']:eq(0)").val();
		Guestobj.company				= 	'';
		Guestobj.rowid					= 	0;	
		jQuery("input[id$='createnewprofile']:eq(0)").val(1);
		jQuery("input[id$='guestunkid']:eq(0)").val(-1);
		arrGuest[0]=Guestobj;
		if(guestcounter==0)
			guestcounter++;			
		sessionStorage.setItem("guestinfo_array", JSON.stringify(arrGuest));
	} catch(e) {alert("WalkIn >> fillmainguestdata >> "+e); }
}
function refilltranlist(croomid){
	try{		
	fillmainguestdata();
	var retdata = jQuery.parseJSON(sessionStorage.getItem("guestinfo_array"));				
	var data='';
	jQuery("select[id$='lstRoomType']").each(function(idx){ 		
		var row = '';			
		row += "<lrmt>"+jQuery("select[id$='lstRoomType']:eq("+idx+")").val()+"</lrmt>";
		row += "<lrm>"+jQuery("select[id$='lstRoom']:eq("+idx+")").val()+"</lrm>";
		row += "<lrmnm>"+jQuery("select[id$='lstRoom']:eq("+idx+") option:selected").text()+"</lrmnm>";
		row += "<lrt>"+jQuery("select[id$='lstRateType']:eq("+idx+")").val()+"</lrt>";
		row += "<la>"+jQuery("select[id$='lstAdult']:eq("+idx+")").val()+"</la>";
		row += "<lc>"+jQuery("select[id$='lstChild']:eq("+idx+")").val()+"</lc>";
		row += "<ls>"+jQuery("select[id$='lstSalutation']:eq("+idx+")").val()+"</ls>";
		row += "<tg>"+jQuery("input[id$='txtGuestName']:eq("+idx+")").val()+"</tg>";
		row += "<lidt>"+jQuery("select[id$='lstIdentityType']:eq("+idx+")").val()+"</lidt>";
		row += "<tidno>"+jQuery("input[id$='txtIdentityNo']:eq("+idx+")").val()+"</tidno>";
		row += "<hgid>"+jQuery("input[id$='guestunkid']:eq("+idx+")").val()+"</hgid>";
		row += "<hcnp>"+jQuery("input[id$='createnewprofile']:eq("+idx+")").val()+"</hcnp>";
		if(retdata[idx]){		
			row += "<gadd>"+retdata[idx]['address']+"</gadd>";
			row += "<gcity>"+retdata[idx]['city']+"</gcity>";
			row += "<gstate>"+retdata[idx]['state']+"</gstate>";
			row += "<gcountry>"+retdata[idx]['country']+"</gcountry>";
			row += "<gzip>"+retdata[idx]['zipcode']+"</gzip>";
			row += "<gphone>"+retdata[idx]['phone']+"</gphone>";
			row += "<gmobile>"+retdata[idx]['mobile']+"</gmobile>";
			row += "<gfax>"+retdata[idx]['fax']+"</gfax>";
			row += "<gbdate>"+retdata[idx]['birthdate']+"</gbdate>";
			row += "<ganndate>"+retdata[idx]['anniversary']+"</ganndate>";
			row += "<gspbdate>"+retdata[idx]['spousebirthdate']+"</gspbdate>";
			row += "<gvipstatus>"+retdata[idx]['vipstatusunkid']+"</gvipstatus>";
			row += "<ggender>"+retdata[idx]['gender']+"</ggender>";
			row += "<gemail>"+retdata[idx]['email']+"</gemail>";
			row += "<gischild>"+retdata[idx]['ischild']+"</gischild>";			
			row += "<gexp_date>"+retdata[idx]['exp_date']+"</gexp_date>";
			row += "<gcompany>"+retdata[idx]['company']+"</gcompany>";
			row += "<gnationality>"+retdata[idx]['nationality']+"</gnationality>";			
			row += "<growid>"+idx+"</growid>";
		}
		else{			
			var salutation = jQuery("select[id$='lstSalutation']:eq("+idx+")").val();
			if(salutation == 'MAM' || salutation == 'MRS' || salutation == 'MS')
				gender = 'Female';
			if(salutation == 'NONE' || salutation == '')
				gender = 'Other';
			else
				gender = 'Male';				
			row += "<gadd></gadd>";
			row += "<gcity></gcity>";
			row += "<gstate></gstate>";
			row += "<gcountry></gcountry>";
			row += "<gzip></gzip>";
			row += "<gphone></gphone>";
			row += "<gmobile></gmobile>";
			row += "<gfax></gfax>";
			row += "<gbdate></gbdate>";
			row += "<ganndate></ganndate>";
			row += "<gspbdate></gspbdate>";
			row += "<gvipstatus></gvipstatus>";				
			row += "<ggender>"+gender+"</ggender>";				
			row += "<gemail></gemail>";
			row += "<gischild></gischild>";			
			row += "<gexp_date></gexp_date>";
			row += "<gcompany></gcompany>";
			row += "<gnationality></gnationality>";			
			row += "<growid>"+idx+"</growid>";
		}
		row += "<suitewith>0</suitewith>";
		row += "<crflag>"+jQuery("input[id$='chkSuiteWith']").is(":checked")+"</crflag>";			
		data += "<r>"+row+"</r>";
	});
	if(jQuery("input[id$='chkSuiteWith']").is(":checked") && jQuery("input[id$='txtNoRooms']").val()==1 && jQuery("select[id$='lstRoom']:eq(0)").val()!=-1)
	{	
		var count=0;
		var connectedroomslist = eval('(' +jQuery.parseJSON(jQuery("input[id$='crl']").val())+ ')');
		jQuery.each(connectedroomslist,function(JsonIndex,jsonData){
			if(jsonData.RoomId==jQuery("select[id$='lstRoom']:eq(0)").val())
			{									
				var resetconnectroomflag=0;
				var rooms_not_available_list = Array();
				if(jQuery("input[id$='hidRoomNotAvailableList']").val()!='')
					rooms_not_available_list = (jQuery("input[id$='hidRoomNotAvailableList']").val()).split(",");
				if(rooms_not_available_list.length>0)
				{
					for(m=0;m<rooms_not_available_list.length;m++)
					{
						if(croomid!='' && jsonData.CRoomId==rooms_not_available_list[m].toString())
							resetconnectroomflag=1;
					}
				}					
				if(croomid!='' && resetconnectroomflag==0)
				{
					count++;
					var row = callConnectRooms(retdata,count,jsonData);	
					data += "<r>"+row+"</r>";						
				}					
				if(croomid=='')
				{
					count++;
					var row = callConnectRooms(retdata,count,jsonData);
					data += "<r>"+row+"</r>";						
				}					
			}			
		});			
	}
	jQuery("input[id$='tl']").val("<lst>"+data+"</lst>");		
	jQuery("input[id$='incl']").val(sessionStorage.getItem("inclusioninfo"));		
	jQuery("input[id$='rmk']").val(sessionStorage.getItem("remarkinfo"));
	jQuery("input[id$='assigntaxlist']").val(sessionStorage.getItem("taxassignlist")); <!--Manali  Purpose : Enhancement - Select taxes for assign -->
	}
	catch(e){alert("walkin >> refilltranlist : "+e);}
}	
function changeSalutation(evn)
{
	rowid=evn.data.cnt;	
	var guestinfo_count=0;
	jQuery.each(arrGuest, function(rowkey, rowval) 
	{
		if(rowkey==rowid)
			guestinfo_count=1;  });
	if(guestinfo_count==0)
	{
		var Guestobj = new Object();			
		var salutation = jQuery("select[id$='lstSalutation']:eq("+rowid+")").val();
		if(salutation == 'MAM' || salutation == 'MRS' || salutation == 'MS')
			Guestobj.gender = 'Female';
		else if(salutation == '' || salutation == 'NONE')
			Guestobj.gender = 'Other';
		else
			Guestobj.gender = 'Male';			
		guestname="";
		if(jQuery("input[id$='txtGuestName']:eq("+rowid+")").val()!='')
			guestname=jQuery("input[id$='txtGuestName']:eq("+rowid+")").val();				
		idno="";
		if(jQuery("input[id$='txtIdentityNo']:eq("+rowid+")").val()!='')
			idno=jQuery("input[id$='txtIdentityNo']:eq("+rowid+")").val();
		Guestobj.salutation = jQuery("select[id$='lstSalutation']:eq("+rowid+")").val();
		Guestobj.name = guestname;
		Guestobj.identityunkid = jQuery("select[id$='lstIdentityType']:eq("+rowid+")").val();
		Guestobj.identity_no = idno;
		Guestobj.contactunkid = jQuery("input[id$='guestunkid']:eq("+rowid+")").val();
		Guestobj.ischild = 0;
		Guestobj.address				= 	'';
		Guestobj.city					= 	'';
		Guestobj.state					=	'';
		Guestobj.zipcode				= 	'';
		Guestobj.country				= 	'';
		Guestobj.phone					= 	'';
		Guestobj.mobile					= 	'';
		Guestobj.fax					= 	'';
		Guestobj.birthdate				= 	'';				
		Guestobj.email					= 	'';
		Guestobj.exp_date				= 	'';
		Guestobj.nationality			= 	'';
		Guestobj.anniversary			= 	'';
		Guestobj.citizenship			= 	'';
		Guestobj.spousebirthdate		= 	'';
		Guestobj.vipstatusunkid			= 	'';
		Guestobj.company				= 	'';
		parent.fun_getguestinformation(Guestobj,rowid,0);
	}
	else {
		var Guestobj =arrGuest[rowid];
		var salutation = jQuery("select[id$='lstSalutation']:eq("+rowid+")").val();
		if(salutation == 'MAM' || salutation == 'MRS' || salutation == 'MS')
			Guestobj.gender = 'Female';
		else if(salutation == '' || salutation == 'NONE')
			Guestobj.gender = 'Other';
		else
			Guestobj.gender = 'Male';			
		guestname="";
		if(jQuery("input[id$='txtGuestName']:eq("+rowid+")").val()!='')
			guestname=jQuery("input[id$='txtGuestName']:eq("+rowid+")").val();				
		idno="";
		if(jQuery("input[id$='txtIdentityNo']:eq("+rowid+")").val()!='')
			idno=jQuery("input[id$='txtIdentityNo']:eq("+rowid+")").val();			
		Guestobj.salutation = jQuery("select[id$='lstSalutation']:eq("+rowid+")").val();
		Guestobj.name = guestname;
		Guestobj.identityunkid = jQuery("select[id$='lstIdentityType']:eq("+rowid+")").val();
		Guestobj.identity_no = idno;
		Guestobj.contactunkid = jQuery("input[id$='guestunkid']:eq("+rowid+")").val();
		Guestobj.ischild = 0;			
		Guestobj.salutation 			= 	jQuery("select[id$='lstSalutation']:eq("+rowid+")").val();
		Guestobj.name					= 	jQuery("input[id$='txtGuestName']:eq("+rowid+")").val();
		Guestobj.address				= 	jQuery("textarea[id$='txtAddress']:eq("+rowid+")").val();
		Guestobj.city					= 	jQuery("input[id$='txtCity']:eq("+rowid+")").val();
		Guestobj.state					=	jQuery("input[id$='txtState']:eq("+rowid+")").val();
		Guestobj.zipcode				= 	jQuery("input[id$='txtZip']:eq("+rowid+")").val();
		Guestobj.country				= 	jQuery("select[id$='lstCountry']:eq("+rowid+")").val();
		Guestobj.phone					= 	jQuery("input[id$='txtContactPhone']:eq("+rowid+")").val();
		Guestobj.mobile					= 	jQuery("input[id$='txtContactMobile']:eq("+rowid+")").val();
		Guestobj.fax					= 	jQuery("input[id$='txtContactFax']:eq("+rowid+")").val();
		Guestobj.birthdate				= 	'';				
		Guestobj.email					= 	jQuery("input[id$='txtContactEmail']:eq("+rowid+")").val();
		Guestobj.identityunkid			= 	jQuery("select[id$='lstIdentityType']:eq("+rowid+")").val();;
		Guestobj.exp_date				= 	'';
		Guestobj.identity_no			= 	jQuery("input[id$='txtIdentityNo']:eq("+rowid+")").val();
		Guestobj.nationality			= 	jQuery("select[id$='lstNationality']:eq("+rowid+")").val();
		Guestobj.anniversary			= 	'';
		Guestobj.citizenship			= 	'';
		Guestobj.spousebirthdate		= 	'';
		Guestobj.vipstatusunkid			= 	jQuery("select[id$='lstVIPStatus']:eq("+rowid+")").val();
		Guestobj.company				= 	'';			
		parent.fun_getguestinformation(Guestobj,rowid,0);
	}
}
var arrGuest = new Object();	
var guestcounter=0;	
parent.is_wkn=0	
parent.fun_getguestinformation=function getguestinformation(objGuest,rowid,disablectrl)
{
	try{	
		if (parent.is_wkn)
		{
			parent.hideWait();
			jQuery("select[id$='lstCompany']").val(objGuest.contactunkid);
			parent.is_wkn=0;
			return false;
		}			
		var gflag=0;
		jQuery.each(arrGuest, function(rowkey, rowval) 
		{
			if(rowkey==rowid)
				gflag=1;
		});			
		arrGuest[rowid]=objGuest;
		if(gflag==0)
			guestcounter++;
		jQuery("select[id$='lstSalutation']:eq("+rowid+")").val(objGuest.salutation);
		jQuery("input[id$='txtGuestName']:eq("+rowid+")").val(objGuest.name);
		jQuery("select[id$='lstIdentityType']:eq("+rowid+")").val(objGuest.identityunkid);
		jQuery("input[id$='txtIdentityNo']:eq("+rowid+")").val(objGuest.identity_no);						
		jQuery("input[id$='guestunkid']:eq("+rowid+")").val(objGuest.contactunkid);
		if(objGuest.contactunkid=='-1')
			jQuery("input[id$='createnewprofile']:eq("+rowid+")").val(1);
		else
			jQuery("input[id$='createnewprofile']:eq("+rowid+")").val(0);		
		if(disablectrl==1)
		{				
			jQuery("select[id$='lstSalutation']:eq("+rowid+")").attr('disabled','disabled');
			jQuery("input[id$='txtGuestName']:eq("+rowid+")").attr('disabled','disabled');
		}
		else
		{
			jQuery("select[id$='lstSalutation']:eq("+rowid+")").attr('disabled','');
			jQuery("input[id$='txtGuestName']:eq("+rowid+")").attr('disabled','');
		}
		if(!rowid) // Main guest case
		{
			jQuery("textarea[id$='txtAddress']:eq("+rowid+")").text(objGuest.address);
			jQuery("input[id$='txtState']:eq("+rowid+")").val(objGuest.state);
			jQuery("input[id$='txtCity']:eq("+rowid+")").val(objGuest.city);
			jQuery("input[id$='txtZip']:eq("+rowid+")").val(objGuest.zipcode);
			jQuery("select[id$='lstCountry']:eq("+rowid+")").val(objGuest.country);
			jQuery("select[id$='lstNationality']:eq("+rowid+")").val(objGuest.nationality);
			if(objGuest.gender=="Male")
				jQuery("input[id$='radMale']:eq("+rowid+")").attr('checked','checked');
			else if(objGuest.gender=="Female")
				jQuery("input[id$='radFemale']:eq("+rowid+")").attr('checked','checked');
			else 
				jQuery("input[id$='radOther']:eq("+rowid+")").attr('checked','checked');	
			jQuery("select[id$='lstVIPStatus']:eq("+rowid+")").val(objGuest.vipstatusunkid);	
			jQuery("input[id$='txtContactEmail']:eq("+rowid+")").val(objGuest.email);
			jQuery("input[id$='txtContactPhone']:eq("+rowid+")").val(objGuest.phone);
			jQuery("input[id$='txtContactMobile']:eq("+rowid+")").val(objGuest.mobile);
			jQuery("input[id$='txtContactFax']:eq("+rowid+")").val(objGuest.fax);
		}
		parent.hideWait();
		if(guestcounter == jQuery(".txtNoRooms").val())
		{
		   sessionStorage.setItem("guestinfo_array", JSON.stringify(arrGuest));
		   refilltranlist(''); 
		}
	}
	catch(e){alert("fun_getguestinformation >> fun_getguestinformation :" +e);}	
}
function swipecard_walkin(evn)
{
	if(evn.data.cnt!='0') evn.data.cnt=jQuery(this).parent().parent().index()+1;
	guestcounter++;
	clearsearch(evn);
	rowid=evn.data.cnt;	
	swipecard('WalkIn',rowid);
}
function guestinfo_clicked(evn){
	if(evn.data.cnt!='0') evn.data.cnt=jQuery(this).parent().parent().index()+1;
	rowid=evn.data.cnt;			
	flag=0;		
	jQuery.each(arrGuest, function(rowkey, rowval) 
	{
		if(rowkey==rowid)
			flag=1;
	});		
	if(flag==1)
		contactid=arrGuest[rowid]['contactunkid'];
	else
		contactid='-1';			
	parent.sharer_operation('',contactid,'','GUEST',1,0,rowid,'AddGuest',1,'WalkIn');		
}
function fillGuestInfo(guestobj_json,rowid){
	try{	
		objGuest=jQuery.parseJSON(guestobj_json);							
		parent.fun_getguestinformation(objGuest,rowid,1);					
	}
	catch(e){alert("sharer >> bindValuesWithWalkIn "+e);}				
}	
function pop_guestsearch(){
	try{
		var P_Height= '580';
		var P_Width='810';
		p_name=' ';
		Type='VENDOR';
		p_identity=' ';
		parent.is_wkn=1;	
		parent.fun_guestsearchreturn=guestsearchreturn;		
		parent.guestsearch_operation('',Type,p_name,p_identity);	
	}
	catch(e){alert(e);}
}	
function cardVarification(){
	try{parent.loadPopup('CardVarify','cardvarification/popup/walkin',300,335);	}
	catch(e){alert(e);}
}
parent.fun_refreshafterxchargepaymentCard = refreshCardVarifivation;
function refreshCardVarifivation(){
	try{
		jQuery('.btnVarify').attr('disabled','disabled');
		jQuery("select[id$='lstMaster']").val("-1");
		jQuery("input[id$='txtRecVouNo']").val("");
		jQuery("input[id$='txtPayAmount']").val("");
		jQuery("input[id$='btnVarify']").css({color:'#ffffff'}).fadeIn(300).fadeOut(200).fadeIn(300).fadeOut(200).fadeIn(300);
	}
	catch(e){alert(e);}
}	
function assignWalkinValues(roomtypeid,objGuest){
	jQuery("select[id$='lstRoomType']:eq(0)").val(roomtypeid);	
	jQuery("select[id$='lstRoomType']:eq(0)").trigger('change',{idx:0,gobject:objGuest});			
}
function releaseDateLimit()	{		
	if(jQuery("input[id$='dtpReleaseDate']").val()!='')
	{
		jQuery("input[id$='chkReleaseDate']").attr('checked',true);
		jQuery("input[id$='txtReleaseTerm']").attr('disabled','');			
	}	
}
function checkSuiteWith(connectroomids){
	if(jQuery("input[id$='txtNoRooms']").val()==1 && connectroomids!='')
		jQuery("#showhideSuiteWith").show();
	else
	{
		jQuery("input[id$='chkSuiteWith']").attr('checked', false);
		jQuery("#showhideSuiteWith").hide();
	}
}
function callConnectRooms(retdata,count,jsonData) {
	var crow='';
	crow += "<lrmt>"+jsonData.CFRoomTypeId+"</lrmt>";
	crow += "<lrm>"+jsonData.CRoomId+"</lrm>";
	crow += "<lrmnm>"+jsonData.CRoomName+"</lrmnm>";
	crow += "<lrt>"+jQuery("select[id$='lstRateType']:eq(0)").val()+"</lrt>";
	crow += "<la>1</la>";
	crow += "<lc>0</lc>";
	crow += "<ls>"+jQuery("select[id$='lstSalutation']:eq(0)").val()+"</ls>";
	crow += "<tg>"+jQuery("input[id$='txtGuestName']:eq(0)").val()+"</tg>";
	crow += "<lidt>"+jQuery("select[id$='lstIdentityType']:eq(0)").val()+"</lidt>";
	crow += "<tidno>"+jQuery("input[id$='txtIdentityNo']:eq(0)").val()+"</tidno>";
	crow += "<hgid>"+jQuery("input[id$='guestunkid']:eq(0)").val()+"</hgid>";
	crow += "<hcnp>"+jQuery("input[id$='createnewprofile']:eq(0)").val()+"</hcnp>";
	if(retdata[0])
	{
		crow += "<gadd>"+retdata[0]['address']+"</gadd>";
		crow += "<gcity>"+retdata[0]['city']+"</gcity>";
		crow += "<gstate>"+retdata[0]['state']+"</gstate>";
		crow += "<gcountry>"+retdata[0]['country']+"</gcountry>";
		crow += "<gzip>"+retdata[0]['zipcode']+"</gzip>";
		crow += "<gphone>"+retdata[0]['phone']+"</gphone>";
		crow += "<gmobile>"+retdata[0]['mobile']+"</gmobile>";
		crow += "<gfax>"+retdata[0]['fax']+"</gfax>";
		crow += "<gbdate>"+retdata[0]['birthdate']+"</gbdate>";
		crow += "<ganndate>"+retdata[0]['anniversary']+"</ganndate>";
		crow += "<gspbdate>"+retdata[0]['spousebirthdate']+"</gspbdate>";
		crow += "<gvipstatus>"+retdata[0]['vipstatusunkid']+"</gvipstatus>";
		crow += "<ggender>"+retdata[0]['gender']+"</ggender>";
		crow += "<gemail>"+retdata[0]['email']+"</gemail>";
		crow += "<gischild>"+retdata[0]['ischild']+"</gischild>";			
		crow += "<gexp_date>"+retdata[0]['exp_date']+"</gexp_date>";
		crow += "<gcompany>"+retdata[0]['company']+"</gcompany>";
		crow += "<gnationality>"+retdata[0]['nationality']+"</gnationality>";			
		crow += "<growid>"+count+"</growid>";
	}
	else
	{
		var salutation = jQuery("select[id$='lstSalutation']:eq(0)").val();
		if(salutation == 'MAM' || salutation == 'MRS' || salutation == 'MS')
			gender = 'Female';
		if(salutation == 'NONE' || salutation == '')
			gender = 'Other';
		else
			gender = 'Male';			
		crow += "<gadd></gadd>";
		crow += "<gcity></gcity>";
		crow += "<gstate></gstate>";
		crow += "<gcountry></gcountry>";
		crow += "<gzip></gzip>";
		crow += "<gphone></gphone>";
		crow += "<gmobile></gmobile>";
		crow += "<gfax></gfax>";
		crow += "<gbdate></gbdate>";
		crow += "<ganndate></ganndate>";
		crow += "<gspbdate></gspbdate>";
		crow += "<gvipstatus></gvipstatus>";				
		crow += "<ggender>"+gender+"</ggender>";				
		crow += "<gemail></gemail>";
		crow += "<gischild></gischild>";			
		crow += "<gexp_date></gexp_date>";
		crow += "<gcompany></gcompany>";
		crow += "<gnationality></gnationality>";			
		crow += "<growid>"+count+"</growid>";
	}
	crow += "<suitewith>1</suitewith>";
	crow += "<crflag>"+jQuery("input[id$='chkSuiteWith']").is(":checked")+"</crflag>";		
	return crow;
}
function enabledisableTemplateList(flag){
	if(!flag)
		jQuery("select[id$='lstEmailTemplates']").attr("disabled","disabled");
	else
		jQuery("select[id$='lstEmailTemplates']").removeAttr("disabled"); 
}
function dataNotProperMsg(){
	jQuery('.ui-selectee',top.document).removeClass('ui-selected');
	jQuery('.first_click',top.document).hide();
	jQuery('.grdborder .first_click',top.document).remove();
	jQuery('.first_click span',top.document).hide();	
	parent.displayDataNotProcessedMsg('WalkIn'); }	
function tax_exemption()<!--Manali - 1.0.37.42 - 26 Nov 2013 , Purpose : Enhancement - Select taxes for assign -->
{parent.loadPopup('WalkInTaxExemption','walkintaxexemption/tranunkid/-1/popupid/WalkIn',385,571); }