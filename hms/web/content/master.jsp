<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
String[] tabmenu =  {"ვალუტა",    "გადახდის მეთოდები", "დამატებითი გადასახადები", "საბუთის ტიპი","მიზეზები", "გადასახადები", "ფასდაკლებები","შაბლონების კატეგორიები","შაბლონები","ბაზრის კოდები","რეზერვაციის ტიპები","უპირატესობის ტიპები","VIP სტატუსი","ბიზნესის წყარო"};
String[] files =    {"lm31.jsp",  "lm32.jsp",          "lm33.jsp",                "lm34.jsp",    "lm35.jsp", "lm36.jsp",     "lm37.jsp",    "lm38.jsp",              "lm39.jsp", "lm310.jsp",    "lm311.jsp",         "lm312.jsp",          "lm313.jsp",  "lm314.jsp"};
String qr = "";
%>
<style type="text/css" media="screen">
        th.ui-th-column div{
            white-space:normal !important;
            height:auto !important;
            padding:2px;
        }
        .ui-jqgrid .ui-jqgrid-resize {height:100% !important;}
        </style>
<script>
    $(document).ready(function() {

        var $tbs = $("#tabs").tabs();
        
        
    });
    
</script>

<table align="center" width="100%">
    <tr>
        <td align="left" class="gText" nowrap>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td align="center" class="gText" width="100%">


            <div class="ui-tabs">

                <div id="tabs">
                        <ul class="ui-tabs-nav">
                            <%
                            for(int i=0;i<tabmenu.length;i++)
                                {
                            %>
                            <li><a href="content/lm3/<%=files[i]+"?"+qr%>"><span><%=tabmenu[i]%></span></a></li>
                            <%
                                }
                            %>
                        </ul>
                </div>

            </div>
        </td>
    </tr>
</table>