<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
ReservationBean reserv = ReservationManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("reservationid")));
GuestBean guest = GuestManager.getInstance().loadByPrimaryKey(reserv.getGuestid());
String guestname = "";
if(guest.getMrmrsid() != null){
    CategoryBean[] salutation = CategoryManager.getInstance().loadByWhere("where categoryid = "+guest.getMrmrsid());
    if(salutation.length > 0)
        guestname += salutation[0].getName()+" ";
}
guestname += guest.getFname() + " " + guest.getLname();
TarifftypeBean tp = TarifftypeManager.getInstance().loadByPrimaryKey(reserv.getTarifftypeid());
RoomBean room = RoomManager.getInstance().loadByPrimaryKey(reserv.getRoomid());
RoomtypeBean roomtype = RoomtypeManager.getInstance().loadByPrimaryKey(room.getRoomtypeid());
RoomtypeBean[] roomtypes = RoomtypeManager.getInstance().loadByWhere("order by name");
String rname = room.getNickname();
if(rname == null)   rname = room.getName();
if(rname == null || rname.trim().length() == 0) rname = "ნომრის გარეშე";
%>
<input type="hidden" id="action" value="saveroommove.jsp?reservationid=<%=reserv.getReservationid()%>"/>
<input type="hidden" id="controls" value="roomtypeid,roomid,oldroomid"/>
<input type="hidden" id="oldroomid" value="<%=room.getRoomid()%>"/>
<input type="hidden" id="callbackurl" value="content/stayviewleft.jsp"/>
<input type="hidden" id="callbackdata" value="leftcontent"/>
    <div class="row">
        <div class="col-md-8">
            <div class="panel panel-primary" style="height: 170px;">
                <div class="panel-heading">
                    <h3 class="panel-title">ახალი ოთახი</h3>
                </div>
                <div class="panel-body">
                    <form role="form" method="post">
                        <div class="form-group">
                            <label for="roomtypeid">ოთახის ტიპი:</label>
                            <select class="form-control" id="roomtypeid" onchange="$.post('content/getroombytype.jsp?', { roomtypeid: $(this).val(), statustypes: '7,8', oldroomid: <%=room.getRoomid()%> },function(data){$('#roomid').html(data);});">
                              <option>-- აირჩიეთ --</option>
                              <%
                              for(int i=0;i<roomtypes.length;i++){
                                  String sel = "";
                                  int cnt = RoomtypeManager.getInstance().countWhere("where roomtypeid = "+roomtypes[i].getRoomtypeid()+" and roomtypeid in (select roomtypeid from room where roomid != "+room.getRoomid()+" and status = true and getroomstatus(roomid,'"+dtlongs.format(new Date())+"') = 1)");
                              %>
                              <option value="<%=roomtypes[i].getRoomtypeid()%>" <%=sel%>><%=roomtypes[i].getName()%> (<%=cnt%>)</option>
                              <%}%>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="roomid">ოთახი:</label>
                            <select class="form-control" id="roomid">
                                <option>-- აირჩიეთ --</option>
                            </select>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-md-8">
            <div class="panel panel-primary" style="height: 170px;">
                <div class="panel-heading">
                    <h3 class="panel-title">მიმდინარე ოთახი</h3>
                </div>
                <div class="panel-body">
                    <table width="100%" class="table table-borderless">
                        <tbody>
                            <tr>
                                <td><b>ოთახი</b></td>
                                <td><%=rname%></td>
                                <td><%=roomtype.getNickname()%></td>
                            </tr>
                            <tr>
                                <td><b>სტუმარი</b></td>
                                <td colspan="2"><%=guestname%></td>
                            </tr>
                            <tr>
                                <td><b>Pax</b></td>
                                <td><b>უფროსი</b> <%=reserv.getAdult()%></td>
                                <td><b>ბავშვი</b> <%=reserv.getChild()%></td>
                            </tr>
                            <tr>
                                <td><b>ჩამოსვლა</b></td>
                                <td colspan="2"><%=dtlong.format(reserv.getArrivaldate())%></td>
                            </tr>
                            <tr>
                                <td><b>წასვლა</b></td>
                                <td colspan="2"><%=dtlong.format(reserv.getDeparturedate())%></td>
                            </tr>
                            <tr>
                                <td><b>ტარიფი</b></td>
                                <td><%=tp.getNickname()%></td>
                                <td><%=dc.format(reserv.getConditionaltotalcost())%></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
