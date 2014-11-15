<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%
int actiontype = Integer.parseInt(request.getParameter("actiontype"));
    
switch(actiontype){
    case -1:
        %>
        <option value="-1">--აირჩიეთ--</option>
        <%
        break;
    case 0:
        %>
        <option value="0">დამრგვალება</option>
        <%
        break;
    case 1:
        PaymentmethodBean[] pm1 = PaymentmethodManager.getInstance().loadByWhere("where active = true and deleted = false and paymentmode = 1 order by name");
        for(int i=0;i<pm1.length;i++){
        %>
        <option value="<%=pm1[i].getPaymentmethodid()%>"><%=pm1[i].getName()%></option>
        <%
        }
        break;
    case 2:
        PaymentmethodBean[] pm2 = PaymentmethodManager.getInstance().loadByWhere("where active = true and deleted = false and paymentmode = 0 order by name");
        for(int i=0;i<pm2.length;i++){
        %>
        <option value="<%=pm2[i].getPaymentmethodid()%>"><%=pm2[i].getName()%></option>
        <%
        }
        break;
    case 3:
        ContragentBean[] cn = ContragentManager.getInstance().loadByWhere("where deleted = false order by name, lname");
        for(int i=0;i<cn.length;i++){
            String cname = cn[i].getName();
            if(cname == null)   cname = cn[i].getFname()+" "+cn[i].getLname();
        %>
        <option value="<%=cn[i].getContragentid()%>"><%=cname%></option>
        <%
        }
        break;
    case 4:
        DiscountBean[] ds = DiscountManager.getInstance().loadByWhere("where active = true and deleted = false order by name");
        for(int i=0;i<ds.length;i++){
            String cname = ds[i].getName();
            if(ds[i].getVal() != null){
                cname += " " + dc.format(ds[i].getVal());
                if(ds[i].getPerctype().booleanValue())  cname += "%";
                else                                    cname += maincurrency.getCode();
            }
        %>
        <option value="<%=ds[i].getDiscountid()%>"><%=cname%></option>
        <%
        }
        break;
    case 5:
        ExtrachargeBean[] ex = ExtrachargeManager.getInstance().loadByWhere("where active = true and deleted = false order by name");
        for(int i=0;i<ex.length;i++){
            String cname = ex[i].getName();
        %>
        <option value="<%=ex[i].getExtrachargeid()%>"><%=cname%></option>
        <%
        }
        break;
    case 6:
        for(int i=0;i<accounts.length;i++){
        %>
        <option value="<%=i%>"><%=accounts[i]%></option>
        <%
        }
        break;
    case 7:
        
        %>
        <option value="-1">--აირჩიეთ--</option>
        <%
        
        break;
}
%>
