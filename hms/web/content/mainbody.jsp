<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<jsp:useBean id="user" scope="session" class="com.mysoft.hms.PersonnelBean"/>
<%
out.clearBuffer();
if(user==null || user.getPersonnelid()==null){
    out.print("<script type=\"text/javascript\"> window.location=\'../index.jsp\'; </script>");
    return;
}
String[] month= {"იან","თებ","მარ","აპრ","მაი","ივნ","ივლ","აგვ","სექ","ოქტ","ნოე","დეკ"};

DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
DateFormat df2= new SimpleDateFormat("MM/dd/yyyy");
String today = df.format( new Date());
int yyyy= Calendar.getInstance().get(Calendar.YEAR);
int dd= Calendar.getInstance().get(Calendar.DAY_OF_MONTH);
int mm= Calendar.getInstance().get(Calendar.MONTH);
%>
<link href="../gt/style.css?1.0.39.44" rel="stylesheet" type="text/css" />
<link href="../gt/external.css?1.0.39.44" rel="stylesheet" type="text/css" />
<script src="../gt/chrome.js?1.0.39.44"></script>
<script src="../gt/jquery-1.4.2.min.js?1.0.39.44"></script>
<script type="text/javascript">

<!-- THIS IS TO AVOID jQuery VARIBLES CONFLICTING WITH PRADO javascript VARIABLES -->
$.noConflict();

/*]]>*/
</script>

<!-- Manali - 1.0.34.39 - 14 Jun 2013 - END-->
<script src="../gt/jquery.ui.core.js?1.0.39.44"></script>
<script src="../gt/jquery.ui.widget.js?1.0.39.44"></script>

<script src="../gt/jquery.ui.datepicker.js?1.0.39.44"></script>
<script src="../gt/jquery.timeentry.js?1.0.39.44"></script>
<script src="../gt/fdleftpanel.js?1.0.39.44"></script>
<script src="../gt/function.js?1.0.39.44"></script>
<script src="../gt/common_functions.js?1.0.39.44"></script>

<!-- For Local Storage - Added By Flora -->
<script src="../gt/localstorage.js?1.0.39.44"></script>

<script type="text/javascript">
	var showBrwClsMsg = true;
	var isRealFocus = true;

	jQuery(function($) {
 		jQuery("#datepicker").datepicker();

			//HRK -- TextArea
	jQuery(".textarea").focus(function() {
		jQuery(this).after("<span class='textcnt_"+ jQuery(this).attr('id') +"' style='color:#999999; display:block;' />");
		});
	jQuery(".textarea").focusout(function() {
		jQuery(".textcnt_"+ jQuery(this).attr('id')).remove();
		});
	jQuery('.textarea').keypress(function() {
		var value = jQuery(this).val();
		if (value.length > 4000) {
			jQuery(this).val(value.substring(0, 4000));
		}
		else
		{
			jQuery(".textcnt_"+ jQuery(this).attr('id')).text(" "+(4000 - value.length)+ " characters left." );
		}
	});

	});

	/* Funciton Confirm_delete*/
	function confirm_delete()
	{
		var checkbox_checked = false;

		checkbox_checked = jQuery('.checkbox_datalist_child').is(':checked');

		if(checkbox_checked)
		{
			if(confirm("You are about to delete a record. Are you sure?"))
				return true;
			else
				return false;
		}
		else
		{
			alert("Please select a record.");
			return false;
		}
	}
	function confirm_select()
	{
		var checkbox_checked = false;

		checkbox_checked = jQuery('.checkbox_datalist_child').is(':checked');

		if(!checkbox_checked)
		{
			alert("Please select a record.");
			return false;
		}
	}

	/* Manali - 16 Mar 2011 - END */
	/*
	var isrefresh=false;

	jQuery(window).keydown(function(event){
		if(event.keyCode==116)
		{
			isrefresh=true;
		}
		else
		{
			isrefresh=false;
		}
	});*/

window.onbeforeunload=function(e){
	if(jQuery('#div_EditTran').length>0 || jQuery('#div_EditGroupTran').length>0)
	{
		Unlocked(jQuery("input[id$='hidTranUnkId']",window.tabiframe_edittran.document).val());
	}
	//alert(jQuery("input[id$='hidFolioUnkId']").val());
	if(jQuery('.cls_incfl_expvoc').length>0)
	{
		UnlockedFolio(jQuery("input[id$='hidFolioUnkId']").val());
	}

	/*
	if(jQuery("input[id$='hidMode']").val()!='' && jQuery("input[id$='hidMode']").val()!='v')
	{
		alert('It looks like your last action on current folio is not saved. Please press save or cancel button to go ahead.');
		return;
	}
	*/

	//alert(mYY);
	/*if(mYY<=0 && !isrefresh)
	{
		isrefresh=true;
		return false;
	}*/
};

/*
reserMouse();
function reserMouse()
{
	mYY=0;
	setTimeout("reserMouse();", 10);
}
*/
</script>



<ul id="myMenu" class="contextMenu">
<li id="1" class="rightmenu menuopt"><a href="#1">რედაქტირება</a></li>
    <li id="2" class="rightmenu menuopt"><a href="#2">ოთახის შეცვლა</a></li>
    <li id="6" class="rightmenu menuopt"><a href="#6">გახანგრძლივება</a></li>
    <li id="8" class="rightmenu menuopt"><a href="#8">შესვლა</a></li>
    <li id="16" class="rightmenu menuopt"><a href="#16">გამოსვლა</a></li>
    <li id="9" class="rightmenu menuopt"><a href="#9">გაუქმება</a></li>
    <li id="11" class="rightmenu menuopt"><a href="#11">არ მოსვლა</a></li>
    <li id="10" class="rightmenu menuopt"><a href="#10">ოთახის მინიჭება</a></li>
    <li id="13" class="rightmenu menuopt"><a href="#13">ოთახის განბლოკვა</a></li>
    <li id="14" class="rightmenu menuopt" ><a href="#14">რეზერვაციის გაუქმება</a></li>
    <li id="15" class="rightmenu menuopt" ><a href="#15">შესვლის გაუქმება</a></li>
    <li id="3" class="rightmenu menuopt"><a href="#3" style="border-top-color:#CCCCCC">შეტყობინებების დაყენება</a></li>
    <li id="4" class="rightmenu menuopt"><a href="#4">სამუშაოების მინიჭება</a></li>
    <li id="5" class="rightmenu menuopt"><a href="#5">პარამეტრები</a></li>
    <li id="17" class="rightmenu menuopt"><a href="#17">ოთახის გადატანის შეჩერება</a></li>
    <li id="18" class="rightmenu menuopt"><a href="#18">ოთახის გადატანის შეჩერების გაუქმება</a></li>
    <li id="19" class="rightmenu menuopt"><a href="#19">ოთახის გაცვლა</a></li>
    <li id="20" class="rightmenu menuopt"><a href="#20">სტუმრის გადაყვანა ფიზიკურად</a></li>
</ul>





<script type="text/javascript" src="../gt/jquery.ui.datepicker-en-GB.js"></script>









<!-- Jignesh - 1.0.22.27 - 8th Oct 2011 - END -->
<script type="text/javascript">
/*<![CDATA[*/

var strTime = "15:05:43";
var H = strTime.split(":")[0];
var M = strTime.split(":")[1];
var S = strTime.split(":")[2];
var js_dateobj;
var js_localTime;
var js_localDate="2014-04-29";

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

function get_GroupCount(tran_id,groupid,res_no,ownership,popup,action,tranflag,tran_status) <!--Manali - 1.0.37.42 - 02 Dec 2013, Purpose : Added tran_status, Part Of Advance Room Move -->
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

function callAction(tran_id,res_no,popup,action,tranflag,groupid,tran_status) <!--Manali - 1.0.37.42 - 02 Dec 2013, Purpose : Added tran_status, Part Of Advance Room Move -->
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
				parent.addTab('content/EditTransaction.jsp?reservationroomid='+tranUnkid,'<span class="glyphicon glyphicon-saved"></span>&nbsp;&nbsp;401 - DXR','TAB_EditTransaction_5');
//				loadTab('EditTran',"Edit Transaction",'edittran.jsp?tranunkid='+tranUnkid);
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
		htmlHeight= jQuery('#outer').height();
		if(document.getElementById('popuptransbg'))
		{
			zindex1=(jQuery('.transbg ').last().css('z-index'))+12;
			zindex2=parseInt(zindex1)+11;
			jQuery(".transbg").css({'opacity':'0','filter':'alpha(opacity=0)','-moz-opacity':'0'});
		}
		else
		{
			zindex1=104;
			zindex2=115;
		}
		jQuery("<div id='popuptransbg' class='transbg popuptransbg_"+popupid+"' ></div>").css({left : '0px', top : '0px',position: 'absolute', width: '100%',opacity:'0.5', height: htmlHeight+'px', zIndex: zindex1 }).appendTo(document.body);

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

		if(jQuery('#divpopup').length==0)
		{
			alert('#divpopup container not found.');
			return;
		}
		jQuery('#divpopup').append(content);
		var size=clientSize(window.self);
		var flag=0;
		top1 = size.height/2 - height/2;
		left = size.width/2 - width/2;
		jQuery("#iframecontainer_"+popupid).css({'top':top1+'px','left':left+'px','position':'absolute',zIndex:zindex2});
		if(popupid!='SetModuleLanguage')
			jQuery("#iframecontainer_"+popupid).append("<a id='langsetting_"+popupid+"' style='display:none' title='Language Settings' class='langsetting lspopup islang_1' onclick=\"showPopupLanguageSettings('"+pageurl+"');return false;\"></a>");

		jQuery("#iframecontainer_"+popupid).append("<a style='display:none' id='popupclose_"+popupid+"' class='popupclose' onclick=\"unLoadPopup('"+popupid+"',false);\"></a>");

		jQuery('.popupiframe').load(function(){
			jQuery(".popupclose").attr("style","");
			jQuery(".lspopup").attr("style","");
		});
		jQuery('#iframecontainer_'+popupid).show();
		jQuery('#divpopup').show();
		jQuery('.islang_1').remove(); // For default language, class islang_1 is applied on various controls. It indicates language settings option is not applicable to users. Please do not remove this line. - Manali [25-July-2011]
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
function unassign_room(tranid,roomtypeid,issplitflag)<!--Manali - 1.0.37.42 - 29 Nov 2013,Purpose : Part Of Advance Room Move, added  issplitflag-->
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
//parent.newWindow1('roommove','მოსული სტუმარი','tranunkid='+tranid);
		parent.loadPopup('RoomMove','roommove/tranunkid/'+tranid+'/popup/'+popupname,420,730);
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

                parent.newWindow('walkin','მოსული სტუმარი');

		//parent.loadPopup('WalkIn','walkin/id/'+id+otherparameters,622,1158);
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

/*]]>*/
</script>






<div id="loading" style="display: none;">Loading...</div>
<div class="transbg" Style="display:none;"><span class='loadspan'></span></div>
<div class='overlay' onclick=closetranmenu(); style="display:none;"></div>

<div id="popupnotify" class="clock" style="position:absolute;bottom:1px;right:0;display:none;height:auto;cursor:pointer">
Reminder
</div>

<div id='divpopup' style="display:none"></div>
<div id='slidingmessage' style="display:none"></div>
<!-- HRK -->
<form id="ctl0_frm" method="post" action="/index.php/page/newfront.stayview">
<script type="text/javascript" src="../gt/clientscripts.js"></script>

<div id="outer">
  <section id="wrapper">
<script type="text/javascript">
function Night_Audit()
{
	try
	{

		// HRK - 1.0.26.31 - 11 July 2012 - START
		// Purpose : Access To Night Audit
		if(!hasRights(107)) // AccessToNightAudit
		{
			return;
		}
		// HRK - 1.0.26.31 - 11 July 2012 - END

		try
		{
			dbDate= "<%=today%>";
			localDate = "2014-04-29";
			if(dbDate >= localDate)
			{
				alert("Night Audit for future date is not allowed.");
				return false;
			}

			if(jQuery('#div_EditTran').length || jQuery('#div_EditGroupTran').length)
			{
				alert("Night Audit is not allowed in open transaction. Please close the transaction and then perform Night Audit.");
				return false;
			}

		}catch(e){
			//ignore error
		}

		loadPopup('NightAudit','nightaudit',450,1101);
	}
	catch(e)
	{
		alert(e);
	}
}

function Net_Locks()
{
	try
	{
		//alert('open walkin here');
		loadPopup('NetLocks','netlocklist',400,325);
	}
	catch(e)
	{
		alert(e);
	}
}

function Change_Password()
{
	try
	{
		//alert('open walkin here');
		loadPopup('ChangePassword','changepassword',180,340);
	}
	catch(e)
	{
		alert(e);
	}
}

function Cashiering_Center()
{
	try
	{
		//alert('open walkin here');
		loadPopup('CashieringCenter','cashcenter',541,811);
	}
	catch(e)
	{
		alert(e);
	}
}

function logout()
{
	if(!confirm("Are you sure want to log out ?"))
		return false;
	else
	{
		 localStorage.removeItem("'LS_PrivilegeList'");
		 localStorage.removeItem("'LS_UserPrivilege'");
		localStorage.removeItem("rmt");
	}
}

<!--Manali - 1.0.34.39 - 03 Jun 2013 - START -->
<!--Purpose : Enhancement - Insert Transaction for past dates -->
function inserttransaction_operation()
{
	try
	{
		<!-- Chandrakant - 1.0.34.39 - 14 June 2013 - START -->
		<!-- Purpose : Check Privilege for Insert Insert Transaction  -->
		if(!hasRights(118))
		{
			return false;
		}
		else
		{
			parent.loadPopup('InsertTransaction','inserttransaction',622,1158);
		}
		<!-- Chandrakant - 1.0.34.39 - 14 June 2013 - END -->
	}
	catch(e)
	{
		alert(e);
	}
}

</script>


    <!-- Do not remove below hiddden field. It is used for page detection -->
    <input type="hidden" name="ctl0$hidPageName" id="ctl0_hidPageName" value="stayview" />

    <!-- Do not remove below hiddden field. It is used for setting Group Owner status -->
	<input type="hidden" name="ctl0$hidOwnershipStatus" id="ctl0_hidOwnershipStatus" value="0" />

    <div class="container_outer">
      <input type="hidden" name="ctl0$ctl6$hidCheckInFlag" id="ctl0_ctl6_hidCheckInFlag" />
<input type="hidden" name="ctl0$ctl6$user" id="ctl0_ctl6_user" value="admin" />
<input name="ctl0$ctl6$txtHiddenDate" type="text" value="<%=today%>" placeholder="" id="ctl0_ctl6_txtHiddenDate" class="txtHiddenDate" style="display:none;" />


<script>
function contextMenuWork(action, el, pos)
{
	tmpId= jQuery(el).attr('id');

	var arr_tmp = tmpId.split( ',' );

	var status= arr_tmp[0];
	var tranid= arr_tmp[1];

	tranmenupopup(status,tranid,'',action);
}
</script>

