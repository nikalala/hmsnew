<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<style>
    #head .dropdown-menu li {
        width: 100%;
        font-size: 13px;
        line-height: 2 !important;
    }
    #head .dropdown-menu li a {
        line-height: 2 !important;
    }
    #head .dropdown-menu  li  a:hover {
        background-color: rgba(185, 185, 185, 0.57);
    }
    .head-link:hover {
        border-bottom: 2px solid #006dcc;
    }
    .head-link {
        border-bottom: 2px solid transparent;
    }
    #head .navbar-nav > li > a {
    padding-top: 12px;
    padding-bottom: 12px;
    }
</style>
<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header col-md-3" style="text-align: center;">
            <a href="index.jsp"><img src="img/logo-hms.png" alt=""/></a>  
        </div>
        <div id="head" class="navbar-collapse collapse"> 
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a href="#mb59" class="dropdown-toggle head-link" data-toggle="dropdown"><span class="fa fa-briefcase" style="padding-right: 10px; font-size: 15px;"></span>მიმღები <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="javascript:newWindow('walkin','მოსული სტუმარი');">სტუმრის მიღება</a>
                        </li>
                        <li>
                            <a href="javascript:newWindow1('walkin','სტუმრის მიღება / რეზერვაცია','wintype=1');">ახალი რეზერვაცია</a>
                        </li>
                        <li>
                            <a href="javascript:newWindow1('walkin','ტრანზაქციის ჩამატება','wintype=2');">ტრანზაქციის ჩამატება</a>
                        </li>
                        <li>
                            <a href="javascript:getBody('stayviewleft','reservationlist','რეზერვაციის სია','res1','',true);">რეზერვაციების სია</a>
                        </li>
                        <li>
                            <a href="javascript:getBody('stayviewleft','arrivallist','ჩამომსვლელთა სია','res1','',true);">ჩამომსვლელთა სია</a>
                        </li>
                        <li>
                            <a href="javascript:getBody('stayviewleft','deplist','წამსვლელთა სია','res1','',true);">წამსვლელთა სია</a>
                        </li>
                        <li>
                            <a href="javascript:getBody('stayviewleft','guestdblist','სტუმრების მონაცემთა ბაზა','res1','',true);">სტუმრების მონაცემთა ბაზა</a>
                        </li>
                        <li>
                            <a href="javascript:newWindow('nightaudit','ღამის აუდიტი');">ღამის აუდიტი</a>
                        </li>
                        <li>
                            <a href="javascript:newWindow('construction','ბლოკირება');">ბლოკირება</a>
                        </li>
                    </ul>
                </li>
                
                <li class="dropdown">
                    <a href="#mb59" class="dropdown-toggle head-link" data-toggle="dropdown"><span class="fa fa-users" style="padding-right: 10px; font-size: 15px;"></span> ჯგუფები <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="javascript:getBody('stayviewleft','construction');">ჯგუფური რეზერვაცია</a>
                        </li>
                        <li>
                            <a href="javascript:getBody('stayviewleft','construction');">არსებული ჯგუფები</a>
                        </li>
                        <li>
                            <a href="javascript:getBody('stayviewleft','construction');">წამსვლელი ჯგუფები</a>
                        </li>
                    </ul>
                </li>

                <li class="dropdown">
                    <a href="#mb59" class="dropdown-toggle head-link" data-toggle="dropdown"><span class="fa fa-money" style="padding-right: 10px; font-size: 15px;"></span> სალარო <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="javascript:getBody('stayviewleft','tagents','ტურისტული აგენტები','res1','?type=2',true);">ტურისტული აგენტები</a>
                        </li>
                        <li>
                            <a href="javascript:getBody('stayviewleft','tagents','კომპანიები','res1','?type=1',true);">კომპანიები</a>
                        </li>
                        <li>
                            <a href="javascript:getBody('construction','expenses','ხარჯები','res1','',true);">ხარჯები</a>
                        </li>
                        <li>
                            <a href="javascript:newWindow('construction','მოლარე');">მოლარე</a>
                        </li>
                        <li>
                            <a href="javascript:newsWindow('currcource','ვალუტის კურსი');">ვალუტის კურსი</a>
                        </li>
                    </ul>
                </li>
                
                <li class="dropdown">
                    <a href="#mb59" class="dropdown-toggle head-link" data-toggle="dropdown"><span class="fa fa-home" style="padding-right: 10px; font-size: 15px;"></span> დალაგება <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="javascript:getBody('stayviewleft','hotelstatus','სასტუმროს სტატუსი','res1','',true);">სასტუმროს სტატუსი</a>
                        </li>
                        <li>
                            <a href="javascript:getBody('stayviewleft','blockroom','ოთახის ბლოკირება','res1','',true);">ოთახის ბლოკირება</a>
                        </li>
                        <li>
                            <a href="javascript:getBody('stayviewleft','workbuilder','შესასრულებელი სამუშაოები','res1','',true);">შესასრულებელი სამუშაოები</a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a class="head-link" href="javascript:getBody('construction','construction');"><span class="fa fa-square-o" style="padding-right: 10px; font-size: 15px;"></span> POS</a>
                </li>
                <li>
                    <a class="head-link" href="javascript:getBody('statsleft','stats','სტატისტიკა','res1','',true);"><span class="fa fa-bar-chart" style="padding-right: 10px; font-size: 15px;"></span> სტატისტიკა</a>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a class="head-link" href="javascript:getBody('stayviewleft', 'stayview', 'დატვირთულობა', 'res1','',true);" data-toggle="tooltip" title="დატვირთულობა"><span class="fa fa-bed" style="font-size: 15px;"></span></a>
                </li>
                <li>
                    <a class="head-link" href="javascript:getBody('stayviewleft','overview','მიმოხილვა', 'res1','',true);" data-toggle="tooltip" title="მიმოხილვა"><span class="fa fa-eye" style="font-size: 15px;"></span></a>
                </li>
                <li>
                    <a class="head-link" href="javascript:getBody('stayviewleft','dashboard','სამუშაო მაგიდა', 'res1','',true);" data-toggle="tooltip" title="სამუშაო მაგიდა"><span class="fa fa-dashboard" style="font-size: 15px;"></span></a>
                </li>
                <li>
                    <a class="head-link" href="javascript:getBody('stayviewleft','construction');" data-toggle="tooltip" title="ოთახები"><span class="fa fa-building" style="font-size: 15px;"></span></a>
                </li>
                <li>
                    <a class="head-link" href="javascript:void(0);" data-action="launchFullscreen" title="Full Screen"><i class="fa fa-arrows-alt" style="font-size: 15px;"></i></a>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle head-link" data-toggle="dropdown"><span class="fa fa-user" style="font-size: 15px;"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="javascript:getBody('construction')">პაროლის შეცვლა</a></li>
                        <li class="divider"></li>
                        <li><a href="#" onclick="launchLockScreen()">ეკრანის ბლოკი</a></li>
                        <li><a href="login.jsp?logout=1">გამოსვლა</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>
