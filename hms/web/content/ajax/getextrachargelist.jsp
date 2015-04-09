<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%
    //Vector v = new Vector();
    ReservationroomBean rroom = ReservationroomManager.getInstance().loadByPrimaryKey(new Long(request.getParameter("id")));
    FolioBean[] folios = FolioManager.getInstance().loadByReservationroomid(rroom.getReservationroomid());
    String s = "";
    String olds = "";
    for(int i=0;i<folios.length;i++){
        FolioitemBean[] items = FolioitemManager.getInstance().loadByFolioid(folios[i].getFolioid());
        for(int j=0;j<items.length;j++){
            ExtrachargefolioBean[] extras = ExtrachargefolioManager.getInstance().loadByWhere("where folioitemid = "+items[j].getFolioitemid()+" order by extrachargeid");
            for(int k=0;k<extras.length;k++){
                ExtrachargeBean ex = ExtrachargeManager.getInstance().loadByPrimaryKey(extras[k].getExtrachargeid());
                //v.addElement((ExtrachargefolioBean)extras[k]);
                if(olds.indexOf(","+extras[k].getExtrachargeid().toString()) >= 0)    continue;
                olds += ","+extras[k].getExtrachargeid().toString();
                if(s.length() > 0)   s += "; ";
                s += "<a href=\"javascript:editExtracharge1("+items[j].getFolioitemid()+","+extras[k].getExtrachargeid()+","+k+")\">"+ex.getName()+"</a>";
            }
        }
    }
    //session.setAttribute("WALKIN_EXTRACHARGES", (Vector)v);
    
%>
<table width="100%">
    <tbody>
        <tr>
            <td><%=s%></td>
        </tr>
    </tbody>
</table>