<script type="text/javascript">
/*<![CDATA[*/

	function refreshArrivalList()
	{
		//alert("refreshArrivalList");
		var request = new Prado.CallbackRequest('ctl0$ctl6$RefreshGuestList',{});
		request.dispatch();
	}

  filterchange(jQuery("select[id$='lstFilter']").val());

  function lstRoomType_change(rt)
  {
  	jQuery("input[id$='txtFilterTerm']").val(rt);
  }

  function filterchange(filter)
  {
  	if(filter=="RT")
	{
		jQuery("select[id$='lstRoomType']").attr("style","display:block;width:125px;");
		jQuery("input[id$='txtFilterTerm']").attr("style","display:none");
		jQuery("input[id$='txtFilterTerm']").val(jQuery("select[id$='lstRoomType']").val());
	}
	else
	{
		jQuery("select[id$='lstRoomType']").attr("style","display:none");
		jQuery("input[id$='txtFilterTerm']").attr("style","display:block;width:125px;");
		jQuery("input[id$='txtFilterTerm']").val('');
	}
  }

  var RefreshLeftPanel = function() {
	  alert('refreshArrivalList');
	  var request = new Prado.CallbackRequest('ctl0$ctl6$RefreshGuestList',{});
	  request.dispatch();
  };

  function showconfirm()
  {
	  var ret=jConfirm("Are you sure ?",{
	  autoHide : false,
	  clickOverlay : false,
	  HorizontalPosition : "center",
	  VerticalPosition : "center",
	  ShowOverlay : true
 	 });

  alert(ret);

  }

  function showalert()
  {
	  var ret=jAlert("Please select a record.",{
	  autoHide : false,
	  clickOverlay : false,
	  HorizontalPosition : "center",
	  VerticalPosition : "center",
	  ShowOverlay : true
	  });
  	alert(ret);
  }

function openSearch()
{
	if(jQuery("select[id$='lstFilter']").val()=='-1')
	{
		alert("Please select filter.");
		jQuery("select[id$='lstFilter']").focus();
		return false;
	}
	if(jQuery("input[id$='txtFilterTerm']").val()=='')
	{
		alert("Please enter filter term.");
		jQuery("input[id$='txtFilterTerm']").focus().addClass('validfailed');
			jQuery('.validfailed').blur(function(){
						jQuery(this).removeClass('validfailed');
					});
		return false;
	}
	open_transactionsearch(jQuery("select[id$='lstFilter']").val(),jQuery("input[id$='txtFilterTerm']").val());
}

var getTodaysDate =function()
	{
		var request = new Prado.CallbackRequest('ctl0$ctl6$callbackgetTodaysDate',{});
		request.dispatch();
	}
// Jignesh : 15 sep 2011
// Reason : To introduse Undocheckin option to rightclick menu.
function undo_checkin(tranid,arrival,departure)
			{
				if(confirm("Are you sure you want to undo checkin/dayuse transaction?"))
				{
					if(isLocked(tranid))
					{
						return;
					}
					showjQloading();
					var request = new Prado.CallbackRequest('ctl0$ctl6$undocheckin_callback',{});
					var param = {'tranunkid' : tranid+"",'arrivaldate' : arrival+"",'departuredate' : departure+""};
					request.setCallbackParameter(param);
					request.dispatch();
				}
			}
function undo_checkin_Message(tranunkid,status)
			{
				try
				{
					jMessage('Undo Checkin/Dayuse is done successfully.','Success','center','center');

					// Manali - 1.0.23.28 - 04 Jan 2012 - START
					// Purpose : If transaction Search tab is opened,its not refreshing tab
					if(parent.jQuery('#div_TranSearch').length)
						parent.tabiframe_TranSearch.loadata();
					// Manali - 1.0.23.28 - 04 Jan 2012 - END

					if (jQuery("input[id$='hidPageName']").val() == "arrivallist")
						{
						refreshList();
						}
					else if (jQuery("input[id$='hidPageName']").val() == "stayview")
						{
						addRemoveTransaction(status,tranunkid,true,true,"UndoCheckIn");
						}
					else if (jQuery("input[id$='hidPageName']").val() == "roomview")
						{

						parent.addRemoveTransaction(status,tranunkid,true,true,"UndoCheckIn");
						}
					else if (jQuery("input[id$='hidPageName']").val() == "dashboard")
						{
							refreshList();
							refreshQuickOperations();
						}
					// Jignesh 16 sep 2011 - Unochekin is not reflection to arrival list.
					else if (jQuery("input[id$='hidPageName']").val() == "quickview")
						{
							refreshArrivalList();
							loadquickview(); // Jignesh 16 sep 2011 - reload quickview .

						}
					else
						{
							refreshArrivalList();

						}
						hidejQloading();
				}
				catch(e)
				{
					alert("newfdleftpanel >> undo_checkin_Message "+ e);
				}
			}

/*]]>*/
</script>




      <section id="right">
      <section class="flexouter" id="right_flexouter">

<span style="display:none">
<link href="../gt/jquery.ui.resizable.css?1.0.39.44" rel="stylesheet" type="text/css" />
<script src="../gt/jquery_003.js?1.0.39.44"></script>
	<script src="../gt/jquery.js?1.0.39.44"></script>
	<script src="../gt/common_view.js?1.0.39.44"></script>
	<script src="../gt/jquery_002.js?1.0.39.44"></script>
	<script src="../gt/localstorage.js?1.0.39.44"></script>
	<script src="../gt/jquery.ui.resizable.js?1.0.39.44"></script>

<style>
.rowhover{
	background:rgba(225,59,39,0.8) !important;
	color:	#FFFFFF !important;
}
#sort{
cursor:pointer;
padding-top:8px;
display: inline-block;
width:60px;
}
.cal_ico{
	margin: 2px 3px 0;
}
.first_click,._first_click{
	background:#ff8428;
	background-image:-moz-linear-gradient(32% 96% 90deg, #eb6500, #ff8428 80%);
	background:-webkit-gradient(linear, 77% 96%, 77% 28%, from(#eb6500), to(#ff8428)) ;
	border:1px solid #c95a00;
	border-top-right-radius: 10px;
	border-bottom-right-radius: 10px;
	border-top-left-radius: 10px;
	border-bottom-left-radius: 10px;
	padding:5px;
	display:block;
	color:#FFFFFF;
}
.nithts{
	white-space:nowrap;
	display:block;
	overflow:hidden;
	color:#FFFFFF;
}
#tplLeft {
    display: block;
    font-family: "Arial","Helvetica","Verdana","sans-serif";
    font-size: 11px;
    margin-bottom: 2px;
    overflow: hidden;
	position:relative;
	z-index:101;
	width:125px;
	float:left;
	border-right:1px solid #c8c8c8;
}
#tplRight{width:840px;z-index:100;}
#conRight{float:left;width:840px;}
ol.ui-selectable{float:left;height:22px;position:relative;border-bottom:1px solid #C8C8C8;}
.ui-selected {
	background: #f2b663;cursor: pointer;color: white;}
.ui-selecting  {
    background: #F39814;color: white;}
.g_name {
    height: 22px;
    line-height: 20px;
    overflow: hidden;
    padding-left: 7px;
    position: absolute;
    white-space: nowrap;
	color:#FFFFFF;
	font-size: 13px;
    font-weight: bold;
	text-shadow: 0 1px 1px #000;
}
.tran_cells{
	width:200px;
	height:22px;
	float:left;
	position:absolute;
	z-index:50;
	/*left:126px;*/
	cursor:pointer;
	-moz-transition: width 2s;
}
.tran_cells .after{
	float:right;
	border-top-color: transparent;
	border-right-color: transparent;
	border-bottom-color: transparent;
	border-style: solid;
	border-width: 11px 0px 11px 18px;
	margin-right:-18px;
}
.gradiusR{border-bottom-right-radius: 10px;border-top-right-radius: 10px;}
.gradiusL{border-bottom-left-radius: 10px;border-top-left-radius: 10px;}
.gradius{border-radius: 10px;}

.gradius::before,.tran_cells::before,.gradiusR::before,.gradiusL::before{
 	background:-moz-linear-gradient(32% 96% 90deg,  rgba(0,0,0,0.5) ,rgba(0,0,0,0)80%);
	background:-webkit-gradient(linear, 77% 96%, 77% 30%, from(rgba(0,0,0,0.5)), to(rgba(0,0,0,0)));
	content: "\00a0";
    display: block;
	position:absolute;
	height:100%;
	width:100%;
 }
.gradius::before{border-radius: 10px;}
.gradiusR::before{border-bottom-right-radius: 10px;border-top-right-radius: 10px;}
.gradiusL::before{border-bottom-left-radius: 10px;border-top-left-radius: 10px;}
.moredata{
	position:absolute;
	left:0;
	min-height:150px;
	overflow:scroll;
	width:500px;
	display:none;
	z-index:1000;
	background-color:#EEEEEE;
}
.roomday{position:relative;float:left;}
#more{cursor:pointer; float:right; padding:3px 16px 3px 5px; border-left:1px solid #c3c7cd; margin-left:5px;font-weight:bold;}
.hoverselect{
	background-color:#FFF;
	border-bottom:none;
	padding:3px 16px 8px 5px!important;
	border-left:1px solid transparent!important;
	box-shadow:0 1px 1px rgba(0,0,0,0.7);
	-moz-box-shadow:0 1px 1px rgba(0,0,0,0.7);
	-webkit-box-shadow:0 1px 1px rgba(0,0,0,0.7);
}
.l_status{cursor:pointer;}
#moreblock{
	display:none;
	position:absolute;
	z-index:113;
	top:22px;
	right:0;
	box-shadow:1px 1px 1px rgba(0,0,0,0.7);
	-moz-box-shadow:1px 1px 1px rgba(0,0,0,0.7);
	-webkit-box-shadow:1px 1px 1px rgba(0,0,0,0.7);
	width:100px;
}
#moreblock li{
	background-color:#FFF;
	border-bottom: 1px solid #c3c7cd;
	color:#000;
	cursor:pointer;
    float: left;
    padding:7px 10px;
    width: 80px;
}
#moreblock li:hover{color:#067CD1; background-color:#F5F5F5;}
.rmasort, .rmdsort{
    border-style: solid;
    content:"\00a0";
    float: right;
    height: 0;
    margin-left: 4px;
    margin-top: 2px;
    position: absolute;
    width: 0;
    z-index: 13;
	position:relative;
}
.rmasort{
	border-color: #FFFFFF transparent transparent;
    border-width: 8px 5px 0;
    margin-top: 21px;
}
.rmdsort{
	border-color: transparent transparent #FFFFFF;
	border-width:0 5px 9px;
	margin-top: 19px;
}
.ttp{
	border-bottom: 5px solid transparent;
	border-left: 7px solid #000;
	border-top: 5px solid transparent;
	float: left;
	height: 0;
	position: relative;
	width: 0;
	opacity:0.4;
}
.bdate{
font-size:15px;
font-weight:bold;
}

.totalbooking_a:hover,.totalbooking_b:hover
{
cursor:pointer;
opacity:0.5;
}
.pttp{
 position: relative;
 float: right;
 padding:6px 2px 6px 3px;

}
#holiday_info{
	background:#FFF;
	color:#000000;
	position:absolute;
	font-size:12px;
	text-align:left;
	-moz-box-shadow:1px 1px 2px rgba(0,0,0,0.6);
	-webkit-box-shadow:1px 1px 2px rgba(0,0,0,0.6);
	box-shadow:1px 1px 2px rgba(0,0,0,0.6);
	z-index:102;
	display:block;
	z-index:200;
	max-width: 350px;
	/*width:220px;*/
}
#holiday_info:before, #holiday_info:after{
	border-style:solid;
	border-width: 9px;
	content:"\00a0";
	height:0;
	position:absolute;
	width:0;
	z-index:13;
	right: 13px;
	bottom:-19px;
}
#holiday_info:before{
	border-color:#BBB transparent transparent;
}
#holiday_info:after{
	bottom:-18px;
	border-color:#EEE transparent transparent;
}
.holi_box{padding:7px 15px; max-height: 350px; overflow: hidden;}

</style>

<link href="../gt/grid.css?1.0.39.44" rel="stylesheet" type="text/css" />
	</span>
	<section id="section_info" style="display:none;">
	<div id="infobox">
		<name> </name>
		<checkin> </checkin>
		<checkout> </checkout>
		<night></night>
		<reservation> </reservation>
		<group> </group>
		<pax></pax>
		<remark></remark>
		<roomchange></roomchange>
	</div>
	<span class="ttfooter"><balance></balance></span>

	</section>

	<section class='arrival_departure_hint' style='display:none'>
		<div id="hintbox">
		<b>ჩამოსვლა:</b><span id='ari'></span>
		<b>წასვლა: </b><span id='dep'></span>
		<span id="rmdt" style="display:none;"></span>
		</div>
	</section>
	<span class="startdate" style="display:none">
		<label class="lbldate">Date </label>
	</span>
	<section id="holiday_info" style="display:none;">
	<div class="holi_box">
	</div>
	</section>

<div class="tabs ui-tabs ui-widget ui-widget-content ui-corner-all">		
		<ul class="main-tabs ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all" >
			<li id="frontDesk" class="ui-state-default ui-corner-top ui-tabs-selected ui-state-active">
                            <a href="#tabs-1" onClick="javascript:showMe('frontDesk');" id="frontDesk"><span>Stay View</span></a>
                        </li>
		</ul>

	
 
	
	</div>
    
          
<div class="sv_grid tabcontent tabmain container flexouter boxflex">
	<div class="svtop">
	<lnk class="today" id="" title="დღეს">დღეს</lnk>
	<lnk  class="daychange" id="7" title="7">7 დღე</lnk>
	<lnk class="daychange" id="15" title="15">15 დღე</lnk>
	<lnk class="daychange" id="30" title="30">30 დღე</lnk>

	<div class="datepicker">
	<input name="ctl0$fdmain$dtpStartDate" type="text" value="<%=today%>" placeholder="" id="dtpStartDate" disabled="disabled" class="txtbox" onchange="showjQloading();datechange();hidejQloading();" style="width:80px;" />
	</div>

	</div>
	<input type="text" value=""  name="day_select" id="day_select" style="width:800px;z-index:-100;position:absolute;left:-500px;top:-500px;" />

	<div id="gridHeader">
		<span class="roomtype_title"><span id="sort">ოთახი <a class="rmasort"></a></span>
		<span id="pre" title="previous"><span class="svpre"></span></span>

		</span>

		<ol id="datetable" style="float:left"></ol>
		<span id="next"><span class="svnext" title="next"></span></span>
	</div>

<div id="grid" class="grdControll scroll-pane-grid boxflex" style="width:983px;float:left;white-space:nowrap;">
<div id="tplLeft"></div>
<span id="tplRight" style="float:left;"></span>
</div>
	<div class="grid_status" >
	<ul>
		<li id="roomavailable">
			<span class="status_title">თავისუფალი ოთახი</span>
		</li>
	</ul>
	<ul>
		<li id="occupancy">
			<span class="status_title">დაკავებული%</span>
		</li>
	</ul>
	<ul>
		<li id="svfooter">
			<span class="status_title">ოთახის სტატუსი</span>
		</li>
	</ul>
	</div>
</div>
	<input name="ctl0$fdmain$txtRange" type="text" placeholder="" id="txtRange" style="z-index:-100;position:absolute;left:-500px;top:-500px;" />



	<input type="hidden" name="ctl0$fdmain$Hidtransaction" id="Hidtransaction" />
	<input type="hidden" name="ctl0$fdmain$HidStartDate" id="HidStartDate" value="04/17/2014" />
	<input type="hidden" name="ctl0$fdmain$HidEndDate" id="HidEndDate" value="05/01/2014" />
	<input type="hidden" name="ctl0$fdmain$dbDate" id="dbDate" value="<%=df2.format( new Date())%>" />
<script>
var month=new Array(12);
month[0]="იან";month[1]="თებ";month[2]="მარ";month[3]="აპრ";month[4]="მაი";month[5]="ივნ";month[6]="ივლ";month[7]="აგვ";month[8]="სექ";month[9]="ოქტ";month[10]="ნოე";month[11]="დეკ";
var weekday=new Array(7);weekday[0]="კვი";weekday[1]="ორშ";weekday[2]="სამ";weekday[3]="ოთხ";weekday[4]="ხუთ";weekday[5]="პარ";weekday[6]="შაბ";

