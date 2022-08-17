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
        <!-- Icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
        <!-- Boxicons -->
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <!-- My CSS -->
        <link rel="stylesheet" href="<c:url value="/css/service.css"/>">
        <link rel="stylesheet" href="<c:url value="/css/modal.css"/>">


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
                            <button type="submit" name="action" value="ViewAllFeedback" class="text"><span>Services</span></button>
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
                <a href="#" class="nav-link">Services</a>
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
                        <h1>Services</h1>
                        <ul class="breadcrumb">
                            <li>
                                <a href="#">Dashboard</a>
                            </li>
                            <li><i class='bx bx-chevron-right' ></i></li>
                            <li>
                                <a class="active" href="#">Services</a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="table-data">
                    <div class="todo">
                        <div class="head">
                            <h3>All Services</h3>
                            <form action="MainController" method="POST">                              
                                <button type="submit" name="action" value="ViewDeletedService" style="background: #4faeff; padding: 5px; color: white; border-radius: 6px;  font-size: 17px; cursor: pointer; border: 1px solid white;">Deleted Services</button>
                            </form>
                            <form action="MainController" method="POST">
                                <a href="#my-modal" style="border: none; font-size: 18px; color: #002060; cursor: pointer;"><i class='bx bx-plus' ></i></a>
                                <!--Modal-->
                                <div id="my-modal" class="modal">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <a href="#" class="close">&times;</a>
                                            <h2>Thêm dịch vụ</h2>
                                        </div>
                                        <div class="modal-body">
                                            <c:forEach var="countService" items="${COUNT_SERVICE}">
                                                <input type="hidden" name="serviceID" value="${countService.serviceID}"/>
                                            </c:forEach>
                                            <label for="serviceName">Tên dịch vụ:</label><br>
                                            <input type="text" id="serviceName" name="serviceName" placeholder="Nhập tên dịch vụ"/><br>
                                            <label for="serviceName">giới thiệu dịch vụ:</label><br>
                                            <textarea placeholder="Nhập giới thiệu dịch vụ"
                                                      rows="5" cols="70" name="demo"></textarea><br>
                                            <label for="serviceName">Miêu tả 1:</label><br>
                                            <textarea placeholder="Nhập miêu tả 1"
                                                      rows="8" cols="70" name="description1"></textarea><br>
                                            <label for="serviceName">Miêu tả 2:</label><br>
                                            <textarea placeholder="Nhập miêu tả 2"
                                                      rows="8" cols="70" name="description2"></textarea><br>
                                            <label for="serviceName">Miêu tả 3:</label><br>
                                            <textarea placeholder="Nhập miêu tả 3"
                                                      rows="8" cols="70" name="description3"></textarea><br>
                                            <label for="serviceName">Tiêu đề 1:</label><br>
                                            <textarea placeholder="Nhập tiêu đề 1"
                                                      rows="3" cols="70" name="title1"></textarea><br>
                                            <label for="serviceName">Tiêu đề 2:</label><br>
                                            <textarea placeholder="Nhập tiêu đề 2"
                                                      rows="3" cols="70" name="title2"></textarea><br>
                                            <label for="serviceName">Tiêu đề 3:</label><br>
                                            <textarea placeholder="Nhập tiêu đề 3"
                                                      rows="3" cols="70" name="title3"></textarea><br>
                                            <input type="hidden" value="${SERVICE_DETAIL.serviceID}" name="serviceID"/>
                                            <label for="serviceName">Ảnh cho tiêu đề 1:</label><br>
                                            <input type="file" name="title1_img"/><br><br>
                                            <label for="serviceName">Ảnh cho tiêu đề 2:</label><br>
                                            <input type="file" name="title2_img"/><br><br>
                                            <label for="serviceName">Ảnh cho tiêu đề 3:</label><br>
                                            <input type="file" name="title3_img"/><br><br>
                                            <label for="serviceName">Ảnh Logo dịch vụ:</label><br>
                                            <input type="file" name="service_img"/><br><br>
                                            <button type="submit" name="action" value="CreateNewService" style="border: none; padding: 10px 15px; color: white; background: #1565c0; margin-bottom: 80px; cursor: pointer;">Update</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <i class='bx bx-filter' ></i>
                        </div>
                        <ul class="todo-list">
                            <c:forEach var="service" items="${LIST_SERVICE}">
                                <li class="completed">
                                    <a href="ViewServiceDetailByIDController?serviceID=${service.serviceID}" style="text-decoration: none;">${service.serviceName}</a>
                                    <form action="MainController" method="POST">
                                        <input type="hidden" value="${service.serviceID}" name="serviceID"/>
                                        <button type="submit" name="action" value="DeleteServiceByID" style="border: none; font-size: 18px; cursor: pointer; color: red;"><i class="bi bi-trash"></i></button> 
                                    </form>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </main>
            <!-- MAIN -->
        </section>
        <!-- CONTENT -->


        <script src="script.js"></script>
    </body>
</html>