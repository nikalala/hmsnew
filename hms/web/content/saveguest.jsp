<%@ page import="org.apache.xmlbeans.impl.xb.ltgfmt.Code" %>
<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<%

    String errorContrName = "";
    Manager.getInstance().beginTransaction();
    try {
        request.setCharacterEncoding("UTF-8");
        String jsonString = request.getParameter("guest");
        jsonString = URLDecoder.decode(jsonString, "UTF-8");
        System.out.println(jsonString);
        if (!CodeHelpers.isNullOrEmpty((String) jsonString) && jsonString.length() > 0) {
            JSONObject json = (JSONObject) JSONSerializer.toJSON(jsonString);
            GuestBean c = null;

            String tid = ((String) json.get("tid"));
            if (!CodeHelpers.isNullOrEmpty(tid) && tid.replace("null","").replace("\"\"","").length() > 0) {
                System.out.println(tid.replace("null","").replace("\"\"",""));
                Long tcontragentid = Long.parseLong((String) json.get("tid"));
                c = GuestManager.getInstance().loadByPrimaryKey(tcontragentid);
                if (tcontragentid != null && tcontragentid > 0) {
                    c.setGuestid(tcontragentid);
                }
            }else{
                c = GuestManager.getInstance().createGuestBean();
            }
            if (!CodeHelpers.isNullOrEmpty((String) json.get("contragent"))) {
                Long tcontragentid = Long.parseLong((String) json.get("contragent"));
                if (tcontragentid > 0) {
                    c.setContragentid(tcontragentid);
                }
            }else{
                c.setContragentid(null);
            }

            if (!CodeHelpers.isNullOrEmpty((String) json.get("tcountryid"))) {
                Integer countryId = Integer.parseInt((String) json.get("tcountryid"));
                c.setCountryid(countryId);
            }else{
                c.setCountryid(null);
            }
            if (!CodeHelpers.isNullOrEmpty((String) json.get("vipstatus"))) {
                Integer vipstatus = Integer.parseInt((String) json.get("vipstatus"));
                c.setVipstatusid(vipstatus);
            }else{
                c.setVipstatusid(null);
            }
            if (!CodeHelpers.isNullOrEmpty((String) json.get("tsalutation"))) {
                Integer setSalutationid = Integer.parseInt((String) json.get("tsalutation"));
                c.setSalutationid(setSalutationid);
            }else{
                c.setSalutationid(0);
            }
            if (!CodeHelpers.isNullOrEmpty((String) json.get("nationality"))) {
                Integer nationality = Integer.parseInt((String) json.get("nationality"));
                c.setNationalityid(nationality);
            }else{
                c.setNationalityid(null);
            }
            if (!CodeHelpers.isNullOrEmpty((String) json.get("paymentmethods"))) {
                Integer paymentmethods = Integer.parseInt((String) json.get("paymentmethods"));
                c.setPaymentmethodid(paymentmethods);
            }else{
                c.setPaymentmethodid(null);
            }
            if (!CodeHelpers.isNullOrEmpty((String) json.get("idtype"))) {
                Integer idtype = Integer.parseInt((String) json.get("idtype"));
                c.setIdtypeid(idtype);
            }else{
                c.setIdtypeid(null);
            }


            if (!CodeHelpers.isNullOrEmpty((String) json.get("txtaddress"))) {
                c.setAddress((String) json.get("txtaddress"));
            }else{
                c.setAddress("");
            }

            if (!CodeHelpers.isNullOrEmpty((String) json.get("type"))) {
                Integer type = Integer.parseInt((String) json.get("type"));
                c.setType(type);
            }else{
                c.setType(null);
            }
            if (!CodeHelpers.isNullOrEmpty((String) json.get("gender"))) {
                Integer g = Integer.parseInt((String) json.get("gender"));
                c.setGender(g);
            }else{
                c.setGender(null);
            }

            if (!CodeHelpers.isNullOrEmpty((String) json.get("txtcity"))) {
                c.setCity((String) json.get("txtcity"));
            }else{
                c.setCity("");
            }

            c.setRegbyid(user.getPersonnelid());

            if (!CodeHelpers.isNullOrEmpty((String) json.get("birthdate"))) {
                String d = (String)json.get("birthdate");
                c.setDob(dt.parse(d));
            }else{
                c.setDob(null);
            }
            if (!CodeHelpers.isNullOrEmpty((String) json.get("wifebirthdate"))) {
                String d = (String)json.get("wifebirthdate");
                c.setSdob(dt.parse(d));
            }else{
                c.setSdob(null);
            }
            if (!CodeHelpers.isNullOrEmpty((String) json.get("weddingyeardate"))) {
                String d = (String)json.get("weddingyeardate");
                c.setWeddingdate(dt.parse(d));
            }else{
                c.setWeddingdate(null);
            }


            c.setEmail(!CodeHelpers.isNullOrEmpty((String) json.get("email")) ? (String) json.get("email") : "");
            c.setZip(!CodeHelpers.isNullOrEmpty((String) json.get("zip")) ? (String) json.get("zip") : "");
            c.setFax(!CodeHelpers.isNullOrEmpty((String) json.get("fax")) ? (String) json.get("fax") : "");
            c.setPhone(!CodeHelpers.isNullOrEmpty((String) json.get("phone")) ? (String) json.get("phone") : "");
            c.setMobile(!CodeHelpers.isNullOrEmpty((String) json.get("mobile")) ? (String) json.get("mobile") : "");
            c.setIdn(!CodeHelpers.isNullOrEmpty((String) json.get("idno")) ? (String) json.get("idno") : "");

            if (!CodeHelpers.isNullOrEmpty((String) json.get("guest")) && ((String) json.get("guest")).length() > 0) {
                String[] contr = ((String) json.get("guest")).split(" ");
                if (contr.length == 2) {
                    c.setFname(contr[0]);
                    c.setLname(contr[1]);
                } else {
                    errorContrName = "სწორად შეიყვანეთ სტუმრის სახელი და გვარი. მაგ(დავით ბერძენიშვილი)";
                }
            } else {
                errorContrName = "სწორად შეიყვანეთ სტუმრის სახელი და გვარი. მაგ(დავით ბერძენიშვილი)";
            }
            if (errorContrName.length() > 0) {
                throw new Exception(errorContrName);
            }
            GuestManager.getInstance().save(c);
            errorContrName = "ok";
        }
        Manager.getInstance().endTransaction(true);
    } catch (Exception e) {
        e.printStackTrace();
        Manager.getInstance().endTransaction(false);
    }
%>
<%="{\"status\":\"" + errorContrName + "\"}"%>



