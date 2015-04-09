var strTime = "15:05:43";
var H = strTime.split(":")[0];
var M = strTime.split(":")[1];
var S = strTime.split(":")[2];
var js_dateobj;
var js_localTime;
var js_localDate="2014-04-29";
var serverurl='http://rms.mysoft.ge:8080/hms/';

function secondsToTime(t)
{
	var secs = (eval(H)*60*60)+(eval(M)*60)+eval(S)+t;
	var hours = Math.floor(secs / (60 * 60));

    var divisor_for_minutes = secs % (60 * 60);
    var minutes = Math.floor(divisor_for_minutes / 60);

    var divisor_for_seconds = divisor_for_minutes % 60;
    var seconds = Math.ceil(divisor_for_seconds);

	var format = "h:i:s A";

	if (format == "h:i:s A")
		{
		var h = (hours > 12) ? (hours -12):hours;
		var p = (hours > 12) ? " PM" : " AM";
		js_localTime = checkTime(h)+":"+checkTime(minutes)+":"+checkTime(seconds)+p;
		}
	else{
		h = hours;
		p = '';
		js_localTime = checkTime(h)+":"+checkTime(minutes)+":"+checkTime(seconds);
		}

    var obj = {
        "h": h,
        "m": minutes,
        "s": seconds,
        "p": p
    };
	js_dateobj = obj;
    return obj;
}

var comm_c=0;
function timedCount()
{
comm_c=eval(comm_c)+1;
t=setTimeout("timedCount()",1000);
secondsToTime(comm_c);
}

function checkTime(i)
{
if (i < 10)
  	{
	i= "0" + i;
  	}
	return i;
	//console.log(i);
}
timedCount();

function get_GroupCount(tran_id,groupid,res_no,ownership,popup,action,tranflag,tran_status)
{
	//console.log("get_GroupCount :"+tran_id+"--"+groupid+"--"+res_no+"--"+ownership+"--"+action+"--"+tranflag);

	if(tranflag=='')
		tranflag=0;

	if(ownership==1)
	{
		var request = new Prado.CallbackRequest('ctl0$ctl1$callbackGroupCount',{});
		var param = {'tranunkid' : tran_id,'groupunkid' : groupid,'res_no' : res_no,'popup' : popup,'action' : action,'tranflag' : tranflag,'status' : tran_status+""}; <!--Manali - 1.0.37.42 - 02 Dec 2013, Purpose : Added tran_status, Part Of Advance Room Move -->
		request.setCallbackParameter(param);
		request.dispatch();
	}
	else
	{
		callAction(tran_id,res_no,popup,action,tranflag,groupid,tran_status);  <!--Manali - 1.0.37.42 - 02 Dec 2013, Purpose : Added tran_status, Part Of Advance Room Move -->
	}
}

<!--Manali - 1.0.37.42 - 02 Dec 2013 - START -->
<!--Purpose : Modified below function,Added status, Part Of Advance Room Move -->
function ChangeGroupOwner(tran_id,groupid,res_no,popup,action,tranid_notin,status)
{
	/*alert("ChangeGroupOwner "+ tran_id +" -- "+groupid+" -- "+ res_no +" -- "+ popup +" -- "+action+" -- "+tranid_notin+" -- "+status);	*/
	loadPopup('ChangeGroupOwner','changegroupownership/tranunkid/'+tran_id+'/groupunkid/'+groupid+'/res_no/'+res_no+'/popup/'+popup+'/action/'+action+'/status/'+status+'/tranflag/'+tranid_notin,350,310);
}
<!--Manali - 1.0.37.42 - 02 Dec 2013 - END -->

function callAction(tran_id,res_no,popup,action,tranflag,groupid,tran_status)
{
	try
	{
		//alert("callAction "+ tran_id +" -- "+ res_no +" -- "+ popup +" -- "+action+" -- "+tranflag+" -- "+groupid+" -- "+tran_status);
		if(popup=='ReservationList')
		{
			if(action=='VOID')
				void_transaction_operation(tran_id,groupid,popup,action);
			else if(action=='CANCEL')
				cancel_reservation_operation(tran_id,res_no,popup,0);
		}
		else if(popup=='ArrivalList')
		{
			if(action=='VOID')
				void_transaction_operation(tran_id,groupid,popup,action);
			else if(action=='NOSHOW')
				no_show(tran_id,res_no,popup);
			else if(action=='VOIDTRANSACTION')
				void_transaction_operation(tran_id,groupid,popup,action);
		}
		else if(popup=='DepartureList' || popup=='Dashboard')
		{
			if(action=='CHECKOUT')
				check_out(tran_id,groupid,tranflag,popup,action,tran_status,res_no);<!--Manali - 1.0.37.42 - 02 Dec 2013, Purpose : Added tranflag,popup,action,tran_status,res_no, Part Of Advance Room Move -->
			else if(action=='VOIDTRANSACTION')
				void_transaction_operation(tran_id,groupid,popup,action);
		}
		else if(popup=='EditTran' || popup=='EditGroupTran_Single')
		{
			//console.log('edittran='+popup);
			if(action=='CHECKOUT')
			{
				//console.log('action='+action);
				//setTimeout("parent.tabiframe_edittran.check_out("+tran_id+")",1000);
				parent.check_out(tran_id,groupid,tranflag,popup,action,tran_status,res_no);<!--Manali - 1.0.37.42 - 02 Dec 2013, Purpose : Added tranflag,popup,action,tran_status,res_no, Part Of Advance Room Move -->
			}
		}
		else if(popup=='EditGroupTran')
		{
			if(action=='CHECKOUT')
			{
				if(!hasRights(25)) // AccessToCheckOutGuest
					return;

				//Alert if any task pending on check out for this transaction - Manali - 26th July 2011
				showPendingTask(tran_id,'ONCHECKOUT','FRONTOFFICE');<!--Manali - 1.0.37.42 - 02 Dec 2013, Purpose : Fixed Bug - tran_id variable was wrongly displayed, initially it was tranid-->

				showjQloading();
				var request = new Prado.CallbackRequest('ctl0$ctl1$callbackGroupCheckOut',{});
				var param = {'groupid' : groupid,'checkedrows' : parent.val_chkedrows_for_groupcheckout,'tranunkid' : tranflag+""};
				request.setCallbackParameter(param);
				request.dispatch();
			}
			// Manali - 1.0.22.27 - 16 Nov 2011 - START
			//Purpose : Enhancement - Remove transaction from group
			else if(action=='RemoveTransactionFromGroup')
			{
				//console.log("Remove Transaction from group");
				parent.tabiframe_edittran.removeTransactionCallback(groupid,tranflag,1,0);
			}
			// Manali - 1.0.22.27 - 16 Nov 2011 - END
		}
		else if(popup=='NightAudit')
		{
			if(action=='VOID')
				void_transaction_operation(tran_id,groupid,popup,action);
			else if(action=='NOSHOW')
				no_show(tran_id,res_no,'nightaudit');
			else if(action=='CANCEL')
				cancel_reservation_operation(tran_id,res_no,'nightaudit',0);
			else if(action=='CANCELRELEASE')
				cancel_reservation_operation(tran_id,res_no,'nightaudit',1);
			else if(action=='CHECKOUT')
				parent.check_out(tran_id,groupid,tranflag,popup,action,tran_status,res_no);	<!--Manali - 1.0.37.42 - 02 Dec 2013, Purpose : Added tranflag,popup,action,tran_status,res_no, Part Of Advance Room Move -->
		}
		else if(popup=='Stayview')
		{
			if(action=='NOSHOW')
				no_show(tran_id,res_no,popup);
			else if(action=='CANCEL')
				cancel_reservation_operation(tran_id,res_no,popup,0);
			else if(action=='VOIDTRANSACTION')
				void_transaction_operation(tran_id,groupid,popup,action);
		}
		return;
	}
	catch(e)
	{
		alert ("newfdlayout >> callAction"+e);
	}
}

function getcancellationaccount()
{
	var cancelaccount= '50300000000000008';
	if(cancelaccount=='')
	{
		alert("Please configure Cancellation Revenue Account from Admin Panel, Settings Menu, Tax/Account Configuration Module.");
		return false;
	}
	else
		return cancelaccount;
}

function getnoshowaccount()
{
	var noshowacc= '50300000000000009';

	if(noshowacc=='')
	{
		alert("Please configure NoShow Revenue Account from Admin Panel, Settings Menu, Tax/Account Configuration Module.");
		return false;
	}
	else
		return noshowacc;
}

function guest_check_in(tranId,arrival,departure,roomtypeid,roomid)
{
	if(roomid==0)
	{
		alert("Check In is not allowed because room is not assigned.");
		return false;
	}
	else
	{
		if(!hasRights(13)) // CheckInGuest
			return;

		//Manali - 1.0.33.38 - 06 May 2013 - START
		//Purpose : Enhancment - Check mandatory information for walkin, then only allow desk user to process for checkin
		var request = new Prado.CallbackRequest('ctl0$ctl1$callbackValidateCheckIn',{});
		var param = {'arrival' : arrival+'','departure' : departure+'','roomid' : roomid+'','roomtypeid' : roomtypeid+'','tranunkid' : tranId+""};
		request.setCallbackParameter(param);
		request.dispatch();
		//Manali - 1.0.33.38 - 06 May 2013 - END
	}
}

// Manali - 1.0.23.28 - 28 Dec 2011,Purpose : Enhancement - If room is dirty,place confirmation while check in. If yes then only proceed for checkin else not.
function checkIsRoomDirty(tranId,arrival,departure,roomtypeid,roomid)
{
	var request = new Prado.CallbackRequest('ctl0$ctl1$callbackIsRoomDirty',{});
	var param = {'arrival' : arrival+'','departure' : departure+'','roomid' : roomid+'','roomtypeid' : roomtypeid+'','tranunkid' : tranId+""};
	request.setCallbackParameter(param);
	request.dispatch();
}

function process_for_CheckIn(tranId,arrival,departure,roomtypeid,roomid)
{
	showPendingTask(tranId,'ONCHECKIN','FRONTOFFICE'); //Alert if any task pending on check In on this transaction - Manali - 26th July 2011

	if(!jQuery('#NightAudit').length)
		showjQloading();
	var request = new Prado.CallbackRequest('ctl0$ctl1$callbackCheckIn',{});
	var param = {'arrival' : arrival,'departure' : departure,'roomid' : roomid,'roomtypeid' : roomtypeid,'tranunkid' : tranId+""};
	request.setCallbackParameter(param);
	request.dispatch();
}

//Manali - 1.0.33.38 - 07 May 2013 - START
//Purpose : Enhancement - Check room is dirty or not in case of group check in,so modified below function
function confirm_to_ProcessForCheckIn(tranId,arrival,departure,roomtypeid,roomid,msg,groupcheckin,groupid)
{
	if(confirm(msg))
	{
		if(groupcheckin==1)
			process_for_GroupCheckIn(tranId,groupid);
		else
			process_for_CheckIn(tranId,arrival,departure,roomtypeid,roomid);
	}
	else
	{
		if(groupcheckin==1)
			hidejQloading(1000);
	}
	return false;
}

function process_for_GroupCheckIn(tranId,groupid)
{
	var request = new Prado.CallbackRequest('ctl0$ctl1$callbackGroupGuestCheckIn',{});
	var param = {'groupid' : groupid,'tranunkid' : tranId+""};
	request.setCallbackParameter(param);
	request.dispatch();
}

function displayMsg(msg)
{
	alert(msg);
	return false;
}

function group_guest_checkin()
{
	var checkbox_checked = false;
	var flag=0;
	var groupid;
	checkbox_checked = parent.tabiframe_edittran.jQuery('.checkbox_datalist_roomcharges_child').is(':checked');

	if(checkbox_checked)
	{
		if(!hasRights(13)) // CheckInGuest
			return;

		//Manali - 1.0.33.38 - 07 May 2013 - START
		//Purpose : Modified code
		var tranflag=0;
		parent.tabiframe_edittran.jQuery('.checkbox_datalist_roomcharges_child').each(function()
		{
			if(jQuery(this).attr('checked')==true)
			{
				var transaction=jQuery(this).val().split("|");
				groupid=transaction[0];

				var chkstatus = ['CONFRESERV','UNCONFRESERV','DAYUSERESERV'];
				if(jQuery.inArray(transaction[4],chkstatus)>=0)
				{
					flag++;

					if(tranflag==0)
						tranflag=transaction[1];
					else
						tranflag=tranflag+","+transaction[1];
				}
			}
		});

		if(flag>0)
		{
			showjQloading();
			var request = new Prado.CallbackRequest('ctl0$ctl1$callbackGroupCheckIn',{'onComplete':function(sender, parameter){ parent.hidejQloading(1000); }});
			var param = {'groupid' : groupid,'tranunkid' : tranflag+""};
			request.setCallbackParameter(param);
			request.dispatch();
		}

		if(flag==0)
			Group_CheckIn_Msg("Group Check In is not allowed.");
		//Manali - 1.0.33.38 - 07 May 2013 - END
	}
	else
	{
		alert("Please select a record.");
		return false;
	}
}

