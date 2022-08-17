<%-- 
    Document   : employee
    Created on : Jun 18, 2022, 10:40:13 PM
    Author     : SE150436 - Hoàng Quang Hòa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Boxicons -->
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <!-- My CSS -->
        <link rel="stylesheet" href="<c:url value="/css/employee.css"/>">

        <title>BDDentist</title>
    </head>
    <body>


        <!-- SIDEBAR -->
        <section id="sidebar">
            <a href="#" class="brand">
                <i class='bx bxs-smile'></i>
                <span class="text">BDDentist</span>
            </a>
            <ul class="side-menu top">
                <form action="MainController" method="POST">
                    <li class="active">
                        <a href="#">
                            <i class='bx bxs-dashboard' ></i>
                            <button type="submit" name="action" value="ViewDashBoard" class="text"><span>Dashboard</span></button>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class='bx bxs-shopping-bag-alt' ></i>
                            <button type="submit" name="action" value="ViewAllAppoinment" class="text"><span>Appoinments</span></button>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <i class='bx bxs-message-dots' ></i>
                            <button type="submit" name="action" value="ViewAllFeedback" class="text"><span>Feedbacks</span></button>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class='bx bxs-briefcase'></i>
                            <button type="submit" name="action" value="ViewAllService" class="text"><span>Services</span></button>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class='bx bxs-group' ></i>
                            <button type="submit" name="action" value="ViewAllDoctorByEmployee" class="text"><span>Doctors</span></button>
                        </a>
                    </li>
                </form>
            </ul>
            <ul class="side-menu">
                <li>
                    <a href="#">
                        <i class='bx bxs-cog' ></i>
                        <span class="text">Settings</span>
                    </a>
                </li>
                <li>
                    <a href="login.jsp" class="logout">
                        <i class='bx bxs-log-out-circle' ></i>
                        <span class="text">Logout</span>
                    </a>
                </li>
            </ul>
        </section>
        <!-- SIDEBAR -->



        <!-- CONTENT -->
        <section id="content">
            <!-- NAVBAR -->
            <nav>
                <i class='bx bx-menu' ></i>
                <a href="#" class="nav-link">Dashboard</a>
                <form action="#">
                    <div class="form-input">
                        <input type="search" placeholder="Search...">
                        <button type="submit" class="search-btn"><i class='bx bx-search' ></i></button>
                    </div>
                </form>
                <input type="checkbox" id="switch-mode" hidden>
                <label for="switch-mode" class="switch-mode"></label>
            </nav>
            <!-- NAVBAR -->

            <!-- MAIN -->
            <main>
                <div class="head-title">
                    <div class="left">
                        <h1>Dashboard</h1>
                        <ul class="breadcrumb">
                            <li>
                                <a href="#">Dashboard</a>
                            </li>
                            <li><i class='bx bx-chevron-right' ></i></li>
                            <li>
                                <a class="active" href="#">Home</a>
                            </li>
                        </ul>
                    </div>
                </div>

                <ul class="box-info">
                    <li>
                        <i class='bx bxs-calendar-check' ></i>
                        <span class="text">
                            <c:forEach var="countAppoinment" items="${COUNT_APPOINMENT}">
                                <h3>${countAppoinment.appoinmentID}</h3>
                                <p>Appointment</p>
                            </c:forEach>
                        </span>
                    </li>
                    <li>
                        <i class='bx bxs-group' ></i>
                        <span class="text">
                            <c:forEach var="countComment" items="${COUNT_COMMENT}">
                                <h3>${countComment.commentID}</h3>
                                <p>Feedbacks</p>
                            </c:forEach>
                        </span>
                    </li>
                    <li>
                        <i class='bx bx-user'></i>
                        <span class="text">
                            <c:forEach var="countDoctor" items="${COUNT_DOCTOR}">
                                <h3>${countDoctor.id}</h3>
                                <p>Doctors</p>
                            </c:forEach>
                        </span>
                    </li>
                </ul>
            </main>
            <!-- MAIN -->
        </section>
        <!-- CONTENT -->


        <script src="script.js"></script>
    </body>
</html>