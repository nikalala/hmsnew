<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header col-md-2">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Selfin HMS</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a href="#mb59" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-briefcase" style="padding-right: 10px;"></span>მიმღები <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="javascript:newWindow('walkin','მოსული სტუმარი');">სტუმრის მიღება</a>
                        </li>
                        <li>
                            <a href="javascript:newWindow1('walkin','სტუმრის მიღება / რეზერვაცია','wintype=2');">ახალი რეზერვაცია</a>
                        </li>
                        <li>
                            <a href="javascript:newWindow1('walkin','ტრანზაქციის ჩამატება','wintype=2');">ტრანზაქციის ჩამატება</a>
                        </li>
                        <li>
                            <a href="javascript:getBody('stayviewleft','reservationlist','რეზერვაციის სია','res1');">რეზერვაციების სია</a>
                        </li>
                        <li>
                            <a href="javascript:getBody('stayviewleft','construction');">ჩამომსვლელთა სია</a>
                        </li>
                        <li>
                            <a href="javascript:getBody('stayviewleft','construction');">წამსვლელთა სია</a>
                        </li>
                        <li>
                            <a href="javascript:getBody('stayviewleft','guestdblist','სტუმრების მონაცემთა ბაზა','res1');">სტუმრების მონაცემთა ბაზა</a>
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
                    <a href="#mb59" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-asterisk" style="padding-right: 10px;"></span> ჯგუფები <b class="caret"></b></a>
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
                    <a href="#mb59" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-usd" style="padding-right: 10px;"></span> სალარო <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="javascript:getBody('stayviewleft','tagents','ტურისტული აგენტები','res1','?type=2');">ტურისტული აგენტები</a>
                        </li>
                        <li>
                            <a href="javascript:getBody('stayviewleft','tagents','კომპანიები','res1','?type=1');">კომპანიები</a>
                        </li>
                        <li>
                            <a href="javascript:getBody('construction','construction');">ხარჯები</a>
                        </li>
                        <li>
                            <a href="javascript:newWindow('construction','მოლარე');">მოლარე</a>
                        </li>
                    </ul>
                </li>
                
                <li class="dropdown">
                    <a href="#mb59" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-home" style="padding-right: 10px;"></span> დალაგება <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="javascript:getBody('stayviewleft','construction');">სასტუმროს სტატუსი</a>
                        </li>
                        <li>
                            <a href="javascript:getBody('stayviewleft','construction');">ოთახის ბლოკირება</a>
                        </li>
                        <li>
                            <a href="javascript:getBody('stayviewleft','construction');">შესასრულებელი სამუშაოები</a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="javascript:getBody('construction','construction');">POS</a>
                </li>
                <li>
                    <a href="javascript:getBody('construction','construction');"><span class="glyphicon glyphicon-folder-close" style="padding-right: 10px;"></span> სტატისტიკა</a>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="javascript:getBody('stayviewleft','construction');" data-toggle="tooltip" title="დატვირთულობა"><span class="glyphicon glyphicon-inbox"></span></a>
                </li>
                <li>
                    <a href="javascript:getBody('stayviewleft','construction');" data-toggle="tooltip" title="სწრაფი ნახვა"><span class="glyphicon glyphicon-eye-open"></span></a>
                </li>
                <li>
                    <a href="javascript:getBody('stayviewleft','construction');" data-toggle="tooltip" title="სამუშაო მაგიდა"><span class="glyphicon glyphicon-dashboard"></span></a>
                </li>
                <li>
                    <a href="javascript:getBody('stayviewleft','construction');" data-toggle="tooltip" title="ოთახები"><span class="glyphicon glyphicon-th"></span></a>
                </li>                
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="javascript:getBody('construction')">პაროლის შეცვლა</a></li>
                        <li class="divider"></li>
                        <li><a href="index.jsp?logout=1">გამოსვლა</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>