function checkedIn_Message(foliono,groupid,rettranids)
{
	try
	{
		var status='';
		// Manali - 1.0.24.29 - 13 Mar 2012 - START
		// Purpose : Fixed Bug - While group check In, not to open print Folio tab,if option is on from Absolute Configuration Panel.
		if(rettranids!='')
		{
			// Jignesh - Start - 2011-09-24  - Open Folio tab on checkin.
			jsonTran = jQuery.parseJSON(rettranids);
			parent.traninfo = rettranids;
			status=jsonTran["statusunkid"];

			tranunkid=jsonTran[0]["tranid"]; //tranunkid id
			var masterguesttranunkid=jsonTran[0]["tranunkid"]; //masterguesttranunkid id
			if(jQuery('#iframecontainer_NightAudit').length == 0)
			{
				// Jignesh - 1.0.22.28 - 02 Jan 2012 - START
				// Purpose : supress removed and put on report .mrt file
				if ("0" == 1)
				{
					PrintGuestRegistrationCard(jsonTran[0]["tranunkid"]); //Jignesh - 1.0.22.27 - 18 Oct 2011
				}

				if ("0" == 1)
				{
					if (jsonTran["masterfoliounkid"] != '')
					{
						PrintFolio(jsonTran[0]["tranid"],jsonTran["masterfoliounkid"],"50300000000000001");//Manali - 1.0.33.38 - 04 May 2013,Purpose : Enhancement - Print Folio in Multi Currency
					}
				}
			}
			// Jignesh - End - 2011-09-24  - Open Folio tab on checkin.
		}
		// Manali - 1.0.24.29 - 13 Mar 2012 - END

		if(foliono=="-1")
			jMessage("Group Check In has been done successfully.",'Success','center','top');
		else if(foliono=="-2") //Manali - 1.0.37.42 - 23 Oct 2013, Purpose : Check previous date transaction guest is physically moved or not if exists anywhere for previous date arrival/stayview case, part of Advance Room Move.
			jMessage("Some of the rooms previous date guest are not physically moved so check in not allowed for that rooms.",'Success','center','top');
		else
			jMessage("The Guest has been checked in successfully. Guest folio no is : "+foliono,'Success','center','top');

		var pagename=jQuery("input[id$='hidPageName']").val();

		if(jQuery('#NightAudit').length)
		{
			if(get_pagename()!="report")
				refreshArrivalList();
			NightAudit.refreshList();
		}
		else if(jQuery('#div_EditTran').length)
		{
			refreshArrivalList();
			jQuery("input[id$='hidCheckInFlag']").val(1);
			parent.tabiframe_edittran.refreshEditTranOnCheckIn();
			hidejQloading(1000);
		}
		else if(jQuery('#div_EditGroupTran').length)
		{
			refreshArrivalList();
			refreshIframe('CheckIn',groupid);
			jQuery("input[id$='hidCheckInFlag']").val(1);
			hidejQloading(1000);
		}
		else if(pagename=="reservationlist" || pagename=="arrivallist" || pagename=="departurelist" || pagename=="groupreservationlist" || pagename=="inhousegrouplist" || pagename=="departedgrouplist")
		{
			if(pagename=="groupreservationlist" || pagename=="inhousegrouplist" || pagename=="departedgrouplist")
			{
				refreshIframe('CheckIn',groupid); //Note :  Please dont remove, if Edit group transaction is opened, and from left panel I am doing checkin on other transaction of same group at that time I need to refresh iframe. - Manali
			}
			refreshList();
		}
		else if(pagename=="dashboard")
		{
			refreshList();
			refreshQuickOperations();
		}
		else if(pagename=="stayview")
			addRemoveTransaction(status,tranunkid,true,true,"CheckIn");
		else if(pagename=="roomview")
			 parent.addRemoveTransaction(status,tranunkid,true,true,"checkin");
		else if(pagename=="quickview")
		{
			refreshArrivalList(); // Jignesh 16 sep 2011 - checkin is not reflection to arrival list.
			loadquickview(0); // Jignesh 16 sep 2011 - reload quickview .
		}
		else
		{
			refreshArrivalList(); // Jignesh 16 sep 2011 - checkin is not reflection to arrival list.
			hidejQloading(1000);
		}

		// Manali - 1.0.23.28 - 04 Jan 2012 - START
		// Purpose : If transaction Search tab is opened,its not refreshing tab
		if(parent.jQuery('#div_TranSearch').length)
			parent.tabiframe_TranSearch.loadata();
		// Manali - 1.0.23.28 - 04 Jan 2012 - END
	}
	catch(e)
	{
		alert(e);
	}
}

//Manali - 1.0.32.37 - 28 Mar 2013,Purpose :Customization - Changed logic, Enhancement - Display inclusion separately on folio based on tran level setting
function PrintFolio(tranunkid,foliounkid,exchangerateid)//Manali - 1.0.33.38 - 04 May 2013,Purpose : Enhancement - Print Folio in Multi Currency
{
	//console.log(tranunkid+','+foliounkid+','+exchangerateid);
	try
	{
		if(!(0 && 0))
		{
			var request = new Prado.CallbackRequest('ctl0$ctl1$callback_printGuestFolio',{'onPreDispatch':function(sender, parameter){ parent.showWait() },'onComplete':function(sender, parameter){ parent.hideWait() }});
			var param = {'tranunkid' : tranunkid,'foliounkid' : foliounkid,'exchangerateid' : exchangerateid+""};//Manali - 1.0.33.38 - 04 May 2013,Purpose : Enhancement - Print Folio in Multi Currency
			request.setCallbackParameter(param);
			request.dispatch();
		}
		else
		{
			url =serverurl+"index.php/page/newfront.foliohtml/a/"+tranunkid+"/b/"+foliounkid;
			window.open(url);
		}
	}
	catch(e)
	{
		alert("commonfunction >> PrintFolio"+e);
	}
}

//Purpose :Customization - Changed logic, Enhancement - Display inclusion separately on folio based on tran level setting
function loadFolioTemplate(tranunkid,foliounkid)
{
	try
	{
		temp=0;
		user = jQuery("input[id$='user']").val();
		hotelcode=503;
		logo="https://saas.s3.amazonaws.com/uploads/";

		localdatetime=js_localDate+" "+js_localTime;
		timeformate="h:i:s A";
		decimalpoint="2";
		dateformate="Y-MM-dd";
		des="0";
		sessionid="503|42429";

		url =serverurl+"protected/pages/stimulsoft/index.php?stimulsoft_client_key=ViewerFx&stimulsoft_report_key=FolioInvoice1.mrt&temp="+temp+"&tranunkid="+tranunkid+"&foliounkid="+foliounkid+"&user="+user+"&hotelcode="+hotelcode+"&logo="+logo+"&dateformate="+dateformate+"&localdatetime="+localdatetime+"&timeformate="+timeformate+"&decimalpoint="+decimalpoint+"&sessionid="+sessionid+"&desc="+des ;
		loadTab('folioinvoice',"Print Folio",url);
	}
	catch(e)
	{
		alert("commonfunction >> loadFolioTemplate"+e);
	}
}
//Manali - 1.0.32.37 - 28 Mar 2013 - END

// Jignesh - 1.0.22.28 - 02 Jan 2012 - START
// Purpose : supress removed and put on report .mrt file
function PrintGuestRegistrationCard(guesttranunkid)
{
	try
	{
		var request = new Prado.CallbackRequest('ctl0$ctl1$callback_printGuestRegistrationCard',{'onPreDispatch':function(sender, parameter){ parent.showWait() },'onComplete':function(sender, parameter){ parent.hideWait() }});
		var param = {'guesttranunkid' : guesttranunkid+""};
		request.setCallbackParameter(param);
		request.dispatch();
	}
	catch(e)
	{
		alert("commonfunction >> PrintGuestRegistrationCard"+e);
	}
}

//Chandrakant - 1.0.34.39 - 1 July 2013 - START
//Purpose : For direct query to XML convertion
function PrintReceipt(detailunkid,foliounkid)
{
	try
	{
		if(typeof(foliounkid)==='undefined')
			foliounkid='';
		if(typeof(detailunkid)==='undefined')
			detailunkid='';

		var request = new Prado.CallbackRequest('ctl0$ctl1$callback_printReceiptCard',{'onPreDispatch':function(sender, parameter){ parent.showWait() },'onComplete':function(sender, parameter){ parent.hideWait() }});
		var param = {'foliounkid' : foliounkid+"",'detailunkid' : detailunkid+""};
		request.setCallbackParameter(param);
		request.dispatch();
	}
	catch(e)
	{
		alert("commonfunction >> PrintReceipt - "+e);
	}
}

function loadReceiptCard(foliounkid)
{
	try
	{
		logo="https://saas.s3.amazonaws.com/uploads/";
		hotelcode="503";
		dateformate="Y-MM-dd";
		decimalpoint ="2";
		localdatetime=js_localDate+" "+js_localTime;
		timeformat="%h:%i:%s %p";
		sessionid="503|42429";

		url =serverurl+"protected/pages/stimulsoft/index.php?stimulsoft_client_key=ViewerFx&stimulsoft_report_key=paymentreceipt1.mrt&foliounkid="+foliounkid+"&hotelcode="+hotelcode+"&dateformate="+dateformate+"&timeformat="+timeformat+"&decimalpoint="+decimalpoint+"&sessionid="+sessionid+"&localdatetime="+localdatetime+"&logo="+logo+"";

		loadTab('paymentreceipt',"Payment Receipt",url);
	}
	catch(e)
	{
		alert("commonfunction >> loadReceiptCard - "+e);
	}
}
//Chandrakant - 1.0.34.39 - 1 July 2013 - END

function loadGuestRegistrationCard(guesttran_id)
{
	try
	{
		logo="https://saas.s3.amazonaws.com/uploads/";
		hotelcode="503";
		dateformate="Y-MM-dd";
		decimalpoint ="2";
		localdatetime=js_localDate+" "+js_localTime;
		timeformat="%h:%i:%s %p";

		sessionid="503|42429";

		url =serverurl+"protected/pages/stimulsoft/index.php?stimulsoft_client_key=ViewerFx&stimulsoft_report_key=Guest_Registration_Card1.mrt&guesttranid="+guesttran_id+"&checkMarkImageURL="+jQuery("input[id$='checkMarkImageURL']").val()+"&hotelcode="+hotelcode+"&dateformate="+dateformate+"&timeformat="+timeformat+"&decimalpoint="+decimalpoint+"&sessionid="+sessionid+"&localdatetime="+localdatetime+"&logo="+logo+"";

		loadTab('guestRegistration',"Guest Registration Card",url);
	}
	catch(e)
	{
		alert("commonfunction >> PrintGuestRegistrationCard"+e);
	}
}

//Chandrakant - 1.0.34.39 - 3 July 2013 - START
//Purpose : For direct Query to XML conversion
function PrintVoucher(detailunkid)
{
	try
	{
		var request = new Prado.CallbackRequest('ctl0$ctl1$callback_PrintVoucher',{'onPreDispatch':function(sender, parameter){ parent.showWait() },'onComplete':function(sender, parameter){ parent.hideWait() }});
		var param = {'detailunkid' : detailunkid+""};
		request.setCallbackParameter(param);
		request.dispatch();
	}
	catch(e)
	{
		alert("commonfunction >> PrintVoucher - "+e);
	}
}

// HRK - 1.0.24.29 - 22 Mar 2012 - START
// Purpose - Print Voucher
function LoadPrintVoucher(detailunkid)
{
	try
	{
		hotelcode="503";
		logo="https://saas.s3.amazonaws.com/uploads/";
		decimalpoint="2";
		dateformate="Y-MM-dd";
		sessionid="503|42429";

		var cardflag = jQuery('#cardprocessflag_'+detailunkid).text();/*Added By Flora*/

		where ="( fasfoliodetail.detailunkid="+detailunkid+" OR fasfoliodetail.parentid="+detailunkid+" )";

		url =serverurl+"protected/pages/stimulsoft/index.php?stimulsoft_client_key=ViewerFx&stimulsoft_report_key=chargevoucher1.mrt&where="+where+"&hotelcode="+hotelcode+"&logo="+logo+"&dateformate="+dateformate+"&decimalpoint="+decimalpoint+"&sessionid="+sessionid+"&cardflag="+cardflag ;

		loadTab('chargevoucher',"Charge Voucher",url);
	}
	catch(e)
	{
		alert(e);
	}
}
// HRK - 1.0.24.29 - 22 Mar 2012 - END
//Chandrakant - 1.0.34.39 - 3 July 2013 - END

