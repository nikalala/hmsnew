<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
CurrencyBean[] curs = CurrencyManager.getInstance().loadByWhere("where basic = true");
PaymentmethodBean pb = null;
if(request.getParameter("id") != null){
    pb = PaymentmethodManager.getInstance().loadByPrimaryKey(new Integer(request.getParameter("id")));
}
String basiccurr = "GEL";
if(curs.length > 0)
    basiccurr = curs[0].getCode();
%>
<script>
    function shoperc(n)
    {
        if(n==1)    $("#amtperc").html("<b>%</b>");
        else           $("#amtperc").html("<b><%=basiccurr%></b>");
    }
    
    function extraclc0(n)
    {
        if(n==1)
            {
                $("#extra0").show();
                
            }
        else
            {
                $("#extra0").hide();
            }
    }
    
    function extraclc1()
    {
        if($("#procesing").attr('checked'))
            {
                $("#extra1").show();
                
            }
        else
            {
                $("#extra1").hide();
            }
    }
    
    function extraclc2()
    {
        if($("#extracharge").attr('checked'))
            {
                $("#extra11").show();
                $("#extra2").show();
            }
        else
            {
                $("#extra11").hide();
                $("#extra2").hide();
            }
    }
    
   <%if(pb != null && pb.getBank().booleanValue()){%>$("#extra0").show();<%}else{%>$("#extra0").hide();<%}%>
   <%if(pb != null && pb.getProcesing().booleanValue()){%>$("#extra1").show();<%}else{%>$("#extra1").hide();<%}%>
  
   <%if(pb != null && pb.getExtracharge().booleanValue()){%>$("#extra11").show();$("#extra2").show();<%}else{%>$("#extra11").hide();$("#extra2").hide();<%}%>
   <%if(pb != null && pb.getExtraperc().booleanValue()){%>$("#amtperc").html("<b>%</b>");<%}else{%>$("#amtperc").html("<b><%=basiccurr%></b>");<%}%>
</script>
<form name="methodfrm" id="methodfrm" method="post">
<table align="center" width="100%">
    <tr>
        <td class="gText" align="left" valign="top" colspan="2">
            <div id="methodformerror"></div>
        </td>
    </tr>
    <tr>
        <td class="gText" align="left" valign="top" width="50%"><b>მოკლე სახელი</b></td>
        <td class="gText" align="left" valign="top" width="50%">
            <input type="text" name="nickname" id="nickname" class="gText" size="10" value="<%=(pb != null) ? pb.getNickname():""%>"/>
        </td>
    </tr>
    <tr>
        <td class="gText" align="left" valign="top"><b>გადახდის მეთოდი</b></td>
        <td class="gText" align="left" valign="top">
            <input type="text" name="name" id="name" class="gText" size="20" value="<%=(pb != null) ? pb.getName():""%>"/>
        </td>
    </tr>
    <tr>
        <td class="gText" align="left" valign="top"><b>ტიპი</b></td>
        <td class="gText" align="left" valign="top">
            <b>ბანკი</b><input type="radio" name="bank" id="bank" class="gText" value="true" onclick="extraclc0(1);" <%=(pb != null && pb.getBank().booleanValue()) ? "checked":""%> />
            &nbsp;&nbsp;&nbsp;
            <b>ნაღდი</b><input type="radio" name="bank" id="bank" class="gText" value="false" onclick="extraclc0(0);" <%=(pb != null && pb.getBank().booleanValue()) ? "":"checked"%> />
        </td>
    </tr>
    <tr id="extra0">
        <td class="gText" align="left" valign="top"><b>ბარათის პროცესინგი</b></td>
        <td class="gText" align="left" valign="top">
            <input type="checkbox" name="procesing" id="procesing" class="gText" value="false" onclick="extraclc1();" <%=(pb != null && pb.getProcesing().booleanValue()) ? "checked":""%> />
        </td>
    </tr>
    <tr id="extra1">
        <td class="gText" align="left" valign="top"><b>დამატებითი საფასურის პარამეტრები</b></td>
        <td class="gText" align="left" valign="top">
            <input type="checkbox" name="extracharge" id="extracharge" class="gText" value="false" onclick="extraclc2();" <%=(pb != null && pb.getExtracharge().booleanValue()) ? "checked":""%> />
            <br>
            <div id="extra11">
                <b>პროცენტი</b><input type="radio" name="extraperc" id="extraperc" class="extraperc" value="true" onclick="shoperc(1);" <%=(pb != null && pb.getExtraperc().booleanValue()) ? "checked":""%> />
                &nbsp;&nbsp;&nbsp;
                <b>თანხის ოდენობა</b><input type="radio" name="extraperc" id="extraperc" class="extraperc" value="false" onclick="shoperc(0);" <%=(pb != null && pb.getExtraperc().booleanValue()) ? "":"checked"%> />
            </div>
        </td>
    </tr>
    <tr id="extra2">
        <td class="gText" align="left" valign="top"><b>ოდენობა</b></td>
        <td class="gText" align="left" valign="top" nowrap>
            <table>
                <tr>
                    <td class="gText" align="right"><input type="text" name="extraamount" id="extraamount" class="gTextBtn" size="10" value="<%=(pb != null) ? dc.format(pb.getExtraamount().doubleValue()):""%>"/></td>
                    <td class="gText" align="left"><div id="amtperc"></div></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="gText" align="left" valign="top"><b>სტატუსი</b></td>
        <td class="gText" align="left" valign="top">
            <input type="checkbox" name="status" id="status" class="gText" value="აქტიური" <%=(pb != null && pb.getStatus().booleanValue()) ? "checked":""%>/>
            <%if(pb != null){%><input type="hidden" name="id" id="id" value="<%=pb.getPaymentmethodid()%>"/><%}%>
        </td>
    </tr>
</table>
</form>
