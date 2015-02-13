<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<%

    RoomBean[] rooms = RoomManager.getInstance().loadByWhere("");
    HouseunitBean[] units = HouseunitManager.getInstance().loadByWhere("");
    PersonnelBean[] personnelBeans = PersonnelManager.getInstance().loadByWhere("where personneltypeid = 2");

%>

<script type="text/javascript">

    $(document).ready(function () {
        loadDefaults();
        drawFooter();
    });

    var page = workOrderGrid.page;

    function getNextRecords() {
        page += 1;
        workOrderGrid.limit = $("#limitselectbox").val();
        var items_per_page = workOrderGrid.limit;
        var offset = (page - 1) * items_per_page;
        var limit = " LIMIT " + items_per_page + " OFFSET " + offset;
        var url = doFilter(true,limit);
        reloadGrid(workOrderGrid.id, url);

    }

    function getPrevRecords() {
        page -= 1;
        if(page < 1){
            page = 1;
            return;
        }
        workOrderGrid.limit = $("#limitselectbox").val();
        var items_per_page = workOrderGrid.limit;
        var offset = (page - 1) * items_per_page;
        var limit = " LIMIT " + items_per_page + " OFFSET " + offset;
        var url = doFilter(true,limit);
        reloadGrid(workOrderGrid.id, url);
    }

    $("#btnNext").click(function(){
        getNextRecords();
    });
    $("#btnPrev").click(function(){
        getPrevRecords();
    });

    function loadDefaults() {

        var limit = " LIMIT " + workOrderGrid.limit + " OFFSET " + 0;
        //workOrderGrid.url = doFilter(true,limit);
        initializeGrid(workOrderGrid);

        $('#grid-table .dropdown').selectpicker();
        $("#grid-table .btn-group").css("width", "100%", "!important");
        $("#grid-table label").each(function () {
            $(this).css("float", "right", "!important");
            $(this).css("line-height", "27px", "!important");
        });
        $("#grid-table input").height($("#grid-table .btn-group").height() - 6, "!important");
        $("#filter-form input[type='text']").css("width", "100%", "!important");
        $("#grid-table .date input[type='text']").css("position", "relative");

    }

</script>

<link rel="stylesheet" type="text/css" href="css/grid-filter.css">

<form name="filter-form" id="filter-form">
    <table id="grid-table" class="first-table" style="width: 100%">
        <tr>
            <td>
                <div id="status_bar" class="first-status-bar" align='center'>
                    <div style="width: 100%; float: left;">
                        <span style="float: left; margin: 7px 0 0 10px;">ძიების კრიტერიუმები</span>
                        <button type="button" class="btn btn-default" id="btnExport"
                                style="border: 0; font-weight: bold; float: right; margin: 3px 5px 0 0;">
                            დამატება
                        </button>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div style="width: 100%;float: left;">
                    <div class="col-md-1">
                        <label>კატეგორია</label>
                    </div>
                    <div class="col-md-4">
                        <select class="dropdown col-md-2" id="workOrderCategory">
                            <option value="0">-კატეგორია-</option>
                            <% for (int i = 0; i < workOrderCategory.length; i++) { %>
                                <option value="<%=i%>"><%=workOrderCategory[i]%></option>
                            <% } %>
                        </select>
                    </div>
                    <div class="col-md-1">
                        <label>ოთახი</label>
                    </div>
                    <div class="col-md-3">
                        <select class="dropdown col-md-2" id="units">
                            <option value="0">-ოთახის #-</option>
                            <% for (int i = 0; i < rooms.length; i++) { %>
                                <option value="<%=rooms[i].getRoomid()%>"roomtypeid="<%=rooms[i].getRoomtypeid()%>"><%=rooms[i].getName()%></option>
                            <% } %>
                            <% for (int i = 0; i < units.length; i++) { %>
                                <option value="<%=units[i].getHouseunitid()%>"><%=units[i].getName()%></option>
                            <% } %>
                        </select>
                    </div>
                    <div class="col-md-1">
                        <label>პრიორიტეტი</label>
                    </div>
                    <div class="col-md-3">
                        <select class="dropdown col-md-2" id="workOrderPriority">
                            <option value="0">-პრიორიტეტი-</option>
                            <% for (int i = 0; i < workOrderPriority.length; i++) { %>
                                <option value="<%=i%>"><%=workOrderPriority[i]%></option>
                            <% } %>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <button type="button" class="btn btn-danger" style="width: 100%;" id="search_reserve_filer"
                                onclick="doFilter()"
                                style="width: 69px;">ძებნა
                        </button>
                    </div>
                </div>
                <div style="width: 100%;float: left; margin-top: 4px;">
                    <div class="col-md-1">
                        <label>ორდ. #</label>
                    </div>
                    <div class="col-md-4">
                        <input type="text" id="ordernum" placeholder=" ორდ. #"/>
                    </div>
                    <div class="col-md-1">
                        <label>სტატუსი</label>
                    </div>
                    <div class="col-md-3">
                        <select class="dropdown col-md-2" id="workOrderStatus">
                            <option value="0">-სტატუსი-</option>
                            <% for (int i = 0; i < workOrderStatus.length; i++) { %>
                                <option value="<%=i%>"><%=workOrderStatus[i]%></option>
                            <% } %>
                        </select>
                    </div>
                    <div class="col-md-1">
                        <label>მიმაგრებულია</label>
                    </div>
                    <div class="col-md-3">
                        <select class="dropdown col-md-2" id="personnel">
                            <option value="0">-აირჩიეთ-</option>
                            <% for (int i = 0; i < personnelBeans.length; i++) { %>
                            <option value="<%=personnelBeans[i].getPersonnelid()%>"><%=personnelBeans[i].getFname() + " " + personnelBeans[i].getLname()%>
                            </option>
                            <% } %>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <button type="button" class="btn" style="width: 100%;" id="search_filer"
                                onclick="doFilter()"
                                style="width: 69px;">მაჩვენე ყველა
                        </button>
                    </div>
                </div>
                <div style="width: 100%;float: left; height: 18px; line-height: 24px;">
                    <div style="float: left;">
                        <input type="checkbox" name="compl_work_orders" id="compl_work_orders"
                               style="color: #818181;font-weight: normal; margin-left: 5px;"/>
                    </div>
                    <div style="float: left;">
                        &nbsp;შესრულებული სამუშაოების სია
                    </div>
                </div>
            </td>
        </tr>
    </table>
    <table id="grid-table">
        <tr>
            <td>
                <table id='list_work_orders' class="table-striped table-hover" align='center'></table>
            </td>
        </tr>
    </table>
</form>