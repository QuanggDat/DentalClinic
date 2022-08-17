<%-- 
    Document   : register
    Created on : Jul 29, 2022, 5:09:07 PM
    Author     : SE150436 - Hoàng Quang Hòa
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <!-- Css -->
        <link href="<c:url value="/css/register.css"/>" rel="stylesheet" type="text/css"/>
        <!-- Icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    </head>
    <body>
        <div class="container">
            <div class="left">
                <a class="btn" href="HomeController" style="text-decoration: none; background: #0d6efd; color: white; width: 50px; text-align: center; padding: 10px 3px; margin-bottom: 40px;"><i class="bi bi-house-door"></i></a>
                <div class="header">
                    <h2 class="animation a1">Đăng ký tài khoản</h2>
                    <h4 class="animation a2">Đăng ký tài khoản của bạn bằng username và password</h4>
                </div>
                <form action="MainController" method="POST">
                    <div class="form">
                        <input type="text" class="form-field animation a3" placeholder="Username (Tên tài khoản bao gồm ít nhất 6 ký tự và ít nhất 1 chữ số, VD: hoacute123)" name="userName" pattern="(?=.*\d)(?=.*[a-z]).{6,}">
                        <input type="password" class="form-field animation a4" placeholder="Password (Mật khẩu chứa ít nhất 6 ký tự)" name="password" pattern=".{6,}">
                        <input type="email" class="form-field animation a5" placeholder="Your Email" name="email">    
                        <button type="submit" name="action" value="RegisterAccount" class="animation a6">ĐĂNG KÝ</button>
                    </div>
                    <br>
                    <%
                        String message = (String) request.getAttribute("MESSAGE");
                        if (message == null) {
                            message = "";
                        }
                        String message2 = (String) request.getAttribute("SUCCESS_MESSAGE");
                        if (message2 == null) {
                            message2 = "";
                        }
                    %>
                    <p style="color: red;" class="animation a5"><%=message%> </p>
                    <p style="color: green;" class="animation a5"><%=message2%></p>
                </form>
            </div>
            <div class="right"></div>
        </div>
    </body>
</html>
