function tranmenupopup(tranStatus,tranUnkid,resNo,opcode){
	try{
		//console.log("tranmenupopup >> "+tranStatus+" | "+tranUnkid+" | "+resNo+" | "+opcode);		
		closetranmenu();
		msg = tranStatus+tranUnkid;
		loadResult='';
		if(opcode=='1')
		{
			if(tranStatus=='UNCONFRESERV' || tranStatus=='CONFRESERV')
			{
				if(!hasRights(8)) // Edit Reservation
					return false;
			}			
			roomOperation(tranUnkid,opcode);	
		}
		else if(opcode=='2')
		{
			//Manali - 1.0.37.42 - 30 Nov 2013 - START
			//Purpose : Customization, Part Of Advance Room Move
			var chkparameters=jQuery("#"+tranStatus+'_'+tranUnkid).text();
			var splitparameters=chkparameters.split("|");	
			var stoproommoveflag = splitparameters[17];
			
			/*Shweta - 1.0.37.42 - 14 Dec 2013 - START
			//Purpose : Remove the reason table related joins from stayview query because of loading time on grid (it is fire only when suite move open) 
			//var stoproommove_by = splitparameters[18];
			var stoproommove_reason = splitparameters[19];*/
			var stoproommove_by = '';
			var stoproommove_reason = '';
			if(stoproommoveflag == 1)
			{
				var jsnObj = getRoomMoveReason(tranUnkid);
				stoproommove_by = jsnObj.StopBy;
				stoproommove_reason = jsnObj.StopByReason;
			}
			//Shweta - 1.0.37.42 - 14 Dec 2013 - END
			
			//roommove_operation(chkparameters,tranUnkid);	//Removed from commonfunction.tpl
			moveroom(tranUnkid,'Stayview',stoproommoveflag,stoproommove_by,stoproommove_reason);
			//Manali - 1.0.37.42 - 30 Nov 2013 - END
		}
		else if(opcode=='3')
		{			
			var chkparameters=jQuery("#"+tranStatus+'_'+tranUnkid).text();
			var splitparameters=chkparameters.split("|");		
			var groupunkid=splitparameters[15];						
			setmessage_operation(tranUnkid,groupunkid,'Stayview');
		}
		else if(opcode=='4')
		{			
			var chkparameters=jQuery("#"+tranStatus+'_'+tranUnkid).text();
			var splitparameters=chkparameters.split("|");		
			var groupunkid=splitparameters[15];						
			settask_operation(tranUnkid,groupunkid,'Stayview');
		}
		else if(opcode=='5')
		{			
			var chkparameters=jQuery("#"+tranStatus+'_'+tranUnkid).text();
			var splitparameters=chkparameters.split("|");		
			var groupunkid=splitparameters[15];						
			setpreference_operation(tranUnkid,groupunkid,'Stayview');
		}
		else if(opcode=='6')
		{
			//Manali - 1.0.37.42 - 31 Oct 2013 - START
			//Purpose : Customization, Part Of Advance Room Move
			var chkparameters=jQuery("#"+tranStatus+'_'+tranUnkid).text();
			var splitparameters=chkparameters.split("|");		
			var isSplitFlag = splitparameters[21];
			var stoproommove_flag = splitparameters[17];
			
			amend_stay(tranUnkid,'Stayview','','',isSplitFlag,stoproommove_flag);	
			//Manali - 1.0.37.42 - 31 Oct 2013 - END
		}
		else if(opcode=='8')
		{			
			if(!hasRights(13)) // CheckInGuest
				return;	
			if(isLocked(tranUnkid))
				return;	
			
			var chkparameters=jQuery("#"+tranStatus+'_'+tranUnkid).text();			
			var splitparameters=chkparameters.split("|");
			var arrival=splitparameters[7];
			var departure=splitparameters[8];
			var roomid=splitparameters[12];
			var roomtypeid=splitparameters[13];			
 			guest_check_in(tranUnkid,arrival,departure,roomtypeid,roomid);
		}
		else if(opcode=='9')
		{
			var chkparameters=jQuery("#"+tranStatus+'_'+tranUnkid).text();
			var splitparameters=chkparameters.split("|");
			var res_no=splitparameters[11];
			var groupunkid=splitparameters[15];
			var ownership=splitparameters[14];
			get_GroupCount(tranUnkid,groupunkid,res_no,ownership,'Stayview','CANCEL','',tranStatus); <!--Manali - 1.0.37.42 - 02 Dec 2013, Purpose : Added ChkStatus, Part Of Advance Room Move -->	
		}
		else if(opcode=='10')
		{
			if(isLocked(tranUnkid))
				return;	
			assign_room(tranUnkid,'Stayview');	
		}
		else if(opcode=='11')
		{			
			var chkparameters=jQuery("#"+tranStatus+'_'+tranUnkid).text();
			var splitparameters=chkparameters.split("|");
			var res_no=splitparameters[11];
			var groupunkid=splitparameters[15];
			var ownership=splitparameters[14];
			get_GroupCount(tranUnkid,groupunkid,res_no,ownership,'Stayview','NOSHOW','',tranStatus);<!--Manali - 1.0.37.42 - 02 Dec 2013, Purpose : Added ChkStatus, Part Of Advance Room Move -->
		}
		else if(opcode=='12')
			roomOperation(tranUnkid,opcode);
		else if(opcode=='13')
			block_unblock_operation(tranUnkid,'','','stayview',2);
		else if(opcode=='14')
		{
			var chkparameters=jQuery("#"+tranStatus+'_'+tranUnkid).text();
			var splitparameters=chkparameters.split("|");
			var res_no=splitparameters[11];
			var groupunkid=splitparameters[15];
			var ownership=splitparameters[14];	
			voidtransaction(tranUnkid,groupunkid,res_no,ownership,'Stayview',tranStatus,'VOIDTRANSACTION');
		}
		else if(opcode=='15')
		{
			var chkparameters=jQuery("#"+tranStatus+'_'+tranUnkid).text();
			var splitparameters=chkparameters.split("|");
			var arri_date=splitparameters[7];
			var dpt_date=splitparameters[8];
			undo_checkin(tranUnkid,arri_date,dpt_date);
		}
		else if(opcode=='16')
		{
			val_checkout=2;			
			var chkparameters=jQuery("#"+tranStatus+'_'+tranUnkid).text();
			var splitparameters=chkparameters.split("|");
			var arri_date=splitparameters[7];
			var dpt_date=splitparameters[8];
			var Tgroupid=splitparameters[15];
			var Tresno=splitparameters[11];
			var Townership=splitparameters[14];
			
			get_GroupCount(tranUnkid,Tgroupid,Tresno,Townership,'EditTran','CHECKOUT','',tranStatus);<!--Manali - 1.0.37.42 - 02 Dec 2013, Purpose : Added ChkStatus, Part Of Advance Room Move -->
			return false;
		}
		else if(opcode=='17')
		{		
			roomOperation(tranUnkid,opcode);
			return false;
		}
		else if(opcode=='18')
		{		
			undoStopRoomMove(tranUnkid,tranStatus);
			return false;
		}		
		else if(opcode=='19') //Manali - 1.0.37.42 - 28 Sep 2013, Purpose : Enhancement : Exchange Room Feature
		{	
			exchangeRoom(tranStatus,tranUnkid);
			return false;
		}
		else if(opcode=='20') //Manali - 1.0.37.42 - 24 Oct 2013, Purpose : Enhancement : Remove isphysicalmoveflag, Part Of Advance Rom Move
		{	
			var chkparameters=jQuery("#"+tranStatus+'_'+tranUnkid).text();
			var splitparameters=chkparameters.split("|");
			var Tgroupid=splitparameters[15];
			var res_no=splitparameters[11];
			var roomid=splitparameters[12];
			var roomtypeid=splitparameters[13];		
			moveGuestPhysically(tranUnkid,Tgroupid,'',tranStatus,res_no,'Stayview','MoveGuestPhysically',1);
			return false;
		}
		return (loadResult);
	}
	catch(e)
		{
		alert("FDleftpanel >> tranmenupopup: "+e);
		}
	}
