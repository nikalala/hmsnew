<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%
MenuBean mn = MenuManager.getInstance().loadByPrimaryKey(new Integer(request.getParameter("edt")));
%>
    <form action="admin.jsp?<%=getHidden1()%>" method="post" name="personell">
    <table width="60%" align="center" class="allborder">
        <tr>
            <td class="gText" align="right" colspan="2"><b>მენიუს რედაქტირება</b></td>
        </tr>
        <tr>
            <td class="gText" align="right"><b>სახელი</b></td>
            <td class="gText" align="left"><input name="name" type="text" class="gText" size="20" value="<%=mn.getName()%>"></td>
        </tr>
        <tr>
            <td class="gText" align="right"><b>ფაილი</b></td>
            <td class="gText" align="left"><input name="file" type="text" class="gText" size="40" value="<%=mn.getFile()%>"></td>
        </tr>
        <tr>
            <td class="gText" align="right" colspan="2">
                <input type="hidden" name="menuid" value="<%=mn.getMenuid()%>">
                <input type="button" name="cancel" value="უკან დაბრუნება" class="navnotselected" onclick="document.location.href='admin.jsp?<%=getHidden1()%>'">
                &nbsp;&nbsp;
                <input type="submit" name="upd" value="განახლება" class="navnotselected">
            </td>
        </tr>
    </table>
</form>
