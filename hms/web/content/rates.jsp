<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%
String[] tabmenu =  {"ტარიფის ტიპი",  "სეზონი",    "ოთახის ტარიფები"};
String[] files =    {"lm11.jsp",      "lm12.jsp",  "lm13.jsp"};
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
                            <li><a href="content/lm1/<%=files[i]+"?"+qr%>"><span><%=tabmenu[i]%></span></a></li>
                            <%
                                }
                            %>
                        </ul>
                </div>

            </div>
        </td>
    </tr>
</table>