</script>
<script>
jQuery("#more").click(function() {
	jQuery("#moreblock").slideDown(100);
	jQuery(this).addClass('hoverselect');
	  });
jQuery("#more").mouseleave(function() {
    jQuery("#moreblock").slideUp(100);
	jQuery("#more").removeClass('hoverselect');
  });
(function($)
{
        $.fn.blink = function(options)
        {
				var defaults = { delay:300};
                var options = $.extend(defaults, options);
				var timerid='';
				var bc=0;

                this.each(function()
                {
						var obj = $(this);
		                timerid=setInterval(function()
                        {
								bc++;
								if($(obj).css("opacity") == 1)
                                {
                                    $(obj).css('opacity',0.5);
                                }
                                else
                                {
                                    $(obj).css('opacity',1);
                                }
								if ( bc >= 6)
								{
									clearInterval(timerid);
								}
                        }, options.delay);
                });
        }

}(jQuery))


dateFormate = "Y-m-d";
jQueryDateFormat = "yy-mm-dd";
if(eALocalStorage.getItemObject("svGrid_displayday") == null)
{
eALocalStorage.setItem("svGrid_displayday",15);
}
displayday=eALocalStorage.getItemObject("svGrid_displayday");
var repTitle=0;
var svGrid = {};
svGrid = {
	//objSource : {RMS : 0, OPT : 0, STS : 0,OCC : 0,BKG : 0,UAR : 0,ARI : 0,NDAY:eALocalStorage.getItemObject("svGrid_displayday")},
	objSource : {OPT : 0, OCC : 0,BKG : 0,UAR : 0,ARI : 0,HKS:0,NDAY:eALocalStorage.getItemObject("svGrid_displayday")},
	roomtylelist :{},
	//list :{},
	dateFormate:"Y-m-d",
	jQueryDateFormat:"yy-mm-dd",
	displayday : eALocalStorage.getItemObject("svGrid_displayday"),
	gW:840,
	//js_startdate  : validDate(jQuery("input[id$='dtpStartDate']").val(),'Y-m-d'),
	fun_ajxdata : function(objData)
		{
		try
		{
		var status = 0;
		svGrid.objSource.STS=1;svGrid.objSource.RMS=1;
		if(eALocalStorage.getItemObject("'LS_StayViewData_RMS'")!=null)
			svGrid.objSource.RMS=1;
		else
			svGrid.objSource.RMS=0;	

		if(eALocalStorage.getItemObject("'LS_StayViewData_OPT'")!=null)
			svGrid.objSource.OPT=1;
		else
			svGrid.objSource.OPT=0;

		if(eALocalStorage.getItemObject("'LS_StayViewData_STS'")!=null)
                    svGrid.objSource.STS=1;
		else
			svGrid.objSource.STS=0;

		if(eALocalStorage.getItemObject("'LS_StayViewData_OCC'")!=null)
			svGrid.objSource.OCC=1;
		else
			svGrid.objSource.OCC=0;

		if(eALocalStorage.getItemObject("'LS_StayViewData_BKG'")!=null)
			svGrid.objSource.BKG=1;
		else
			svGrid.objSource.BKG=0;

		if(eALocalStorage.getItemObject("'LS_StayViewData_UAR'")!=null)
			svGrid.objSource.UAR=1;
		else
			svGrid.objSource.UAR=0;

		if(eALocalStorage.getItemObject("'LS_StayViewData_ARI'")!=null)
			svGrid.objSource.ARI=1;
		else
			svGrid.objSource.ARI=0;

		if(eALocalStorage.getItemObject("'LS_StayViewData_HKS'")!=null)
			svGrid.objSource.HKS = 1;
		else
			svGrid.objSource.HKS = 0;


		/*if(localStorage)
		{
			if(eALocalStorage.getItemObject("'LS_StayViewData'")!=null)
			{
			status=eALocalStorage.getItemObject("'LS_StayViewData'");
			}
		}
		else
		{	*/

		var tdata={};
		var req=1;
		for(v in svGrid.objSource)
		{
			if(svGrid.objSource[v]==0)
			{
			req=1;
			break;
			}
			else{
			req=0;
			}
		}

		if(req == 1)
			{
				jQuery.ajax({
					async: false,
					data: {
							opcode: objData.OPCODE, //"rtwrm",
							islocal:svGrid.objSource,
							sdate:jQuery.trim(jQuery("input[id$='dtpStartDate']").val())
							},
					url: 'json/webfront.jsp',
					success: function(data)
							{
//data='{"hkstatus":[{"roomunkid":"50300000000000001","name":null,"smokingstatus":"NONSMOKING"},{"roomunkid":"50300000000000002","name":null,"smokingstatus":"NONSMOKING"},{"roomunkid":"50300000000000003","name":null,"smokingstatus":"NONSMOKING"},{"roomunkid":"50300000000000004","name":null,"smokingstatus":"NONSMOKING"},{"roomunkid":"50300000000000005","name":null,"smokingstatus":"NONSMOKING"},{"roomunkid":"50300000000000006","name":null,"smokingstatus":"NONSMOKING"},{"roomunkid":"50300000000000007","name":null,"smokingstatus":"NONSMOKING"},{"roomunkid":"50300000000000008","name":null,"smokingstatus":"NONSMOKING"},{"roomunkid":"50300000000000009","name":null,"smokingstatus":"NONSMOKING"},{"roomunkid":"50300000000000010","name":null,"smokingstatus":"NONSMOKING"},{"roomunkid":"50300000000000011","name":null,"smokingstatus":"NONSMOKING"},{"roomunkid":"50300000000000012","name":null,"smokingstatus":"NONSMOKING"},{"roomunkid":"50300000000000013","name":null,"smokingstatus":"NONSMOKING"}]}';
							status = data;
							}
					});
//status='{"hkstatus":[{"roomunkid":"50300000000000001","name":null,"smokingstatus":"NONSMOKING"},{"roomunkid":"50300000000000002","name":null,"smokingstatus":"NONSMOKING"},{"roomunkid":"50300000000000003","name":null,"smokingstatus":"NONSMOKING"},{"roomunkid":"50300000000000004","name":null,"smokingstatus":"NONSMOKING"},{"roomunkid":"50300000000000005","name":null,"smokingstatus":"NONSMOKING"},{"roomunkid":"50300000000000006","name":null,"smokingstatus":"NONSMOKING"},{"roomunkid":"50300000000000007","name":null,"smokingstatus":"NONSMOKING"},{"roomunkid":"50300000000000008","name":null,"smokingstatus":"NONSMOKING"},{"roomunkid":"50300000000000009","name":null,"smokingstatus":"NONSMOKING"},{"roomunkid":"50300000000000010","name":null,"smokingstatus":"NONSMOKING"},{"roomunkid":"50300000000000011","name":null,"smokingstatus":"NONSMOKING"},{"roomunkid":"50300000000000012","name":null,"smokingstatus":"NONSMOKING"},{"roomunkid":"50300000000000013","name":null,"smokingstatus":"NONSMOKING"}]}';
			tdata = jQuery.parseJSON(status);

				}

	/*	}	*/

		if(eALocalStorage.getItemObject("'LS_StayViewData_STS'") == null)
			eALocalStorage.setItem("'LS_StayViewData_STS'",tdata.status);
		else
		tdata.status=eval(eALocalStorage.getItemObject("'LS_StayViewData_STS'"));

		if(svGrid.objSource.RMS==0)
			eALocalStorage.setItem("'LS_StayViewData_RMS'",tdata.rooms);
		else
		tdata.rooms=eval(eALocalStorage.getItemObject("'LS_StayViewData_RMS'"));

		if(eALocalStorage.getItemObject("'LS_StayViewData_OPT'") == null)
			eALocalStorage.setItem("'LS_StayViewData_OPT'",tdata.roomopt);
		else
		tdata.roomopt=eval(eALocalStorage.getItemObject("'LS_StayViewData_OPT'"));

		/*if(eALocalStorage.getItemObject("'LS_StayViewData_STS'") == null)
			eALocalStorage.setItem("'LS_StayViewData_STS'",tdata.status);
		else
		tdata.status=eval(eALocalStorage.getItemObject("'LS_StayViewData_STS'"));*/

		if(eALocalStorage.getItemObject("'LS_StayViewData_OCC'") == null)
			eALocalStorage.setItem("'LS_StayViewData_OCC'",tdata.occupancy);
		else
		tdata.occupancy=eval(eALocalStorage.getItemObject("'LS_StayViewData_OCC'"));

		//console.log(tdata.booking);

		if(eALocalStorage.getItemObject("'LS_StayViewData_BKG'") == null)
			eALocalStorage.setItem("'LS_StayViewData_BKG'",tdata.booking);
		else
		tdata.booking=eval(eALocalStorage.getItemObject("'LS_StayViewData_BKG'"));

		if(eALocalStorage.getItemObject("'LS_StayViewData_UAR'") == null)
			eALocalStorage.setItem("'LS_StayViewData_UAR'",tdata.unassigned);
                else
		tdata.unassigned=eval(eALocalStorage.getItemObject("'LS_StayViewData_UAR'"));

 		if(eALocalStorage.getItemObject("'LS_StayViewData_ARI'") == null)
			eALocalStorage.setItem("'LS_StayViewData_ARI'",tdata.alist);
		else
		tdata.alist=eval(eALocalStorage.getItemObject("'LS_StayViewData_ARI'"));

		if(eALocalStorage.getItemObject("'LS_StayViewData_HKS'") == null)
			eALocalStorage.setItem("'LS_StayViewData_HKS'",tdata.hkstatus);
		else
		tdata.hkstatus=eval(eALocalStorage.getItemObject("'LS_StayViewData_HKS"));

		return (tdata);
		}
		catch(e)
		{
		alert("fun_ajxdata "+ e);
		}
		},
	   	fun_tplHeaderRight : function()
		{
		var dtp_validDate = validDate(jQuery.trim(jQuery("input[id$='dtpStartDate']").val()),svGrid.dateFormate);

		// Shweta - 1.0.39.44 START
		var getHldDt = getHoliDayList();
		var arr = getHldDt[0];
		var arr_col  = getHldDt[1];
		var arr_hname = getHldDt[2];
		// Shweta - 1.0.39.44 END

		//var dates = [ {d:'21',D:'Mon',m:'11'},{d:'22',D:'Tue',m:'11'} ];
		//var tdate= new Array(); // tmpl code
		 var head_html='';

		 	for(i=0;i<svGrid.displayday;i++)
				{
				//console.log(1);
				var nextDate = new Date(dtp_validDate.getTime());
				nextDate.setDate(nextDate.getDate()+i);//var msecsInADay = 86400000;
				nextDate = daylightSavingAdjust(nextDate,1);

				var d=nextDate.getDate();
				var m=month[nextDate.getMonth()];
				var D=weekday[nextDate.getDay()];
				var c = (i%2 == 0) ? '_a' : '_b';
				var w=svGrid.gW/svGrid.displayday;

				// Shweta - 1.0.39.44 START - Convert date to mysql format
				var cDt = nextDate.getFullYear() + '-' +
						(nextDate.getMonth() < 9 ? '0' : '') + (nextDate.getMonth()+1) + '-' +
						(nextDate.getDate() < 10 ? '0' : '') + nextDate.getDate();

				//console.log(cDt+"========="+arr);
				var CheckValue = jQuery.inArray(cDt,arr);
				var st = 'width:'+w+'px;';
				var flg = '';
				var color = '';
				var bl = '';

				if(CheckValue != -1 && arr_col[cDt]!='NA') //Manali - 1.0.40.45 - 05 Apr 2014, Purpose : Fixed Bug - If no color is assigned to holidays, then in database color column is '', it disturbs stayview loading.
				{
					st = 'width:'+w+'px;cursor:pointer;background:'+arr_col[cDt];
					bl = arr_hname[cDt];
					flg = 'holinm';
					color='color='+arr_col[cDt];
				}

				// Shweta - 1.0.39.44 - END

				//tdate.push({i:i,d:d,m:m,D:D,cls:c,w:w,M:nextDate.getMonth()+1,Y:nextDate.getFullYear()}); // tmpl code
				//head_html += "<li style='width:"+w+"px' class='lidate title"+c+" "+nextDate.getFullYear()+"_"+(nextDate.getMonth()+1)+"_"+D+"'>";

				head_html += "<li style="+st+" class='lidate title"+c+" "+flg+"'  id=t_"+i +"  "+color+">";
				head_html += "<span class='bdate'>"+nextDate.getDate()+"</span>";
				head_html += "<span class='bday'>"+m+"</span><span class='bday'>"+D+"</span><span class='descholi' style='display:none;'>"+bl+"</span></li>";

				}
				jQuery("#datetable").html(head_html);

			 //jQ164( "#datetable" ).html( jQ164("#mHeader" ).tmpl( tdate ));
			 return;

		},
	fun_makeArray : function (objData)
		{
		try
		{
		var tdata = svGrid.fun_ajxdata(objData);
		var t=(jQuery("#sort a").attr('class') == 'rmasort') ? false : 1;

		//tdata['rooms'].sort(sort_by('rtsort', false, function(a){return ((a == null)?0 :eval(a));}));
		//tdata['rooms'].sort(sort_by('rtsort,roomtype', t, function(a){return ((a == null)?0 :a.toUpperCase());}));
		//tdata['rooms'].sort(sort_by('fsortkey', false, function(a){return ((a == null)?0 :eval(a));}));

		var categories = {};
			jQuery.each(tdata.rooms, function(i, m) {
			if(!categories[m.roomtypeunkid]) categories[m.roomtypeunkid] = [m];
				else categories[m.roomtypeunkid].push(m);
			});

			svGrid.roomtylelist=categories;
			n=0;
			var c_categories = {};
			jQuery('.chk_roomtype').each(function(index){
				if(jQuery(this).is(':checked'))
				{
				n++;
				var v =jQuery(this).val();
				jQuery.each(categories[v], function(i, m) {
				if(!c_categories[m.roomtypeunkid])
					{
					c_categories[m.roomtypeunkid] = [m];
					}
				else{
					c_categories[m.roomtypeunkid].push(m);
					}
				});
				}
			});

			if(n==0)
			{
			c_categories = categories;
			}
			else
			{
			c_categories = c_categories;
			}
		 	return(c_categories);
		}
		catch(e)
		{
		alert ("fun_makeArray >> "+e);
		}
		},
		fun_templateCategories : function()
		{
		try
		{
			//jQ164("#mRootype").tmpl(svGrid.roomtylelist).appendTo("#con_roomtype"); //tmpl code
		}
		catch(e)
		{
		alert("fun_templateCategories "+e);
		}
		},
	fun_makeRoomoptArray : function()
		{
			var objData = {OPCODE : 'rtwrm'};
			var data = svGrid.fun_ajxdata(objData);
			var roomopt = {};
			jQuery.each(data.roomopt, function(i, m) {
			if(!roomopt[m.roomunkid]) roomopt[m.roomunkid] = [m];
				else roomopt[m.roomunkid].push(m);
			});
			return(roomopt);
		},
	fun_templateleft : function(objData)
		{
		try
		{
			var dataRoomopt = svGrid.fun_makeRoomoptArray();
			eALocalStorage.setItem("'LS_StayViewData_HKS'",null);
			var objData = {OPCODE : 'rtwrm'};
			var data = svGrid.fun_ajxdata(objData);
			//console.log(data);

			var hkstatus = {};
				jQuery.each(data.hkstatus, function(i, m) {
					if(!hkstatus[m.roomunkid]) hkstatus[m.roomunkid] = [m];
						else hkstatus[m.roomunkid].push(m);
			});


			//jQ164("#tplLeft").html(jQ164("#mLeft").tmpl(svGrid.fun_makeArray(objData))); // tmplcode
			var html_left='';
			var html_roomtype='';
			jQuery("#tplLeft").html('');

			//console.log(svGrid.fun_makeArray(objData));
			jQuery.each(svGrid.fun_makeArray(objData), function(i, m) {

				html_roomtype += "<input type='checkbox' class='chk_roomtype' value='"+m[0]['roomtypeunkid']+"' /><label>"+m[0]['roomtype']+"</label>";
					for (var i=0;i<m.length;i++)
					{
					var srt = jQuery('<span/>',{className:'roomtype',text:m[0]['roomtype']});
					if (repTitle != 0)
					{
						if(i%repTitle==0)
								{
								jQuery("#tplLeft").append(srt);
								}
					}
					else if (i==0)
					{
						jQuery("#tplLeft").append(srt);
					}
						var ltclass = (i%2 == 0) ? 't1' : 't2';
						var swc = jQuery('<span/>',{className:'wrap_container'});
						var swc_t = jQuery('<span/>',{className:'sidetitle '+ ltclass,id:'op_'+m[i]['roomunkid'],html:"<span>"+m[i]['name']+"</span>"}).appendTo(swc);
						var opt= jQuery('<span/>',{className:'op_outer'}).appendTo(swc_t);

						//console.log(m[i]['smokingstatus']+"|"+m[i]['roomunkid']);

						if (m[i]['smokingstatus'] != null)
						{
							var smoking = (m[i]['smokingstatus'] == "SMOKING") ? 'smoking' : 'non-smoking';
							var smokstatus = (m[i]['smokingstatus'] == "SMOKING") ? "Smoking" : "Non Smoking";
							jQuery('<a/>',{className:smoking,title:smokstatus,id:'smoking '}).appendTo(opt);

							 if (hkstatus[m[i]['roomunkid']][0]['name'] != null)
							{
						 	jQuery('<a/>',{className:'hkstatus',title:'Room Status:'+hkstatus[m[i]['roomunkid']][0]['name']}).appendTo(opt);
							}
						}
						if(dataRoomopt[m[i]['roomunkid']] != undefined)
							{

							/*if(dataRoomopt[m[i]["roomunkid"]][0]["skstatusname"]!='')
							{
							if(opt.children('.hkstatus').length == 0 )
								jQuery('<a/>',{className:'hkstatus',title:'Room Status:'+dataRoomopt[m[i]["roomunkid"]][0]["skstatusname"]}).appendTo(opt);
							}*/

							if(dataRoomopt[m[i]["roomunkid"]][0]["taskstatus"]!=0)
								{
								jQuery('<a/>',{className:'task',title:"Task",onClick:"tranmenupopup('"+dataRoomopt[m[i]["roomunkid"]][0]["status"]+"','"+dataRoomopt[m[i]["roomunkid"]][0]["tranunkid"]+"','',4)"}).appendTo(opt);
								}

							if(dataRoomopt[m[i]["roomunkid"]][0]["messagestatus"]!=0)
								{
								jQuery('<a/>',{className:'message',title:"Message",onClick:"tranmenupopup('"+dataRoomopt[m[i]["roomunkid"]][0]["status"]+"','"+dataRoomopt[m[i]["roomunkid"]][0]["tranunkid"]+"','',3)"}).appendTo(opt);
								}
							if(dataRoomopt[m[i]["roomunkid"]][0]["tranunkid"]!= null && dataRoomopt[m[i]["roomunkid"]][0]["statusunkid"]!= 2 && dataRoomopt[m[i]["roomunkid"]][0]["statusunkid"] != 8 && dataRoomopt[m[i]["roomunkid"]][0]["statusunkid"]!= 12)
								{
								jQuery('<a/>',{className:'currentroom ',title:"Current Room",onClick:"tranmenupopup('"+dataRoomopt[m[i]["roomunkid"]][0]["statusunkid"]+"','"+dataRoomopt[m[i]["roomunkid"]][0]["tranunkid"]+"','',1)"}).appendTo(opt);
								}

							}
						jQuery("#tplLeft").append(swc);
					}
			});
			bindHkstatus();
			if(jQuery(".chk_roomtype").length == 0)
					jQuery("#rmt").html(html_roomtype);

			return;
		}
		catch(e)
		{
		alert("fun_templateleft "+e);
		}
		},

	fun_templateright : function(objData)
		{
		try
		{
			var objData = {
				OPCODE : 'rtwrm',
				LS	   :	1
				};
				if(jQuery("#conRight").length&&false)
				{
				var markup ="<span id='conRight' style='position:absolute'>";
				}
				else
				{
				var markup ="<span id='conRight'>";
				}
		var List = svGrid.fun_makeArray(objData);
		var dtp_validDate = validDate(jQuery.trim(jQuery("input[id$='dtpStartDate']").val()),svGrid.dateFormate);
		var w=svGrid.gW/svGrid.displayday;

		// markup is used to assigned in jq146 template.
		 for(i in List)
		 	{
			markup_0 = "<ol class='roomtype_unc' id='rt_"+i+"'>";
			for(j=0; j<svGrid.displayday;j++)
				{
				//console.log(2);
				var nextDate = new Date(dtp_validDate.getTime());
				nextDate.setDate(nextDate.getDate()+j);//var msecsInADay = 86400000;
				nextDate = daylightSavingAdjust(nextDate,2);

				var objdateid = datepart(nextDate);
				var tclass = (j%2 == 0) ? '_a' : '_b';
			//	markup += "<li class='totalbooking"+tclass+" "+objdateid.y+"_"+objdateid.m+"_"+objdateid.d+"' style='width:"+w+"px'>0</li>";
				markup_0 += "\n<li rel="+j+" class='totalbooking"+tclass+"' style='width:"+w+"px'>0</li>";
				}
			markup_0 += "\n</ol>";
			//markup += markup_0;
			var Lcnt = List[i].length;


			for(k=0;k<Lcnt;k++)
				{
					if (repTitle != 0)
					{
						if(k%repTitle==0)
								{
								markup += markup_0;
								}
					}
					else if (k==0)
					{
						markup += markup_0;
					}

					var trclass = (k%2 == 0) ? ' r1' : ' r2';
					markup += "\n\n<div  id='rm_"+List[i][k].roomunkid+"' class='roomday"+trclass+"'><ol class='ui-selectable'>";
					for(cnt=1,j=0; j<svGrid.displayday; j++,cnt+=2)
					{
					//console.log(3);
					var nextDate = new Date(dtp_validDate.getTime());
					nextDate.setDate(nextDate.getDate()+j);//var msecsInADay = 86400000;
					nextDate = daylightSavingAdjust(nextDate,3);
					var objdateid = datepart(nextDate);
					var tclass = (j%2 == 0) ? '_b ' : '_a ';
					var st ='width:'+(w/2)+'px';

					markup += "\n<li class='ui-selectee "+tclass+objdateid.y+"_"+objdateid.m+"_"+objdateid.d+"' style="+st+" id='"+j+"_"+List[i][k].roomunkid+"_"+List[i][k].roomtypeunkid+"_a' rel='"+cnt+"' title=''></li>";
					markup += "\n<li class='ui-selectee rline "+tclass+objdateid.y+"_"+objdateid.m+"_"+objdateid.d+"' style="+st+" id='"+j+"_"+List[i][k].roomunkid+"_"+List[i][k].roomtypeunkid+"_b' rel='"+(cnt+1)+"' title=''></li>";
					}
					markup += "\n</ol></div>";
				}
			}
			markup += "</span>";
			//jQ164.template( "svTemplate", markup ); // tmpl code
 			//jQ164( "#tplRight" ).html(jQ164.tmpl( "svTemplate", List )) ; // tmplcode
                        
		  	jQuery("#tplRight").html(markup);
jQuery("#buf123").val(jQuery("#grid").html());
            return;
		  }
		  catch(e)
		  {
		  alert("fun_templateright "+e);
		  }
		},

	fun_svTrandata : function(Tran)
		{
			var blink = false;
			if (Tran != '')
			{
				vTran= Tran;
				blink = true;
			}
			else
			{
				if(eALocalStorage.getItemObject("'LS_StayViewData_BKG'")!=null)
				{
					vTran = eval(eALocalStorage.getItemObject("'LS_StayViewData_BKG'"));
				}
				else
				{
					var objData = {OPCODE : 'rtwrm'};
					var tdata = svGrid.fun_ajxdata(objData);
					vTran = eval(eALocalStorage.getItemObject("'LS_StayViewData_BKG'"));
				}
			}
			if(vTran.length == 0){ console.log('return'); return;}
			jQuery.each(vTran, function(i, m) {

				vTrandata = eval(vTran[i]);

				A=[];A.push(vTrandata[0]);
				B=[];k=i;k=[];t=0;
				for(j=0;j<vTrandata.length;j++)
				{
				var vTransaction = vTrandata[j].split( "|" );

				 if(j < vTrandata.length-1)
				   {
					var vNTransaction = vTrandata[(j+1)].split( "|" );
					var next_rentdate = vNTransaction[2]
					var cur_rentdate = vTransaction [2];

					var cur_next_rentdate = validDate(vTransaction [2],'Y-m-d');
					//console.log(4);
					var ndate = new Date(cur_next_rentdate.getTime());
					ndate.setDate(ndate.getDate()+1);//var msecsInADay = 86400000;
					ndate = daylightSavingAdjust(ndate,4);
					ndate = ndate.format('yy-mm-dd');

					if (next_rentdate ==  ndate && t==0 )
						{
						t=0;
						/*var nkvalue = vTrandata[j+1].split( "|" );
						nkvalue.splice(8,1,next_rentdate);
						console.log(nkvalue);*/
						A.push(vTrandata[j+1]);
						}
					if (next_rentdate !=  ndate )
						{
						if(A.length != 0)
						{
						k.push(A);A=[];t=0;
						}
						else{t=1;}
						A.push(vTrandata[j+1]);
						}
					}
				}
			   k.push(A);A=[];

			jQuery.each(k, function(p, q) {
			cell_length =0;
            for(j=0;j<k[p].length;j++)
	        {
                vTransaction = k[p][j].split( "|" );
				if(vTransaction[2] > vTransaction[7]){tL=2;}
				else if (vTransaction[0] == 'checkin' ||  vTransaction[0] == 'checkout' ||  vTransaction[0] == 'onedaycheckout' ||  vTransaction[0] == 'roomchange' || vTransaction[0] == 'stayover'){tL=1;}else if (vTransaction[0] == 'block'){tL=2;	}
				cell_length = eval(cell_length+tL);
              }

			cell_length = (cell_length != 1) ? cell_length-1 : cell_length;

			k[p][0] = k[p][0].toString().replace(/,/g, ""); //Manali - 1.0.37.42 - 22 Nov 2013, Purpose : Fixed bug - If ,(comma) added in room name then in resize transaction, amend stay wrong parameters are counting from statyview.

			FTransaction = k[p][0].split( "|" );
			LTransaction = ( k[p][eval(k[p].length)-1]).split( "|" );
			FTransaction .splice(8,1,LTransaction[2]); // Replace departure date to last rentaldate.

			divLength=cell_length;
			rentaldate = validDate(FTransaction[2],'Y-m-d');
			var p = svGrid.fun_getPosition(rentaldate,'');
			rel_a =jQuery("#"+p+"_"+FTransaction[12]+"_"+FTransaction[13]+"_a").attr('rel');
			rel_b =jQuery("#"+p+"_"+FTransaction[12]+"_"+FTransaction[13]+"_b").attr('rel');
			tWidth=0;lPosition ='';ispoint =1;gWidth=0;vZindex=55;
			cWidth=(svGrid.gW/svGrid.displayday)/2;cLeft=0;
			var adjWidth = (svGrid.gW/displayday)/2;

			if (FTransaction[0] == 'checkout')
				{
					//console.log(1+'|'+FTransaction[5]+'|'+rentaldate);
					ispoint =2;
					tWidth=cWidth;
					gWidth=cWidth-7;
					lPosition = cLeft + ((rel_a-1)*cWidth);
				}
				else if (FTransaction[0] == 'onedaycheckout')
				{
					//console.log(2);
					vZindex=vZindex-1;
					tWidth=cWidth;
					gWidth=cWidth-7;
					lPosition = cLeft + ((rel_b-1)*cWidth);
				}
				else if (FTransaction[0] == 'stayover')
				{
					//console.log(3+'|'+FTransaction[5]+'|'+rentaldate);
					if (LTransaction[0] == "stayover")
					{
						//console.log(3.1);
						ispoint =0;
						divLength = (divLength == 1 )? 1 : divLength;
						tWidth=cWidth*(divLength+1);
						gWidth=tWidth-adjWidth;
						lPosition = cLeft + ((rel_a-1)*cWidth);
						vZindex=vZindex+1;
					}
					else
					{
						//console.log(3.2);
						ispoint =2;
						divLength = (divLength == 1 )? 1 : divLength-1;
						//tWidth=gWidth=cWidth*(divLength)+adjWidth;
						tWidth=cWidth*(divLength)+adjWidth;
						gWidth=cWidth*(divLength)+adjWidth-7;
						lPosition = cLeft + ((rel_a-1)*cWidth);
					}
				}
				else if (FTransaction[0] == 'roomchange')
				{
					//console.log(4+'|'+rentaldate);
					ispoint =2;
					divLength = (divLength == 1 )? 1 : divLength-1;
					gWidth=tWidth=cWidth*(divLength+1)+adjWidth;
					lPosition = cLeft + ((rel_a-1)*cWidth);
					vZindex=vZindex+1;

					if (LTransaction[0] == "stayover")
					{
						//console.log(4.1);
					ispoint =0;
					gWidth=tWidth=cWidth*(divLength+2)+adjWidth;
					}
					if (LTransaction[0] == "roomchange")
					{
						//console.log(4.2);
						ispoint =0;
						gWidth=tWidth=cWidth*(divLength)+adjWidth;
					}
				}
				else if(FTransaction[2] > FTransaction[7])
				{
					//console.log(5);
					if (LTransaction[0] == "stayover")
					{
						//console.log(5.1);
						ispoint =0;
						divLength = (divLength == 1 )? 1 : divLength-1;
						tWidth=gWidth=cWidth*(divLength+2);
						lPosition = cLeft + ((rel_a-1)*cWidth);
					}
					else if (FTransaction[0] == "checkin")
					{
						//console.log(5.2);
						ispoint =2;
						divLength = (divLength == 1 )? 1 : divLength-1;
						tWidth=gWidth=cWidth*(divLength+1);
						lPosition = cLeft + (rel_a-1);
					}
					else
					{
						//console.log(5.3);
					tWidth=gWidth=(cWidth*(divLength-1));
					lPosition = cLeft + (rel_a-1);
					}
				}
				else if (FTransaction[0] == 'checkin')
				{
					//console.log(FTransaction[5]+' | 6 |'+FTransaction[21]+'|'+FTransaction[22]);
					if (LTransaction[0] == "stayover")
					{
						//console.log('6.1'+'|'+divLength+'|'+cWidth+'|'+cLeft+'|'+rentaldate);
						//ispoint =0;
						//ispoint =1;

						ispoint =3;
						divLength = (divLength == 1 )? 1 : divLength-1;
						tWidth=gWidth=cWidth*(divLength+2);
						lPosition = cLeft + ((rel_b-1)*cWidth);

						//console.log('6.1'+'|'+tWidth+'|'+lPosition);
					}
					else if (LTransaction[0] == "checkin")
					{
						//console.log("6.2" +"|"+ vTrandata.length);
						ispoint =0;
						tWidth=gWidth=cWidth*(divLength);
						lPosition = cLeft + ((rel_b-1)*cWidth);
						gWidth = tWidth-adjWidth;

						if(vTrandata.length >= 1) //Manali - 1.0.37.42 - 23 Nov 2013, Purpose : Initially when adavance room move was not developed here it was if(vTrandata.length == 1) condition
						{
						//console.log(6.4);
						ispoint =3;
						}
					}

				else
					{
						//console.log(7);
						divLength = (divLength == 1 )? 1 : divLength-1;
						tWidth=cWidth*(divLength)+adjWidth;
						gWidth=cWidth*(divLength)+adjWidth-7;
						lPosition = cLeft + ((rel_b-1)*cWidth);

					}
				}
				else if (FTransaction[0] == 'block')
				{
					ispoint =0;
					if (divLength == 1 ){tWidth=cWidth*((divLength+2)-1);}
					else {tWidth=cWidth*((divLength-1)+2);}
					gWidth = tWidth-adjWidth;
					lPosition = cLeft + ((rel_a-1)*cWidth);
				}

//				console.log(FTransaction[3]);
				cellDiv = jQuery('<div/>',{className:'tran_cells'});
				cellDiv.attr('id',"_"+FTransaction[4]+"_"+FTransaction[5]);
				cellDiv.css({'background':hasTorgba(FTransaction[3]),left:lPosition+'px',width:(tWidth)+'px','z-index':vZindex,display:'block'});
				<!-- Manali - 1.0.34.39 - 30 May 2013 - START -->
				<!-- Purpose : Enhancement - Group leader indication -->
				if(FTransaction[14]==1)
					var displaygroupleader = 'display:;margin-bottom: -1.2px;';
				else
					var displaygroupleader = 'display:none';

				<!-- Manali - 1.0.36.41 - 07 Aug 2013 - START -->
				<!-- Purpose : Enhancement - Group Transaction Indication by adding group color-->
				if(FTransaction[20]!='' && FTransaction[20]!="0")
					var displaygroupcolor = 'display:inline-block;color:'+FTransaction[20]+';margin: 5px 3px;';
				else
					var displaygroupcolor = 'display:none;';

				cellDiv.html("<div class='g_name newrightmenu' id='"+FTransaction[4]+","+FTransaction[5]+"' style='width:"+(0>(gWidth-10)?0:(gWidth-10))+"px;'><span class='groupcolor' style='"+displaygroupcolor+"' title='Group'/><span class='groupleader' style='"+displaygroupleader+"' title='Group Leader'></span> "+FTransaction[9]+"<span class='hidden' id='"+FTransaction[4]+"_"+FTransaction[5]+"'>"+FTransaction.toString().replace(/,/g, "|") +"</span></div><span class='pttp' title='More Information'><span class='ttp'></span></span>");

				<!-- Manali - 1.0.36.41 - 07 Aug 2013 - END -->

				<!-- Manali - 1.0.34.39 - 30 May 2013 - ENd -->
				cellDiv.attr('title',"სხვა ოპციებისათვის დააკლიკეთ მარჯვენა ღილაკს");
				if(ispoint == 1){cellDiv.addClass('gradius');	}
				if(ispoint == 2){cellDiv.addClass('gradiusR');}
				if(ispoint == 3){cellDiv.addClass('gradiusL');}
				if(ispoint == 4){cellDiv.removeClass('gradius');}//Manali - 1.0.37.42 - 18 Oct 2013,Purpose : Part Of Advance Room Move

				jQuery("#rm_"+FTransaction[12]).append(cellDiv);

        }); // each (p,1)

		}); // each (i,m)

			//console.log(jQuery('#_'+FTransaction[4]+'_'+FTransaction[5]+' .pttp'));
			jQuery('#_'+FTransaction[4]+'_'+FTransaction[5]+' .pttp').eZeeTooltip({delay:600});
			active_hover();
		},
		fun_holidayList : function() // Shweta -  1.0.39.44 - Holiday List
		{
			cwidth = svGrid.gW/svGrid.displayday;
			jQuery("#datetable li.holinm").each(function() {
						var t= jQuery('#conRight').offset();
						var t1 = jQuery(this).offset();
						var v = t1.left-t.left;
						col = Math.floor(v/cwidth);
						var col1 = col * 2;
						color = hasTorgba(jQuery(this).attr('color'));
						jQuery(".ui-selectable").find("li:eq("+col1+")").css('background',color).next().css('background',color);

			});

		},

		fun_getPosition : function(rentaldate,pos) // rentaldate should be valid date
		{

			fromdate = validDate(jQuery.trim(jQuery("input[id$='dtpStartDate']").val()),svGrid.dateFormate);


			if(rentaldate !='')
			{
				var dstDiff = fromdate.getTimezoneOffset() - rentaldate.getTimezoneOffset();
				var dstDiffMs = dstDiff * 60 * 1000;
				var diff = rentaldate.getTime() - fromdate.getTime() + dstDiffMs;
				var days = diff / 86400000;

				return (Math.abs(parseInt(days)));
			}
			else if (pos !='')
			{
				//console.log(5);
				var nextDate = new Date(fromdate.getTime());
				nextDate.setDate(nextDate.getDate()+pos);//var msecsInADay = 86400000;
				nextDate = daylightSavingAdjust(nextDate,5);
				return (nextDate);
			}

		},
		fun_createAlist : function()
		{
			data = svGrid.fun_ajxdata();

			if (jQuery("#vmenu").length == 0)
			{
			var vmenu= jQuery('<ul/>',{id:'vmenu'});
			vmenu.css({width:"100%",overflow:"hidden"});
			vmenu.appendTo(jQuery("span[id$='LeftRepeater_Container']"));
			data['alist'].sort(sort_by("GName", false, function(a){return ((a == null)?0 :a.toUpperCase());}));
			fun_create_arrivalList(data["alist"])
			}
			return;
		},
		fun_svFooter : function ()
		{
		data = svGrid.fun_ajxdata();
			if(jQuery(".l_status").length != 0)
			{
			return;
			}
			for(var stCnt=0;stCnt<data['status'].length;stCnt++)
			{

				if (data['status'][stCnt]["statusunkid"] != 13 && data['status'][stCnt]["statusunkid"] != 10)
				{
				var aSpan = jQuery('<span/>',{className:'l_status',onClick:"blink_room('"+data["status"][stCnt]["status"]+"')"});
				jQuery('<span/>',{className:'legend_status',style:'background:'+data['status'][stCnt]["statuscolor"]}).appendTo(aSpan);
				jQuery(aSpan).append(data['status'][stCnt]["displaystatus"]);
				jQuery('#svfooter').append(aSpan);
				}
			}
		},
		fun_svOccupancy : function()
		{
		var objData = {OPCODE : 'rtwrm'	};
		data = svGrid.fun_ajxdata(objData);
		var totalRooms =data['rooms'].length;
		var dtStart =  validDate(jQuery.trim(jQuery("input[id$='dtpStartDate']").val()),svGrid.dateFormate);
		//console.log(6);
		var dtpEnd = new Date(dtStart.getTime());
		dtpEnd.setDate(dtpEnd.getDate()+displayday);//var msecsInADay = 86400000;
		dtpEnd = daylightSavingAdjust(dtpEnd,6); // Shweta - 25March 2014 - dtpEnd var not in used for occupancy calculation.

			var  availableroom  =0;
			var occupancy = 0;

			jQuery("#roomavailable ul").remove();
			jQuery("#occupancy ul").remove();

			if (jQuery("#roomavailable li").length == 0 )
			{
			var room_ul = jQuery('<ul/>',{style:'padding:0;width:'+svGrid.gW+'px'});
			var occupancy_ul = jQuery('<ul/>',{style:'padding:0;width:'+svGrid.gW+'px'});

			for(var j=0; j<displayday;j++)
				{
					var aSpan = jQuery('<li/>',{className:'day_s',width:(svGrid.gW/displayday),rel:j,id:"roomul_"+j});
					aSpan.append(jQuery('<span/>',{text:totalRooms,className:'rv'}));
					//aSpan.append(jQuery('<span/>',{style:'border-left:1px dotted #C3C3C3;float:right;height:11px;'}));
					room_ul.append(aSpan);


					var aSpan = jQuery('<li/>',{className:'day_s',width:(svGrid.gW/displayday),rel:j,id:"occul_"+j});
					aSpan.append(jQuery('<span/>',{text:0,className:'ov'}));
					//aSpan.append(jQuery('<span/>',{style:'border-left:1px dotted #C3C3C3;float:right;height:11px;'}));
					occupancy_ul.append(aSpan);
				}
				//console.log(room_ul);
				jQuery('#roomavailable').append(room_ul);
				jQuery('#occupancy').append(occupancy_ul);
			}
			else
			{
			jQuery('#roomavailable li span.rv').text(totalRooms);
			jQuery('#occupancy li span.ov').text(0);
			}

			for (var j=0;j<data['occupancy'].length;j++)
				{



				var p = svGrid.fun_getPosition(validDate(data['occupancy'][j]['RentalDate'],"yy-m-d"),'');

					jQuery("#roomavailable li").each(function(){


						if(jQuery(this).attr('rel') == p)
						{

						tmpid = jQuery(this).attr('id');
						jQuery("#"+tmpid+ " .rv").text(eval(jQuery(this).text()) - data['occupancy'][j]['ReservedRooms']);


						}
					});
				/*	jQuery("#occupancy li").each(function(){
								if(jQuery(this).attr('rel') == p)
								{
								occupancy = ((data['occupancy'][j]['ReservedRooms']-data['occupancy'][j]['blockRooms'])*100/totalRooms);
								occupancy = Math.round(occupancy);
								tmpid = jQuery(this).attr('id');
								jQuery("#"+tmpid+ " .ov").text(occupancy);
								}
					});*/
				}
			fun_OccupancyList(); // Shweta -  1.0.40.45 - 21st April 2014 - for correct the calculation of occupancy data same as Monthly Statastics Report
		},

		fun_unassignrooms:function (objData)
		{
			if (objData == undefined)
			{
			var objData = {OPCODE : 'rtwrm'	};
			data = svGrid.fun_ajxdata(objData);
			}
			else
			{
			data = getUnAssignedroom(objData);
			}



			// HRK - always clear all unassigned count
			jQuery(".roomtype_unc li").text(0);

			/*if(data.unassigned.length == 0)
			{
				jQuery(".roomtype_unc li").text(0);
			}*/

		var categories = {};
			jQuery.each(data.unassigned, function(i, m) {
			if(!categories[m.roomtypeunkid]) categories[m.roomtypeunkid] = [m];
				else categories[m.roomtypeunkid].push(m);
		});

		jQuery.each(categories, function(k, v) {
			jQuery("#rt_"+k+" li").text(0);
				for(var j=0;j<categories[k].length;j++)
					{
					var p = svGrid.fun_getPosition(validDate(categories[k][j]['rentaldate'],"yy-m-d"),'');

					jQuery("#rt_"+k+" li").each(function(){
							if (p == jQuery(this).attr('rel'))
								{
								jQuery(this).text(categories[k][j]['rcount']);
								}
						});
					}
			});
		},
};

