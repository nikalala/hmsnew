<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.io.*"%>
<%@ page import="jxl.*" %>
<%@ page import="jxl.write.*" %>
<%@ include file="../includes/init.jsp"%>
<%@ include file="../includes/subheader.jsp" %>
<%if(company == null){%>
<div class="gText"><font color="red" size="+1"><b>ჯერ შეავსეთ კომპანიის მონაცემები</b></font></div>
<%}else{%>
<script>
    $(document).ready(function() {

   $("#upd").click(function() {
         $.post("../content/saveconf.jsp", {
             action: "mail",
             smtp: $("#smtp").val(),
             port: $("#port").val(),
             username: $("#username").val(),
             password: $("#password").val(),
             from: $("#from").val(),
             to: $("#to").val(),
             updateto: $("#updateto").val()
         },
            function(data){
                $("#result").html(data);
           });
         });

 });
</script>
<table align="left">
    <tr>
        <td align="center" class="gText" valign="top" colspan="2">
            <div id="result"></div>
        </td>
    </tr>
    <tr>
        <td align="right" class="gText" valign="top"><b>SMTP სერვერი</b></td>
        <td align="left" class="gText" valign="top">
            <input type="text" size="20" class="gText" name="smtp" id="smtp" value="<%=(confmail != null) ? confmail.getSmtp():""%>">
        </td>
    </tr>
    <tr>
        <td align="right" class="gText" valign="top"><b>პორტი</b></td>
        <td align="left" class="gText" valign="top">
            <input type="text" size="5" class="gTextBtn" name="port" id="port" value="<%=(confmail != null) ? confmail.getPort():""%>">
        </td>
    </tr>
    <tr>
        <td align="right" class="gText" valign="top"><b>სარეგისტრაციო სახელი</b></td>
        <td align="left" class="gText" valign="top">
            <input type="text" size="20" class="gText" name="username" id="username" value="<%=(confmail != null) ? confmail.getUsername():""%>">
        </td>
    </tr>
    <tr>
        <td align="right" class="gText" valign="top"><b>პაროლი</b></td>
        <td align="left" class="gText" valign="top">
            <input type="text" size="20" class="gText" name="password" id="password" value="<%=(confmail != null) ? confmail.getPass():""%>">
        </td>
    </tr>
    <tr>
        <td align="right" class="gText" valign="top"><b>ელფოსტის მისამართი საიდანაც იგზავნება</b></td>
        <td align="left" class="gText" valign="top">
            <input type="text" size="20" class="gText" name="from" id="from" value="<%=(confmail != null) ? confmail.getFrommail():""%>">
        </td>
    </tr>
    <tr>
        <td align="right" class="gText" valign="top"><b>გადაზღვევის მენეჯერის ელფოსტის მისამართი</b></td>
        <td align="left" class="gText" valign="top">
            <input type="text" size="20" class="gText" name="to" id="to" value="<%=(confmail != null) ? confmail.getTomail():""%>">
        </td>
    </tr>
    <tr>
        <td align="right" class="gText" valign="top"><b>პოლისის ცვლილებების შესახებ შეტყობინებების გაგზავნის ელფოსტის მისამართი</b></td>
        <td align="left" class="gText" valign="top">
            <input type="text" size="20" class="gText" name="updateto" id="updateto" value="<%=(confmail != null) ? confmail.getUpdateto():""%>">
        </td>
    </tr>
    <tr>
        <td align="right" class="gText" valign="top" colspan="2">
            <button id="upd" class="navnotselected" >განახლება</button>
        </td>
    </tr>
</table>
<%}%>