//Manali - 1.0.37.42 - 22 Oct 2013 - START
//Purpose : Guest_Already_CheckIn/No_Successful_CheckIn method changed to GuestCheckInFailed_Msg, to shift messages at common level in case of failed check in
function GuestCheckInFailed_Msg(flag)
{
	try
	{
		if(flag==1) 	//flag 1 - Guest Already Checked In
			alert("Guest already checked in.");
		else if(flag==2) 	//flag 2 - Previous Date Guest is not physically moved so check in not allowed
			alert("Previous date guest is not physically moved so check in not allowed");
		else 		//flag 3 - Previous guest not checked out
			alert("Guest cannot be check in because previous guest in the same room has not checked out yet.");
		hidejQloading(1000);
	}
	catch(e)
	{
		alert("commonfunction >> Guest_Already_CheckIn"+ e);
	}
}
//Manali - 1.0.37.42 - 22 Oct 2013 - END

function Group_CheckIn_Msg(msg)
{
	try
	{
		alert(msg);
		hidejQloading(1000);
		return false;
	}
	catch(e)
	{
		alert(e);
	}
}

    
function gettodaysdate()
{
	return '<%= today %>';
}

function group_guest_checkout()
{
	if(!parent.tabiframe_edittran.jQuery('.checkbox_datalist_roomcharges_child').is(':checked'))
	{
		alert("Please select a record.");
		return false;
	}

	var tran_guest_ownership=0;
	var ownershipflag=0;
	var ownertran_id=0;
	var res_no=0;
	var checkedval=0;
	var chkbalance=0;
	var totalrows=0;
	var tranflag='';
	var dueoutflag=0;
	var inhouseflag=0;
	var chkIsguestPhysicallyMoved=0;  <!--Manali - 1.0.37.42 - 03 Dec 2013, Purpose : Added chkIsguestPhysicallyMoved, Part of Advance Room Move -->

	parent.tabiframe_edittran.jQuery('.checkbox_datalist_roomcharges_child').each(function()
	{
		totalrows++;
		var transaction=jQuery(this).val().split("|");
		groupid=transaction[0];

		if(transaction[4]=='ARRIVAL' || transaction[4]=='STAYOVER' || transaction[4]=='DUEOUT' || transaction[4]=='DAYUSE') //Check status for Ownership
		{
			if(transaction[4]=='DUEOUT' || transaction[4]=='DAYUSE')
			{
				dueoutflag++;
				if(jQuery(this).attr('checked')==true) //Is checkbox Checked
				{
					checkedval++;

					if(transaction[5]==0)//Balance Check = 0
					{
						chkbalance++;

						if(transaction[7]=="-1")<!--Manali - 1.0.37.42 - 03 Dec 2013, Purpose : Added chkIsguestPhysicallyMoved, Part of Advance Room Move -->
							chkIsguestPhysicallyMoved++;

						if(transaction[2]==1)//Check Ownership transaction checked, then change ownership
						{
							ownershipflag=1;

							ownertran_id=transaction[1];
							res_no=	transaction[3];
							status = transaction[4];  <!--Manali - 1.0.37.42 - 03 Dec 2013, Purpose : Added status, Part of Advance Room Move -->
						}

						//Concat transaction ids which is not to be considered while changing ownership
						if(tran_guest_ownership==0)
							tran_guest_ownership=transaction[1];
						else
							tran_guest_ownership=tran_guest_ownership+","+transaction[1];

						//List Transaction Ids to be checked out
						if(tranflag=='')
							tranflag=transaction[1];
						else
							tranflag=tranflag+","+transaction[1];
					}
				}
			}
			else
				inhouseflag++;
		}
	}); //End loop

	if((checkedval==chkbalance && checkedval==chkIsguestPhysicallyMoved && checkedval==totalrows && inhouseflag==0) || (chkbalance==1 && dueoutflag==chkbalance  && inhouseflag==0)) <!--Manali - 1.0.37.42 - 03 Dec 2013, Purpose : Added chkIsguestPhysicallyMoved, Part of Advance Room Move -->
		ownershipflag=0;

	if(ownershipflag==1)
	{
		parent.val_chkedrows_for_groupcheckout=checkedval;
		ChangeGroupOwner(ownertran_id,groupid,res_no,'EditGroupTran','CHECKOUT',tran_guest_ownership,status); <!--Manali - 1.0.37.42 - 03 Dec 2013, Purpose : Added status, Part of Advance Room Move -->
	}
	else
	{
		if(!hasRights(25)) // AccessToCheckOutGuest
			return;

		//Alert if any task pending on check out for this transaction - Manali - 26th July 2011
		var tranId='';
		showPendingTask(tranId,'ONCHECKOUT','FRONTOFFICE');

		showjQloading();
		var request = new Prado.CallbackRequest('ctl0$ctl1$callbackGroupCheckOut',{});
		var param = {'groupid' : groupid,'checkedrows' : checkedval,'tranunkid' : tranflag+""};
		request.setCallbackParameter(param);
		request.dispatch();
	}
}

<!--Manali - 1.0.37.42 - 02 Dec 2013 - START-->
<!--Purpose : Added status,popup,tranflag,res_no and action, Part Of Advance Room Move -->
function showCheckOutMsg(code,tranId,msg,mode,groupid,status,popup,action,tranflag,res_no)
{
	try
	{
		if(code==0)
		{
			if(confirm(msg))
			{
				var request = new Prado.CallbackRequest('ctl0$ctl1$callbackCheckOut',{'onPreDispatch':function(sender, parameter){ parent.showWait() }});
				var param = {'groupid' : groupid,'tranunkid' : tranId,'tranflag' : tranflag,'popup' : popup,'res_no' : res_no,'status' : status,'action' : action+"",'inclusion':'1'};
				request.setCallbackParameter(param);
				request.dispatch();
				return false;
			}
			else
			{
				var request = new Prado.CallbackRequest('ctl0$ctl1$callbackCheckOut',{'onPreDispatch':function(sender, parameter){ parent.showWait() }});
				var param = {'groupid' : groupid,'tranunkid' : tranId,'tranflag' : tranflag,'popup' : popup,'res_no' : res_no,'status' : status,'action' : action+""};
				request.setCallbackParameter(param);
				request.dispatch();
				return false;
			}
			return false;
		}

		if(code==1)
		{
			if(confirm(msg))
			{
				latecheckout=1;
				var request = new Prado.CallbackRequest('ctl0$ctl1$callbackdoCheckOut',{'onPreDispatch':function(sender, parameter){ parent.showWait() },'onComplete':function(sender, parameter){ parent.hideWait() }});
				var param = {'groupid' : groupid,'tranunkid' : tranId,'latecheckoutflag' : latecheckout,'isinclusionposted' : 0+""};
				request.setCallbackParameter(param);
				request.dispatch();
			}
			else
			{
				if(jQuery('#div_EditGroupTran').length && mode=='Group')
				{
					parent.refreshArrivalList();
					parent.hidejQloading(1000);
					jQuery("input[id$='hidCheckInFlag']",top.document).val(1);
					tabiframe_edittran.fillRoomCharges();
				}
				parent.hideWait();
			}
		}
		<!--Manali - 1.0.37.42 - 02 Dec 2013 - START-->
		<!--Purpose : Enhancement - Part Of Advance Room Move, Check guest is Physically moved or not-->
		else if(code==3)
		{
			parent.hideWait();
			if(confirm(msg))
				moveGuestPhysically(tranId,groupid,tranflag,status,res_no,popup,action,1);
		}
		<!--Manali - 1.0.37.42 - 02 Dec 2013 - END	-->
		else
		{
			parent.hideWait();
			if(jQuery('#div_EditGroupTran').length == 0 && jQuery('#div_EditTran').length == 0 && jQuery('#iframecontainer_NightAudit').length == 0)
				roomOperation(tranId,1); // Open Edit transaction.

			parent.jMessage(msg,'WarningO','center','center');
			if(jQuery('#div_EditGroupTran').length && mode=='Group')
			{
				parent.refreshArrivalList();
				parent.hidejQloading(1000);
				jQuery("input[id$='hidCheckInFlag']",top.document).val(1);
				tabiframe_edittran.fillRoomCharges();
			}
		}
	}
	catch(e)
	{
		alert("commonfunction >> showCheckOutMsg "+ e);
	}
}
<!--Manali - 1.0.37.42 - 02 Dec 2013 - END-->

function guestCheckOutMsg(msg,groupid,alertmsg)
{
	try
	{
		if(alertmsg==0)
			parent.jMessage(msg,'Success','center','top');
		else
			alert(msg);

		var pagename=jQuery("input[id$='hidPageName']").val();

		if(jQuery('#NightAudit').length)
		{
			if(get_pagename()!="report")
				refreshArrivalList();

			NightAudit.refreshList();
			parent.hideWait();
		}
		else if(jQuery('#div_EditTran').length)
		{
			parent.refreshArrivalList();
			jQuery("#div_EditTran")[0].contentWindow.closeEditTran();

			if(parent.jQuery('#div_TranSearch').length)
				parent.tabiframe_TranSearch.loadata();

			if(pagename=="dashboard")
			{
				refreshList();
				refreshQuickOperations();
			}
			hideWait();
		}
		else if(jQuery('#div_EditGroupTran').length)
		{
			parent.hideWait();
			refreshArrivalList();
			refreshIframe('CheckOut',groupid);
		}
		else if(pagename=="dashboard")
		{
			refreshList();
			refreshQuickOperations();
			hideWait();
		}
		else if(pagename=="departurelist")
		{
			refreshList();
			hideWait();
		}
		else
		{
			if(jQuery("input[id$='hidPageName']").val() == "stayview")
			{
				reloadGrid();
				refresh_aList("GuestName");
			}
			else if(jQuery("input[id$='hidPageName']").val() == "roomview")
			{
				create_view(1) // 1 will not create empty grid
				refresh_aList('GuestName');
			}
			else
				refreshArrivalList(); // Jigneh 3rd oct 2011
			hideWait();
		}
	}
	catch(e)
	{
		alert("commonfunction >> guestCheckOutMsg "+e);
	}
}

<!--Manali - 1.0.37.42 - 02 Dec 2013 - START-->
<!--Purpose : Added tranflag,tran_status,popup,res_no and action, Part Of Advance Room Move -->
function check_out(tranId,groupid,tranflag,popup,action,tran_status,res_no)
{
	try
	{
		if(!hasRights(25)) // AccessToCheckOutGuest
			return;

		showPendingTask(tranId,'ONCHECKOUT','FRONTOFFICE');

		var request = new Prado.CallbackRequest('ctl0$ctl1$callbackCheckOut',{'onPreDispatch':function(sender, parameter){ parent.showWait() }});
		var param = {'groupid' : groupid,'tranunkid' : tranId,'tranflag' : tranflag,'popup' : popup,'res_no' : res_no,'status' : tran_status,'action' : action+"",'inclusion' : '0'};
		request.setCallbackParameter(param);
		request.dispatch();
		return false;
	}
	catch(e)
	{
		alert("commonfunction >> check_out "+ e);
	}
}
<!--Manali - 1.0.37.42 - 02 Dec 2013 - END-->

<!-- Jignesh - 1.0.22.27 - 14 th Oct 2011 - START -->
<!-- Purpose : To Introduse Express Checkout -->

function fun_ExpressCheckout()
{
	if(!jQuery('.checkbox_datalist_expcheckout_child').is(':checked'))
	{
		alert("Please select a record.");
		return false;
	}

	<!-- Manali - 1.0.37.42 - 02 Dec 2013 - START -->
	<!-- Purpose : Check guest physically moved or not, Part Of Advance Room Move -->
	var isphysically_moved=0;
	var process_for_expresscheckout=1;
	jQuery('.checkbox_datalist_expcheckout_child').each(function(){
		if(jQuery(this).is(':checked'))
		{
			var transaction=jQuery(this).val().split("|");
			if(transaction[2]==0)
				isphysically_moved++;
		}
	});

	if(isphysically_moved>0)
	{
		if(jQuery('.checkbox_datalist_expcheckout_child:checked').length==isphysically_moved && isphysically_moved==1)
			process_for_expresscheckout=0;
		else
			msg = "Express Checkout is not allowed on all transactions as some of transactions guest is not physically moved. Do you want to perform Express Checkout on transactions whereever applicable?";
	}
	else
		msg = "Do You Want To Express Checkout.";

	if(process_for_expresscheckout==1)
	{
		if(confirm(msg))
		{
			jQuery('.checkbox_datalist_expcheckout_child').each(function(){
				if(jQuery(this).is(':checked'))
				{
					var transaction=jQuery(this).val().split("|");
					latecheckout=1;
					if(transaction[2]!=0)
					{
						var request = new Prado.CallbackRequest('ctl0$ctl1$callbackdoCheckOut',{'onPreDispatch':function(sender, parameter){ parent.showWait() },'onComplete':function(sender, parameter){ parent.hideWait() }});
						var param = {'groupid' : transaction[1],'tranunkid' : transaction[0],'latecheckoutflag' : latecheckout,'isinclusionposted' : 1+""};
						request.setCallbackParameter(param);
						request.dispatch();
					}
				}
			}); //End loop
		}
	}
	else
	{
		alert("Express Checkout is not allowed on checked transaction as guest is not physically moved.");
		return false;
	}
	<!-- Manali - 1.0.37.42 - 02 Dec 2013 - END -->
}

