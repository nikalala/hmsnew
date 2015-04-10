<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../includes/init.jsp" %>
<%
  Vector v = new Vector();

panelitem pi = new panelitem();
pi.setId("editcontactinfo_label1");
pi.setLabel("სახელი");
pi.setSql("");
pi.setType(8);
pi.setVal("");
pi.setX(0);
pi.setY(0);
pi.setColmd(2);
v.addElement((panelitem)pi);

pi = new panelitem();
pi.setId("editcontactinfo_salutationid");
pi.setLabel("");
pi.setSize1(20);
pi.setSql("select salutationid, name from salutation order by name");
pi.setType(2);
pi.setVal("");
pi.setX(1);
pi.setY(0);
pi.setColmd(2);
v.addElement((panelitem)pi);

pi = new panelitem();
pi.setId("editcontactinfo_fname");
pi.setPlaceholder("სახელი");
pi.setSize1(20);
pi.setSql("");
pi.setType(0);
pi.setVal("");
pi.setX(2);
pi.setY(0);
pi.setColmd(5);
v.addElement((panelitem)pi);

pi = new panelitem();
pi.setId("editcontactinfo_lname");
pi.setPlaceholder("გვარი");
pi.setSize1(20);
pi.setSql("");
pi.setType(0);
pi.setVal("");
pi.setX(3);
pi.setY(0);
pi.setColmd(5);
v.addElement((panelitem)pi);

pi = new panelitem();
pi.setId("editcontactinfo_search");
pi.setClassname("search");
pi.setSql("");
pi.setType(7);
pi.setVal("");
pi.setOnclick("");
pi.setX(4);
pi.setY(0);
pi.setColmd(2);
v.addElement((panelitem)pi);

pi = new panelitem();
pi.setId("editcontactinfo_adultchild");
pi.setLabel("უფროსი/ბავშვი");
pi.setSql("");
pi.setType(8);
pi.setVal("");
pi.setX(0);
pi.setY(1);
pi.setColmd(5);
v.addElement((panelitem)pi);

pi = new panelitem();
pi.setId("editcontactinfo_adultchild");
pi.setLabel("");
pi.setSql("");
pi.setValues(pax);
pi.setType(3);
pi.setVal("");
pi.setX(1);
pi.setY(1);
pi.setColmd(11);
v.addElement((panelitem)pi);

pi = new panelitem();
pi.setId("editcontactinfo_gender");
pi.setLabel("სქესი");
pi.setSql("");
pi.setType(8);
pi.setVal("");
pi.setX(0);
pi.setY(2);
pi.setColmd(5);
v.addElement((panelitem)pi);

pi = new panelitem();
pi.setId("editcontactinfo_gender");
pi.setLabel("");
pi.setSql("");
pi.setValues(gender);
pi.setType(3);
pi.setVal("");
pi.setX(1);
pi.setY(2);
pi.setColmd(11);
v.addElement((panelitem)pi);

pi = new panelitem();
pi.setId("editcontactinfo_nationality");
pi.setLabel("ეროვნება");
pi.setSql("");
pi.setType(8);
pi.setVal("");
pi.setX(0);
pi.setY(3);
pi.setColmd(5);
v.addElement((panelitem)pi);

pi = new panelitem();
pi.setId("editcontactinfo_nationality");
pi.setLabel("");
pi.setSql("select nationalityid, name from nationality order by name");
pi.setType(2);
pi.setVal("");
pi.setX(1);
pi.setY(3);
pi.setColmd(6);
v.addElement((panelitem)pi);

pi = new panelitem();
pi.setId("editcontactinfo_idnum");
pi.setLabel("");
pi.setPlaceholder("რეგისტრაციის ნომერი");
pi.setSize1(20);
pi.setSql("");
pi.setType(0);
pi.setVal("");
pi.setX(2);
pi.setY(3);
pi.setColmd(5);
v.addElement((panelitem)pi);