function addRemovefrom_arrivalList(status,tranunkid,opt)
{
try
	{
		console.log("addRemovefrom_arrivalList"+status+" , "+tranunkid+" , "+opt);
		var objData = {OPCODE : 'rtwrm'	};
		ajxdata = svGrid.fun_ajxdata(objData);

		if (opt == undefined)
			{
			return;
			}
		else if (opt=="CheckOut")
				{
				jQuery("#list_"+status+"_"+tranunkid).html('');
				jQuery("#list_"+status+"_"+tranunkid).remove();
				}
		var value = jQuery("#"+status+"_"+tranunkid).html();
		dstatus = value.split("|")[4];
		var matchTdata = getMatch(value.split("|")[6],ajxdata['status'],"statusunkid");

		if(matchTdata!=undefined)
			displaystatus= matchTdata["displaystatus"];

		var	obj =jQuery("#list_"+status+'_'+tranunkid);
		obj.attr('id',"list_"+dstatus+"_"+tranunkid);

		var	iobj =obj.children().attr("id",dstatus+"_"+tranunkid);
		var trow = getMatch(value.split("|")[13],ajxdata['rooms'],"roomtypeunkid");
		roomType=trow['shortcode'];

		jQuery("#"+dstatus+"_"+tranunkid+" .room_no").html(value.split("|")[1]+" - "+roomType);
		var hidden =  jQuery('<span/>',{className:'hidden',text:value,id:dstatus+"_"+tranunkid});
		jQuery("#list_"+dstatus+"_"+tranunkid+" .guest_name").append(hidden);
		iobj.attr('id',dstatus+","+tranunkid);
	}
catch(e)
	{
	alert("addRemovefrom_arrivalList >> "+e);
	}
}
var tmp;
function addRemoveTransaction(status,tranunkid,isShow,isaList,opt)
{
	try
	{
		var OP=0;
		var NP=0;
		var objData = {OPCODE : 'rtwrm'	};
		ajxdata = svGrid.fun_ajxdata(objData);
		console.log ("addRemoveTransaction >> status:"+status+" tranunkid: "+tranunkid +"isShow: "+isShow+" isaList: "+isaList+"opt:"+opt);
		if(opt == "amendStay" || opt=="Cancel" || opt=="Void" || opt=="noshow" || opt=="block" || opt=="assignroom" || opt=='IsPhysicallyMoved')
		{
			eALocalStorage.setItem("'LS_StayViewData_OCC'",null);
			svGrid.fun_svOccupancy();
		}

		if (status.length <= 2)
		{
		 	var trow = getMatch(status,ajxdata['status'],"statusunkid");
			statusid = status;
			status=trow['status'];
		}
		else
		{
			if (isShow == true)
			{
				var matchTdata = getMatch(status,ajxdata['status'],"status");
				statusid = matchTdata["statusunkid"];
			}
		}
		<!-- Jignesh - 1.0.22.27 - 20 Oct 2011 - START -->
		<!-- Purpose : Transaction is not removed if amend stay is out of date range.-->
		<!-- Desc :  Added opt == "amendStay" -->

		//console.log(status+"_"+tranunkid);
		//console.log(jQuery("#"+status+"_"+tranunkid).html());
		old_hidden_value = jQuery("#"+status+"_"+tranunkid).html();

		//HRK
		if(!jQuery("#"+status+"_"+tranunkid).length && opt !="Walkin" )
		{
			console.log("intended transaction not exists on stayview or left panel : "+("#"+status+"_"+tranunkid));
			return;
		}

		if(opt == "noshow" || opt == "block" || opt == "amendStay" || opt == "IsPhysicallyMoved" || opt=="moveRoom")
		{
			var arrival = (old_hidden_value.split("|")[7]).split(" ")[0];
			var departure = (old_hidden_value.split("|")[8]).split(" ")[0];

			if( (jQuery("#_"+status+'_'+tranunkid).css('left') == (svGrid.gW/displayday/2)+"px") || (arrival == jQuery("input[id$='txtHiddenDate']").val() || departure == jQuery("input[id$='txtHiddenDate']").val() || (arrival < jQuery("input[id$='txtHiddenDate']").val() && jQuery("input[id$='txtHiddenDate']").val() < departure ) ) )
			{
				OP=1;
			}

			jQuery("#list_"+status+'_'+tranunkid+" #"+status+'_'+tranunkid).remove();
			jQuery("#_"+status+'_'+tranunkid).remove();
			//alert("789");
		}

		if(opt == "amendStay" && old_hidden_value.split("|")[12]==0)
		{
			refresh_aList("GName");
			return;
		}
	<!-- Jignesh - 1.0.22.27 - 12 Nov 2011 - START -->
	<!-- Purpose : Unassign room transaction not updating room available.-->
	    if(opt=="assignroom")
			svGrid.fun_unassignrooms(old_hidden_value.split("|")[13]);
	<!-- Jignesh - 1.0.22.27 - 12 Nov 2011 - END -->

		if(opt == "StopRoomMove" || opt == "UndoStopRoomMove")
			refresh_aList("GName");

		if (isShow == true )
		{
			jQuery.ajax({
				async: false,
				data: {
						opcode: "getTran",
						sdate:jQuery("input[id$='dtpStartDate']").val(),
						statusid:statusid,
						tranid:tranunkid,
						n:displayday
						},
				url: 'json/webfront.jsp',
				success: function(data)
				{
					operation=data;
				}
			});

			var Tdata = jQuery.parseJSON(operation);

			//Manali - 1.0.37.42 - 22 Oct 2013 - START
			//Purpose : Status added
			if(opt!='Walkin')
			{
				changed_status = old_hidden_value.split("|")[4];
				//alert(opt+"|"+changed_status);
				if(opt=="CheckIn" || opt=="UndoCheckIn" || opt=="CheckOut" || opt=="amendStay" || opt=="moveRoom") //Manali - 1.0.37.42 - 22 Nov 2013, Purpose : Part Of Advance Room Move
					if(opt=="moveRoom")
						status = changed_status;
					//Manali - 1.0.37.42 - 22 Nov 2013 - END
				{
					for(var key in Tdata['booking']) {
						changed_status = key.split("_")[4];
					}
				}
			}
			//alert(changed_status);
			//Manali - 1.0.37.42 - 22 Oct 2013 - END

			tmp = Tdata;
			if (Tdata['booking'].length == 0)
			{
				console.log("booking.return");
				refresh_aList('GName');

				if(opt=='moveRoom')
				{
					jQuery("#_"+status+'_'+tranunkid+'.tran_cells').remove();
				}

				return;
			}
			jQuery("#list_"+status+'_'+tranunkid+" #"+status+'_'+tranunkid).remove();
			if (opt=="moveRoom" && Tdata['booking'].length>0)
			{
				p_id = jQuery("#_"+status+'_'+tranunkid).parent().attr('id');
				p_id = p_id.split("_")[1];
				//console.log("1.1 : "+opt +" -- "+p_id);
				var objOpt= jQuery("#op_"+p_id+" .op_outer");
				var lnksmoking = jQuery("#op_"+p_id+" .op_outer .smoking");
				var lnknosmoking = jQuery("#op_"+p_id+" .op_outer .non-smoking");
				var lnkhkstatus = jQuery("#op_"+p_id+" .op_outer .hkstatus");
				objOpt.html('');
				lnksmoking.appendTo(objOpt);
				lnknosmoking.appendTo(objOpt);
				lnkhkstatus.appendTo(objOpt);

				//Manali - 1.0.37.42 - 11 Dec 2013 - START
				//Purpose : If reservation is out of stayview visible dates(7days,15 days,30 days), then transaction was not getting removed
				/*if(opt=="moveRoom")
					jQuery("#_"+status+'_'+tranunkid+'.tran_cells').remove();*/
				//Manali - 1.0.37.42 - 11 Dec 2013 - END

				if(lnkhkstatus.length)
					lnkhkstatus.appendTo(objOpt);
				else if (status != "CONFRESERV" && status != "DAYUSERESERV")
				{
					//console.log(old_hidden_value.split("|")[12]);
					var roomhkunit = getRoomHkunit(old_hidden_value.split("|")[12]);
					//console.log(roomhkunit);
					jQuery('<a/>',{className:'hkstatus',title:"Room Status:"+roomhkunit['roomopt'][0]['name']}).appendTo(objOpt);
				}
			}
			//Jignesh - 1.0.22.28 - 2 Nov 2011 - START
			// Purpose - arrival list not getting change on checkout
			else if (opt=="CheckOut")
			{
				addRemovefrom_arrivalList(status,tranunkid,opt);
				reload_roomOperation(tranunkid);
			}
			//Jignesh - 1.0.22.28 - 2 Nov 2011 - START
			if (opt !="Cancel" || opt!="Void" || opt!="noshow")
				jQuery("#_"+status+'_'+tranunkid+'.tran_cells').remove();

			svGrid.fun_svTrandata(Tdata["booking"]);

		if (opt !="Walkin" && opt !="assignroom" && opt !="moveRoom" && opt !="Edit")
		{
			key1="_"+tranunkid+"_"+ old_hidden_value.split("|")[12]+"_"+ old_hidden_value.split("|")[13]+"_"+changed_status; 	//Manali - 1.0.37.42 - 22 Oct 2013, Purpose : Status added

			console.log(key1);

			tdata = Tdata['booking'][key1][0];
			var arrival = tdata.split("|")[7];
			var departure = tdata.split("|")[8];

			if( (jQuery("#_"+status+'_'+tranunkid).css('left') == (svGrid.gW/displayday/2)+"px") || (arrival == jQuery("input[id$='txtHiddenDate']").val() || departure == jQuery("input[id$='txtHiddenDate']").val() ) )
					NP=1;
		}
		if (isaList == true)
			{
				if(opt=="CheckIn" || opt=="UndoCheckIn")
				{
				key="_"+tranunkid+"_"+ old_hidden_value.split("|")[12]+"_"+ old_hidden_value.split("|")[13]+"_"+changed_status; //Manali - 1.0.37.42 - 22 Oct 2013, Purpose : Status added
				value = Tdata['booking'][key][0];
				var statusObj=jQuery("#list_"+status+"_"+tranunkid+" .guest_status");
				var trow = getMatch(value.split("|")[6],ajxdata['status'],"statusunkid");

				dstatus=trow['displaystatus'];
				statusObj.html(dstatus);
				var hidden =  jQuery('<span/>',{className:'hidden',text:value,id:trow['status']+"_"+tranunkid});
				jQuery("#list_"+status+"_"+tranunkid+" .guest_name").append(hidden);

				jQuery("#list_"+status+"_"+tranunkid).attr('id',"list_"+trow['status']+"_"+tranunkid);
				jQuery("#list_"+trow['status']+"_"+tranunkid+" .vmenu").attr('id',trow['status']+","+tranunkid);
				jQuery("#"+status+"_"+tranunkid).attr('id',trow['status']+"_"+tranunkid);

				}
				else if (opt=="moveRoom" || opt=="assignroom" || opt=="Walkin" || opt=="Edit")
				{
					//Manali - 1.0.37.42 - 22 Nov 2013 - START
					//Purpose : Part Of Advance Room Move
					if(opt=="moveRoom" || opt=="Edit")  // Shweta - 1.0.38.43 - 06 jan 2013 for solve the issue related with js error
						status = changed_status;

					if(opt=="assignroom" || opt=="Walkin" || opt=="Edit")
					{
						addRemovefrom_arrivalList(status,tranunkid,opt);
						reload_roomOperation(tranunkid);
					}
					//Manali - 1.0.37.42 - 22 Nov 2013 - END
				}
				else if (opt=="Edit")
					refresh_aList('GName');
				else if (opt != "CheckOut")
					addRemovefrom_arrivalList(status,tranunkid);
			}
			else if (isaList == false)
				jQuery("#list_"+status+'_'+tranunkid).remove();

			if (opt=="amendStay")
			{
				key="_"+tranunkid+"_"+ old_hidden_value.split("|")[12]+"_"+ old_hidden_value.split("|")[13]+"_"+changed_status;//Manali - 1.0.37.42 - 22 Oct 2013, Purpose : Status added
				value = Tdata['booking'][key][0];
				if (OP == 1 && NP == 0) // old position != new positoin
				{
					jQuery("#op_"+old_hidden_value.split("|")[12]+" .op_outer .currentroom").remove();
					jQuery("#op_"+old_hidden_value.split("|")[12]+" .op_outer .message").remove();
					jQuery("#op_"+old_hidden_value.split("|")[12]+" .op_outer .task").remove();
				}
				if (OP != NP) // old position != new positoin
					reload_roomOperation(tranunkid);

				if ((OP == 1 && NP == 1) || (OP == 1 && NP == 0) || (OP == 0 && NP == 1))
					refresh_aList('GName');
				else
				{
					if(jQuery("#list_"+status+'_'+tranunkid).length)
						jQuery("#list_"+status+'_'+tranunkid).remove();
					var objOpt= jQuery("#op_"+value.split("|")[12]+" .op_outer");
					var lnksmoking = jQuery("#op_"+value.split("|")[12]+" .op_outer .smoking");
					var lnknosmoking = jQuery("#op_"+value.split("|")[12]+" .op_outer .non-smoking");
					var lnkhkstatus = jQuery("#op_"+value.split("|")[12]+" .op_outer .hkstatus");
					objOpt.html('');
					lnksmoking.appendTo(objOpt);
					lnknosmoking.appendTo(objOpt);
					lnkhkstatus.appendTo(objOpt);
				}
			}
		}

		if (opt=="Cancel" || opt=="Void" || opt=="noshow")
		{
			var p_id = old_hidden_value.split("|")[12];
			var objOpt= jQuery("#op_"+p_id+" .op_outer");
			var lnksmoking = jQuery("#op_"+p_id+" .op_outer .smoking");
			var lnknosmoking = jQuery("#op_"+p_id+" .op_outer .non-smoking");
			var lnkhkstatus = jQuery("#op_"+p_id+" .op_outer .hkstatus");
			objOpt.html('');
			lnksmoking.appendTo(objOpt);
			lnknosmoking.appendTo(objOpt);
			lnkhkstatus.appendTo(objOpt);

			jQuery("#_"+status+'_'+tranunkid+'.tran_cells').remove();
				if(jQuery("#list_"+status+'_'+tranunkid).length)
					jQuery("#list_"+status+'_'+tranunkid).remove();
				//hidejQloading();  //Manali - 1.0.27.32 - Purpose - Facing background issue while void reservation from nightaudit screen
				return;
		}

		jQuery(".vmenu").contextMenu({ menu: 'myMenu', leftButton: true },
				function(action, el, pos) {
				contextMenuWork(action, el, pos);
				});
		bindHkstatus();
		if(opt=="Cancel" || opt=="Void" || opt=="noshow"  || opt=="assignroom" || opt == "IsPhysicallyMoved" || opt=="moveRoom") //Manali - 1.0.37.42 - 03 Dec 2013,Purpose : Part Of Advance Room Move
			refresh_aList('GName');
		hidejQloading();
	}
	catch(e)
	{
		alert("stayview :: addRemoveTransaction "+e);
	}
}

