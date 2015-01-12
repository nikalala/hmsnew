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
            ContragentBean c = ContragentManager.getInstance().createContragentBean();
            System.out.println(json);

            String tid = ((String) json.get("tid"));
            if (!CodeHelpers.isNullOrEmpty(tid) && tid.replace("null", "").replace("\"\"", "").length() > 0) {
                System.out.println(tid.replace("null", "").replace("\"\"", ""));
                Long tcontragentid = Long.parseLong((String) json.get("tid"));
                c = ContragentManager.getInstance().loadByPrimaryKey(tcontragentid);
                if (tcontragentid != null && tcontragentid > 0) {
                    c.setContragentid(tcontragentid);
                }
            } else {
                c = ContragentManager.getInstance().createContragentBean();
            }
            String add = (String) json.get("taddress");
            c.setAddress(!CodeHelpers.isNullOrEmpty(add) && add.replace("\\r\\n","").trim() != "" ? (String) json.get("taddress") : null);
            System.out.println(c.getAddress());
            c.setBsource(!CodeHelpers.isNullOrEmpty((String) json.get("taddtobussinesssource")) ? json.get("taddtobussinesssource").equals("on") : false);
            c.setCcblock(!CodeHelpers.isNullOrEmpty((String) json.get("tccblock")) ? json.get("tccblock").equals("on") : false);
            c.setCreateuser(!CodeHelpers.isNullOrEmpty((String) json.get("tcreateuser")) ? json.get("tcreateuser").equals("on") : false);
            c.setCity(json.get("tcity") != null ? (String) json.get("tcity") : "");
            if (!CodeHelpers.isNullOrEmpty((String) json.get("tcommissionplan"))) {
                Integer tcommissionplan = Integer.parseInt((String) json.get("tcommissionplan"));
                c.setCommissionplan(tcommissionplan);
            }else{
                c.setCommissionplan(null);
            }

            c.setRegbyid(user.getPersonnelid());
            c.setType(2);
            if (!CodeHelpers.isNullOrEmpty((String) json.get("tcontragentid"))) {
                Long tcontragentid = Long.parseLong((String) json.get("tcontragentid"));
                c.setContragentid(tcontragentid);
            }else{
                c.setContragentid(0);
            }

            if (!CodeHelpers.isNullOrEmpty((String) json.get("tcountryid"))) {
                Integer countryId = Integer.parseInt((String) json.get("tcountryid"));
                c.setCountryid(countryId);
            }else{
                c.setCountryid(0);
            }

            if (!CodeHelpers.isNullOrEmpty((String) json.get("tsalutation"))) {
                Integer setSalutationid = Integer.parseInt((String) json.get("tsalutation"));
                c.setSalutationid(setSalutationid);
            }else{
                c.setSalutationid(null);
            }

            if (!CodeHelpers.isNullOrEmpty((String) json.get("rinve"))) {
                Integer rinve = Integer.parseInt((String) json.get("rinve"));
                c.setRoominventory(rinve);
            }else{
                c.setRoominventory(0);
            }

            if (!CodeHelpers.isNullOrEmpty((String) json.get("topenbal"))) {
                Double topenbal = Double.parseDouble((String) json.get("topenbal"));
                if (topenbal != null) {
                    c.setOpenbalance(topenbal);
                }else{
                    c.setOpenbalance(null);
                }
            }else{
                c.setOpenbalance(null);
            }

            if (!CodeHelpers.isNullOrEmpty((String) json.get("trate"))) {
                Integer trate = Integer.parseInt((String) json.get("trate"));
                c.setRate(trate);
            }else{
                c.setRate(0);
            }

            if (!CodeHelpers.isNullOrEmpty((String) json.get("tvalue"))) {
                Double tvalue = Double.parseDouble((String) json.get("tvalue"));
                if (tvalue != null) {
                    c.setVal(tvalue);
                }else{
                    c.setVal(null);
                }
            }else{
                c.setVal(null);
            }

            c.setEmail(!CodeHelpers.isNullOrEmpty((String) json.get("temail")) ? (String) json.get("temail") : "");
            c.setZip(!CodeHelpers.isNullOrEmpty((String) json.get("zip")) ? (String) json.get("zip") : "");
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
                    errorContrName = "სწორად შეიყვანეთ ტურისტული აგენტის სახელი და გვარი. მაგ(დავით ბერძენიშვილი)";
                }

            } else {
                errorContrName = "სწორად შეიყვანეთ ტურისტული აგენტის სახელი და გვარი. მაგ(დავით ბერძენიშვილი)";
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
<%="{\"status\":\"" + errorContrName + "\"}"%>




