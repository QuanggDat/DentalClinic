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
        <link href="<c:url value="/css/forgotpassword.css"/>" rel="stylesheet" type="text/css"/>
        <!-- Icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    </head>
    <body>
        <div class="container">
            <div class="left">
                <a class="btn" href="HomeController" style="text-decoration: none; background: #0d6efd; color: white; width: 50px; text-align: center; padding: 10px 3px; margin-bottom: 40px;"><i class="bi bi-house-door"></i></a>
                <div class="header">
                    <h2 class="animation a1">Quên mật khẩu</h2>
                    <h4 class="animation a2">Điền username và email của bạn</h4>
                </div>
                <form action="MainController" method="POST">
                    <div class="form">
                        <input type="text" class="form-field animation a3" placeholder="Username" name="userName" pattern="[A-Za-z][1-10].{,10}">
                        <input type="email" class="form-field animation a5" placeholder="Your Email" name="email">    
                        <button type="submit" name="action" value="ForgotPassword" class="animation a6">Gửi Mail</button>
                    </div>
                    <br>
                </form>
                <%
                        String error1 = (String) session.getAttribute("ERROR1");
                        if (error1 == null) {
                            error1 = "";
                        }
                        String error2 = (String) session.getAttribute("ERROR2");
                        if (error2 == null) {
                            error2 = "";
                        }
                    %>
                    <h4 style="color: red;" ><%=error1%> </h4>
                    <h4 style="color: green;" ><%=error2%> </h4>
            </div>
            <div class="right"></div>
        </div>
    </body>
</html>
