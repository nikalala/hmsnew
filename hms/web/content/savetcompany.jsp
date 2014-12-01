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

            if (((String) json.get("taddress")).trim() != null) {
                c.setAddress((String) json.get("taddress"));
            }

            if (json.get("taddtobussinesssource") != null && json.get("taddtobussinesssource").toString().length() > 0) {
                c.setBsource(json.get("taddtobussinesssource").equals("on") ? true : false);
            }

            if (json.get("tcreateuser") != null && json.get("tcreateuser").toString().length() > 0) {
                c.setCreateuser(json.get("tcreateuser").equals("on") ? true : false);
            }

            if (json.get("tcity") != null) {
                c.setCity((String) json.get("tcity"));
            }

            c.setRegbyid(user.getPersonnelid());
            c.setType(1);

            if (json.get("tcontragentid") != null && ((String)json.get("tcontragentid")).length() > 0) {
                Long tcontragentid = Long.parseLong((String) json.get("tcontragentid"));
                if (tcontragentid != null && tcontragentid > 0) {
                    c.setContragentid(tcontragentid);
                }
            }

            if (json.get("tcterm") != null && ((String)json.get("tcterm")).length() > 0) {
                Integer tcterm = Integer.parseInt((String) json.get("tcterm"));
                if (tcterm != null && tcterm > 0) {
                    c.setCreditterm(tcterm);
                }
            }

            if (json.get("tclimit") != null && ((String)json.get("tclimit")).length() > 0) {
                Long tclimit = Long.parseLong((String) json.get("tclimit"));
                if (tclimit != null && tclimit > 0) {
                    c.setCreditlimit(tclimit);
                }
            }

            if (json.get("tcountryid") != null && ((String)json.get("tcountryid")).length() > 0) {
                Integer countryId = Integer.parseInt((String) json.get("tcountryid"));
                if (countryId != null) {
                    c.setCountryid(countryId);
                }
            }

            if (json.get("tsalutation") != null && ((String)json.get("tsalutation")).length() > 0) {
                Integer setSalutationid = Integer.parseInt((String) json.get("tsalutation"));
                if (setSalutationid != null) {
                    c.setCountryid(setSalutationid);
                }
            }

            if (json.get("rinve") != null && ((String)json.get("rinve")).length() > 0) {
                Integer rinve = Integer.parseInt((String) json.get("rinve"));
                if (rinve != null) {
                    c.setRoominventory(rinve);
                }
            }

            if (json.get("topenbal") != null  && ((String)json.get("topenbal")).length() > 0) {
                Double topenbal = Double.parseDouble((String) json.get("topenbal"));
                if (topenbal != null) {
                    c.setOpenbalance(topenbal);
                }
            }

            if (json.get("trate") != null && ((String)json.get("trate")).length() > 0) {
                Integer trate = Integer.parseInt((String) json.get("trate"));
                if (trate != null) {
                    c.setRate(trate);
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




