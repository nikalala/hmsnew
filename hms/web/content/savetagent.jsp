<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>

<%
    String errorContrName = "";
    Manager.getInstance().beginTransaction();
    try {
        String jsonString = request.getParameter("tagent");
        if (jsonString != null && jsonString.length() > 0) {
            JSONObject json = (JSONObject) JSONSerializer.toJSON(jsonString);
            ContragentBean c = ContragentManager.getInstance().createContragentBean();
            System.out.println(json);
            if (((String) json.get("taddress")).trim() != null) {
                c.setAddress((String) json.get("taddress"));
            }
            if (json.get("taddtobussinesssource") != null && json.get("taddtobussinesssource").toString().length() > 0) {
                c.setBsource(json.get("taddtobussinesssource").equals("on") ? true : false);
            }
            if (json.get("tccblock") != null && json.get("tccblock").toString().length() > 0) {
                c.setCcblock(json.get("tccblock").equals("on") ? true : false);
            }
            if (json.get("tcreateuser") != null && json.get("tcreateuser").toString().length() > 0) {
                c.setCreateuser(json.get("tcreateuser").equals("on") ? true : false);
            }
            if (json.get("tcity") != null) {
                c.setCity((String) json.get("tcity"));
            }
            if (json.get("tcommissionplan") != null) {
                c.setCommissionplan(new Integer(json.get("tcommissionplan").toString()));
            }
            c.setRegbyid(user.getPersonnelid());
            c.setType(2);
            if (json.get("tcontragentid") != null) {
                Long tcontragentid = Long.parseLong((String) json.get("tcontragentid"));
                if (tcontragentid != null && tcontragentid > 0) {
                    c.setContragentid(tcontragentid);
                }
            }


            if (json.get("tcountryid") != null) {
                Integer countryId = Integer.parseInt((String) json.get("tcountryid"));
                if (countryId != null) {
                    c.setCountryid(countryId);
                }
            }

            if (json.get("tsalutation") != null) {
                Integer setSalutationid = Integer.parseInt((String) json.get("tsalutation"));
                if (setSalutationid != null) {
                    c.setCountryid(setSalutationid);
                }
            }

            if (json.get("rinve") != null) {
                Integer rinve = Integer.parseInt((String) json.get("rinve"));
                if (rinve != null) {
                    c.setRoominventory(rinve);
                }
            }

            if (json.get("topenbal") != null) {
                Double topenbal = Double.parseDouble((String) json.get("topenbal"));
                if (topenbal != null) {
                    c.setOpenbalance(topenbal);
                }
            }

            if (json.get("trate") != null) {
                Integer trate = Integer.parseInt((String) json.get("trate"));
                if (trate != null) {
                    c.setRate(trate);
                }
            }

            if (json.get("tvalue") != null) {
                Double tvalue = Double.parseDouble((String) json.get("tvalue"));
                if (tvalue != null) {
                    c.setVal(tvalue);
                }
            }

            if (json.get("temail") != null) {
                c.setEmail((String) json.get("temail"));
            }
            if (json.get("tfax") != null) {
                c.setFax((String) json.get("tfax"));
            }
            if (json.get("tphone") != null) {
                c.setPhone((String) json.get("tphone"));
            }
            if (json.get("tmobile") != null) {
                c.setMobile((String) json.get("tmobile"));
            }
            if (json.get("tcompany") != null) {
                c.setName((String) json.get("tcompany"));
            }
            if ((String) json.get("tcontrname") != null && ((String) json.get("tcontrname")).length() > 0) {
                String[] contr = ((String) json.get("tcontrname")).split(" ");
                if (contr != null && contr.length == 2) {
                    c.setFname(contr[0]);
                    c.setLname(contr[1]);
                } else {
                    errorContrName = "სწორად შეიყვანეთ კონტრაგენტის სახელი და გვარი. მაგ(დავით ბერძენიშვილი)";
                }

            } else {
                errorContrName = "სწორად შეიყვანეთ კონტრაგენტის სახელი და გვარი. მაგ(დავით ბერძენიშვილი)";
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
<%=errorContrName%>