<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta content="text/html", charset="utf-8">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <title>posts</title>

    <style type="text/css">
        body{
            padding-top: 40px;
        }
        a{
            color : #fff;
        }
        .navbar-inverse{
            border-radius: 0;
        }
    </style>

</head>

<body>

    <div id="wrapper" style="padding-bottom: 80px;">

        <div id="head-wrap">

            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">

                <div class="container-fluid">

                    <div class="navbar-header">
                        <a class="navbar-brand" href="#">ITIS programming 3</a>
                    </div>

                    <div class="collapse navbar-collapse" id="myNavbar">
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
                                    <form action="<c:url value=""></c:url>" method="post" style="padding-right: 17px;">
                                        <button  name="exit" value="exit" type="submit" class="btn btn-default navbar-btn"> Exit</button>
                                    </form>
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

        </div>


        <div id="profile" style="padding-top:50px;">

            <div class="container">

                <div class="row">

                    <div class="col-md-2"></div>

                    <div class="col-md-8">

                        <c:forEach items="${posts}" var="p">

                            <div class="panel panel-default">

                                <div class="panel-heading" >
                                    <h1 class="panel-title">
                                        <c:out value="${p.getUserName()}"></c:out>
                                    </h1>
                                </div>

                                    <%--текст поста--%>
                                <div class="panel-body">
                                    <p><c:out value="${p.getText()}"></c:out></p>
                                </div>

                                    <%--доп информация о посте--%>
                                <div class="panel-footer" style="padding-bottom:30px;">
                                    <span class="pull-right">
                                        <p>Published time : <c:out value="${p.getPublishedTime()}"></c:out></p>
                                    </span>
                                </div>

                            </div>

                        </c:forEach>

                        <br>

                        <div id="post">

                            <form action="<c:url value=""></c:url>" method="POST">

                                <div class="form-group">
                                    <label for="about">Write a post:</label>
                                    <textarea name="post" class="form-control" rows="5" id="about"></textarea>
                                </div>

                                <button  type="submit" class="btn btn-block btn-success">publish</button>

                            </form>

                        </div>

                    </div>

                    <div class="col-md-2"></div>

                </div>

            </div>

        </div>

    </div>

</body>
</html>