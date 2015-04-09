<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="org.apache.commons.fileupload.servlet.*" %>
<%@page import="org.apache.commons.fileupload.util.*"%>
<%@include file="../includes/init.jsp"%>
<%@include file="../includes/subheader.jsp"%>
<%
String err = "";
String fname = "";
int filetypeid = 0;
long objid = 0;
long productid = 0;
//FiletypeBean[] ftypes = FiletypeManager.getInstance().loadByWhere("order by name");
try{
boolean isMultipart = ServletFileUpload.isMultipartContent(request);
if(isMultipart){
/*    ServletFileUpload upload = new ServletFileUpload();
    FileItemIterator iter = upload.getItemIterator(request);
    while(iter.hasNext()) {
        FileItemStream item = iter.next();
        String name = item.getFieldName();
        InputStream stream = item.openStream();
        if (item.isFormField()) {
            String val = Streams.asString(stream);
            if(name.equals("filetypeid"))   filetypeid = Integer.parseInt(val);
            else if(name.equals("objid"))   objid = Long.parseLong(val);
            else if(name.equals("productid"))   productid = Long.parseLong(val);
        } else {
            String idun = new Date().getTime()+"_"+user.getPersonellid()+"_";
            fname = "doc/"+idun+item.getName();
            File f=new File(basedir+"/"+fname);
            InputStream inputStream= item.openStream();
            OutputStream fout=new FileOutputStream(f);
            byte buf[]=new byte[1024];
            int len;
            while((len=inputStream.read(buf))>0)
                fout.write(buf,0,len);
            fout.close();
            inputStream.close();
        }
    }
    ObjfileBean objfile = ObjfileManager.getInstance().createObjfileBean();
    objfile.setFiletypeid(filetypeid);
    if(objid > 0)    objfile.setObjid(objid);
    if(productid > 0)   objfile.setProductid(productid);
    objfile.setPath(fname);
    objfile.setUploadbyid(user.getPersonellid());
    objfile = ObjfileManager.getInstance().save(objfile);*/
    %>
    <script>
        top.opener.$("#list3").trigger("reloadGrid");
        top.close();
    </script>
    <%
    
} else {
    if(request.getParameter("objid") != null)    objid = Long.parseLong(request.getParameter("objid"));
    if(request.getParameter("productid") != null)    productid = Long.parseLong(request.getParameter("productid"));
}
    
}catch(Exception e){e.printStackTrace(); err = e.getMessage();}
%>

<form action="upload_picture.jsp" method="post" name="upl" enctype="multipart/form-data">
    <table width="100%">
        <%if(err.length() > 0){%>
        <tr>
            <td class="gText" colspan="2" align="center">
                <font size="+1" color="red"><%=err%><br></font>
            </td>
        </tr>
        <%}%>
        <tr>
            <td class="gText">სურათი:</td>
            <td class="gText"><input type="file" name="doc" size="15" class="gText"></td>
        </tr>
        <tr>
            <td valign="top" class="gText" colspan="4">
                <input type="submit" name="uploaddoc" value="ატვირთვა" class="navnotselected">
                <img src="../images/blank.gif" alt="" width="40" height="1" border="0">
                <input type="button" name="cancel" value="დახურვა" class="navnotselected" onClick="javascript:top.close();">
                <%if(objid>0){%><input type="hidden" name="objid" value="<%=objid%>"><%}%>
                <%if(productid>0){%><input type="hidden" name="productid" value="<%=productid%>"><%}%>
            </td>
        </tr>
    </table>
</form>

<%@ include file="../includes/subfooter.jsp" %>
