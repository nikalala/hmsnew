<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
int tp = Integer.parseInt(request.getParameter("tp"));
int stockid = Integer.parseInt(request.getParameter("stockid"));
int stockopertypeid = 0;
if(request.getParameter("stockopertypeid") != null)
    stockopertypeid = Integer.parseInt(request.getParameter("stockopertypeid"));
int contragentid = 0;
if(request.getParameter("contragentid") != null)
    contragentid = Integer.parseInt(request.getParameter("contragentid"));
long productid = 0;
if(request.getParameter("productid") != null)
    productid = Long.parseLong(request.getParameter("productid"));
long stockoperid = Long.parseLong(request.getParameter("stockoperid"));
StockoperBean oper = null;
if(stockoperid > 0){
    oper = StockoperManager.getInstance().loadByPrimaryKey(stockoperid);
}

if(stockid > 0 && stockopertypeid > 0 && contragentid > 0 && productid > 0){
String nm = "ბოთლი";

if(tp == 0){
    ProductBean pr = ProductManager.getInstance().loadByPrimaryKey(productid);
    UnittypeBean ut = UnittypeManager.getInstance().loadByPrimaryKey(pr.getUnittypeid());
    nm = ut.getName();
}
%>
<td align="right" class="gText" valign="top"><%=mand%><b>რაოდენობა</b></td>
<td align="left" class="gText" valign="top" nowrap>
    <input type="text" size="10" name="quantity" id="quantity" class="gTextBtn" value="<%=(oper != null) ? dc.format(oper.getQuantity().doubleValue()):""%>"/>
    <%=nm%>
</td>
<%}%>
