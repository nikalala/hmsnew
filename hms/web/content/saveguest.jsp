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
            GuestBean c = GuestManager.getInstance().createGuestBean();

            if (!CodeHelpers.isNullOrEmpty((String) json.get("contragent"))) {
                Long tcontragentid = Long.parseLong((String) json.get("contragent"));
                if (tcontragentid > 0) {
                    c.setContragentid(tcontragentid);
                }
            }

            if (!CodeHelpers.isNullOrEmpty((String) json.get("tcountryid"))) {
                Integer countryId = Integer.parseInt((String) json.get("tcountryid"));
                c.setCountryid(countryId);
            }
            if (!CodeHelpers.isNullOrEmpty((String) json.get("tsalutation"))) {
                Integer setSalutationid = Integer.parseInt((String) json.get("tsalutation"));
                c.setSalutationid(setSalutationid);
            }
            if (!CodeHelpers.isNullOrEmpty((String) json.get("nationality"))) {
                Integer nationality = Integer.parseInt((String) json.get("nationality"));
                c.setNationalityid(nationality);
            }
            if (!CodeHelpers.isNullOrEmpty((String) json.get("paymentmethods"))) {
                Integer paymentmethods = Integer.parseInt((String) json.get("paymentmethods"));
                c.setPaymentmethodid(paymentmethods);
            }
            if (!CodeHelpers.isNullOrEmpty((String) json.get("idtype"))) {
                Integer idtype = Integer.parseInt((String) json.get("idtype"));
                c.setIdtypeid(idtype);
            }


            if (!CodeHelpers.isNullOrEmpty((String) json.get("txtaddress"))) {
                c.setAddress((String) json.get("txtaddress"));
            }
            if (!CodeHelpers.isNullOrEmpty((String) json.get("type")) && json.get("type").toString().length() > 0) {
                c.setType(json.get("type").equals("on") ? 1 : 0);
            }
            if (!CodeHelpers.isNullOrEmpty((String) json.get("gender")) && json.get("gender").toString().length() > 0) {
                c.setGender(json.get("gender").equals("on") ? 1 : 0);
            }
            if (!CodeHelpers.isNullOrEmpty((String) json.get("txtcity"))) {
                c.setCity((String) json.get("txtcity"));
            }
            c.setRegbyid(user.getPersonnelid());
            if(if (!CodeHelpers.isNullOrEmpty((String) json.get("birthdate"))) {)
            if (!CodeHelpers.isNullOrEmpty((String) json.get("birthdate"))) {
                SimpleDateFormat birthdate = new SimpleDateFormat(arrdepdateformats[dff]);
                Date d = birthdate.parse(json.get("birthdate").toString());
                c.setDob(d);
            }
            if (!CodeHelpers.isNullOrEmpty((String) json.get("wifebirthdate"))) {
                SimpleDateFormat birthdate = new SimpleDateFormat(arrdepdateformats[dff]);
                Date d = birthdate.parse(json.get("wifebirthdate").toString());
                c.setSdob(d);
            }
            if (!CodeHelpers.isNullOrEmpty((String) json.get("weddingyeardate"))) {
                SimpleDateFormat birthdate = new SimpleDateFormat(arrdepdateformats[dff]);
                Date d = birthdate.parse(json.get("weddingyeardate").toString());
                c.setWeddingdate(d);
            }

            if (!CodeHelpers.isNullOrEmpty((String) json.get("email"))) {
                c.setEmail((String) json.get("email"));
            }
            if (!CodeHelpers.isNullOrEmpty((String) json.get("zip"))) {
                c.setZip((String) json.get("zip"));
            }
            if (!CodeHelpers.isNullOrEmpty((String) json.get("fax"))) {
                c.setFax((String) json.get("fax"));
            }
            if (!CodeHelpers.isNullOrEmpty((String) json.get("phone"))) {
                c.setPhone((String) json.get("phone"));
            }
            if (!CodeHelpers.isNullOrEmpty((String) json.get("mobile"))) {
                c.setMobile((String) json.get("mobile"));
            }
            if (!CodeHelpers.isNullOrEmpty((String) json.get("idno"))) {
                c.setIdn((String) json.get("idno"));
            }
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