var reload_roomOperation =function(tranid)
	{
	try
		{
			var optData = getRoomOperation(tranid);
			if(optData["roomopt"].length != 0)
			{
			fun_roomOperation(optData["roomopt"])
			}
			return;
		}
	catch(e)
		{
		alert("reload_roomOperation :"+e);
		}
	}


function fun_roomOperation(roomOperationData)
	{
	try
		{
			if(roomOperationData != null)
			{
			//tmp = roomOperationData;
			var tranunkid =roomOperationData[0]["tranunkid"];
			var status =roomOperationData[0]["status"];
			var tmpid = "#op_"+roomOperationData[0]['roomunkid']+" .op_outer";
			var objOpt= jQuery(tmpid);

			var lnksmoking = jQuery("#op_"+roomOperationData[0]['roomunkid']+" .op_outer .smoking");
			var lnknosmoking = jQuery("#op_"+roomOperationData[0]['roomunkid']+" .op_outer .non-smoking");
			var lnkhkstatus = jQuery("#op_"+roomOperationData[0]['roomunkid']+" .op_outer .hkstatus");

			objOpt.html('');
			lnksmoking.appendTo(objOpt);
			lnknosmoking.appendTo(objOpt);
			lnkhkstatus.appendTo(objOpt);

				if(roomOperationData[0]["messagestatus"] != 0)
				{
				jQuery('<a/>',{className:'message',title:"Message",onClick:"tranmenupopup('"+status+"','"+tranunkid+"','',3)"}).appendTo(objOpt);
				}

				if(roomOperationData[0]["taskstatus"] != 0)
				{
				jQuery('<a/>',{className:'task',title:"Task",onClick:"tranmenupopup('"+status+"','"+tranunkid+"','',4)"}).appendTo(objOpt);
				}

				var str=",2,8,12,";
				var sts = ","+roomOperationData["statusunkid"]+",";
				if(tranunkid != null && (str.indexOf(sts) == -1) )
				{
				jQuery('<a/>',{className:'currentroom',title:"Current Room",onClick:"tranmenupopup('"+status+"','"+tranunkid+"','',1)"}).appendTo(objOpt);
				}


			}
			return;
		}
	catch(e)
		{
		alert(e);
		}
	}
