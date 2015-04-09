<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<%

    String errorContrName = "";
    Manager.getInstance().beginTransaction();
    try {
        request.setCharacterEncoding("UTF-8");
        String jsonString = request.getParameter("tagent");
        jsonString = URLDecoder.decode(jsonString, "UTF-8");
        if (jsonString != null && jsonString.length() > 0) {
            JSONObject json = (JSONObject) JSONSerializer.toJSON(jsonString);
            ContragentBean c = null;
            String tid = ((String) json.get("tid"));
            System.out.println(tid);
            if (!CodeHelpers.isNullOrEmpty(tid) && tid.replace("null", "").replace("\"\"", "").length() > 0) {
                System.out.println(tid.replace("null", "").replace("\"\"", ""));
                Long tcontragentid = Long.parseLong((String) json.get("tid"));
                c = ContragentManager.getInstance().loadByPrimaryKey(tcontragentid);
                System.out.println("Contragent Id Set was successful");
            } else {
                c = ContragentManager.getInstance().createContragentBean();
            }

            c.setAddress(((String) json.get("taddress")).trim() != null ? (String) json.get("taddress") : "");

            if (json.get("taddtobussinesssource") != null && json.get("taddtobussinesssource").toString().length() > 0) {
                c.setBsource(json.get("taddtobussinesssource").equals("on"));
            }else{
                c.setBsource(false);
            }

            if (json.get("tcreateuser") != null && json.get("tcreateuser").toString().length() > 0) {
                c.setCreateuser(json.get("tcreateuser").equals("on"));
            }else{
                c.setCreateuser(false);
            }

            c.setCity(json.get("tcity") != null ? (String) json.get("tcity") : "");

            c.setRegbyid(user.getPersonnelid());
            c.setType(1);


            if (json.get("tcterm") != null && ((String)json.get("tcterm")).length() > 0) {
                Integer tcterm = Integer.parseInt((String) json.get("tcterm"));
                c.setCreditterm(tcterm);
            }else{
                c.setCreditterm(null);
            }

            if (json.get("tclimit") != null && ((String)json.get("tclimit")).length() > 0) {
                Long tclimit = Long.parseLong((String) json.get("tclimit"));
                c.setCreditlimit(tclimit);
            }else{
                c.setCreditlimit(null);
            }

            if (json.get("tcountryid") != null && ((String)json.get("tcountryid")).length() > 0) {
                Integer countryId = Integer.parseInt((String) json.get("tcountryid"));
                c.setCountryid(countryId);
            }else{
                c.setCountryid(0);
            }

            if (json.get("tsalutation") != null && ((String)json.get("tsalutation")).length() > 0) {
                Integer setSalutationid = Integer.parseInt((String) json.get("tsalutation"));
                c.setSalutationid(setSalutationid);
            }else{
                c.setSalutationid(0);
            }

            if (json.get("rinve") != null && ((String)json.get("rinve")).length() > 0) {
                Integer rinve = Integer.parseInt((String) json.get("rinve"));
                c.setRoominventory(rinve);
            }else{
                c.setRoominventory(0);
            }

            if (json.get("topenbal") != null  && ((String)json.get("topenbal")).length() > 0) {
                Double topenbal = Double.parseDouble((String) json.get("topenbal"));
                if (topenbal != null) {
                    c.setOpenbalance(topenbal);
                }
            }else{
                c.setOpenbalance(null);
            }

            if (json.get("trate") != null && ((String)json.get("trate")).length() > 0) {
                Integer trate = Integer.parseInt((String) json.get("trate"));
                c.setRate(trate);
            }else{
                c.setRate(0);
            }

            c.setEmail(!CodeHelpers.isNullOrEmpty((String) json.get("temail")) ? (String) json.get("temail") : "");
            c.setFax(!CodeHelpers.isNullOrEmpty((String) json.get("tfax")) ? (String) json.get("tfax") : "");
            c.setPhone(!CodeHelpers.isNullOrEmpty((String) json.get("tphone")) ? (String) json.get("tphone") : "");
            c.setMobile(!CodeHelpers.isNullOrEmpty((String) json.get("tmobile")) ? (String) json.get("tmobile") : "");
            c.setName(!CodeHelpers.isNullOrEmpty((String) json.get("tcompany")) ? (String) json.get("tcompany") : "");

            if ((String) json.get("tcontrname") != null && ((String) json.get("tcontrname")).length() > 0) {
                String[] contr = ((String) json.get("tcontrname")).split(" ");
                if (contr != null && contr.length == 2) {
                    c.setFname(contr[0]);
                    c.setLname(contr[1]);
                } else {
                    errorContrName = "სწორად შეიყვანეთ საკონტაქტო პირის სახელი და გვარი. მაგ(დავით ბერძენიშვილი)";
                }
            } else {
                errorContrName = "სწორად შეიყვანეთ საკონტაქტო პირის სახელი და გვარი. მაგ(დავით ბერძენიშვილი)";
            }

            if (errorContrName.length() > 0) {
                throw new Exception(errorContrName);
            }

            ContragentManager.getInstance().save(c);
            errorContrName = "ok";
        }
        Manager.getInstance().endTransaction(true);
    } catch (Exception e) {
        e.printStackTrace();
        Manager.getInstance().endTransaction(false);
    }
%>
<%="{\"status\":\""+errorContrName+"\"}"%>




