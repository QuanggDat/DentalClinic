<%-- 
    Document   : login
    Created on : Jun 2, 2022, 9:44:05 AM
    Author     : SE150436 - Hoàng Quang Hòa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <!-- Icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
        <!-- Css -->
        <link href="<c:url value="/css/login.css"/>" rel="stylesheet" type="text/css"/>
    </head>
    <body >
        <div class="login-root">
            <div class="box-root flex-flex flex-direction--column" style="min-height: 100vh;flex-grow: 1;">
                <div class="loginbackground box-background--white padding-top--64">
                    <div class="loginbackground-gridContainer">
                        <div class="box-root flex-flex" style="grid-area: top / start / 8 / end;">
                            <div class="box-root" style="background-image: linear-gradient(white 0%, rgb(247, 250, 252) 33%); flex-grow: 1;">
                            </div>
                        </div>
                        <div class="box-root flex-flex" style="grid-area: 4 / 2 / auto / 5;">
                            <div class="box-root box-divider--light-all-2 animationLeftRight tans3s" style="flex-grow: 1;"></div>
                        </div>
                        <div class="box-root flex-flex" style="grid-area: 6 / start / auto / 2;">
                            <div class="box-root box-background--blue800" style="flex-grow: 1;"></div>
                        </div>
                        <div class="box-root flex-flex" style="grid-area: 7 / start / auto / 4;">
                            <div class="box-root box-background--blue animationLeftRight" style="flex-grow: 1;"></div>
                        </div>
                        <div class="box-root flex-flex" style="grid-area: 8 / 4 / auto / 6;">
                            <div class="box-root box-background--gray100 animationLeftRight tans3s" style="flex-grow: 1;"></div>
                        </div>
                        <div class="box-root flex-flex" style="grid-area: 2 / 15 / auto / end;">
                            <div class="box-root box-background--cyan200 animationRightLeft tans4s" style="flex-grow: 1;"></div>
                        </div>
                        <div class="box-root flex-flex" style="grid-area: 3 / 14 / auto / end;">
                            <div class="box-root box-background--blue animationRightLeft" style="flex-grow: 1;"></div>
                        </div>
                        <div class="box-root flex-flex" style="grid-area: 4 / 17 / auto / 20;">
                            <div class="box-root box-background--gray100 animationRightLeft tans4s" style="flex-grow: 1;"></div>
                        </div>
                        <div class="box-root flex-flex" style="grid-area: 5 / 14 / auto / 17;">
                            <div class="box-root box-divider--light-all-2 animationRightLeft tans3s" style="flex-grow: 1;"></div>
                        </div>
                    </div>
                </div>
                <div class="box-root padding-top--24 flex-flex flex-direction--column" style="flex-grow: 1; z-index: 9;">
                    <div class="box-root padding-top--48 padding-bottom--24 flex-flex flex-justifyContent--center">
                        <h1><a href="http://blog.stackfindover.com/" rel="dofollow">BDDentist</a></h1>
                    </div>
                    <div class="formbg-outer">
                        <div class="formbg">
                            <div class="formbg-inner padding-horizontal--48">
                                <span class="padding-bottom--15">Sign in to your account</span>
                                <form action="MainController" class="login-form mt-4" method="POST" id="stripe-login">
                                    <div class="field padding-bottom--24">
                                        <label class="form-label text-bold">UserName <span class="text-danger">*</span></label>
                                        <input type="text" placeholder="UserName" name="userName" required="">
                                    </div>
                                    <div class="field padding-bottom--24">
                                        <div class="grid--50-50">
                                            <label class="form-label text-bold">Password <span class="text-danger">*</span></label>
                                            <div class="reset-pass">
                                                <a href="resetpassword.jsp">Forgot your password?</a>
                                            </div>
                                        </div>
                                        <input type="password" placeholder="password"  name="password" required="">
                                    </div>
<!--                                    <div class="field field-checkbox padding-bottom--24 flex-flex align-center">
                                        <label for="checkbox">
                                            <input type="checkbox" name="checkbox"> Stay signed in for a week
                                        </label>
                                    </div>-->
                                    <div class="field padding-bottom--24">
                                        <input type="submit" name="action" value="Login" />
                                    </div>
                                    <!--                                    <div class="field">
                                                                            <a class="ssolink" href="https://accounts.google.com/o/oauth2/auth?scope=profile&redirect_uri=http://localhost:8080/DentalClinic/LoginGoogleController&response_type=code
                                                                               &client_id=1018139610073-7v18hs48jp1da05d44gb26m4pkjuds3l.apps.googleusercontent.com&approval_prompt=force" name="action" value="LoginGoogle">Use single sign-on (Google) instead</a>
                                                                        </div>-->
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
                                </form>
                            </div>
                        </div>
                        <div class="footer-link padding-top--24">
                            <span>Don't have an account? <a href="register.jsp">Sign up</a></span>
                            <div class="listing padding-top--24 padding-bottom--24 flex-flex center-center">
                                <span><a href="#">© DBDentist</a></span>
                                <span><a href="#">Contact</a></span>
                                <span><a href="#">Privacy & terms</a></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>