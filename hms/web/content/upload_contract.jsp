<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>საწარმოს მართვის სისტემა</title>
        <link rel="stylesheet" type="text/css" href="../css/mysoft.css">
	<link rel="stylesheet" type="text/css" href="../css/jquery-ui-1.9.1.custom.css">
	<link rel="stylesheet" type="text/css" href="../css/ui.jqgrid.css">
        
        <link rel="stylesheet" type="text/css" href="../css/jquery.ui.menu.css">
        <link rel="stylesheet" type="text/css" href="../css/jquery.ui.menubar.css">
        <link rel="stylesheet" type="text/css" href="../css/jquery.multiselect.css">
        <link rel="stylesheet" type="text/css" href="../css/layout-default-latest.css">
        <link rel="stylesheet" type="text/css" href="../css/colorpicker.css">
        
        <script type="text/javascript" src="../js/jquery-1.8.2.js"></script>
        <script type="text/javascript" src="../js/jquery-ui-1.9.1.custom.js"></script>
        <script type="text/javascript" src="../js/i18n/grid.locale-ka.js"></script>
        <script type="text/javascript" src="../js/jquery.jqGrid.src.js"></script>
        <script type="text/javascript" src="../js/jquery.layout-latest.js"></script>
        <script type="text/javascript" src="../js/jquery.validate.js"></script>
        <script type="text/javascript" src="../js/jquery.multiselect.js"></script>
        <script type="text/javascript" src="../js/localization/messages_ka.js"></script>
        
        <script type="text/javascript" src="../js/plugins/jquery.ui.widget.js"></script>
        <script type="text/javascript" src="../js/plugins/jquery.ui.position.js"></script>
        <script type="text/javascript" src="../js/plugins/jquery.ui.button.js"></script>
        <script type="text/javascript" src="../js/plugins/jquery.ui.menu.js"></script>
        <script type="text/javascript" src="../js/plugins/jquery.ui.menubar.js"></script>
        <script type="text/javascript" src="../js/colorpicker.js"></script>
        <script>
         $(function() {
                $("#uploaddoc").button({ icons: {primary: "ui-icon-disk"}});
                $("#cancel").button({ icons: {primary: "ui-icon-close"}});
            });
            
         function doUpload()
            {
                if((document.upl.doc.value).length == 0)
                    alert("შეიყვანეთ დოკუმენტი!");
                else
                    document.upl.submit();
            }
        </script>
</head>
<body>
<%
long maxsize = 2097152;
String err = "";
int pcontractid = 0;
byte[] data = new byte[0];
String listid = request.getParameter("listid");
try{
if(FileUpload.isMultipartContent(request))
    {
    DiskFileUpload upload = new DiskFileUpload();
//    upload.setRepositoryPath(request.getRealPath("/tmp"));
    upload.setRepositoryPath("/tmp");
    java.util.List items = upload.parseRequest(request);
    Iterator iter = items.iterator();
    while(iter.hasNext())
        {
        FileItem item = (FileItem) iter.next();
        if (!item.isFormField())
            {
            String contenttype = item.getContentType();
            if(!contenttype.equals("application/pdf"))
                err = "ფაილის ტიპი უნდა იყოს PDF";
            else
                data = item.get();
            if(err.length() == 0 && data.length == 0)    err = "ფალი ცარიელია. სცადეთ ახლიდან.";
            if(err.length() == 0 && data.length > maxsize)   err = "ფაილის ზომა მეტია ვიდრე დაშვებული მაქსიმუმი ("+dclkb.format(data.length/1024)+"K). შეცვალეთ ფაილის ზომა, რომ იყოს მაქსიმუმ <b>"+dcint.format(maxsize/1024)+" K</b> და სცადეთ ახლიდან.";
            }
        else
            {
            String fldname = item.getFieldName();
            String fldvalue = item.getString("UTF-8");
            if(item.getFieldName().equalsIgnoreCase("pcontractid"))
                pcontractid = Integer.parseInt(fldvalue);
            }
        }
    if(err.length() == 0)
        {
        PcontractBean contract = PcontractManager.getInstance().loadByPrimaryKey(pcontractid);
        contract.setContent(data);
        contract = PcontractManager.getInstance().save(contract);
        %>
        <script>
            window.opener.$("#<%=listid%>").trigger("reloadGrid");
            top.close();
        </script>
        <%
        }
    }
else
    pcontractid = Integer.parseInt(request.getParameter("pcontractid"));
}catch(Exception e){e.printStackTrace(); %><%= e.getMessage() %><%}
%>
<script>
    window.opener.$("#<%=listid%>").trigger("reloadGrid");
</script>
<form action="upload_contract.jsp" method="post" name="upl" enctype="multipart/form-data">
    <table width="100%">
        <%if(err.length() > 0){%>
        <tr>
            <td class="gText" colspan="2" align="center">
                <font size="+1" color="red"><%=err%><br></font>
            </td>
        </tr>
        <%}%>
        <tr>
            <td class="gText">დოკუმენტი (მაქსიმუმ <b><%=dcint.format(maxsize/1024)%> K</b>):</td>
            <td class="gText"><input type="file" name="doc" size="15" class="gText"></td>
        </tr>
        <tr>
            <td valign="top" class="gText" colspan="4">
                <input type="button" name="uploaddoc" id="uploaddoc" value="ატვირთვა" onclick="doUpload();">
                <img src="../images/blank.gif" alt="" width="40" height="1" border="0">
                <input type="button" name="cancel" id="cancel" value="დახურვა" onClick="top.close();">
                <input type="hidden" name="listid" value="<%=listid%>">
                <%if(pcontractid>0){%><input type="hidden" name="pcontractid" value="<%=pcontractid%>"><%}%>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
