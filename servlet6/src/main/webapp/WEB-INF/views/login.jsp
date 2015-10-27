<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta content="text/html" charset="utf-8">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <title>login</title>

    <style type="text/css">
        a{
            color : #fff;
        }
        .navbar-inverse{
            border-radius: 0;
        }
    </style>

</head>
<body>
<div id="wrapper">

    <div id="navbar-top">

        <nav class="navbar navbar-inverse">

            <div class="container-fluid">

                <div class="navbar-header">
                    <a class="navbar-brand" href="#">ITIS programming 3</a>
                </div>

                <div class="collapse navbar-collapse">

                    <!--страницы куда можно перейти -->
                    <ul class="nav navbar-nav">

                        <li>
                            <a href="<c:url value="/welcome"></c:url>">Welcome</a>
                        </li>

                        <li>
                            <a href="<c:url value="/profile"></c:url>">Profile</a>
                        </li>

                        <li>
                            <a href="<c:url value="/posts"></c:url>">Posts</a>
                        </li>
                    </ul>

                    <!-- вход и регистрация -->
                    <ul class="nav navbar-nav navbar-right">

                        <!-- если пользователь вошел  -->
                        <c:if test="${not empty user}">
                            <li>
                                <a href="#">
                                    <c:out value="${user.getEmail()}"></c:out>
                                    &nbsp;
                                    <span class="glyphicon glyphicon-user"></span>
                                </a>
                            </li>

                            <li>
                                <a href="#">
                                    <span class=" glyphicon glyphicon-log-out"></span> Exit
                                </a>
                            </li>
                        </c:if>

                        <%--если вошел гость--%>
                        <c:if test="${empty user}">
                            <li>
                                <a href="<c:url value="/registration"></c:url>">
                                    <span class="glyphicon glyphicon-user"></span> Sign Up
                                </a>
                            </li>

                            <li>
                                <a href="<c:url value="/login"></c:url>">
                                    <span class="glyphicon glyphicon-log-in"></span> Login
                                </a>
                            </li>
                        </c:if>

                    </ul>

                </div>

            </div>

        </nav>

        <%--end id navbar-top--%>
    </div>

    <div id="profile" style="padding-top:50px;">

        <div class="container">

            <div class="row">

                <div class="col-md-3"></div>

                <div class="col-md-6">


                    <div class="panel panel-default">

                        <div class="panel-heading" >
                            <h3 class="panel-title">&nbsp;Login</h3>
                        </div>

                        <div class="panel-body">
                            <div class="row">

                                <form name="reg_form" action='<c:url value=""></c:url>' onsubmit="return validate_form()" method="POST" style="padding :15px;">

                                    <div class="input-group">
                                        <span class="input-group-addon">@</span>
                                        <input id="email" type="text" name="email" class="form-control" placeholder="email@example.com">
                                    </div>

                                    <br>

                                    <div class="form-group">
                                        <label for="password">Password</label>
                                        <input type="password" name="password" class="form-control" id="password" placeholder="Password">
                                    </div>

                                    <div class="checkbox">
                                        <label for="remember">
                                            <input id="remember" name="remember" type="checkbox"> remember me
                                        </label>
                                    </div>

                                    <button id="button" type="submit" class="btn btn-default">Submit</button>

                                </form>

                            </div>

                        </div>

                    </div>

                </div>

                <div class="col-md-3"></div>

                <!-- row ends -->
            </div>

        </div>
    </div>


    <footer class="footer" style="margin-top: 180px;">
        <div class="container">
            <div class="text-right">
                <hr>
                <p class="text-muted">&copy; Copyright 2015 Ramil Safin</p>
                <hr>
            </div>
        </div>
    </footer>

    <!--end of wrapper -->
</div>

</body>
</html>