var getRoomOperation = function(tranid)
{
	try
	{
		var operation=0;
		jQuery.ajax({
				async: false,
				data: {
						opcode: "ropt",
						tranid:tranid
						},
				url: 'json/webfront.jsp',
				success: function(data)
				{
					operation=data;
				}
			});

			return jQuery.parseJSON(operation);
	}
	catch(e)
	{
		alert("styview :: getRoomOperation " + e);
	}
}


var traninfo=-1;
//Jignesh - 1.0.22.27 - 18 Oct 2011 - START
var walkinRowcount=0;
//Jignesh - 1.0.22.27 - 18 Oct 2011 - END

function loadgridfirsttime(reset)
	{
		try
		{

		if(reset == 1 && traninfo != -1)
			{
				showjQloading();
				var jsonTran = jQuery.parseJSON(traninfo);

				//alert(traninfo);

				//var arrivaldate = '';
				for (var r=0;r < walkinRowcount ;r++)
					{
						if(jsonTran["statusunkid"]!='10' && jsonTran[r]["roomunkid"] != -1)
						{
							addRemoveTransaction(jsonTran["statusunkid"],jsonTran[r]["tranunkid"],true,true,"Walkin");
						}
						else if (jsonTran[r]["roomunkid"] == -1)
						{
							svGrid.fun_unassignrooms(jsonTran[r]["roomtypeunkid"]);
							//arrivaldate = jsonTran["arrivaldatetime"].split(" ")[0];
						}
					}
				/*if("2014-04-17" == arrivaldate)
					{*/
						refresh_aList("GName");
				/*	}*/

						eALocalStorage.setItem("'LS_StayViewData_OCC'",null);
						svGrid.fun_svOccupancy();
						hidejQloading(100);
			}
			else
			{
			showjQloading();
			reloadGrid();
			hidejQloading(100);
			}
		}
		catch(e)
		{
		alert("Stayview :: loadgridfirsttime() >> "+ e);
		}
	}
function getUnAssignedroom(roomtyeunkid)
{
	try
	{
		jQuery.ajax({
				async: false,
				data: {
						opcode: "uart",
						sdate:jQuery("input[id$='dtpStartDate']").val(),
						roomtype:roomtyeunkid,
						n:displayday
						},
				url: 'json/webfront.jsp',
				success: function(data)
				{
					operation=data;
				}
			});

			return jQuery.parseJSON(operation);
	}
	catch(e)
	{
		alert("styview :: getUnAssignedroom " + e);
	}
}

function reload_hkstatus(roomunkid)
	{
	try
		{
			var roomhkunit = getRoomHkunit(roomunkid);

			if (roomhkunit['roomopt'].length > 0)
			{
				if(jQuery("#op_"+roomunkid+ " .hkstatus").length == 0)
				{
					jQuery('<a/>',{className:'hkstatus',title:"Room Status:"+roomhkunit['roomopt'][0]['name']}).appendTo(jQuery("#op_"+roomunkid+ " .op_outer"));
				}
				else
				{
					jQuery("#op_"+roomunkid+ " .hkstatus").attr('title',"Room Status:"+roomhkunit['roomopt'][0]['name']);
				}
			}
			//Manali - 1.0.31.36 - 15 Feb 2013 - START
			else
				jQuery("#op_"+roomunkid+ " .hkstatus").remove();
			//Manali - 1.0.31.36 - 15 Feb 2013 - END

		}
	catch(e)
		{
		alert("reload_hkstatus >> "+e);
		}
	}
	var tid='';
