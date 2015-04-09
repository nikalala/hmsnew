<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%
String id = request.getParameter("id");
RoomtypeBean[] roomtypes = RoomtypeManager.getInstance().loadByWhere("order by name");


SalutationBean[] salutations = SalutationManager.getInstance().loadByWhere("order by name");
IdtypeBean[] idtypes = IdtypeManager.getInstance().loadByWhere("order by name");
%>
<tr id="walkin_guest_<%=id%>">
    <td style="width: 110px;">
        <form class="form-inline" role="form">
        <div class="form-group">
            <div class="input-group-xs">
                <select class="form-control dropdown" name="walkin_roomtypeid" id="walkin_roomtypeid_<%=id%>" style="width: 100px;" onchange="walkinRoomType(<%=id%>)">
                    <option value="0">--აირჩიეთ--</option>
                    <%
                    for(int j=0;j<roomtypes.length;j++){
                    %>
                    <option value="<%=roomtypes[j].getRoomtypeid()%>"><%=roomtypes[j].getName()%></option>
                    <%
                    }
                    %>
                </select>
            </div>
        </div>
        </form>
    </td>
    <td style="width: 90px;">
        <form class="form-inline" role="form">
        <div class="form-group">
            <div class="input-group-xs">
                <select class="form-control dropdown" name="walkin_roomid" id="walkin_roomid_<%=id%>" style="width: 80px;">
                    
                </select>
            </div>
        </div>
        </form>
    </td>
    <td style="width: 110px;">
        <form class="form-inline" role="form">
        <div class="form-group">
            <div class="input-group-xs">
                <select class="form-control dropdown" name="walkin_ratetypeid" id="walkin_ratetypeid_<%=id%>" style="width: 100px;" onchange="walkinRatetype(<%=id%>)">
                    
                </select>
            </div>
        </div>
        </form>
    </td>
    <td style="width: 90px;">
        <form class="form-inline" role="form">
        <div class="form-group">
            <div class="input-group-xs" nowrap>
                <select class="form-control dropdown" name="walkin_adult" id="walkin_adult_<%=id%>" style="width: 40px;">
                    
                </select>
                <select class="form-control dropdown" name="walkin_child" id="walkin_child_<%=id%>" style="width: 40px;">
                    
                </select>
            </div>
        </div>
        </form>
    </td>
    <td style="width: 55px;">
        <form class="form-inline" role="form">
        <div class="form-group">
            <div class="input-group-xs">
                <select class="form-control dropdown" name="walkin_salutationid" id="walkin_salutationid_<%=id%>" style="width: 50px; padding: 2px 2px; font-size: 12px; line-height: 1.5;">
                    <%
                    for(int j=0;j<salutations.length;j++){
                    %>
                    <option value="<%=salutations[j].getSalutationid()%>"><%=salutations[j].getName()%></option>
                    <%
                    }
                    %>
                </select>
            </div>
        </div>
        </form>
    </td>
    <td style="width: 260px;">
        <form class="form-inline" role="form">
        <div class="form-group">
            <div class="input-group">
                <input class="form-control" type="text" id="walkin_name_<%=id%>" style="width: 115px;">
                <div class="input-group-addon glyphicon glyphicon-remove" style="color: red; cursor: pointer;" onclick="$('#walkin_name_<%=id%>').val('');$('#walkin_name_<%=id%>').focus();"></div>
                <div class="input-group-addon glyphicon glyphicon-search" style="cursor: pointer;" onclick="walkinNameSearch('walkin_name_<%=id%>')"></div>
                <div class="input-group-addon glyphicon glyphicon-credit-card" style="cursor: pointer;" onclick="alert('ბარათი')"></div>
                <div class="input-group-addon glyphicon glyphicon-plus" style="color: green; cursor: pointer;" onclick="alert('დამატება')"></div>
            </div>
        </div>
        </form>
    </td>
    <td style="width: 130px;">
        <form class="form-inline" role="form">
        <div class="form-group">
            <div class="input-group-xs">
                <select class="form-control dropdown" name="walkin_idtypeid" id="walkin_idtypeid_<%=id%>" style="width: 120px;">
                    <option value="0">--აირჩიეთ--</option>
                    <%
                    for(int j=0;j<idtypes.length;j++){
                    %>
                    <option value="<%=idtypes[j].getIdtypeid()%>"><%=idtypes[j].getName()%></option>
                    <%
                    }
                    %>
                </select>
            </div>
        </div>
        </form>
    </td>
    <td style="width: 290px;" nowrap>
        <form class="form-inline" role="form">
        <div class="form-group">
            <div class="input-group">
                <input class="form-control" type="text" id="walkin_idn_<%=id%>" style="width: 120px;" placeholder="ნომერი">
                <div class="input-group-addon glyphicon glyphicon-paperclip" style="color: green; cursor: pointer;" onclick="alert('დამატებითი სერვისი')"></div>
                <div class="input-group-addon glyphicon glyphicon-file" style="color: orange; cursor: pointer;" onclick="alert('შენიშვნა')"></div>
                <div id="walkin_guest_copy_<%=id%>" class="input-group-addon glyphicon glyphicon-tags" style="cursor: pointer;" onclick="alert('კოპირება')"></div>
                <div class="input-group-addon glyphicon glyphicon-remove" style="color: red; cursor: pointer;" onclick="delRow(<%=id%>)"></div>
                <div id="walkin_guest_usd_<%=id%>" class="input-group-addon glyphicon glyphicon-usd" style="color: black; cursor: pointer;" onclick="showRateTable(<%=id%>)"></div>
            </div>
        </div>
        </form>
    </td>
    <td style="width: 10px;"></td>
</tr>