function hideloading_main()
{
	hidejQloading(1000);
}

function refreshIframe(action,groupid)
{
	if(jQuery('#div_EditGroupTran').length && tabiframe_edittran.jQuery("input[id$='hidGroupId']").val()==groupid)
	{
		parent.NewshowjQloading('iframe_reload');
		jQuery('.transbg_iframe_reload').css({opacity:"0.3", background : "black"});

		if(action=='SetMessage')
			tabiframe_edittran.refreshSetMessage();
		else if(action=='SetPreference')
			tabiframe_edittran.refreshSetPreference();
		else if(action=='SetTask')
			tabiframe_edittran.refreshSetTask();
		else
		{
			tabiframe_edittran.refreshList();
			tabiframe_edittran.fillFolioDetails();
			tabiframe_edittran.fillRoomCharges();
			tabiframe_edittran.refreshGuestInfo();
		}
	}
}

function isLockPersist(tranunkid,guid)
{
    try
    {
        var status='0';
	jQuery.ajax({
            async: false,
            data: {
                opcode: "tlp",
		rq: tranunkid,
		guid: guid,
		},
            url: 'json/service.jsp',
            success: function(data)
            {
                status=data;
            }
            });
        var data = status;
	if(data=='0')
	{
            var message1 = "<b>You have lost ownership of this transaction. No further operation allowed.</b>";
            jMessage(message1,'WarningO','center','center');
            alert("You have lost ownership of this transaction. No further operation allowed.");
            jMessage(message1,'WarningO','center','center');
            return false;
	}
        else
            return true;
    }
    catch(e)
    {
	alert("common :: isLockPersist " + e);
    }
}

function isLocked(tranunkid,oprn) //Defination : This function is used to check the transaction status. - HRK
{
    try
    {
    var status='0';
    jQuery.ajax({
        async: false,
	data: { opcode: "ts", rq: tranunkid },
	url: 'json/service.jsp',
	success: function(data) {status=data;}
        });

    var data = status;

		if(data.indexOf('<title>Login</title>') != -1)
		{
			alert("Your login session is expired. Click OK to logout.");
			showBrwClsMsg=false;
			redirecturl='index.php/page/newfront.logout';
			window.location.href=serverurl+redirecturl;
			return true;
		}

		if(data!='0')
		{
			if(data=='2')
			{
				if(!(oprn=="VOID" || oprn=="EDITTRAN"))
				{
					if(confirm("Attention !, This transaction is Failed/Incomplete Online Booking. No further operation allowed on it. First you have to convert it to successful/complete transaction. Do you want to continue to make it complete?"))
						makeTranComplete(tranunkid);
					return true;
				}
				return false
			}
			else
			{
				var message1 = '<b>This room is already in use.</b>';
				var message2 = '<b>Locked By : </b>';
				var arr=data.split('|');
				var msg=message1+'<br /><br />'+message2+arr[1]+' , '+arr[2];
				jMessage(msg,'WarningO','center','center');
				return true;
			}
		}
		else
			return false;
	}
	catch(e)
	{
		alert("common :: isLocked " + e);
	}
}
function Unlocked(tranunkid) //This function will unlock the transaction. - HRK
{
	try
	{
		var status='0';
		jQuery.ajax({
				async: false,
				data: {opcode: "tul",rq: tranunkid},
				url: serverurl+'index.php/page/newfront.service',
				success: function(data)
				{
					status=data;
				}
			});
		return status;
	}
	catch(e)
	{
		alert("common :: Unlocked " + e);
	}
}
function UnlockedFolio(foliounkid)
{
	try
	{
		var status='0';
		jQuery.ajax({
				async: false,
				data: {
						opcode: "ful",
						rq: foliounkid
						},
				url: serverurl+'index.php/page/newfront.service',
				success: function(data)
				{
					status=data;
				}
			});
		return status;
	}
	catch(e)
	{
		alert("common :: UnlockedFolio" + e);
	}
}

function callStorageData(privilege)
{
	var jsonformtedData=eALocalStorage.getItemObject("'LS_PrivilegeList'");
	var objData = eval(jsonformtedData);

	var privileg_name=[];
	jQuery.each(objData, function(key, value) {
			privileg_name[value['privilegeunkid']]=value['privilegename'];
	});

	//get privilege id for user
	var jsonformtedData=eALocalStorage.getItemObject("'LS_UserPrivilege'");
	var objData = eval(jsonformtedData);

	var dt=0;
	jQuery.each(objData, function(key, value) {
		var pStore=value['privilege'];
		pStoreArr=pStore.split(",");

		for(iPri=0;iPri < pStoreArr.length;iPri++)
		{
			if(privilege==pStoreArr[iPri])
			{
				dt=1;
				req=dt+"|"+	privileg_name[privilege];

			}
		}
	});
	if(dt==0)
		req=dt+"|"+	privileg_name[privilege];

	return req;
}

function checkRights(privilege) //Defination : Check Privileg - HRK
{
    return true;
try
{

	var status=0;

	if(localStorage)
	{
		if(eALocalStorage.getItemObject("'LS_UserPrivilege'")!=null)
			status=callStorageData(privilege);
		else
		{
			jQuery.ajax({
			async: false,
			data: {opcode: "pc",rq: privilege},
			url: serverurl+'index.php/page/newfront.service',
			success: function(data)
			{
				status=data;
			}
			});
		}
	}
	else
	{
		jQuery.ajax({
			async: false,
			data: { opcode: "pc",rq: privilege},
			url: serverurl+'index.php/page/newfront.service',
			success: function(data)
			{
				status=data;
			}
		});
	}

	var data = status;
	var data_arr=[];
	if(data.indexOf('|')>0)
	{
		data_arr = data.split('|');
		if(data_arr.length>0)
		{
			if(data_arr[0]=='0')
				return false;
			else
				return true;
		}
	}
	else
	{
		if(data=='0')
			return false;
		else
			return true;
	}
}
catch(e)
{
alert("commonfunction :: checkRights " + e);
}
}
function hasRights(privilege)
{
    var status=0;
    jQuery.ajax({
        async: false,
	data: {opcode: "pc",rq: privilege},
	url: 'json/service.jsp',
	success: function(data) {status=data;}
        });
    var data = status;
    var data_arr=[];
    if(data.indexOf('|')>0)
    {
        data_arr = data.split('|');
	if(data_arr.length>0)
		{
			if(data_arr[0]=='0')
			{
				showAccessDenied(data_arr[1]);
				return false;
			}
			else
				return true;
		}
	}
    else if(data=='0')
    {
        showAccessDenied('');
	return false;
    }
    else
        return true;
}

function showAccessDenied(pre)
{
	var msg="<b>Access Denied !</b><br/><br/>Your user account does not have rights to access this functionality.";
	if(pre!='' && pre!=null)
		var msg="<b>Access Denied ! [ "+pre+" ]</b><br/><br/>Your user account does not have rights to access this functionality.";
	jMessage(msg,'ErrorO','center','center');
}

function showWait()
{
	try
	{
		jNotify("Please wait.",{
		  autoHide : false,
		  clickOverlay : false,
		  HorizontalPosition : "center",
		  VerticalPosition : "center",
		  icnClass  :'jWarning',
		  ShowOverlay : true
		});
	}
	catch(e)
	{
		alert("common :: showWait " + e);
	}
}

function roomOperation(tranUnkid,opcode)
{
	try{
		if(opcode=='1')
		{
			if(isLocked(tranUnkid,'EDITTRAN'))
				return;

			if(jQuery('#div_EditTran').length == 0)
				loadTab('EditTran',"Edit Transaction",'edittran.jsp?tranunkid='+tranUnkid);
			else
				jMessage("One transaction is already open. You need to close that transaction prior to open new one.",'WarningO','center','center');
		}
		else if(opcode=='12')
		{
			if(isLocked(tranUnkid))
				return;
			loadTab('EditGroupTran',"Edit Group Transaction",'editgrouptran/tranunkid/'+tranUnkid);
		}
		else if(opcode=='17')
			loadPopup('StopRoomMove','stoproommove/tranunkid/'+tranUnkid+'/popup/Stayview',350,283);
	}
	catch(e)
	{
		alert("roomOperation >> "+ e);
	}
}
function showPendingTask(tranunkid,alerton,taskfor)
{
	var request = new Prado.CallbackRequest('ctl0$ctl1$callbackshowPendingTask',{});
	var param = {'tranunkid' : tranunkid,'taskfor' : taskfor,'alerton' : alerton+""};
	request.setCallbackParameter(param);
	request.dispatch();
	return false;
}
function alertPendingTask(task)
{
	var newtask=task.replace(/\|/g,"\n");
	alert("Warning : "+" : "+"Please note below tasks are pending for this room."+"\n"+newtask);
	return false;
}

function loadPopup(popupid,pageurl,height,width)
{
	try
	{
//		if(popupid == 'RoomMove' || popupid == 'SetMessage' || popupid == 'SetTask' || popupid == 'SetPreference' || popupid == 'AmendStay' || popupid == 'CancelReservation' || popupid == 'VoidTransaction' || popupid == 'NoShow' || popupid == 'AssignRoom')
		if(popupid == 'VoidTransaction' || popupid == 'NoShow' || popupid == 'AssignRoom')
		{
			var chktranid = pageurl.split('tranunkid/');
			if(chktranid[1] !='')
			{
				var transaction_arr = chktranid[1].split("/");
				var transaction_id = transaction_arr[0];
				var request = new Prado.CallbackRequest('ctl0$ctl1$callbackCheckTransactionActive',{});
				var param = {'tranunkid' : transaction_id,'popupid' : popupid,'pageurl' : pageurl,'height' : height,'width' : width+""};
				request.setCallbackParameter(param);
				request.dispatch();
			}
			return false;
		}
		else
			loadActivePopup(popupid,pageurl,height,width);
	}
	catch(e)
	{
		alert("loadPopup >> "+e);
	}
}

