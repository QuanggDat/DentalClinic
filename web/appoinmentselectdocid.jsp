<%-- 
    Document   : appoinment
    Created on : Jun 27, 2022, 10:05:54 PM
    Author     : SE150436 - Hoàng Quang Hòa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <!-- Boxicons -->
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <!-- Css -->
        <link href="<c:url value="/css/employee.css"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/css/modal.css"/>" rel="stylesheet" type="text/css" />

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
                    <input type="hidden" value="${DOCTOR.id}" name="doctorID"/>
                    <li class="active">
                        <a href="#">
                            <i class='bx bxs-dashboard' ></i>
                            <span class="text">Dashboard</span>
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
                            <i class='bx bxs-news'></i>
                            <button type="submit" name="action" value="ViewAllService" class="text"><span>News</span></button>
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
                        <h1>Appoinment</h1>
                        <ul class="breadcrumb">
                            <li>
                                <a href="#">Dashboard</a>
                            </li>
                            <li><i class='bx bx-chevron-right' ></i></li>
                            <li>
                                <a class="active" href="ViewAllAppoinmentController">Appoinment</a>
                            </li>
                        </ul>
                    </div>
                </div>


                <div class="table-data">
                    <div class="order">
                        <div class="head">
                            <h3>Appoinment</h3>
                            <i class='bx bx-search' ></i>
                            <form action="MainController" method="POST">
                                <select id="cars" name="doctorID" style="border: 2px solid blue; outline: none; border-radius: 7px; padding: 4px; color: blue; margin-left: 15px;">
                                    <option value="1">Calvin Carlo</option>
                                    <option value="2">Cristino Murphy</option>
                                    <option value="3">Alia Reddy</option>
                                    <option value="4">Toni Kovar</option>
                                    <option value="5">Jessica McFarlane</option>
                                    <option value="6">Elsie Sherman</option>
                                    <option value="7">Bertha Magers</option>
                                    <option value="8">Louis Batey</option>
                                </select>
                                <button type="submit" name="action" value="ViewAppoinmentByDoctorID" style="border: none; font-size: 18px; cursor: pointer;"><i class='bx bx-filter' ></i></button>
                            </form>
                        </div>


                        <c:if test="${LIST_APPOINMENT_BY_DOCTORID != null}">
                            <table>
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>Full Name</th>
                                        <th>Appoinment Date</th>
                                        <th>Email</th>
                                        <th>Note</th>
                                        <th>Doctor</th>
                                        <th>Time</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="listAppoinmentByDoctorID" items="${LIST_APPOINMENT_BY_DOCTORID}" varStatus="loop">
                                        <tr>
                                    <input type="hidden" value="${listAppoinment.appoinmentID}" name="appoinmentID"/>
                                    <td>${loop.count}</td>
                                    <td>
                                        <p style="font-weight: 600; color: #002060;">${listAppoinmentByDoctorID.fullName}</p>
                                    </td>
                                    <td style="font-weight: 500; color: #0c21e5;">${listAppoinmentByDoctorID.appointment_date}</td>
                                    <td><span>${listAppoinmentByDoctorID.email}</span></td>
                                    <td><span style="color: #ea0051;">${listAppoinmentByDoctorID.note}</span></td>
                                    <c:if test="${listAppoinmentByDoctorID.doctorID == 1}">
                                        <td><span>Calvin Carlo</span></td>
                                    </c:if>
                                    <c:if test="${listAppoinmentByDoctorID.doctorID == 2}">
                                        <td><span>Cristino Murphy</span></td>
                                    </c:if>
                                    <c:if test="${listAppoinmentByDoctorID.doctorID == 3}">
                                        <td><span>Alia Reddy</span></td>
                                    </c:if>
                                    <c:if test="${listAppoinmentByDoctorID.doctorID == 4}">
                                        <td><span>Toni Kovar</span></td>
                                    </c:if>
                                    <c:if test="${listAppoinmentByDoctorID.doctorID == 5}">
                                        <td><span>Jessica McFarlane</span></td>
                                    </c:if>
                                    <c:if test="${listAppoinmentByDoctorID.doctorID == 6}">
                                        <td><span>Elsie Sherman</span></td>
                                    </c:if>
                                    <c:if test="${listAppoinmentByDoctorID.doctorID == 7}">
                                        <td><span>Bertha Magers</span></td>
                                    </c:if>
                                    <c:if test="${listAppoinmentByDoctorID.doctorID == 8}">
                                        <td><span>Louis Batey</span></td>
                                    </c:if>
                                    <!--Giờ--> 
                                    <c:if test="${listAppoinmentByDoctorID.wkID == 1}">
                                        <td style="font-weight: 500; color: #2eb7e5;"><span>09:00AM - 11:00AM</span></td>
                                    </c:if>
                                    <c:if test="${listAppoinmentByDoctorID.wkID == 2}">
                                        <td style="font-weight: 500; color: #2eb7e5;"><span>12:00AM - 02:00PM</span></td>
                                    </c:if>
                                    <c:if test="${listAppoinmentByDoctorID.wkID == 3}">
                                        <td style="font-weight: 500; color: #2eb7e5;"><span>02:00PM - 04:00PM</span></td>
                                    </c:if>
                                    <c:if test="${listAppoinmentByDoctorID.wkID == 4}">
                                        <td style="font-weight: 500; color: #2eb7e5;"><span>04:00PM - 06:00PM</span></td>
                                    </c:if>
                                    <c:if test="${listAppoinmentByDoctorID.wkID == 5}">
                                        <td style="font-weight: 500; color: #2eb7e5;"><span>107:00PM - 09:00PM</span></td>
                                    </c:if>
                                    <td><span class="status pending">${listAppoinmentByDoctorID.status}</span></td>
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


        <script src="<c:url value="/js/main.js"/>"></script>
    </body>
</html>
