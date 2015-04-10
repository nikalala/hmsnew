<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<div class="footer navbar-inverse navbar-fixed-bottom navbar-collapse" role="navigation">
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-left">
                <li style="color: white; font-size: 11px; padding-top: 2px; padding-bottom: 2px;">
                    <div>Copyright &copy; <a href="http://selfin.ge" target="_blank">Selfin</a> 2014</div>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li style="color: white; font-size: 11px; padding: 2px;"><%=user.getFname()%> <%=user.getLname()%></li>
                <li style="color: white; font-size: 11px; padding: 2px;"><%=dtlong.format(new Date())%></li>
            </ul>
        </div>
</div>