function loadActivePopup(popupid,pageurl,height,width)
{
	try
	{
		var parenturl=(window.self.location).toString();
		var urlarr=parenturl.split("newfront.");

		if(document.getElementById(popupid))
			return;
		htmlHeight= $('#outer').height();
		if(document.getElementById('popuptransbg'))
		{
			zindex1=($('.transbg ').last().css('z-index'))+12;
			zindex2=parseInt(zindex1)+11;
			$(".transbg").css({'opacity':'0','filter':'alpha(opacity=0)','-moz-opacity':'0'});
		}
		else
		{
			zindex1=104;
			zindex2=115;
		}
		$("<div id='popuptransbg' class='transbg popuptransbg_"+popupid+"' ></div>").css({left : '0px', top : '0px',position: 'absolute', width: '100%',opacity:'0.5', height: htmlHeight+'px', zIndex: zindex1 }).appendTo(document.body);

		if(popupid != "Folio_Invoice" && popupid != "CashCenterReport")
		{
//			var content = "<div id='iframecontainer_"+popupid+"' style='display:'><iframe src='"+serverurl+"index.php/page/newfront."+pageurl+"' id='"+popupid+"' scrolling='no' class='popupiframe' height='"+height+"px' width='"+width+"px' name='"+popupid+"'/></div>";
                var content = "<div id='iframecontainer_"+popupid+"' style='display:'><iframe src='"+serverurl+"webfront/popup.jsp?hi=edit&m=2&sm=116&url="+pageurl+"' id='"+popupid+"' scrolling='no' class='popupiframe' height='"+height+"px' width='"+width+"px' name='"+popupid+"'/></div>";

        var pars = pageurl.split("/");
        if (pars[0]!="walkin")
        {
            var qs=pars[1]+"="+pars[2];
            content = "<div id='iframecontainer_"+popupid+"' style='display:'><iframe src='"+serverurl+"content/"+pars[0]+".jsp?"+qs+"' id='"+popupid+"' scrolling='no' class='popupiframe' height='"+height+"px' width='"+width+"px' name='"+popupid+"'/></div>";
        }
            }
		else
		{
			var content = "<div id='iframecontainer_"+popupid+"' style='display:'><iframe src="+ pageurl +" scrolling='no' class='popupiframe' height='"+height+"px' width='"+width+"px' name='"+popupid+"'/></div>";
		}

		if($('#divpopup').length==0)
		{
			alert('#divpopup container not found.');
			return;
		}
		$('#divpopup').append(content);
		var size=clientSize(window.self);
		var flag=0;
		top1 = size.height/2 - height/2;
		left = size.width/2 - width/2;
		$("#iframecontainer_"+popupid).css({'top':top1+'px','left':left+'px','position':'absolute',zIndex:zindex2});
		if(popupid!='SetModuleLanguage')
			$("#iframecontainer_"+popupid).append("<a id='langsetting_"+popupid+"' style='display:none' title='Language Settings' class='langsetting lspopup islang_1' onclick=\"showPopupLanguageSettings('"+pageurl+"');return false;\"></a>");

		$("#iframecontainer_"+popupid).append("<a style='display:none' id='popupclose_"+popupid+"' class='popupclose' onclick=\"unLoadPopup('"+popupid+"',false);\"></a>");

		$('.popupiframe').load(function(){
			$(".popupclose").attr("style","");
			$(".lspopup").attr("style","");
		});
		$('#iframecontainer_'+popupid).show();
		$('#divpopup').show();
		$('.islang_1').remove(); // For default language, class islang_1 is applied on various controls. It indicates language settings option is not applicable to users. Please do not remove this line. - Manali [25-July-2011]
		hideWait(); // Jignesh - 30 sep 2011
	}
	catch(e)
	{
		//console.log(e);
	}
}
function transactionNotActive(msg,refreshpage)
{
	alert(msg,'WarningO','center','center');
	if(refreshpage==1)
		location.href=window.self.location;
}
function fun_triggreFoliotab(tranid)
{
 try{
		 roomOperation(tranid,1);
	 }
 catch(e)
	{
		alert("fun_triggreFoliotab >> "+e);
	}
}
function swipecard(from,rowid)
{
	if(from=='GuestInfo')
	{
		var tranid=jQuery("input[id$='hiddentranunkid']").val();
		if(tranid=='')
			return false;
	}
	val_swipecardflag=0;
	parent.loadPopup('SwipeCard','swipecard/popup/'+from+'/rowid/'+rowid,350,310);
}
function readCard(mstrFirstName,mstrLastName,mstrAddress,mstrCity,mstrState,mstrPinCode,mstrCountry,mdtBirthDate,mstrExpDate,mstrCardNo,mstrGender,countryname,rowid,frompage)
 {
	parent.unLoadPopup('SwipeCard',false);

	if(mstrGender=="Male")
	{
		gender="M";
		salutation="MR";
		lang_salutation="Mr.";
	}
	else
	{
		gender="F";
		salutation="MS";
		lang_salutation="Ms.";
	}

	var confirmmsg="Please confirm your information"+"\n";
	confirmmsg=confirmmsg+"---------------------------------------------------------------------"+"\n";
	confirmmsg=confirmmsg+"Name"+" : "+lang_salutation+" "+mstrFirstName+" "+mstrLastName+"\n";
	confirmmsg=confirmmsg+"Gender"+" : "+mstrGender+"\n";
	confirmmsg=confirmmsg+"Address"+" : "+mstrAddress+"\n";
	confirmmsg=confirmmsg+"City"+" : "+mstrCity+"\n";
	confirmmsg=confirmmsg+"State"+" : "+mstrState+"\n";
	confirmmsg=confirmmsg+"Country"+" : "+countryname+"\n";
	confirmmsg=confirmmsg+"Pincode"+" : "+mstrPinCode+"\n";
	confirmmsg=confirmmsg+"Birth Date"+" : "+mdtBirthDate+"\n";
	confirmmsg=confirmmsg+"Id Card No"+" : "+mstrCardNo+"\n";
	confirmmsg=confirmmsg+"Expiry Date"+" : "+mstrExpDate+"\n";

	if(confirm(confirmmsg))
	{
		if(frompage=='WalkIn')
		{
			var walkinobj = new Object();
			walkinobj.contactunkid		= 	'-1';
			walkinobj.salutation 		= 	salutation;
			walkinobj.name				= 	mstrFirstName+" "+mstrLastName;
			walkinobj.address			= 	mstrAddress;
			walkinobj.city				= 	mstrCity;
			walkinobj.state				=	mstrState;
			walkinobj.zipcode			= 	mstrPinCode;
			walkinobj.country			= 	countryname;
			walkinobj.phone				= 	'';
			walkinobj.mobile			= 	'';
			walkinobj.fax				= 	'';
			walkinobj.birthdate			= 	mdtBirthDate;
			walkinobj.gender			= 	mstrGender;
			walkinobj.email				= 	'';
			walkinobj.identityunkid		= 	'';
			walkinobj.exp_date			= 	mstrExpDate;
			walkinobj.identity_no		= 	mstrCardNo;
			walkinobj.nationality		= 	'';
			walkinobj.anniversary		= 	'';
			walkinobj.citizenship		= 	'';
			walkinobj.spousebirthdate	= 	'';
			walkinobj.vipstatusunkid	= 	'';
			walkinobj.company			= 	'';
			walkinobj.ischild			=	0;

			if(walkinobj.gender=='')
			{
				if(walkinobj.salutation=='MRS' || walkinobj.salutation=='MS' || walkinobj.salutation=='MAM')
					walkinobj.gender="Female";
				else
					walkinobj.gender="Male";
			}
			WalkIn.parent.fun_getguestinformation(walkinobj,rowid);
		}
		else
		{
			if(jQuery('#div_EditTran').length)
				contactid=tabiframe_edittran.jQuery("input[id$='hiddenContactunkid']").val();
			else
				contactid=jQuery("input[id$='hiddenContactunkid']").val();

			var request = new Prado.CallbackRequest('ctl0$ctl1$callbackUpdateGuestInfoThroughSwipeCard',{});
			var param = {'salutation' : salutation,'guestname':mstrFirstName+" "+mstrLastName,'address':mstrAddress,'city':mstrCity,'state':mstrState,'country':countryname,'pincode':mstrPinCode,'gender':mstrGender,'birthdate':mdtBirthDate,'idcardno':mstrCardNo,'idexpdate':mstrExpDate,'contactid':contactid+""};
			request.setCallbackParameter(param);
			request.dispatch();
		}
		return false;
	}
	else
		return false;
}
function refreshGuestInformation()
{
	if(jQuery('#div_EditTran').length)
	{
		tabiframe_edittran.refreshGuestInfo();
		tabiframe_edittran.refreshList();
	}
	else
	{
		refreshList();
		refreshFolioList();
		foliolist();
		refreshArrivalList();
	}
}
function printFolioatCheckout(tranunkid,masterfoliounkid)
{
	try
		{
			if(jQuery('#iframecontainer_NightAudit').length == 0)
			{
			PrintFolio(tranunkid,masterfoliounkid,"50300000000000001");//Manali - 1.0.33.38 - 04 May 2013,Purpose : Enhancement - Print Folio in Multi Currency
			}
		}
	catch(e)
		{
		alert("commonfunction >> printFolioatCheckout "+e);
		}
}
function confirmLateCheckout(msg,tranunkid,groupunkid,secondlast_to_departure_date,departuredate,foliounkid)
{
	try
	{
		if(confirm(msg))
		{
			var request = new Prado.CallbackRequest('ctl0$ctl1$callbackInsertLateTransaction',{'onPreDispatch':function(sender, parameter){ parent.showWait() },'onComplete':function(sender, parameter){ parent.hideWait() }});
			var param = {'groupid' : groupunkid,'tranunkid' : tranunkid,'secondlast_to_departure_date' : secondlast_to_departure_date,'departuredate' : departuredate,'foliounkid' : foliounkid+""};
			request.setCallbackParameter(param);
			request.dispatch();
		}
		else
		{
			latecheckout=0;
			var request = new Prado.CallbackRequest('ctl0$ctl1$callbackdoCheckOut',{'onPreDispatch':function(sender, parameter){ parent.showWait() },'onComplete':function(sender, parameter){ parent.hideWait() }});
			var param = {'groupid' : groupunkid,'tranunkid' : tranunkid,'latecheckoutflag' : latecheckout,'isinclusionposted' : 0+""};
			request.setCallbackParameter(param);
			request.dispatch();
		}
	}
	catch(e)
	{
		alert("commonfunction >> confirmLateCheckout "+e);
	}
}
function guestLateCheckOutMsg(msg,groupid)
{
	try
	{
		parent.jMessage(msg,'Success','center','top');

		var pagename=jQuery("input[id$='hidPageName']").val();

		if(jQuery('#NightAudit').length)
		{
			parent.hideWait();
		}
		else if(jQuery('#div_EditTran').length)
		{
			jQuery("#div_EditTran")[0].contentWindow.jQuery("input[id$='realoadFolioDetail']").val(1);
			jQuery("#div_EditTran")[0].contentWindow.fillFolioDetails();

			if(pagename=="dashboard")
			{
				refreshList();
				refreshQuickOperations();
			}
			hideWait();
		}
		else if(jQuery('#div_EditGroupTran').length)
		{
			refreshIframe('CheckOut',groupid);
		}
		else if(pagename=="dashboard")
		{
			refreshFolioList();
			hideWait();
		}
		else if(pagename=="departurelist")
		{
			refreshList();
			hideWait();
		}
		else
		{
			hideWait();
		}
	}
	catch(e)
	{
		alert("commonfunction >> guestLateCheckOutMsg "+e);
	}
}

function guestInclusionMsg(msg,groupid)
{
	try
	{
		parent.jMessage(msg,'Success','center','top');

		var pagename=jQuery("input[id$='hidPageName']").val();

		if(jQuery('#NightAudit').length)
		{
			parent.hideWait();
		}
		else if(jQuery('#div_EditTran').length)
		{
			jQuery("#div_EditTran")[0].contentWindow.jQuery("input[id$='realoadFolioDetail']").val(1);
			jQuery("#div_EditTran")[0].contentWindow.fillFolioDetails();

			if(pagename=="dashboard")
			{
				refreshList();
				refreshQuickOperations();
			}
			hideWait();
		}
		else if(jQuery('#div_EditGroupTran').length)
		{
			refreshIframe('CheckOut',groupid);
		}
		else if(pagename=="dashboard")
		{
			refreshFolioList();
			hideWait();
		}
		else if(pagename=="departurelist")
		{
			refreshList();
			hideWait();
		}
		else
		{
			hideWait();
		}
	}
	catch(e)
	{
		alert("commonfunction >> guestLateCheckOutMsg "+e);
	}
}
function assign_room(tranid,popupname)
{
	if(popupname=="Dashboard")
		tranid=jQuery("input[id$='hiddentranunkid']").val();

	if(isLocked(tranid))
		return;

	parent.loadPopup('AssignRoom','assignroom/tranunkid/'+tranid+'/popup/'+popupname,350,600);
}
function unassign_room(tranid,roomtypeid,issplitflag)
{
	<!--Manali - 1.0.37.42 - 29 Nov 2013 - START -->
	<!--Purpose : Part Of Advance Room Move, added  issplitflag-->
	if(issplitflag==1)
	{
		alert("Unassign Room not allowed on splitted reservation.");
		return false;
	}
	<!--Manali - 1.0.37.42 - 29 Nov 2013 - END -->

	if(jQuery("input[id$='hidPageName']").val()=="dashboard")
	{
		tranid=jQuery("input[id$='hiddentranunkid']").val();
		roomtypeid=jQuery("input[id$='hidRoomTypeId']").val();
	}

	if(confirm("Are you sure you want to unassign room?"))
	{
		if(isLocked(tranid))
			return;

		showjQloading();
		var request = new Prado.CallbackRequest('ctl0$ctl1$unassignroom_callback',{});
		var param = {'tranunkid' : tranid,'roomtypeunkid' : roomtypeid+""};
		request.setCallbackParameter(param);
		request.dispatch();
	}
}
function unAssignRoom_Message()
{
	if(jQuery("input[id$='hidPageName']").val()=="dashboard")
		refreshQuickOperations();

	refreshList();
	jMessage("Room unassigned successfully",'Success','center','center');
}
<!--Manali - 1.0.37.42 - 30 Nov 2013 - START -->
<!--Purpose : Part Of Advance Room Move, Modified below function -->
function amend_stay(tranid,popupname,arrival,departure,issplitflag,stoproommoveflag)
{
	var stoproommove_by = '';
	var stoproommove_reason = '';
	if(popupname=="Dashboard")
	{
		tranid=jQuery("input[id$='hiddentranunkid']").val();
		issplitflag=jQuery("input[id$='isSplitFlag']").val();
		stoproommoveflag= jQuery("input[id$='StopRoomMove_Flag']").val();
	}

	if(issplitflag==1)
	{
		var moveroom_flag=0;
		if(stoproommoveflag==1)
		{
			jQuery.ajax({
				async: false,
				data: { opcode: "getStopRoomMoveInfo",tranid:tranid	},
				url: serverurl+'json/webfront.jsp',
				success: function(data)
				{
					if(data=="-1")
					{
						jMessage('Request information is not received in proper format. Please refresh the browser screen and try again.','ErrorO','center','center');
						moveroom_flag=1;
					}
					else
					{
						var JSONobject = jQuery.parseJSON(data);
						stoproommove_by = JSONobject.StopBy;
						stoproommove_reason = JSONobject.StopByReason;
						//console.log(stoproommove_by+"|"+stoproommove_reason);
					}
				}
			});
		}
		if(moveroom_flag==0)
			moveroom(tranid,popupname,stoproommoveflag,stoproommove_by,stoproommove_reason);
	}
	else
	{
		var parameters='';
		var stopprocessflag=0;

		if(stopprocessflag==0)
		{
			if(popupname=='TransactionResize')
			{
				if(arrival!='' && departure!='')
					var parameters='/arrival/'+arrival+'/departure/'+departure;
				else
				{
					jMessage('Request information is not received in proper format. Please refresh the browser screen and try again.','ErrorO','center','center');
					stopprocessflag=1;
				}

				jQuery.ajax({
					async: false,
					data: {opcode: "checkAmendTransactionInfo",	tranid:tranid,arrival:arrival,departure:departure},
					url: serverurl+'json/webfront.jsp',
					success: function(data)
					{
						if(data!=0)
						{
							var JSONobject = jQuery.parseJSON(data);
							stopprocessflag = JSONobject.processflag;
							status = JSONobject.status;
							jMessage('Request information is not received in proper format. Please refresh the browser screen and try again.','ErrorO','center','center');
							parent.addRemoveTransaction(status,tranid,true,'','amendStay');
						}
					}
				});

				if(stopprocessflag==0)
				{
					if(isLocked(tranid))
						return 3;
					else
						showWait();
				}
			}
			else
			{
				if(isLocked(tranid))
					return;
			}
			if(stopprocessflag==0)
				parent.loadPopup('AmendStay','amendstay/tranunkid/'+tranid+'/popup/'+popupname+parameters,450,600);
			else
				hideWait();
		}
	}
}
<!--Manali - 1.0.37.42 - 30 Nov 2013 - END -->

