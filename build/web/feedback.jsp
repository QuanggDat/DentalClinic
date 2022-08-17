<%-- 
    Document   : feedback
    Created on : Jun 22, 2022, 9:38:10 PM
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
        <!-- Boxicons -->
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <!-- Css -->
        <link href="<c:url value="/css/doctor.css"/>" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <!-- SIDEBAR -->
        <section id="sidebar">
            <a href="#" class="brand">
                <i class='bx bxs-smile'></i>
                <span class="text">AdminHub</span>
            </a>
            <ul class="side-menu top">
                <form action="MainController" method="POST">
                    <input type="hidden" value="${DOCTORID}" name="doctorID"/>
                    <li class="active">
                        <a href="#">
                            <i class='bx bxs-dashboard' ></i>
                            <span class="text">Dashboard</span>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <i class='bx bxs-shopping-bag-alt' ></i>
                            <button type="submit" name="action" value="View_Appoinment" class="text"><span>Appoinments</span></button>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class='bx bxs-message-dots' ></i>
                            <button type="submit" name="action" value="View_Feedback" class="text"><span>Feedbacks</span></button>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class='bx bxs-group' ></i>
                            <button type="submit" name="action" value="View_Feedback" class="text"><span>Patients</span></button>
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
                <a href="#" class="nav-link">Categories</a>
                <form action="#">
                    <div class="form-input">
                        <input type="search" placeholder="Search...">
                        <button type="submit" class="search-btn"><i class='bx bx-search' ></i></button>
                    </div>
                </form>
                <input type="checkbox" id="switch-mode" hidden>
                <label for="switch-mode" class="switch-mode"></label>
                <a href="#" class="notification">
                    <i class='bx bxs-bell' ></i>
                    <span class="num">8</span>
                </a>
                <a href="#" class="profile">
                    <img src="img/people.png">
                </a>
            </nav>
            <!-- NAVBAR -->

            <!-- MAIN -->
            <main>
                <div class="head-title">
                    <div class="left">
                        <h1>Feedback</h1>
                        <ul class="breadcrumb">
                            <li>
                                <a href="#">Dashboard</a>
                            </li>
                            <li><i class='bx bx-chevron-right' ></i></li>
                            <li>
                                <a class="active" href="#">Feedback</a>
                            </li>
                        </ul>
                    </div>
                </div>


                <div class="table-data">
                    <div class="order">
                        <div class="head">
                            <h3>Feedback</h3>
                            <i class='bx bx-search' ></i>
                            <form action="MainController" method="POST">
                                <label for="commentTime">Xem feedback theo ngày:</label>
                                <input type="hidden" name="doctorID" value="${DOCTORID}"/>
                                <input type="date" name="cmtDate"  id="commentTime" style="border: 2px solid blue; outline: none; border-radius: 7px; padding: 4px; color: blue; margin-left: 15px;">
                                <button type="submit" name="action" value="ViewFeedbackByTimeDoctor" style="border: none; font-size: 18px; cursor: pointer;"><i class='bx bx-filter' ></i></button>
                            </form>
                        </div>

                        <c:if test="${LIST_COMMENT != null}">
                            <table>
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>Full Name</th>
                                        <th>Date</th>
                                        <th>Content</th>
                                        <th>Rate</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="listComment" items="${LIST_COMMENT}" varStatus="loop">
                                        <tr>
                                            <td>${loop.count}</td>
                                            <td>
                                                <p style="font-weight: 600; color: #002060;">${listComment.name}</p>
                                            </td>
                                            <td>${listComment.cmtTime}</td>
                                            <td><span style="font-weight: 500; color: #2eb7e5;">${listComment.contentCmt}</span></td>
                                            <td><span class="status pending" style="color: white;">${listComment.rate}</span></td>
                                            <td><span class="status pending">${listComment.status}</span></td>
                                        </tr>
                                    </c:forEach>                                                                   
                                </tbody>
                            </table>
                        </c:if>
                    </div>
                </div>
            </main>
            <!-- MAIN -->
        </section>
        <!-- CONTENT -->

        <script src="script.js"></script>
    </body>
</html>
