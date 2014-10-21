<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../../includes/init.jsp"%>
<%
SimpleDateFormat sdt0 = new SimpleDateFormat("yyyy-MM-dd");
SimpleDateFormat sdt1 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
String msg = "";

String sid = "0";
String oper = request.getParameter("oper");
Manager.getInstance().beginTransaction();
try{
    if(oper.equalsIgnoreCase("del")){
        sid = request.getParameter("id");
        TariffroomtypeManager.getInstance().deleteByTarifftypeid(new Integer(sid));
        TarifftypeManager.getInstance().deleteByPrimaryKey(new Integer(sid));
        ChangelogBean chlog = ChangelogManager.getInstance().createChangelogBean();
        chlog.setChangebyid(user.getPersonellid());
        chlog.setName("TARIFFTYPE");
        chlog.setId(new Long(sid));
        chlog = ChangelogManager.getInstance().save(chlog);
    } else if(oper.equalsIgnoreCase("edit")){
        sid = request.getParameter("id");
        TarifftypeBean trf = TarifftypeManager.getInstance().loadByPrimaryKey(new Integer(sid));
        
        String name=request.getParameter("name").trim();
        String nickname=request.getParameter("nickname").trim();
        int numnights = Integer.parseInt(request.getParameter("numnights"));
        int maxadolt = Integer.parseInt(request.getParameter("maxadolt"));
        int minnight = Integer.parseInt(request.getParameter("minnight"));
        int ord = Integer.parseInt(request.getParameter("ord"));
        String status=request.getParameter("status");
        String[] rtype = request.getParameter("rtype").split(",");
        if(rtype == null)   rtype = new String[0];
        
        trf.setMaxadolt(maxadolt);
        trf.setMinnight(minnight);
        trf.setName(name);
        trf.setNickname(nickname);
        trf.setNumnights(numnights);
        trf.setOrd(ord);
        
        if(status.equalsIgnoreCase("აქტიური"))   trf.setStatus(true);
        else                                trf.setStatus(false);
        
        trf = TarifftypeManager.getInstance().save(trf);
        
        TariffroomtypeManager.getInstance().deleteByTarifftypeid(trf.getTarifftypeid());
        for(int i=0;i<rtype.length;i++){
            TariffroomtypeBean trfrm = TariffroomtypeManager.getInstance().createTariffroomtypeBean();
            trfrm.setTarifftypeid(trf.getTarifftypeid());
            trfrm.setRoomtypeid(new Integer(rtype[i].trim()));
            trfrm = TariffroomtypeManager.getInstance().save(trfrm);
        }
                
        ChangelogBean chlog = ChangelogManager.getInstance().createChangelogBean();
        chlog.setChangebyid(user.getPersonellid());
        chlog.setName("TARIFFTYPE");
        chlog.setId(trf.getTarifftypeid());
        chlog = ChangelogManager.getInstance().save(chlog);
    } else if(oper.equalsIgnoreCase("add")){
        TarifftypeBean trf = TarifftypeManager.getInstance().createTarifftypeBean();
        
        String name=request.getParameter("name").trim();
        String nickname=request.getParameter("nickname").trim();
        int numnights = Integer.parseInt(request.getParameter("numnights"));
        int maxadolt = Integer.parseInt(request.getParameter("maxadolt"));
        int minnight = Integer.parseInt(request.getParameter("minnight"));
        int ord = Integer.parseInt(request.getParameter("ord"));
        String status=request.getParameter("status");
        
        String[] rtype = request.getParameter("rtype").split(",");
        if(rtype == null)   rtype = new String[0];
        
        trf.setMaxadolt(maxadolt);
        trf.setMinnight(minnight);
        trf.setName(name);
        trf.setNickname(nickname);
        trf.setNumnights(numnights);
        trf.setOrd(ord);
        
        if(status.equalsIgnoreCase("აქტიური"))   trf.setStatus(true);
        else                                trf.setStatus(false);
        
        trf = TarifftypeManager.getInstance().save(trf);
        
        TariffroomtypeManager.getInstance().deleteByTarifftypeid(trf.getTarifftypeid());
        for(int i=0;i<rtype.length;i++){
            TariffroomtypeBean trfrm = TariffroomtypeManager.getInstance().createTariffroomtypeBean();
            trfrm.setTarifftypeid(trf.getTarifftypeid());
            trfrm.setRoomtypeid(new Integer(rtype[i].trim()));
            trfrm = TariffroomtypeManager.getInstance().save(trfrm);
        }
                
        ChangelogBean chlog = ChangelogManager.getInstance().createChangelogBean();
        chlog.setChangebyid(user.getPersonellid());
        chlog.setName("TARIFFTYPE");
        chlog.setId(trf.getTarifftypeid());
        chlog = ChangelogManager.getInstance().save(chlog);
        
        sid = trf.getTarifftypeid().toString();
        
    }

    Manager.getInstance().endTransaction(true);
    msg = "{\"result\":1,\"id\":"+sid+"}";
}catch(Exception e){
    Manager.getInstance().endTransaction(false);
    e.printStackTrace();
    msg = "{\"result\":0,\"error\":\""+e.getMessage().replaceAll("\n"," ").replaceAll("\"", "\\\\\"")+"\"}"; 
    }
%>
<%=msg%>
