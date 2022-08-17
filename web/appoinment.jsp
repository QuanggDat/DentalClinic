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
        <link href="<c:url value="/css/doctor.css"/>" rel="stylesheet" type="text/css" />
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
                    <input type="hidden" value="${DOCTORID}" name="doctorID"/>
                    <li class="active">
                        <a href="#">
                            <i class='bx bxs-dashboard' ></i>
                            <span class="text">Dashboard</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
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
                        <h1>Appoinment</h1>
                        <ul class="breadcrumb">
                            <li>
                                <a href="#">Dashboard</a>
                            </li>
                            <li><i class='bx bx-chevron-right' ></i></li>
                            <li>
                                <a class="active" href="#">Appoinment</a>
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
                                <input type="hidden" value="${DOCTORID}" name="doctorID"/>
                                <button type="submit" name="action" value="ViewProcessingAppoinment" style="background: #4faeff; padding: 5px; color: white; border-radius: 6px;  font-size: 17px; cursor: pointer; border: 1px solid white;">Processing List</button>
                            </form>
                            <!--                            <div>
                                                            <form action="MainController" method="POST">
                                                                <input type="hidden" value="${DOCTORID}" name="doctorID"/>
                                                                <input type="date" name="appointmentDate"  id="commentTime" style="border: 2px solid blue; outline: none; border-radius: 7px; padding: 4px; color: blue; margin-left: 15px;">
                                                                <button type="submit" name="action" value="ViewAppointmentDoctorByDate" style="border: none; font-size: 18px; cursor: pointer;"><i class='bx bx-filter' ></i></button>
                                                            </form>
                                                        </div>-->
                        </div>

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
                        <c:if test="${LIST_APPOINMENT != null}">
                            <table>
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>Full Name</th>
                                        <th>Appoinment Date</th>
                                        <th>Email</th>
                                        <th>Phone Number</th>
                                        <th>Note</th>
                                        <th>Status</th>
                                        <th>Accept</th>
                                        <th>Delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="listAppoinment" items="${LIST_APPOINMENT}" varStatus="loop">
                                    <form action="MainController" method="POST">
                                        <tr>
                                        <input type="hidden" value="${DOCTORID}" name="doctorID"/>
                                        <input type="hidden" value="${listAppoinment.appoinmentID}" name="appoinmentID"/>
                                        <td>${loop.count}</td>
                                        <td>
                                            <p>${listAppoinment.fullName}</p>
                                        </td>
                                        <td>${listAppoinment.appointment_date}</td>
                                        <td><span>${listAppoinment.email}</span></td>
                                        <td><span>${listAppoinment.phoneNumber}</span></td>
                                        <td><span>${listAppoinment.note}</span></td>
                                        <td><span class="status pending">${listAppoinment.status}</span></td>
                                        <td><button type="submit" name="action" value="UpdateAppoinment" style="border: none; font-size: 25px; color: green; cursor: pointer;"><i class='bx bxs-check-circle'></i></button></td>
                                        <td><button type="submit" name="action" value="DeleteAppoinment" style="border: none; font-size: 25px; color: red; cursor: pointer;"><i class='bx bxs-x-circle'></i></button></td>
                                        
                                        </tr>
                                    </form>
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