panel[] pl = new panel[2];
pl[0] = new panel();
pl[0].setClassnames("");
pl[0].setHeight("350");
pl[0].setId("geninfo");
pl[0].setTitle("ზოგადი ინფორმაცია");
pl[0].setColmd(8);
pl[0].setPanelitems(v);

pl[1] = new panel();
pl[1].setClassnames("");
pl[1].setHeight("350");
pl[1].setId("geninfo");
pl[1].setTitle("ზოგადი ინფორმაცია");
pl[1].setColmd(8);
pl[1].setPanelitems(v);
  
  button[] btns = new button[2];
  btns[0] = new button();
  btns[0].setAction("alert('aaaa');");
  btns[0].setClassname("btn-primary");
  btns[0].setClose(false);
  btns[0].setValue("შენახვა");
  
  btns[1] = new button();
  btns[1].setAction("dialogItself.close();");
  btns[1].setClassname("btn-danger");
  btns[1].setClose(true);
  btns[1].setValue("დახურვა");
  
  dialog dl = new dialog();
  dl.setTitle("სტუმრის პროფილის რედაქტირება");
  dl.setType("WIDE");
  dl.setButtons(btns);
  dl.setPanels(pl);
 
  //System.out.println(dl.draw());
%>

<script type="text/javascript">
    
    function addContact(){
        <%=dl.draw()%>
    }
    
    function searchContact(){
        
    }
    
    $(document).ready(function(){
        $("#contrbean").next().css("min-width","170px");
        $("#contrbean").next().css("top","-4px");
    });
</script>
<style>
    .ellipsis {
    white-space: nowrap; 
    overflow: hidden;
    text-overflow: ellipsis;
}
</style>
<div class="panel-heading" style="height: 26px;">
    <h3 class="panel-title">
        <div class="span-header" style="margin: 0;">კონტაქტი</div>
        <div style="float: right; margin: -2px 0 0 10px;">
            <table>
                <tr>
                    <td style="padding-right: 10px;">
                        <select class="dropdown col-md-2" id="contrbean">
                            <%
                                for (int i = 0; i < contragenttype.length - 1; i++) {
                                    String selected = "";
                                    if (i == 4) {
                                        selected = "selected='selected'";
                                    } else {
                                        selected = "";
                                    }
                            %>
                            <option value="<%=i%>" <%=selected%>><%=contragenttype[i]%>
                            </option>
                            <% } %>
                        </select>
                    </td>
                    <td>
                        <a href="#" onclick="addContact()" class="glyphicon glyphicon-plus iconblack" style="text-decoration: none; top: -4px;" data-toggle="დამატება"></a>
                    </td>
                    <td>
                        <a href="#" class="glyphicon glyphicon-search iconblack" onclick="searchContact()" style="text-decoration: none; padding-left: 10px; padding-right: 10px; top: -3px;" data-toggle="ძებნა"></a>
                    </td>
                </tr>
            </table>
        </div>
    </h3>
</div>
<div class="panel-body" style="height:110px;">
    <div class="col-md-8">
        <div class="col-md-16" style="text-align: left; padding: 3px;"><b><span style="color: #598904">guestname</span></b></div>
        <div class="col-md-16" style="text-align: left; padding: 3px;"><span>address</span></div>
        <div class="col-md-16" style="text-align: left; padding: 3px;"><span>city - zip</span></div>
        <div class="col-md-16" style="text-align: left; padding: 3px;"><span>country</span></div>
    </div>
    <div class="col-md-8">
    <div class="col-md-16" style="text-align: left; padding: 3px; padding-top: 20px;"><b><i class="fa fa-mobile" style="width: 15px;"></i></b> 577 65 11 00</div>
    <div class="col-md-16" style="text-align: left; padding: 3px;"><b><i class="fa fa-phone" style="width: 15px;"></i></b> 2 124 755</div> 
    <div class="col-md-16" style="text-align: left; padding: 3px;"><b><i class="fa fa-envelope-o pull-left" style="width: 15px;"></i></b> <span class="ellipsis col-md-14" style="padding: 0;">giorgi.vashakidze@amindsolutions.com</span></div>
    </div>
</div>