function reloadGrid(){
	//alert("1");
	/*repTitle=(eval(jQuery("#Tnumber").val())).floor();*/
	setTimeout("svCleartLocalStorate()",1);
	svGrid.fun_tplHeaderRight();
	svGrid.fun_templateleft();
	svGrid.fun_templateright();

 	/*svGrid.fun_unassignrooms();
	svGrid.fun_svTrandata('');
	svGrid.fun_svFooter();
	svGrid.fun_svOccupancy();
	svGrid.fun_createAlist(); */

	setTimeout("svGrid.fun_unassignrooms()",2);
	setTimeout("svGrid.fun_svTrandata('')",3);
	setTimeout("svGrid.fun_svFooter()",4);
	setTimeout("svGrid.fun_svOccupancy()",5);
	setTimeout("svGrid.fun_createAlist()",6);
	setTimeout("svGrid.fun_holidayList()",7); // Shweta - 1.0.39.44

	//setTimeout("jQuery('.pttp').eZeeTooltip({delay:600})",25);
	jQuery(".ui-selectable").selectable();
	jQuery(".ui-selectable").live('mousedown',function(){
	jQuery(".ui-selectable").selectable();
	});
}

jQuery(".daychange").click(function(){
//	showjQloading();
	jQuery('.daychange ,.today').removeClass('activeview');
	jQuery(this).addClass('activeview');
	eALocalStorage.setItem("'LS_StayViewData_BKG'",null);
	eALocalStorage.setItem("'LS_StayViewData_OCC'",null);
	eALocalStorage.setItem("'LS_StayViewData_UAR'",null);
	eALocalStorage.setItem("'LS_StayViewData_OPT'",null);
	svGrid.objSource.NDAY = svGrid.displayday = jQuery(this).attr('id');
	eALocalStorage.setItem("svGrid_displayday",jQuery(this).attr('id'));
	displayday = jQuery(this).attr('id');
	reloadGrid();setTimeout("jQuery('.pttp').eZeeTooltip({delay:600})",25);
//	hidejQloading();
});

function datechange()
	{
		jQuery(".ui-selectable li").css('background',''); // Shweta - 1.0.39.44 - for remove the color from li which is give intimation of holidays color

		eALocalStorage.setItem("'LS_StayViewData_BKG'",null);
		eALocalStorage.setItem("'LS_StayViewData_OCC'",null);
		eALocalStorage.setItem("'LS_StayViewData_UAR'",null);
		eALocalStorage.setItem("'LS_StayViewData_OPT'",null);
		svGrid.fun_tplHeaderRight();
		svGrid.fun_unassignrooms();
		svGrid.fun_svOccupancy();
		jQuery(".tran_cells").remove();
		svGrid.fun_svTrandata('');//jQuery('.pttp').eZeeTooltip({delay:600}); It was in comment - Shweta
		//Shweta - 1.0.37.42 - 14 Dec 2013 - START
		//Purpose: When date change from date picker at that time tool tip was not appear in some case.
		jQuery('.pttp').eZeeTooltip({delay:600});
		//Shweta - 1.0.37.42 - 14 Dec 2013 - END
		//hidejQloading();
		svGrid.fun_holidayList();
		return ;
	}
function svCleartLocalStorate()
	{
		eALocalStorage.setItem("'LS_StayViewData_RMS'",null);
		eALocalStorage.setItem("'LS_StayViewData_OPT'",null);
		eALocalStorage.setItem("'LS_StayViewData_STS'",null);
		eALocalStorage.setItem("'LS_StayViewData_OCC'",null);
		eALocalStorage.setItem("'LS_StayViewData_BKG'",null);
		eALocalStorage.setItem("'LS_StayViewData_UAR'",null);
		eALocalStorage.setItem("'LS_StayViewData_ARI'",null);
		eALocalStorage.setItem("'LS_StayViewData_HKS'",null);
		return(1);
	}


/*jQuery(".tran_cells").live('mouseenter',function(){
jQuery(this).css('z-index',eval(jQuery(this).css('z-index'))+10);
	}).live('mouseleave',function(){
	jQuery(this).css('z-index',eval(jQuery(this).css('z-index'))-10);
	});*/

jQuery("#next").mousedown(function(e){
		showjQloading();
		jQuery(".transbg").mouseup(function(e){
		var date = validDate(jQuery.trim(jQuery("input[id$='dtpStartDate']").val()),svGrid.dateFormate);

		var nextDate = new Date(date.getTime());
		nextDate.setDate(nextDate.getDate()+parseInt(svGrid.objSource.NDAY));//var msecsInADay = 86400000;
		nextDate = daylightSavingAdjust(nextDate,7);

		jQuery("input[id$='dtpStartDate']").datepicker('setDate',nextDate);
		jQuery("#ui-datepicker-div").hide();
		datechange();
		jQuery('.pttp').eZeeTooltip({delay:600});
		hidejQloading();
		jQuery(".transbg").unbind();
		});
});


jQuery("#pre").mousedown(function(e){
		showjQloading();

		jQuery(".transbg").mouseup(function(e){
		var date = validDate(jQuery.trim(jQuery("input[id$='dtpStartDate']").val()),svGrid.dateFormate);

		var preDate = new Date(date.getTime());
		preDate.setDate(preDate.getDate()-parseInt(svGrid.objSource.NDAY));//var msecsInADay = 86400000;
		preDate = daylightSavingAdjust(preDate,8);
		jQuery("input[id$='dtpStartDate']").datepicker('setDate',preDate);
		jQuery("#ui-datepicker-div").hide();
		datechange();
		jQuery('.pttp').eZeeTooltip({delay:600});
		hidejQloading();
		jQuery(".transbg").unbind();
		});

});

jQuery(".today").click(function(){
	showjQloading();
	jQuery('.daychange ,.today').removeClass('activeview');
	jQuery(this).addClass('activeview');
	var date = validDate(jQuery.trim(jQuery("input[id$='dbDate']").val()),'m/d/y');
	jQuery("input[id$='dtpStartDate']").datepicker('setDate',date );
	jQuery("#ui-datepicker-div").hide();
	datechange();
	jQuery('.pttp').eZeeTooltip({delay:600});
	hidejQloading();
});

/*jQuery("#more").click(function(){
 jQuery(".moredata").show();
});*/

jQuery("#sort").click(function(){
	jQuery("#sort a").toggleClass('rmasort rmdsort');
	jQuery(".tran_cells").remove();
	svGrid.fun_templateleft();
	svGrid.fun_templateright();
	svGrid.fun_unassignrooms();
	svGrid.fun_svTrandata('');hidejQloading();jQuery('.pttp').eZeeTooltip({delay:600});
	return ;

});

function booked(){/*return false;*/};

function svMessage(m)
		{
			if(m=='NotAllow')
			{
			jMessage('Please use Insert Transaction Screen For Past Date Operation.','ErrorO','center','center');
			}
			return false;
		}

function refreshGridForNightAudit (step,diff) // Shweta - 1.0.38.43 - 24 jan 2014 - for refresh the grid date on the basis of diiffrence
	{
		try
		{
		if(step == 6) //Manali - 1.0.37.42 - 28 Oct 2013 - START, Purpose : Enhancement - Pending Room Move, Part of Advance Room Move all other steps shifted to next level
			{
		 	var date = validDate(jQuery.trim(jQuery("input[id$='dtpStartDate']").val()),svGrid.dateFormate);
			var preDate = new Date(date.getTime());
			preDate.setDate(preDate.getDate()+Number(diff));//var msecsInADay = 86400000;
			preDate = daylightSavingAdjust(preDate,9);
			jQuery("input[id$='dtpStartDate']").datepicker('setDate',preDate);
			var objdate = datepart(preDate);
			jQuery("input[id$='txtHiddenDate']").val(objdate.y+"-"+objdate.m+"-"+objdate.d);
			jQuery("#ui-datepicker-div").hide();
			datechange();
			jQuery('.pttp').eZeeTooltip({delay:600});
			refresh_aList("GName");
			svGrid.fun_templateleft(); //Manali - 1.0.36.41 - 06 Sept 2013,Purpose :Refresh house kepping status
			}
			hidejQloading(100);
			return;


		}
		catch(e)
		{
		alert("stayview :: refreshGridForNightAudit "+e);
		}
	}
function blink_room(id)
	{
		jQuery('.tran_cells').removeClass('shadowanimation');
		jQuery(".tran_cells").each(function(){
		var tmpid = jQuery(this).attr('id');
			if(tmpid.indexOf(id) == 1)
			{
				//Shweta - 1.0.37.42 - 16 Dec 2013 - START
				//Purpose: When split transaction on grid at that time id will not be unique so it's not blinking as per selection on this case only.
				//jQuery("#"+tmpid).blink();
				jQuery(this).blink();
				//Shweta - 1.0.37.42 - 16 Dec 2013 - END
			}

		});
	}
function active_hover()
	{
		jQuery(".tran_cells,.ui-selectable").mousemove(function(e){
		jQuery('.rowhover').removeClass('rowhover');

		selcol = jQuery(this).parent().attr('id');

		id="op_"+selcol.split("_")[1];

		cwidth = svGrid.gW/svGrid.displayday;

		var t= jQuery('#conRight').offset();
		var v = e.clientX-t.left;
		col = Math.floor(v/cwidth);

		//console.log(e.target.clientLeft+" cwidth "+cwidth+" v: "+v+" col: "+col);
		var $LIS = jQuery("#datetable li");

		// Shweta -  1.0.39.44 - 22nd Feb 2014 after integrate the holidays related changes for stay view grid
		if($LIS.eq(col).hasClass('holinm'))
		{
			var cSS = hasTorgba($LIS.eq(col).attr('color'));
			$LIS.eq(col).removeClass('rowhover');
			jQuery("#roomul_"+col).css("background-color",cSS);
			jQuery("#occul_"+col).css("background-color",cSS);
			jQuery("#"+id).css("background-color",cSS);
		}
		else
		{
			// HRK
			$LIS.eq(col).addClass('rowhover');
			jQuery("#roomul_"+col).addClass('rowhover');
			jQuery("#occul_"+col).addClass('rowhover');
			jQuery("#"+id).addClass('rowhover');
			jQuery(".day_s").css("background-color","");
		}



		}).mouseleave(function(){
		jQuery('.rowhover').removeClass('rowhover');
		jQuery("#"+id).css("background-color","");
		jQuery(".day_s").css("background-color","");
		});

	}

jQuery(document).ready(function (){
reloadGrid();
setTimeout("jQuery('.pttp').eZeeTooltip({delay:600})",25);
jQuery('.holinm').live('mouseover mouseout', function(event) {
  if (event.type == 'mouseover')
  {
  	ttpOffset = jQuery(event.target).offset();
  	var boxHeight = jQuery("#holiday_info").height()+9;
	var boxWidth = jQuery("#holiday_info").width();
	jQuery("#holiday_info").css({"top":ttpOffset.top-boxHeight,"left":(ttpOffset.left-boxWidth)+25});
   	jQuery("#holiday_info").show();
 	var brkstr =   jQuery(this).find('.descholi').text();
 	brkstr = brkstr.split("|");
  	jQuery(".holi_box").html("<span><b>Holiday Name : </b>"+brkstr[0]+"</span><br/><br/><span><b>Holiday Description : </b>"+brkstr[1]+"</span>");
  }
  else
  {
    jQuery("#holiday_info").hide();
  }
});

});
function getTransactiondata(el){tmp = el;}
</script>

<script>

var tmp;	var xhr= false;
(function($){
    $.fn.extend({
        eZeeTooltip: function(options) {
            var defaults = {};
            var options = $.extend(defaults, options);
			var timerC;

			jQuery(document).mousedown(function(e){
				  	if(e.button == 0 || e.button == 1 || e.button == 2)
						{
						clearTimeout(timerC);
						}
						jQuery("#section_info").hide(100);
				  });

			return this.each(function() {
                  var o =options;
                  var obj = $(this);
                  obj.mouseover(function(e) {
				  var thisId= $(this).parent().attr('id');

				    jQuery("#section_info[class!='"+thisId+"']").hide();

					timerC = setTimeout(function(){

						jQuery("#section_info").attr('class',thisId);

						var objdata = jQuery("#"+thisId +" span.hidden").text();
						jQuery("#infobox name").text(objdata.split("|")[9]);


						ttpOffset = jQuery(e.target).offset();

						var changeinfo=[];

						if(jQuery("#"+thisId +" .pttp  data").length == 0)
						{
							if(objdata.split("|")[4] != "MAINTENBLOCK")
								{

									var infoData = getTraninfo(objdata.split("|")[5]);

									if(infoData != undefined )
								  	{

									jQuery("#infobox remark").html('');

										jQuery.each(infoData['traninfodata'], function(i) {

											if(infoData['traninfodata'][i]['reasoncategory'])
											{
											jQuery("#infobox remark")
											.prepend("<span style='display:block'>"+infoData['traninfodata'][i]['reasoncategory']+":"+infoData['traninfodata'][i]['reason']+"</span>")
											.show();
											}
											else
											{
											jQuery("#infobox remark").hide();
											}

												if(infoData['traninfodata'].length > 1)
												{
													if(infoData['traninfodata'][i]['room'] != infoData['traninfodata'][i-i]['room'])
													{

															changeinfo.push(infoData['traninfodata'][i]['room']);

													}
												}
										});

										jQuery(".tran_cells[id='"+thisId+"'] .pttp").append("<data style='display:none'>"+(infoData)+"</data>");
									 }

								}
								else if(objdata.split("|")[4] == "MAINTENBLOCK")
								{
									console.log("blocked");
									return;
								}
						}
						else
						{
							var idata='';

							jQuery("#"+thisId +" data").each(function(i){

								if (i == 0)
									{

									idata = jQuery(this).text().trim();

									}

							});

							var roomchang='';
							jQuery("#"+thisId+ ".hidden").each(function(i){
								hData = (jQuery(this).text()).split("|");
								roomchang=roomchang+hData[1]+"<span>"+hData[7]+" To "+hData[8]+"</span>";
							});
							var infoData = jQuery.parseJSON(idata);

							jQuery("#infobox remark").html('');
							var troom='';
							jQuery.each(infoData['traninfodata'], function(i) {
								if(infoData['traninfodata'][i]['reasoncategory'])
								{
								jQuery("#infobox remark")
								.prepend("<span style='display:block'>"+infoData['traninfodata'][i]['reasoncategory']+":"+infoData['traninfodata'][i]['reason']+"</span>").show();
								//.prepend("<span style='display:block'>"+infoData['traninfodata'][i]['reason']+"</span>").show();
								}
								else
								{
								jQuery("#infobox remark").hide();
								}

								if(infoData['traninfodata'][i]['room'])
								{
								if(infoData['traninfodata'][i]['room'] != troom)
									changeinfo.push(infoData['traninfodata'][i]['room']);

									troom=infoData['traninfodata'][i]['room'];
								}
							});

						}

						 if(changeinfo.length > 1)
								{
									jQuery("#infobox roomchange").html("<label> Room Change </label>"+changeinfo.join(">")).show();
								}
								else
								{
									jQuery("#infobox roomchange").hide();
								}

						var adate = (infoData['traninfodata'][0]['arrivaldatetime']).split(" ");
						var vadate = validDate(adate[0],'y-m-d');
						var ddate = (infoData['traninfodata'][0]['departuredatetime']).split(" ");
						var vddate = validDate(ddate[0],'y-m-d');

						jQuery("#infobox checkin")
						.html("<label>Arrive </label>"+vadate.format('d M yy')+" at "+timeFormat(adate[1],"h:i:s A"))
						.show();

						jQuery("#infobox checkout")
						.html("<label>Depart </label>"+vddate.format('d M yy')+" at "+timeFormat(ddate[1],"h:i:s A"))
						.show();

						jQuery("#infobox night")
						.html("<label>Night </label>"+objdata.split("|")[10]+" night").show();

						if(objdata.split("|")[11] != 0)
						jQuery("#infobox reservation").html("<label>Res. # </label>"+objdata.split("|")[11]).show();
						else
						jQuery("#infobox reservation").hide();

						if(objdata.split("|")[15] != 0)
						jQuery("#infobox group").html("<label>Group No </label>"+objdata.split("|")[15]).show();
						else
						jQuery("#infobox group").hide();

						jQuery("#infobox pax").html("<label>Pax (A/C)</label>"+infoData['traninfodata'][0]['adult']+"/"+infoData['traninfodata'][0]['child']).show();

						jQuery(".ttfooter balance")
						.html("<label>Balance </label>azz "+infoData['traninfodata'][0]['Balance']).show();

						var boxHeight = jQuery("#section_info").height()+9;
						var boxWidth = jQuery("#section_info").width();
						jQuery("#section_info").css({"top":ttpOffset.top-boxHeight,"left":(ttpOffset.left-boxWidth)+25});
						jQuery("#section_info").show();
						},options.delay);

                  }).mouseout(function(e) {
					clearTimeout(timerC);

                  });


            });

        }
    });
})(jQuery);