<!--Shweta - 1.0.37.42 - 14 Dec 2013 - END -->
function getRoomMoveReason(tranid)
{
	var JSONobject= {};
	jQuery.ajax({
				async: false,
				data: {opcode: "getStopRoomMoveInfo",tranid:tranid},
				url: serverurl+'json/webfront.jsp',
				success: function(data)
				{
					if(data=="-1")
						jMessage('Request information is not received in proper format. Please refresh the browser screen and try again.','ErrorO','center','center');
					else
					{
						JSONobject = jQuery.parseJSON(data);
						stoproommove_by = JSONobject.StopBy;
						stoproommove_reason = JSONobject.StopByReason;
					}
				}
			});
	return JSONobject;
}
<!--Shweta - 1.0.37.42 - 14 Dec 2013 - END -->

<!--Manali - 1.0.37.42 - 30 Nov 2013 - START -->
<!--Purpose : Part Of Advance Room Move, added  issplitflag and stoproommoveflag-->
function moveroom(tranid,popupname,stoproommove_flag,stoproommove_by,stoproommove_reason)
{
	if(!hasRights(18)) // AccessToRoomMove
		return;

	if(stoproommove_flag==0)
		call_roommove=1;

	if(stoproommove_flag==1 && !hasRights(108))
		return;

	if(stoproommove_flag==1 && hasRights(108))
	{
		if(confirm('Room Move is stopped by '+stoproommove_by+"."+"\n"+'Reason : '+stoproommove_reason+"\n\n"+'Are you sure you want to continue with Room Move Operation? '))
			call_roommove=1;
		else
			return;
	}

	if(call_roommove==1)
	{
		if(isLocked(tranid))
			return;

		loadPopup('RoomMove','roommove/tranunkid/'+tranid+'/popup/'+popupname,420,730);
	}
}
<!--Manali - 1.0.37.42 - 30 Nov 2013 - END -->
function voidtransaction(tran_id,group_id,res_no,ownership,popup,status,operation)
{
	try
	{
		if(operation=='VOIDTRANSACTION')
		{
			if(!hasRights(79)) // Void Checkin
				return false;
		}
		else
		{
			if(!hasRights(12)) // Void Reservation
				return;
		}

		if(isLocked(tran_id,'VOID'))
			return;

		if(status=='CHECKEDOUT' && operation=='VOIDTRANSACTION')
		{
			callAction(tran_id,res_no,popup,operation,'',group_id,status); <!--Manali - 1.0.37.42 - 03 Dec 2013, Purpose : Added status, Part of Advance Room Move -->
		}
		else
		{
			get_GroupCount(tran_id,group_id,res_no,ownership,popup,operation,'',status);<!--Manali - 1.0.37.42 - 02 Dec 2013, Purpose : Added ChkStatus, Part Of Advance Room Move -->
		}
		return false;
	}
	catch(e)
	{
		alert ("newfdlayout >> voidtransaction"+e);
	}
}
function void_transaction_operation(tranid,groupid,popupname,action)
{
	parent.loadPopup('VoidTransaction','voidtransaction/tranunkid/'+tranid+'/groupunkid/'+groupid+'/popup/'+popupname+'/action/'+action,340,666);
}
function cancel_reservation_operation(tranid,res_no,popupname,isrelease)
{
	if(isrelease==1)
	{
		if(!hasRights(11)) // Release Reservation
			return;
	}
	else
	{
		if(!hasRights(9)) // Cancel Reservation
			return;
	}

	if(isLocked(tranid))
		return;

	var cancelaccount=parent.getcancellationaccount();

	if(cancelaccount!='')
	{
		if(isrelease==1)
			parent.loadPopup('CancelReservation','cancelreservation/tranunkid/'+tranid+'/popup/'+popupname+'/res_no/'+res_no+'/isrelease/true',340,731);
		else
			parent.loadPopup('CancelReservation','cancelreservation/tranunkid/'+tranid+'/popup/'+popupname+'/res_no/'+res_no,340,731);
	}
}
function no_show(tranid,res_no,popupname)
{
	if(!hasRights(10)) // NoShow Reservation
		return;

	if(isLocked(tranid))
		return;

	var noshowaccount=parent.getnoshowaccount();

	if(noshowaccount!='')
		parent.loadPopup('NoShow','noshow/tranunkid/'+tranid+'/popup/'+popupname+'/res_no/'+res_no,340,731);
}
function add_reason_operation(popupname)
{
	parent.loadPopup('AddReason','addreason/popup/'+popupname,350,320);
}
function block_unblock_operation(block_id,roomid,roomtypeid,popupname,blockflag) //blockflag - 1 (block room),2 (unblock room)
{
	parent.loadPopup('BlockRooms','blockroom/blockunkid/'+block_id+'/popup/'+popupname+'/roomid/'+roomid+'/roomtypeid/'+roomtypeid,372,600);
}
function setmessage_operation(tranid,groupid,popupname)
{
	if(jQuery('#div_EditGroupTran').length || jQuery('#div_EditTran').length)
	{
		tranid=tabiframe_edittran.jQuery("input[id$='hidTranUnkId']").val();
		groupid=tabiframe_edittran.jQuery("input[id$='hidGroupId']").val();
	}
	else
	{
		if(isLocked(tranid))
			return;
	}
	parent.loadPopup('SetMessage','setmessage/tranunkid/'+tranid+'/groupunkid/'+groupid+'/popup/'+popupname,436,600);
}
function settask_operation(tranid,groupid,popupname)
{
	if(jQuery('#div_EditGroupTran').length || jQuery('#div_EditTran').length)
	{
		tranid=tabiframe_edittran.jQuery("input[id$='hidTranUnkId']").val();
		groupid=tabiframe_edittran.jQuery("input[id$='hidGroupId']").val();
	}
	else
	{
		if(isLocked(tranid))
			return;
	}

	if(tranid=='' || typeof(tranid)==='undefined' || tranid=='undefined') //Manali - 1.0.40.45 - 10 Apr 2014, Purpose : Fixed bug on live, tranid going as undefined sometimes
		parent.displayDataNotProcessedMsg('SetTask');
	else
	{
		if(popupname=='AssignHKUnits')
			parent.loadPopup('SetTask','settask/tranunkid/'+tranid+'/popup/'+popupname,460,600);
		else
			parent.loadPopup('SetTask','settask/tranunkid/'+tranid+'/groupunkid/'+groupid+'/popup/'+popupname,460,600);
	}
}
function setpreference_operation(tranid,groupid,popupname)
{
	if(jQuery('#div_EditGroupTran').length || jQuery('#div_EditTran').length)
	{
		tranid=tabiframe_edittran.jQuery("input[id$='hidTranUnkId']").val();
		groupid=tabiframe_edittran.jQuery("input[id$='hidGroupId']").val();
	}
	else
	{
		if(isLocked(tranid))
			return;
	}

	if(popupname=='AssignHKUnits')
		parent.loadPopup('SetPreference','setpreference/tranunkid/'+tranid+'/popup/'+popupname,435,600);
	else
		parent.loadPopup('SetPreference','setpreference/tranunkid/'+tranid+'/groupunkid/'+groupid+'/popup/'+popupname,455,600);
}
function setinclusion_operation(inclusionid,popupname)
{
	tranid=tabiframe_edittran.jQuery("input[id$='hidTranUnkId']").val();
	groupid=tabiframe_edittran.jQuery("input[id$='hidGroupId']").val();
	folioid=tabiframe_edittran.jQuery("input[id$='hidFolioUnkId']").val();

	//Manali - 1.0.36.41 - 16 Aug 2013 - START
	//Purpose : Placed checking for not allowing user to add inclusion for checked out,cancelled, no showed, voided guest
	var chkstatus = ['CHECKEDOUT','VOID','CANCEL','NOSHOW'];
	if(jQuery.inArray(tabiframe_edittran.jQuery("input[id$='hidStatus']").val(),chkstatus)>=0 && inclusionid==0)
		jMessage('You are not allowed to add inclusion for checked out/ cancelled/ void and no showed guest.','WarningO','center','center');
	else	parent.loadPopup('SetInclusion','inclusion/tranunkid/'+tranid+'/inclusionunkid/'+inclusionid+'/groupunkid/'+groupid+'/foliounkid/'+folioid+'/popup/'+popupname,400,600);
	//Manali - 1.0.36.41 - 16 Aug 2013 - END
}
function foliolist_operation(foliocurrency,flag,popupname)
{
	if(flag!='')
		parent.loadPopup('FolioList','foliolist/flag/'+flag+'/foliocurrency/'+foliocurrency+'/popup/'+popupname,415,750);
	else
	{
		if(jQuery.inArray(popupname,['cashcenter','splitfolio'])>=0)
			parent.loadPopup('FolioList','foliolist/popup/'+popupname,415,750);
		else
			parent.loadPopup('FolioList','foliolist/foliocurrency/'+foliocurrency+'/popup/'+popupname,415,750);
	}
}
function showAuditTrail_operation(tranid)
{
	if(jQuery('#div_EditTran').length)
	{
		action='';
		tranid=tabiframe_edittran.jQuery("input[id$='hidTranUnkId']").val();
	}
	else
		action='action/blockroom/';

	parent.loadPopup('AuditTrail','audittraillogs/'+action+'tranunkid/'+tranid,500,585);
}
function walkin_operation(id,groupid,tranid,arrivaldate,popupname)
{
	try
	{
		otherparameters='';
		if(jQuery('#div_EditGroupTran').length)
		{
			if(tabiframe_edittran.jQuery("input[id$='hidResNo']").val()=="")
				var hidresno=0;
			else
				var hidresno=tabiframe_edittran.jQuery("input[id$='hidResNo']").val();

			otherparameters='/groupunkid/'+tabiframe_edittran.jQuery("input[id$='hidGroupId']").val()+'/masterresno/'+hidresno; //Manali - 1.0.35.40 - 18 jul 2013, Purpose : Passed reservation no, for checking owner reservationno to display Reserve Button on WalkIn while adding new guest from Edit Group Transaction screen
		}
		else if(groupid!='')
			otherparameters='/groupunkid/'+groupid;
		else if(popupname=='ReservationList')
			otherparameters='/tranid/'+tranid+'/arrivaldate/'+arrivaldate;

		parent.loadPopup123('WalkIn','walkin/id/'+id+otherparameters,622,1158);
	}
	catch(e)
	{
		alert(e);
	}
}
function open_transactionsearch(filter,term)
{
	try
	{
		if(jQuery('#div_EditGroupTran').length)
			parent.loadPopup('TranSearch','transearch/popup/EditGroupTranSerch',525,1013);
		else
			loadTab('TranSearch','Transaction Search','transearch/filter/'+filter+'/term/'+term);
	}
	catch(e)
	{
		alert(e);
	}
}
function newfolio_operation(popupname)
{
	try
	{
		if(!hasRights(58)) // Create New Folio
			return false;

		if(jQuery('#div_EditTran').length)
			tranid=tabiframe_edittran.jQuery("input[id$='hidTranUnkId']").val();
		else
			tranid=jQuery("input[id$='hiddentranunkid']").val();

		if(tranid=="")
		{
			alert("Please select Guest.");
			return false;
		}

		if(popupname=="Dashboard")
		{
			if(isLocked(tranid))
				return;
		}
		parent.loadPopup('NewFolio','createfolio/tranunkid/'+tranid+'/popup/'+popupname,150,360);
	}
	catch(e)
	{
		alert(e);
	}
}
function billto_operation(popupname)
{
	try
	{
		if(jQuery('#div_EditTran').length)
		{
			tranid=tabiframe_edittran.jQuery("input[id$='hidTranUnkId']").val();
			folioid=tabiframe_edittran.jQuery("select[id$='lstFolio']").val();
		}
		else
		{
			tranid=jQuery("input[id$='hiddentranunkid']").val();
			folioid=jQuery("select[id$='lstFolio']").val();
		}

		if(popupname=="Dashboard")
		{
			if(isLocked(tranid))
				return;
		}
		parent.loadPopup('BillTo','billto/foliounkid/'+folioid+'/tranunkid/'+tranid+'/popup/'+popupname,150,360);
	}
	catch(e)
	{
		alert(e);
	}
}
function splitfolio_operation(popupname)
{
	try
	{
		if(!hasRights(34)) // Transfer item from Folio
			return false;

		if(jQuery('#div_EditTran').length)
		{
			tranid=tabiframe_edittran.jQuery("input[id$='hidTranUnkId']").val();
			folioid=tabiframe_edittran.jQuery("select[id$='lstFolio']").val();
		}
		else
		{
			tranid=jQuery("input[id$='hiddentranunkid']").val();
			folioid=jQuery("select[id$='lstFolio']").val();
		}

		if(popupname=="Dashboard" && tranid!='') //Manali - 1.0.33.38 - 12 April 2013,Purpose : Fixed Bug : Undefined index popup - exception error thrown on live because of blank tranid
		{
			if(isLocked(tranid))
				return;
		}

		//Manali - 1.0.33.38 - 12 April 2013 - START
		//Purpose : Fixed Bug : Undefined index popup - exception error thrown on live because of blank tranid
		if(tranid=='')
			tranid = 0;
		//Manali - 1.0.33.38 - 12 April 2013 - END

		parent.loadPopup('SplitFolio','splitfolio/srcfoliounkid/'+folioid+'/tranunkid/'+tranid+'/popup/'+popupname,508,1010);
	}
	catch(e)
	{
		alert(e);
	}
}
function guestsearch_operation(loadall,type,name,identity)
{
	try
	{
		otherparameters='';
		if(loadall!='')
			otherparameters=otherparameters+'/loadall/'+loadall;
		if(type!='')
			otherparameters=otherparameters+'/type/'+type;
		if(name!='')
			otherparameters=otherparameters+'/name/'+name;
		if(identity!='')
			otherparameters=otherparameters+'/identity/'+identity;

		parent.loadPopup('GuestSearch','guestsearch'+otherparameters,580,810);
	}
	catch(e)
	{
		alert("guestsearch >> "+ e);
	}
}
function consolidation_operation(popupname)
{
	try
	{
		var checkbox_checked = false;
		var checkedval=0;
		var flag=0;
		checkbox_checked = jQuery('.checkbox_datalist_child').is(':checked');

		if(checkbox_checked)
		{
			jQuery('.checkbox_datalist_child').each(function()
			{
				if(jQuery(this).attr('checked')==true)
				{
					 if(checkedval==0)
						checkedval=jQuery(this).val();
					 else
						checkedval=checkedval+","+jQuery(this).val();

					flag++;
				}
			});
		}
		else
		{
			alert("Please select a record.");
			return false;
		}

		if(flag < 2)
		{
			alert("Please select minimum 2 records for Consolidation");
			return false;
		}

		if(popupname=="CompanyDatabase")
			contacttype='VENDOR';
		else if(popupname=="GuestDatabase")
			contacttype='GUEST';
		else if(popupname=="TravelAgentDatabase")
			contacttype='TRAVELAGENT';

		loadPopup('GuestConsolidation','guestconsolidation/contactunkid/'+checkedval+'/type/'+contacttype+'/popup/'+popupname,500,711);
	}
	catch(e)
	{
		alert("consolidation_operation >> "+ e);
	}
}
function hkstatus_operation(popupname,tranid,roomid)
{
	if(popupname=='Dashboard')
	{
		var tranid= jQuery("input[id$='hiddentranunkid']").val();
		var roomid=jQuery("input[id$='hidRoomId']").val();
	}

	if(tranid!=null) //Manali - 1.0.31.36 - 15 Feb 2013, Purpose: For rooms having no transaction on todays date, then no need to check for transaction locked process
	{
		if(isLocked(tranid))
			return;
	}
	else
		tranid="";
	loadPopup('HKStatus','hkstatus/roomunkid/'+roomid+'/popup/'+popupname+'/tranunkid/'+tranid,265,320);
}
function sharer_operation(Docobj,contactunkid,guesttranunkid,contacttype,hidefolio,opensearch,rowid,operationtype,hidesearch,popupname)
{
	tranunkid='';
	oldcontactunkid='';
	if(jQuery('#div_EditGroupTran').length || jQuery('#div_EditTran').length)
	{
		var tranunkid = tabiframe_edittran.jQuery("input[id$='hiddentranunkid']").val();

		//Manali - 1.0.36.41 - 31 Aug 2013 - START
		//Purpose : Fixed Bug - For same transaction opened by same user in same browser, different tabs, it was allowing to do operations,ownership lost message was not displaying, so added hidGuid
		var hidGuid=tabiframe_edittran.jQuery("input[id$='hidGuid']").val();
		//Manali - 1.0.36.41 - 31 Aug 2013 - END

		if(operationtype=='EditProfile')
		{
			var guesttranunkid = tabiframe_edittran.jQuery("input[id$='hiddenmasterguestunkid']").val();

			if(contactunkid=="")
				var contactunkid= tabiframe_edittran.jQuery("input[id$='hiddenContactunkid']").val();
			else
				var oldcontactunkid= tabiframe_edittran.jQuery("input[id$='hiddenContactunkid']").val();

			if(!isLockPersist(tranunkid,hidGuid)) // Is ownership lost ? //Manali - 1.0.36.41 - 31 Aug 2013,Purpose : Fixed Bug - For same transaction opened by same user in same browser, different tabs, it was allowing to do operations,ownership lost message was not displaying, so added hidGuid
			{
				event.preventDefault();
				tabiframe_edittran.closeEditTran();
				return false;
			}
		}
	}
	else if(jQuery("input[id$='hidPageName']").val()=="dashboard")
	{
		var tranunkid = jQuery("input[id$='hiddentranunkid']").val();

		if(tranunkid=='')
				return false;

		if(operationtype=='EditProfile')
		{
			var guesttranunkid = jQuery("input[id$='hiddenmasterguestunkid']").val();
			if(contactunkid=="")
				var contactunkid= jQuery("input[id$='hiddenContactunkid']").val();
			else
				var oldcontactunkid= jQuery("input[id$='hiddenContactunkid']").val();
		}
	}

	if(operationtype=='EditProfile' || operationtype=='EditSharer')
	{
		if(!hasRights(22)) // ChangeGuestProfile
			return;
	}

	if(contacttype == "GUEST")
	{
		popup_width = 736;
		popup_height = 500;
	}
	else
	{
		popup_width = 736;
		popup_height = 353;
	}

	otherparameters='';
	if(tranunkid!='')
		otherparameters=otherparameters+'/tranunkid/'+tranunkid;
	if(contactunkid!='')
		otherparameters=otherparameters+'/contactunkid/'+contactunkid;
	if(oldcontactunkid!='')
		otherparameters=otherparameters+'/oldcontactunkid/'+oldcontactunkid;
	if(guesttranunkid!='')
		otherparameters=otherparameters+'/guesttranunkid/'+guesttranunkid;
	if(contacttype!='')
		otherparameters=otherparameters+'/type/'+contacttype;
	if(hidefolio!='')
		otherparameters=otherparameters+'/hidefolio/'+hidefolio;
	if(opensearch!='')
		otherparameters=otherparameters+'/opensearch/'+opensearch;
	if(rowid!='')
		otherparameters=otherparameters+'/rowid/'+rowid;
	if(hidesearch!='')
		otherparameters=otherparameters+'/hidesearch/'+hidesearch;
	if(popupname!='')
		otherparameters=otherparameters+'/popup/'+popupname;

	//console.log('sharer'+otherparameters);

	parent.loadPopup('Sharer','sharer'+otherparameters,popup_height,popup_width);
}
function blacklist_operation(popupname,guesttranunkid,contactunkid)
{
	otherparameters='';
	tranunkid='';
	if(jQuery('#div_EditTran').length)
		tranunkid = tabiframe_edittran.jQuery("input[id$='hiddentranunkid']").val();

	if(tranunkid!='')
		otherparameters=otherparameters+'/tranunkid/'+tranunkid;
	if(guesttranunkid!='')
		otherparameters=otherparameters+'/guesttranunkid/'+guesttranunkid;
	if(contactunkid!='')
		otherparameters=otherparameters+'/contactunkid/'+contactunkid;

	parent.loadPopup('BlackList','blacklist'+otherparameters+'/popup/'+popupname,270,310);
}
function reservation_vouchermail_operation(tranid,groupid,id)
{
	loadPopup('ResVocEmail','resvocemail/tranid/'+tranid+'/groupid/'+groupid+'/id/'+id,310,490);
}
function getCreditCardInfo(popupname,tranunkid)
{
	try
	{
		showjQloading();
		otherparameters='';
		reservationno = '';
		status = '';
		if(tranunkid==null)
			tranunkid = "-1";

		if(jQuery('#div_EditTran').length)
		{
			tranunkid = tabiframe_edittran.jQuery("input[id$='hiddentranunkid']").val();
			reservationno = tabiframe_edittran.jQuery("input[id$='hidResNo']").val();
			status = tabiframe_edittran.jQuery("input[id$='hidStatus']").val();
		}

		if(tranunkid!='')
			otherparameters=otherparameters+'/tranunkid/'+tranunkid;

		if(reservationno!='')
			otherparameters=otherparameters+'/resno/'+reservationno;

		if(status!='')
			otherparameters=otherparameters+'/status/'+status;

		if(popupname!='')
			otherparameters=otherparameters+'/popup/'+popupname;

		if(jQuery('#div_EditTran').length)
		{
			var request = new Prado.CallbackRequest('ctl0$ctl1$callbackchkCCInfo',{});
			var param = {'tranunkid' : tranunkid,'resno' : reservationno,'status' : status,'popup' : popupname+""};
			request.setCallbackParameter(param);
			request.dispatch();
		}
		else
			loadCreditCardPopup(otherparameters);
	}
	catch(e) {
		alert(e);
	}
}
function loadCreditCardPopup(parametersvalue)
{
	hidejQloading(1000);
	parent.loadPopup('CreditCardInfo','creditcardinformation'+parametersvalue,385,350);
}
function saveCCInformation(tranid,updatetranid,resno)
{
	var ccinfo = sessionStorage.getItem("creditcardinfo");
	var ccata = jQuery.parseJSON(ccinfo);

	if(ccata[tranid])
	{
		var request = new Prado.CallbackRequest('ctl0$ctl1$callbackCCInfo',{});
		var param = {'tranunkid' : tranid,'updatetranunkid' : updatetranid,'reservationno' : resno,'ccno' : ccata[tranid][0]['ccno'],'cctype' : ccata[tranid][0]['cctype'],'expirymonth' : ccata[tranid][0]['expirymonth'],'expiryyear' : ccata[tranid][0]['expiryyearval'],'cardholdername' : ccata[tranid][0]['cardholdername'],'mode' : ccata[tranid][0]['mode']+""};
		request.setCallbackParameter(param);
		request.dispatch();
	}
}
function closeCCInformation(msg)
{
	if(jQuery('#div_EditTran').length)
		jMessage(msg,'Success','center','center');
	hidejQloading(1000);
}
function undoStopRoomMove(tranUnkid,tranStatus)
{
	showjQloading();
	var request = new Prado.CallbackRequest('ctl0$ctl1$callbackundoStopRoomMove',{});
	var param = {'tranunkid' : tranUnkid,'tranStatus' : tranStatus+""};
	request.setCallbackParameter(param);
	request.dispatch();
}
function showSuccessStopRoomMoveMessage(msg,tranStatus,tranid)
{
	jMessage(msg,'Success','center','center');

	if(jQuery("input[id$='hidPageName']").val()=='stayview' || jQuery("input[id$='hidPageName']").val()=='roomview') <!--Manali - 1.0.29.34 - 08 Nov 2012,Purpose : Added roomview condition,To introduce Undo Stop Room Move option in transaction menu for roomview. -->
		addRemoveTransaction(tranStatus,tranid,true,true,"UndoStopRoomMove");
	else
		refreshArrivalList();
	hidejQloading(1000);
}
<!--Manali - 1.0.32.37 - 12 Mar 2013 - START-->
<!--Purpose : Enhancement - Folio Routing -->
function FolioRoutingProcess(popup)
{
	if(popup=='AmendFolioDetail')
	{
		var tran_id = tabiframe_edittran.jQuery("input[id$='hiddentranunkid']").val();
		var folio_id = tabiframe_edittran.jQuery("select[id$='lstFolio']").val()+"_"+tabiframe_edittran.jQuery("select[id$='lstFolio']").find('option:selected').text();
		var group_id = tabiframe_edittran.jQuery("input[id$='hidGroupId']").val();
	}
	else if(popup=='Dashboard')
	{
		var tran_id = jQuery("input[id$='hiddentranunkid']").val();
		var folio_id = jQuery("select[id$='lstFolio']").val()+"_"+jQuery("select[id$='lstFolio']").find('option:selected').text();
		var group_id = jQuery("input[id$='hidGroupId']").val();
	}

	loadPopup('FolioRouting','foliorouting/tranunkid/'+tran_id+'/groupid/'+group_id+'/sourcefolio/'+folio_id+'/popup/'+popup,350,580);
}
function displayDataNotProcessedMsg(popupid)
{
	jMessage('Request information is not received in proper format. Please refresh the browser screen and try again.','ErrorO','center','center');
	if(popupid!='')
	{
		if(popupid=='AmendGroupFolioDetail' || popupid=='GroupPaymentDistribution')
			closeEditTran();
		else
			unLoadPopup(popupid,false);
	}
}
<!--Manali - 1.0.32.37 - 12 Mar 2013 - END-->
<!--Manali - 1.0.37.42 - 04 Oct 2013 - START-->
<!--Purpose : Enhancement : Exchange Room Feature -->
function exchangeRoom(tranStatus,tranUnkid)
{
	if(!hasRights(18)) // AccessToRoomMove
			return;

	var chkparamters=jQuery("#"+tranStatus+'_'+tranUnkid).text();
	var splitparamaters=chkparamters.split("|");
	var roomname=splitparamaters[1];
	var arrival=splitparamaters[7].split(" ");
	var departure=splitparamaters[8].split(" ");
	var guestname=splitparamaters[9];
	var roomid=splitparamaters[12];
	var roomtypeid=splitparamaters[13];
	var ratetypeid=splitparamaters[13];
	var roomtypename=splitparamaters[16];
	var stoproommove_flag=splitparamaters[17];

	//Shweta - 1.0.37.42 - 14 Dec 2013 - START
	//Purpose : Remove the joins of reason related table from stayview query because of loding time on grid (it is fire only when suite move open)
	//var stoproommove_by=splitparamaters[18];
	//var stoproommove_reason=splitparamaters[19];

		var stoproommove_by = '';
		var stoproommove_reason = '';
		if(stoproommove_flag == 1)
		{
			var jsnObj = getRoomMoveReason(tranUnkid);
			stoproommove_by = jsnObj.StopBy;
			stoproommove_reason = jsnObj.StopByReason;
		}
	//Shweta - 1.0.37.42 - 14 Dec 2013 - END

	if(stoproommove_flag==0)
		call_roommove=1;

	if(stoproommove_flag==1 && !hasRights(108))
		return;

	if(stoproommove_flag==1 && hasRights(108))
	{
		if(confirm('Room Move is stopped by '+stoproommove_by+"."+"\n"+'Reason : '+stoproommove_reason+"\n\n"+'Are you sure you want to continue with Exchange Room Operation? '))
			call_roommove=1;
		else
			return;
	}

	if(call_roommove==1)
	{
		if(isLocked(tranUnkid))
			return;
			loadPopup('ExchangeRoom','exchangeroom/tranunkid/'+tranUnkid+'/status/'+tranStatus+'/arrival/'+arrival[0]+'/departure/'+departure[0]+'/roomid/'+roomid+'/roomtypeid/'+roomtypeid+'/roomname/'+roomname+'/roomtypename/'+roomtypename+'/guestname/'+guestname+'/popup/Stayview',480,580);
	}
}
<!--Manali - 1.0.37.42 - 04 Oct 2013 - END-->
function makeTranComplete(tran_id)
{
	try
	{
		var request = new Prado.CallbackRequest('ctl0$ctl1$callback_MakeTranComplete',{'onPreDispatch':function(sender, parameter){ parent.showWait() },'onComplete':function(sender, parameter){ parent.hideWait() }});
		var param = {'tranid' : tran_id+""};
		request.setCallbackParameter(param);
		request.dispatch();
		return false;
	}
	catch(e){alert ("commonfunction.tpl >> makeTranComplete"+e);}
}

