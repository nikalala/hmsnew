<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%
String type = request.getParameter("type");
ContragentBean[] companies = ContragentManager.getInstance().loadByWhere("where type = 1 order by name");
MarketBean[] markets = MarketManager.getInstance().loadByWhere("order by name");
BsourceBean[] bsources = BsourceManager.getInstance().loadByWhere("order by name");
%>
<script>
    $(document).ready(function(){
        
    });
</script>
<table class="table table-borderless">
    <tr>
        <td class="tbllabel" style="width: 50px;">კომპანია</td>
        <td>
            <form class="form-inline" role="form">
            <div class="form-group">
                <div class="input-group">
                    <select class="form-control dropdown" name="wlakin_other_companyid" id="wlakin_other_companyid" style="width: 100px;">
                        <option value="0">--აირჩიეთ--</option>
                        <%
                        for(int i=0;i<companies.length;i++){
                        %>
                        <option value="<%=companies[i].getContragentid()%>"><%=companies[i].getName()%></option>
                        <%
                        }
                        %>
                    </select>
                    <div class="input-group-addon glyphicon glyphicon-plus" style="color: green; cursor: pointer;" onclick="newmWindow1('company','კომპანია','')"></div>
                    <div class="input-group-addon glyphicon glyphicon-search" style="cursor: pointer;" onclick="walkinNameSearch1('wlakin_other_companyid',1)"></div>
                </div>
            </div>
            </form>
        </td>
    </tr>
    <tr>
        <td class="tbllabel" style="width: 50px;">სეგმენტი</td>
        <td>
            <form class="form-inline" role="form">
            <div class="form-group">
                <div class="input-group-xs">
                    <select class="form-control dropdown" name="wlakin_other_marketid" id="wlakin_other_marketid" style="width: 165px;">
                        <option value="0">--აირჩიეთ--</option>
                        <%
                        for(int i=0;i<markets.length;i++){
                        %>
                        <option value="<%=markets[i].getMarketid()%>"><%=markets[i].getName()%></option>
                        <%
                        }
                        %>
                    </select>
                </div>
            </div>
            </form>
        </td>
    </tr>
    <tr>
        <td class="tbllabel" style="width: 50px;">ბიზნეს-წყარო</td>
        <td>
            <form class="form-inline" role="form">
            <div class="form-group">
                <div class="input-group-xs">
                    <select class="form-control dropdown" name="wlakin_other_bsourceid" id="wlakin_other_bsourceid" style="width: 165px;">
                        <option value="0">--აირჩიეთ--</option>
                        <%
                        for(int i=0;i<bsources.length;i++){
                        %>
                        <option value="<%=bsources[i].getBsourceid()%>"><%=bsources[i].getName()%></option>
                        <%
                        }
                        %>
                    </select>
                </div>
            </div>
            </form>
        </td>
    </tr>
</table>