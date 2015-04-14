<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
String s = "";
for(Enumeration e=request.getParameterNames();e.hasMoreElements();){
    String name = (String)e.nextElement();
    String[] val = request.getParameterValues(name);
    if(val == null) val = new String[0];
    s += name+": ";
    for(int i=0;i<val.length;i++)
        s += val[i]+"; ";
    s += "\n";
}
System.out.println(s);
    
JSONObject obj = new JSONObject();
Manager.getInstance().beginTransaction();
try{
       
    int ctype = Integer.parseInt(request.getParameter("contragenttype"));
    
    if(ctype == 4){
        int     salutationid                    =	 Integer.parseInt(request.getParameter("editcontactinfo_salutationid"));
        String	fname                           =	 request.getParameter("editcontactinfo_fname");
        String	lname                           =	 request.getParameter("editcontactinfo_lname");
        int     adultchild                      =	 Integer.parseInt(request.getParameter("editcontactinfo_adultchild"));
        int     editcontactinfo_gender          =	 Integer.parseInt(request.getParameter("editcontactinfo_gender"));
        int     nationality                     =	 Integer.parseInt(request.getParameter("editcontactinfo_nationality"));
        String	idnum                           =	 request.getParameter("editcontactinfo_idnum");
        String	mobile_input                    =	 request.getParameter("editcontactinfo_mobile_input");
        String	phone_input                     =	 request.getParameter("editcontactinfo_phone_input");
        String	email_input                     =	 request.getParameter("editcontactinfo_email_input");
        String	fax_input                       =	 request.getParameter("editcontactinfo_fax_input");
        String	address_textarea                =	 request.getParameter("editcontactinfo_address_textarea");
        int     country_select                  =	 Integer.parseInt(request.getParameter("editcontactinfo_country_select"));
        String	state_input                     =	 request.getParameter("editcontactinfo_state_input");
        String	zip_input                       =	 request.getParameter("editcontactinfo_zip_input");
        int     id_type_select                  =	 Integer.parseInt(request.getParameter("editcontactinfo_id_type_select"));
        String	expiry_date_datepicker          =	 request.getParameter("editcontactinfo_expiry_date_datepicker");
        String	id_no_input                     =	 request.getParameter("editcontactinfo_id_no_input");
        String	birth_date_datepicker           =	 request.getParameter("editcontactinfo_birth_date_datepicker");
        String	company_input                   =	 request.getParameter("editcontactinfo_company_input");
        String	spouse_birth_date_datepicker	=	 request.getParameter("editcontactinfo_spouse_birth_date_datepicker");
        int     vip_status_select               =	 Integer.parseInt(request.getParameter("editcontactinfo_vip_status_select"));
        String	wedding_date_datepicker         =	 request.getParameter("editcontactinfo_wedding_date_datepicker");

        GuestBean guest = GuestManager.getInstance().createGuestBean();

        guest.setSalutationid(salutationid);
        guest.setFname(fname);
        guest.setLname(lname);
        guest.setType(adultchild);
        guest.setGender(editcontactinfo_gender);
        guest.setNationalityid(nationality);
        guest.setIdn(id_no_input);
        guest.setMobile(mobile_input);
        guest.setPhone(phone_input);
        guest.setEmail(email_input);
        guest.setFax(fax_input);
        guest.setAddress(address_textarea);
        guest.setCountryid(country_select);
        guest.setZip(zip_input);
        guest.setIdtypeid(id_type_select);
        guest.setEmail(email_input);
        guest.setVipstatusid(vip_status_select);
        if(wedding_date_datepicker.length() > 0){
            try{
                guest.setWeddingdate(dt.parse(wedding_date_datepicker));
            }catch(Exception ex){
                throw new Exception("არასწორი ქორწინების თარიღი");
            }
        }
        if(spouse_birth_date_datepicker.length() > 0){
            try{
                guest.setSdob(dt.parse(spouse_birth_date_datepicker));
            }catch(Exception ex){
                throw new Exception("არასწორი მეუღლის დაბ. თარიღი");
            }
        }
        if(birth_date_datepicker.length() > 0){
            try{
                guest.setSdob(dt.parse(birth_date_datepicker));
            }catch(Exception ex){
                throw new Exception("არასწორი დაბ. თარიღი");
            }
        }

        if(company_input.length() > 0){
            ContragentBean[] contragent = ContragentManager.getInstance().loadByWhere("where upper(name) = '"+company_input.replaceAll("'", "''").toUpperCase() +"'");
            if(contragent.length == 0){
                contragent = new ContragentBean[1];
                contragent[0] = ContragentManager.getInstance().createContragentBean();
            }
            contragent[0].setName(company_input);
            contragent[0].setType(1);
            contragent[0].setRegbyid(user.getPersonnelid());
            contragent[0] = ContragentManager.getInstance().save(contragent[0]);
            guest.setContragentid(contragent[0].getContragentid());
        }

        guest.setRegbyid(user.getPersonnelid());
        guest = GuestManager.getInstance().save(guest);
        obj.put("id",guest.getGuestid());
    } else {
        int     salutationid                    =	 Integer.parseInt(request.getParameter("editcontactinfo_salutationid"));
        String	business                        =	 request.getParameter("editcontactinfo_business");
        String	name                            =	 request.getParameter("editcontactinfo_name");
        String	mobile_input                    =	 request.getParameter("editcontactinfo_mobile_input");
        String	phone_input                     =	 request.getParameter("editcontactinfo_phone_input");
        String	email_input                     =	 request.getParameter("editcontactinfo_email_input");
        String	fax_input                       =	 request.getParameter("editcontactinfo_fax_input");
        String	address_textarea                =	 request.getParameter("editcontactinfo_address_textarea");
        int     country_select                  =	 Integer.parseInt(request.getParameter("editcontactinfo_country_select"));
        String	zip_input                       =	 request.getParameter("editcontactinfo_zip_input");
        
        String[] names = name.split(" ", 2);

        ContragentBean contragent = ContragentManager.getInstance().createContragentBean();
        contragent.setAddress(address_textarea);
        contragent.setCountryid(country_select);
        contragent.setEmail(email_input);
        contragent.setMobile(mobile_input);
        contragent.setName(business);
        contragent.setPhone(phone_input);
        contragent.setSalutationid(salutationid);
        contragent.setFax(fax_input);
        contragent.setZip(zip_input);
        contragent.setFname(names[0]);
        if(names.length > 1)    contragent.setLname(names[1]);
        contragent = ContragentManager.getInstance().save(contragent);
        
        obj.put("id",contragent.getContragentid());
    }
    Manager.getInstance().endTransaction(true);
    obj.put("result",1);
    
}catch(Exception e){
    e.printStackTrace();
    Manager.getInstance().endTransaction(false);
    obj.put("result",0);
    obj.put("error",e.getMessage());
}
%>
<%=obj.toString()%>