function tranCompleteStatus(status)
{
	try
	{
		if(status=='inventory')
		{
			jMessage("Transaction cannot be complete, Inventory is not available.",'WarningO','center','center');
		}
		else if(status=='failure')
		{
			jMessage("Internal error, please try again later.",'ErrorO','center','center');
		}
		else if(status=='success')
		{
			jMessage("Transaction converted to successful/complete.",'Success','center','center');
			if(typeof refreshList != "undefined" )
				refreshList();
		}
	}
	catch(e){alert ("commonfunction.tpl >> makeTranComplete"+e);}
}
<!--Manali - 1.0.37.42 - 24 Oct 2013 - START-->
<!--Purpose : Enhancement : Remove isphysicalmoveflag, Part Of Advance Rom Move -->
function moveGuestPhysically(tranUnkid,groupid,tranflag,tranStatus,res_no,popup,action)
{
	showWait();
	var request = new Prado.CallbackRequest('ctl0$ctl1$callback_moveGuestPhysically',{'onPreDispatch':function(sender, parameter){ parent.showWait() }});
	var param = {'tranid' : tranUnkid,'groupid' : groupid,'res_no' : res_no,'tranflag' : tranflag,'status' : tranStatus,'popup' : popup,'action' : action+""};
	request.setCallbackParameter(param);
	request.dispatch();
	return false;
}
function guestPhysicallyMovedSuccessFailed(msg,tranunkid,groupid,status,refresh)
{
	alert(msg);
	if(refresh==1)
	{
		var pagename=jQuery("input[id$='hidPageName']").val();
		if(jQuery('#NightAudit').length)
		{
			if(get_pagename()!="report")
				refreshArrivalList();
			NightAudit.reloadList(1);
		}
		else if(jQuery('#div_EditTran').length)
		{
			refreshArrivalList();
			jQuery("input[id$='hidCheckInFlag']").val(1);
			parent.tabiframe_edittran.refreshEditTranOnCheckIn();
		}
		else if(jQuery('#div_EditGroupTran').length)
		{
			refreshArrivalList();
			refreshIframe('CheckIn',groupid);
			jQuery("input[id$='hidCheckInFlag']").val(1);
		}
		else if(pagename=="reservationlist" || pagename=="arrivallist" || pagename=="departurelist" || pagename=="groupreservationlist" || pagename=="inhousegrouplist" || pagename=="departedgrouplist")
		{
			if(pagename=="groupreservationlist" || pagename=="inhousegrouplist" || pagename=="departedgrouplist")
				refreshIframe('CheckIn',groupid); //Note :  Please dont remove, if Edit group transaction is opened, and from left panel I am doing checkin on other transaction of same group at that time I need to refresh iframe. - Manali
			refreshList();
		}
		else if(pagename=="dashboard")
		{
			refreshList();
			refreshQuickOperations();
		}
		else if(pagename=="stayview")
			addRemoveTransaction(status,tranunkid,true,true,"IsPhysicallyMoved");
		else if(pagename=="roomview")
			 addRemoveTransaction(status,tranunkid,true,true,"IsPhysicallyMoved");
		else if(pagename=="quickview")
		{
			refreshArrivalList(); // Jignesh 16 sep 2011 - checkin is not reflection to arrival list.
			loadquickview(0); // Jignesh 16 sep 2011 - reload quickview .
		}
		else
			refreshArrivalList(); // Jignesh 16 sep 2011 - checkin is not reflection to arrival list.

		if(parent.jQuery('#div_TranSearch').length)
			parent.tabiframe_TranSearch.loadata();
	}
	hideWait();
}
function getNewDate(dateval,days,operation)
{
	var jQ_date = validDate(dateval,'Y-m-d');
	if(operation=="add")
		jQ_date.setDate(jQ_date.getDate() + parseInt(days));
	else
		jQ_date.setDate(jQ_date.getDate() - parseInt(days));
	jQ_date = jQuery.datepicker.formatDate('yy-mm-dd', jQ_date);
	return jQ_date;
}
<!--Manali - 1.0.37.42 - 24 Oct 2013 - END-->
/*Function: loadTab : loadTab in iframe*/
var isfromunload=false;
function loadTab(tabid,tabname,pagename)
{
	try
	{
		var preTabId='pre_'+tabid;
		var divTabId='div_'+tabid;

		if(tabid=="TranSearch")
			tab_name='tabiframe_'+tabid;
		else
			tab_name='tabiframe_edittran';

		if (pagename.indexOf('stimulsoft_client_key') == -1)
		{
			if(document.getElementById(preTabId))
			{
				if(preTabId == "pre_TranSearch")
					jMessage("One Search Tab is already open. You need to close that Tab prior to open new one.",'WarningO','center','center');
				else
					jMessage("One transaction is already open. You need to close that transaction prior to open new one.",'WarningO','center','center');
				return;
			}
			jQuery('.ui-state-default').removeClass('ui-tabs-selected ui-state-active');
			var	li="<li  id="+preTabId+" class='ui-state-default ui-corner-top ui-tabs-selected ui-state-active'><a onclick='javascript:showMe(\""+preTabId+"\")'><span>"+tabname+"</span></a><span id='closetab_"+preTabId+"' class='closetab' onclick='javascript:unloadTab(\""+preTabId+"\",\""+divTabId+"\");' >X</span></li>";
			jQuery('.ui-tabs-nav').append(li);
			jQuery('.tabcontent').hide();
			var content = "<iframe name='"+tab_name+"' src='manager/"+pagename+"' id='"+divTabId+"' class='tabcontent tabiframe_edittran flexouter boxflex' scrolling='no'><div>";
			content += "</div></iframe>";
			jQuery('#right_flexouter').append(content);
			jQuery('#'+divTabId).show();
			hidejQloading();
		}
		else
		{
			if(top.document.getElementById(preTabId))
			{
				jMessage("One report is already open. You need to close that Report prior to open new one.",'WarningO','center','center');
				return;
			}
			jQuery('.ui-tabs-selected',top.document).removeClass('ui-tabs-selected ui-state-active');
			var	li="<li  id="+preTabId+" class='ui-state-default ui-corner-top ui-tabs-selected ui-state-active'><a onclick='javascript:showMe(\""+preTabId+"\")'><span>"+tabname+"</span></a><span class='closetab' onclick='javascript:unloadTab(\""+preTabId+"\",\""+divTabId+"\");' >X</span></li>";
			jQuery('.ui-tabs-nav',top.document).append(li);
			jQuery('.tabcontent',top.document).hide();
			reportHeight= (jQuery('#right').height()) - 50;
			var content = "<iframe id='"+divTabId+"' style='height:"+reportHeight+"px' name='tabiframe2' src='"+pagename+"' class='"+divTabId+" tabcontent  container floated reportframe' scrolling='no'><div>";
			content += "</div></iframe>";
			jQuery('#right_flexouter',top.document).append(content);
			jQuery('#'+divTabId).show();
		}
		return true;
	}
	catch(e){alert("loadTab >> "+ e);}
}

