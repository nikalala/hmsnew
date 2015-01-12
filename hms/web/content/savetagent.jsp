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
            if (((String) json.get("taddress")).trim() != "") {
                c.setAddress((String) json.get("taddress"));
            }
            if (!CodeHelpers.isNullOrEmpty((String) json.get("taddtobussinesssource"))) {
                c.setBsource(json.get("taddtobussinesssource").equals("on"));
            }
            if (!CodeHelpers.isNullOrEmpty((String) json.get("tccblock"))) {
                c.setCcblock(json.get("tccblock").equals("on"));
            }
            if (!CodeHelpers.isNullOrEmpty((String) json.get("tcreateuser"))) {
                c.setCreateuser(json.get("tcreateuser").equals("on"));
            }
            if (json.get("tcity") != null) {
                c.setCity((String) json.get("tcity"));
            }

            if (!CodeHelpers.isNullOrEmpty((String) json.get("tcommissionplan"))) {
                Integer tcommissionplan = Integer.parseInt((String) json.get("tcommissionplan"));
                if (tcommissionplan != null) {
                    c.setCommissionplan(tcommissionplan);
                }
            }

            c.setRegbyid(user.getPersonnelid());
            c.setType(2);
            if (!CodeHelpers.isNullOrEmpty((String) json.get("tcontragentid"))) {
                Long tcontragentid = Long.parseLong((String) json.get("tcontragentid"));
                if (tcontragentid != null && tcontragentid > 0) {
                    c.setContragentid(tcontragentid);
                }
            }

            if (!CodeHelpers.isNullOrEmpty((String) json.get("tcountryid"))) {
                Integer countryId = Integer.parseInt((String) json.get("tcountryid"));
                if (countryId != null) {
                    c.setCountryid(countryId);
                }
            }

            if (!CodeHelpers.isNullOrEmpty((String) json.get("tsalutation"))) {
                Integer setSalutationid = Integer.parseInt((String) json.get("tsalutation"));
                if (setSalutationid != null) {
                    c.setCountryid(setSalutationid);
                }
            }

            if (!CodeHelpers.isNullOrEmpty((String) json.get("rinve"))) {
                Integer rinve = Integer.parseInt((String) json.get("rinve"));
                if (rinve != null) {
                    c.setRoominventory(rinve);
                }
            }

            if (!CodeHelpers.isNullOrEmpty((String) json.get("topenbal"))) {
                Double topenbal = Double.parseDouble((String) json.get("topenbal"));
                if (topenbal != null) {
                    c.setOpenbalance(topenbal);
                }
            }

            if (!CodeHelpers.isNullOrEmpty((String) json.get("trate"))) {
                Integer trate = Integer.parseInt((String) json.get("trate"));
                if (trate != null) {
                    c.setRate(trate);
                }
            }

            if (!CodeHelpers.isNullOrEmpty((String) json.get("tvalue"))) {
                Double tvalue = Double.parseDouble((String) json.get("tvalue"));
                if (tvalue != null) {
                    c.setVal(tvalue);
                }
            }

            if (!CodeHelpers.isNullOrEmpty((String) json.get("temail"))) {
                c.setEmail((String) json.get("temail"));
            }
            if (!CodeHelpers.isNullOrEmpty((String) json.get("zip"))) {
                c.setZip((String) json.get("zip"));
            }
            if (!CodeHelpers.isNullOrEmpty((String) json.get("tfax"))) {
                c.setFax((String) json.get("tfax"));
            }
            if (!CodeHelpers.isNullOrEmpty((String) json.get("tphone"))) {
                c.setPhone((String) json.get("tphone"));
            }
            if (!CodeHelpers.isNullOrEmpty((String) json.get("tmobile"))) {
                c.setMobile((String) json.get("tmobile"));
            }
            if (!CodeHelpers.isNullOrEmpty((String) json.get("tcompany"))) {
                c.setName((String) json.get("tcompany"));
            }
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




