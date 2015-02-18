<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<%
    WorkorderBean workorderBean = null;
    String wid = (String) request.getParameter("wid");
    if (wid != null) {
        workorderBean = WorkorderManager.getInstance().loadByWhere("where workorderid = " + wid)[0];
    }
    RoomBean[] rooms = RoomManager.getInstance().loadByWhere("");
    HouseunitBean[] units = HouseunitManager.getInstance().loadByWhere("");
    PersonnelBean[] personnelBeans = PersonnelManager.getInstance().loadByWhere("where personneltypeid = 2");
%>

<script>
    $(document).ready(function(){
        $('.dropdown').selectpicker();
        $(".work-table .btn-group").css("width", "250px", "!important");
        $(".work-table input").css("height","27px","!important").css("margin-left","4px");
        $("#dt-block-st").css("margin-left","0");
        $('.work-table .date').datepicker(<%=pickerFormatForDatePickers%>);
    });
    function cancelSaveWorkorder(){
        $(".filter-form1").show();
        $("#workorder_add").html('');
        $(".filter-form2").hide();
    }
</script>

<style>
    .work-order-add-maindiv {
        width: 100%;
        margin-top: -10px;
    }

    .header-td {
        height: 30px;
        line-height: 30px;
        width: 100%;
        padding: 0 !important;
        background: white;
    }

    .header-td span {
        margin-left: 10px;
        color: #107fdc;
        font-family: BGMtavr;
        font-size: 12px;
    }

    .td2 {
        width: 285px;
        vertical-align: top;
    }

    .footer-td {
        height: 35px;
        line-height: 35px;
        width: 100%;
        background: #fff;
    }

    .work-table td {
        padding: 0 !important;
    }

    .maintable{
        width: 500px;
        margin-left: 10px;
        margin-top: -35px;
    }
    .maintable td{
        border: 0 !important;
        padding: 3px !important;
    }
</style>
<div class="work-order-add-maindiv">

    <table style="width: 100%" class="work-table">
        <tr>
            <td style="">
                <table style="width: 100%; height: 472px;" class="work-table">
                    <tr>
                        <td class="header-td">
                            <span>შესასრულებელი სამუშაოს დამატება</span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table class="maintable">
                                <tr>
                                    <td>
                                        <span>ორდ. #</span>
                                    </td>
                                    <td>
                                        <input type="text" name="work-ordernum" id="work-ordernum" style="background: whitesmoke;" readonly/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>განმარტება</span>
                                    </td>
                                    <td>
                                        <textarea id="work-descr" style="height: 40px; margin-left: 4px;"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>კატეგორია</span>
                                    </td>
                                    <td>
                                        <select class="dropdown col-md-2" id="workOrderCategory">
                                            <option value="0">-კატეგორია-</option>
                                            <% for (int i = 0; i < workOrderCategory.length; i++) { %>
                                            <option value="<%=i%>"><%=workOrderCategory[i]%>
                                            </option>
                                            <% } %>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>ოთახი</span>
                                    </td>
                                    <td>
                                        <select class="dropdown col-md-2" id="units">
                                            <option value="0">-ოთახის #-</option>
                                            <% for (int i = 0; i < rooms.length; i++) { %>
                                            <option value="<%=rooms[i].getRoomid()%>"
                                                    roomtypeid="<%=rooms[i].getRoomtypeid()%>"><%=rooms[i].getName()%>
                                            </option>
                                            <% } %>
                                            <% for (int i = 0; i < units.length; i++) { %>
                                            <option value="<%=units[i].getHouseunitid()%>"><%=units[i].getName()%>
                                            </option>
                                            <% } %>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>ბლოკის დასაწყისი</span>
                                    </td>
                                    <td>
                                        <div class="col-md-2">
                                            <div class="input-append date" id="dt-block-st-div">
                                                <input type="text" class="span2 " id="dt-block-st" placeholder=" თარიღიდან"
                                                       style="">
                                                <span class="add-on"
                                                      style="position:absolute !important; right : -104px  !important;background : none  !important;border: none !important;top: 1px;">
                                                    <i class="glyphicon glyphicon-calendar"></i></span>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>ბლოკის დასასრული</span>
                                    </td>
                                    <td>
                                        <div class="input-append date" id="dt-block-end-div"  style="position: relative;">
                                            <input type="text" class="span2 " id="dt-block-end" placeholder=" თარიღიდან"
                                                   style="">
                                                <span class="add-on"
                                                      style="position:absolute !important; right : 189px  !important;background : none  !important;border: none !important;top: 1px;">
                                                    <i class="glyphicon glyphicon-calendar"></i></span>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>პრიორიტეტი</span>
                                    </td>
                                    <td>
                                        <select class="dropdown col-md-2" id="workOrderPriority">
                                            <option value="0">-პრიორიტეტი-</option>
                                            <% for (int i = 0; i < workOrderPriority.length; i++) { %>
                                            <option value="<%=i%>"><%=workOrderPriority[i]%>
                                            </option>
                                            <% } %>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>მიმაგრებულია</span>
                                    </td>
                                    <td>
                                        <select class="dropdown col-md-2" id="personnel">
                                            <option value="0">-აირჩიეთ-</option>
                                            <% for (int i = 0; i < personnelBeans.length; i++) { %>
                                            <option value="<%=personnelBeans[i].getPersonnelid()%>"><%=personnelBeans[i].getFname() + " " + personnelBeans[i].getLname()%>
                                            </option>
                                            <% } %>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>სტატუსი</span>
                                    </td>
                                    <td>
                                        <select class="dropdown col-md-2" id="workOrderStatus">
                                            <option value="0">-სტატუსი-</option>
                                            <% for (int i = 0; i < workOrderStatus.length; i++) { %>
                                            <option value="<%=i%>"><%=workOrderStatus[i]%>
                                            </option>
                                            <% } %>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>დედლაინი</span>
                                    </td>
                                    <td>
                                        <div class="input-append date" id="dt-dedline-div"  style="position: relative;">
                                            <input type="text" class="span2 " id="dt-dedline" placeholder=" თარიღიდან"
                                                   style="">
                                                <span class="add-on"
                                                      style="position:absolute !important; right : 189px  !important;background : none  !important;border: none !important;top: 1px;">
                                                    <i class="glyphicon glyphicon-calendar"></i></span>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="footer-td">
                            <button type="button" class="btn btn-default" id="cancelSave" onclick="cancelSaveWorkorder()"
                                    style="border: 0; font-weight: bold; float: right; margin: 4px 6px 0 0;">
                                დახურვა
                            </button>
                            <button type="button" class="btn btn-danger" id="saveAgent" onclick="saveTAgent()"
                                    style="font-weight: bold; float: right; margin: 3px 5px 0 0;">
                                შენახვა
                            </button>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 10px;">
                &nbsp;
            </td>
            <td class="td2">
                <table style="width: 100%; height: 103px;" class="work-table">
                    <tr>
                        <td class="header-td">
                            <span>შემდეგი რეზერვაცია</span>
                        </td>
                    </tr>
                    <tr>
                        <td>

                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>