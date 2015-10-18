<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset='UTF-8'><title>registration</title>
    <style>
        * {
            margin: 0px;
            padding: 0px;
        }
        body {
            margin: 0 auto;
        }
        #header{
            text-align: center;
            width: 100%;
            height: 80px;
            padding-top: 20px;
        }
        #form{
            background-color: rgba(0, 0, 0, 0.4);
            width: 60%;
            margin-left: 20%;
            margin-right: 20%;
            color: black;
            padding: 20px;
            height: 100%;
            font-size: 13pt;
        }
        .formInner{
            width: 60%;
            margin-right: 20%;
            margin-left: 35%;
        }

        .in{
            height: 20px;
            width: 190px;
        }
        .submit{
            width: 200px;
        }

        #message{
            text-align: center;
            padding: 15px;
        }
        textarea{
            width:200px;
            height: 150px;
        }
    </style>

    <script type="text/javascript" language="javascript">

        function validate_form(){

            var reg = /^([a-z0-9_\-]+\.)*[a-z0-9_\-]+@([a-z0-9][a-z0-9\-]*[a-z0-9]\.)+[a-z]{2,6}$/i;
            if(!reg.test(document.reg_form.email.value)){
                alert("Некорректный email! Введите еще раз!")
                return false;
            }
            var inp = document.getElementsByName('sex');
            if (!inp[0].checked && !inp[1].checked) {
                alert("Выберите свой пол!!!");
                return false;
            }
            return true;

        }
        function count (str) {
            document.getElementById('symb').innerHTML=str.length;
        }

    </script>
</head>
<body>

<div id="header">
    <h1>Registration form</h1>
</div>

<div id="form">
    <form name="reg_form" onsubmit="return validate_form()" class="formInner" action='' method='POST'>

        <input class="in" type='text' name='email'>
        <br>
        <br>
        <input class="in" type='password' name='password'><br><br>

        <input  type='radio' name='sex' value="male">&nbsp;Мужской
        &nbsp;&nbsp;&nbsp;
        <input  type='radio' name='sex' value="female">&nbsp;Женский

        <br><br>
        <input class="box" type='checkbox' name='subscription'>&nbsp;&nbsp;Подписаться<br><br>
        <br><br>
        <p>
            <textarea onkeyup="count(value)" maxlength="50" name="about"></textarea>
        </p>
        <p>символов <b id="symb">0</b>/50</p>
        <br><br>
        <input class="submit" type='submit' value='отправить'>
    </form>
</div>

<div id="message">
    <c:if test="${not empty message}">
        <h3>${message}</h3>
    </c:if>
</div>

</body>
</html>