var tmp;
function getTraninfo(tranId)
	{
	try
		{
			var pObj = { tranid:tranId,d1:'',d2:''}
			var response;
			jQuery.ajax({
				async: false,
				data: {
						opcode: "Info",
						data: pObj
						},
				url: 'json/webfront.jsp',
				success: function(data)
				{
					if(IsJsonString(data)){
					response = jQuery.parseJSON(data);
					}else{
					return false;
					}
				}
			});

			return response

		}
	catch(e)
		{
		alert("stayview >> getTraninfo :: "+e);
		}

	}

function IsJsonString(str) {
    try {
        JSON.parse(str);
    } catch (e) {
        return false;
    }
    return true;
}
function hasTorgba(code)
{
var patt = /^#([\da-fA-F]{2})([\da-fA-F]{2})([\da-fA-F]{2})$/;
var matches = patt.exec(code);
var rgb = "rgba("+parseInt(matches[1], 16)+","+parseInt(matches[2], 16)+","+parseInt(matches[3], 16)+",0.6)";
return (rgb);
}
</script>
<script type="text/javascript">
/*<![CDATA[*/


	jQuery(function($) {
	jQuery("input[id$='txtRange']").focus(function(){
		if(jQuery(this).val()!='')
		{
			jQuery('#day_select').focus();
			if(jQuery(this).val()!='undefined,undefined' && jQuery(this).val()!=',')
				walkin_operation(jQuery(this).val(),'','','','StayView');
		}
		});
	});

jQuery(function() {
		jQuery("input[id$='dtpStartDate']").datepicker({
			changeMonth: true,
			changeYear: true,
			dateFormat: "yy-mm-dd"
		}
		<!-- Jignesh - 1.0.22.27 - 8th Oct 2011 - START -->
		<!-- Purpose : To Introduse Language for jQuery Calendar. -->
		,
		jQuery.datepicker.regional['en-GB']
		<!-- Jignesh - 1.0.22.27 - 8th Oct 2011 - END -->
		);
	});

/*]]>*/
</script>

<script>
function Browser() {
  var ua, s, i;
  this.isIE    = false;
  this.isNS    = false;
  this.version = null;

  ua = navigator.userAgent;
  s = "MSIE";
  if ((i = ua.indexOf(s)) >= 0) {
    this.isIE = true;
    this.version = parseFloat(ua.substr(i + s.length));
    return;
  }

  s = "Netscape6/";
  if ((i = ua.indexOf(s)) >= 0) {
    this.isNS = true;
    this.version = parseFloat(ua.substr(i + s.length));
    return;
  }

  // Treat any other "Gecko" browser as NS 6.1.

  s = "Gecko";
  if ((i = ua.indexOf(s)) >= 0) {
    this.isNS = true;
    this.version = 6.1;
    return;
  }
}

var browser = new Browser();
// Global object to hold drag information.
var dragObj = new Object();
dragObj.zIndex = 0;

function dragStart(event, id) {
//console.log(event);
//console.log(id);
  var el;
  var x, y;
  // If an element id was given, find it. Otherwise use the element being
  // clicked on.
  if (id)
    dragObj.elNode = document.getElementById(id);
  else {
   if (browser.isIE)
     dragObj.elNode = window.event.srcElement;
    if (browser.isNS)
      dragObj.elNode = event.target;

    // If this is a text node, use its parent element.
    if (dragObj.elNode.nodeType == 3)
      dragObj.elNode = dragObj.elNode.parentNode;
  }

  // Get cursor position with respect to the page.
  if (browser.isNS) {
    x = event.clientX + window.scrollX;
    y = event.clientY + window.scrollY;
  }

  // Save starting positions of cursor and element.

  dragObj.cursorStartX = x;
  dragObj.cursorStartY = y;
  dragObj.elStartLeft  = parseInt(dragObj.elNode.style.left, 10);
  dragObj.elStartTop   = parseInt(dragObj.elNode.style.top,  10);

  if (isNaN(dragObj.elStartLeft)) dragObj.elStartLeft = 0;
  if (isNaN(dragObj.elStartTop))  dragObj.elStartTop  = 0;

  // Update element's z-index.
  dragObj.elNode.style.zIndex = ++dragObj.zIndex;

  // Capture mousemove and mouseup events on the page.

  if (browser.isNS) {
    document.addEventListener("mousemove", dragGo,   true);
    document.addEventListener("mouseup",   dragStop, true);
    event.preventDefault();
  }
}



function dragGo(event) {
  var x, y;
  // Get cursor position with respect to the page.
  if (browser.isNS) {
    x = event.clientX + window.scrollX;
    y = event.clientY + window.scrollY;
  }

// Move drag element by the same amount the cursor has moved.
  dragObj.elNode.style.left = (dragObj.elStartLeft + x - dragObj.cursorStartX) + "px";
  dragObj.elNode.style.top  = (dragObj.elStartTop  + y - dragObj.cursorStartY) + "px";

  if (browser.isNS)
    event.preventDefault();

}



function dragStop(event) {

  // Stop capturing mousemove and mouseup events.
  if (browser.isNS) {

    document.removeEventListener("mousemove", dragGo,   true);

    document.removeEventListener("mouseup",   dragStop, true);
  }

}

//Manali - 1.0.34.39 - 20 Jun 2013 - START
//Purpose : Enhancement - Resize Drag drop transaction
/*function resizeTransaction(flag,resize_arrival,resize_departure,transaction,oldarrival,olddeparture)
{
	//var processflag=0;
	var newarrival='';
	var newdeparture='';

	if(resize_arrival!='')
		newarrival = resize_arrival;
	else
		newarrival = oldarrival;

	if(resize_departure!='')
		newdeparture = resize_departure;
	else
		newdeparture = olddeparture;

}*/
//Manali - 1.0.34.39 - 20 Jun 2013 - START

//Manali - 1.0.35.40 - 24 Jul 2013 - START
//Purpose : Enhancement - Resize Drag drop transaction
function displayStayviewMsg(flag)
{
	if(flag==1)
		displayMsg("Dates selection not proper. Stay should be minimum of 1 night.");
}
//Manali - 1.0.35.40 - 24 Jul 2013 - END
var getHoliDayList = function() // Shweta - 1.0.39.44 - 19th Feb 2014 - for getting the holidays list
{
	try
	{
		var operation=0;
		var myColumnDefs = new Array();
		var arrcolor = new Array();
		var arrhname = new Array();
		var arrhdesc = new Array();
		jQuery.ajax({
				async: false,
				data: {
						opcode: "hld",
						sdate:jQuery("input[id$='dtpStartDate']").val(),
						n:displayday
						},
				url: 'json/webfront.jsp',
				success: function(data)
				{
				data="[]";
					operation=jQuery.parseJSON(data);

					for (var i = 0; i < operation.length; i++)
					{
						myColumnDefs.push(operation[i]['holidaydate']);
						arrcolor[operation[i]['holidaydate']] = operation[i]['color'];
						arrhname[operation[i]['holidaydate']] = operation[i]['holidayname']+"|"+operation[i]['description'];
					}
				}
			});

			return [ myColumnDefs,arrcolor,arrhname];
	}
	catch(e)
	{
		alert("styview :: getHoliDayList " + e);
	}
}

// Made by Shweta - 25th March 2014 for solve the issue of day light saving for all time zone
 function daylightSavingAdjust(date,status)
 	{
		//console.log(date.getHours()+"===get Hours " +status+" status===== ")
		date.setHours(date.getHours() > 12 ? date.getHours() + 2 : 0);
		//console.log(date+"After Date=========");
		return date;
     }

var fun_OccupancyList = function()
{
	try
	{
		var occu='';
		jQuery.ajax({
				async: false,
				data: {
						opcode: "assignOccupancy",
						sdate:jQuery("input[id$='dtpStartDate']").val(),
						n:displayday
						},
				url: 'json/webfront.jsp',
				success: function(data)
				{
	//			data='[["2014-04-17",23.076923076923],["2014-04-18",7.6923076923077],["2014-04-20",7.6923076923077],["2014-04-21",0],["2014-04-22",0],["2014-04-23",0]]';
					occu=jQuery.parseJSON(data);
					for (var k=0;k<occu.length;k++)
					{
						var p = svGrid.fun_getPosition(validDate(occu[k][0],"yy-m-d"),'');
						jQuery("#occupancy li").each(function(){
									if(jQuery(this).attr('rel') == p)
									{
									tmpid = jQuery(this).attr('id');
									jQuery("#"+tmpid+ " .ov").text(Math.round(occu[k][1]));
									}
						});
					}

				}
			});


	}
	catch(e)
	{
		alert("styview :: fun_OccupancyList " + e);
	}
}

</script>



      </section>
      </section>
    </div>
    <!-- container_outer -->


  <footer>
  <ul>
  <li class="hotelname" style="cursor:pointer"> Property Name :
  	<span class="fvalue">
		<div id="hotellist_container" class="dd-menu" style="display:inline-block">
			<div id="hotellist_wrapper" class="dd-submenu dd-bottom">
				<div id="hotellist" class="ul">
				</div>
				<span class="dd-bottom-arrow"></span>
			</div>
			<span id="ctl0_ctl7_lblHotelName" class="dd-button lblhn">Victoria Inn</span>
		</div>
	</span>
  </li>
  <li> User : <span class="fvalue">
    <span id="ctl0_ctl7_lblUserName" class="loggedinuser">admin</span>
    </span>
  </li>
  <li style="padding:2px 10px;"> Working Date : <span id="workingdate" class="fvalue">
    <span id="ctl0_ctl7_workingdate">17 Apr 2014</span>
	</span>
	<!-- Chandrakant - 1.0.38.43 - 20 Jan 2014 - START -->
	<!-- Purpose : Get Night Audit Trail -->
	<span>
	<a href="javascript:;" onclick="showNightAuditTrail();" class="nightauditlog" title="Audit Trail - Night Audit" id="Audit Trail - Night Audit"></a>
	</span>
	<!-- Chandrakant - 1.0.38.43 - 20 Jan 2014 - END -->

  </li>
  <li> System Date : <span class="fvalue">
    29 Apr 2014
    </span>
  </li>
  <li> Version : <span class="fvalue">
    <span id="ctl0_ctl7_version">1.0.39.44</span>
    </span> </li>
	<li style="display:block">
		<a href="#" class="livesupport" onclick="livesupport();">Live Support</a>
	</li>
  <li class="oemcompany">
    <span id="ctl0_ctl7_lblOEMCompany">Selfin HMS</span>
  </li>
</ul>

<script>
	function refreshFooter()
	{
		try
		{
			var request = new Prado.CallbackRequest('ctl0$ctl7$callbackfooter',{});
			request.dispatch();
		}
		catch(e)
		{
			alert("newfdfooter - refreshFooter >> "+e);
		}
	}
	function livesupport()
	{
	window.open("http://chatserver.comm100.com/ChatWindow.aspx?siteId=64061&planId=245&partnerId=-1&visitType=1&byHref=1", "myWindow", "status = 0, height = 550, width = 500, resizable = 0");
	}

	// HRK - 1.0.27.32 - 31 July 2012 - START
	// Purpose : Hotel Chain
	jQuery(document).ready(function(){

		if('')
		{

			jQuery.ajax({
				data: {opcode: "ghl"},
				url: serverurl+'index.php/page/newfront.service',
				success: function(data) {
						jQuery("#hotellist").html('');
						var retdata = jQuery.parseJSON(data);
						jQuery(retdata).each(function(idx,val){
							jQuery("#hotellist").append("<div class='li'><a href='"+(serverurl+"index.php/page/newclient.propertychange/side/1/hotel/"+val.hotel_code)+"'>"+val.name+"</a></div>");
						});

						jQuery("#hotellist_container").append("<span class='hn-toparrow'></span>");
						jQuery(".lblhn").css({'padding-right':'15px'});

						jQuery("#hotellist_wrapper").width(jQuery(".hotelname").width()+20);
					}
				});
		}
		else
		{
			jQuery("#hotellist_wrapper").remove();
		}
	});
	// HRK - 1.0.27.32 - 31 July 2012 - END

	//Chandrakant - 1.0.38.43 - 20 Jan 2014 - START
	function showNightAuditTrail()
	{
		var title = "Night Audit";
		parent.loadPopup('GeneralAuditTrail','generalaudittraillogs/keyname/todayDate/title/'+title,500,585);
	}
	//Chandrakant - 1.0.38.43 - 20 Jan 2014 - END
</script>

  </footer>
  </section>
  <!--wrapper-->
</div>
<!--outer-->
<!-- HRK - 09 Feb 2011 - Start -->
<div id="divjs" style="display:none">
<script>
	var serverurl='http://rms.mysoft.ge:8080/hms/';

	if(!checkRights(38)) // Access to House Keeping
	{
		jQuery(".ddm_housekeeping").remove();
	}

	window.onmousemove=function(){
		 setTimeout("BrwClsMsg = true;",10);
	}

	jQuery(".dropmenudiv a , .quick_icons a , .logoff , .ddm_reports , .ddm_reports , .donotconfirm").click(function(){
		showBrwClsMsg=false;
	});

	window.onbeforeunload = function()
	{
		if(jQuery('#div_EditTran').length>0 || jQuery('#div_EditGroupTran').length>0)
		{
			Unlocked(jQuery("input[id$='hidTranUnkId']",window.tabiframe_edittran.document).val());
		}
		if(jQuery('.cls_incfl_expvoc').length>0)
		{
			UnlockedFolio(jQuery("input[id$='hidFolioUnkId']").val());
		}

		if(showBrwClsMsg)
		{
			isRealFocus=false;
			return 'Confirm your action.';
		}
	}

	localStorage.setItem("OEMLogo","eZee_Absolute_1.png");
	localStorage.setItem("OEMID","1");
	scyios4587();

	 window.addEventListener("focus", function(event) {
		 console.log("focus")
	 	if(isRealFocus)
			checkbrowsersession();
		else
			isRealFocus=true;
	});

	function checkbrowsersession()
	{
            return;
		var _sessionResult=_CheckSessionHotelCode();
		//console.log(_sessionResult);
		if(!_sessionResult)
		{
			showBrwClsMsg=false;
			window.location.reload();
		}
	}

	if (window.localStorage) {
		if(window.localStorage.getItem("front_hotel_code")!=null)
  			console.log("session Value : " + window.localStorage.getItem('front_hotel_code'));
		window.localStorage.setItem("front_hotel_code","503");
}
</script>
</div>
</form>

<textarea style="width: 800px;height: 200px;" id="buf123"></textarea>

</body>
</html>
