<%-- 
    Document   : employee
    Created on : Jun 18, 2022, 10:40:13 PM
    Author     : SE150436 - Hoàng Quang Hòa
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                            <button type="submit" name="action" value="ViewAllService" class="text"><span>Services</span></button>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class='bx bxs-group' ></i>
                            <span class="text">Team</span>
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
                    <a href="#" class="logout">
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
                                <a class="active" href="ViewAllServiceController">Services</a>
                            </li>
                            <li><i class='bx bx-chevron-right' ></i></li>
                            <li>
                                <a class="active" href="#">Service information</a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="table-data">
                    <div class="todo">
                        <div class="head">
                            <h3>Service Infomation</h3>
                            <i class='bx bx-plus' ></i>
                            <i class='bx bx-filter' ></i>
                        </div>
                        <p>${SUCCESS}</p>
                        <form action="MainController" method="POST">
                            <input type="hidden" value="${SERVICE_DETAIL.serviceID}" name="serviceID"/>
                            <label for="serviceName">Tên dịch vụ:</label><br>
                            <input type="text" id="serviceName" name="serviceName" value="${SERVICE_DETAIL.serviceName}"/><br>
                            <label for="serviceName">giới thiệu dịch vụ:</label><br>
                            <textarea placeholder="${SERVICE_DETAIL.demo}"
                                      rows="5" cols="40" name="demo"></textarea><br>
                            <label for="serviceName">Miêu tả 1:</label><br>
                            <textarea placeholder="${SERVICE_DETAIL.description1}"
                                      rows="12" cols="40" name="description1"></textarea><br>
                            <label for="serviceName">Miêu tả 2:</label><br>
                            <textarea placeholder="${SERVICE_DETAIL.description2}"
                                      rows="12" cols="40" name="description2"></textarea><br>
                            <label for="serviceName">Miêu tả 3:</label><br>
                            <textarea placeholder="${SERVICE_DETAIL.description3}"
                                      rows="12" cols="40" name="description3"></textarea><br>
                            <label for="serviceName">Tiêu đề 1:</label><br>
                            <textarea placeholder="${SERVICE_DETAIL.title1}"
                                      rows="3" cols="40" name="title1"></textarea><br>
                            <label for="serviceName">Tiêu đề 2:</label><br>
                            <textarea placeholder="${SERVICE_DETAIL.title2}"
                                      rows="3" cols="40" name="title2"></textarea><br>
                            <label for="serviceName">Tiêu đề 3:</label><br>
                            <textarea placeholder="${SERVICE_DETAIL.title3}"
                                      rows="3" cols="40" name="title3"></textarea><br>
                            <button type="submit" name="action" value="UpdateService" style="border: none; padding: 10px 15px; color: white; background: #1565c0; margin-bottom: 80px; cursor: pointer;">Update</button>
                        </form>
                        <form action="MainController" method="POST">
                            <input type="hidden" value="${SERVICE_DETAIL.serviceID}" name="serviceID"/>
                            <label for="serviceName">Ảnh tiêu đề 1:</label><br>        
                            <img src="<c:url value="/images/serviceDetail/${SERVICE_DETAIL.title1_img}"/>" alt="" width="160px" height="160px"><br>
                            <input type="file" name="title1_img"/><br><br>
                            <label for="serviceName">Ảnh tiêu đề 2:</label><br>        
                            <img src="<c:url value="/images/serviceDetail/${SERVICE_DETAIL.title2_img}"/>" alt="" width="160px" height="160px"><br>
                            <input type="file" name="title2_img"/><br><br>
                            <label for="serviceName">Ảnh tiêu đề 3:</label><br>        
                            <img src="<c:url value="/images/serviceDetail/${SERVICE_DETAIL.title3_img}"/>" alt="" width="160px" height="160px"><br>
                            <input type="file" name="title3_img"/><br><br>
                            <label for="serviceName">Ảnh Logo dịch vụ:</label><br>        
                            <img src="<c:url value="/images/service/${SERVICE_DETAIL.service_img}"/>" alt="" width="130px" height="130px"><br>
                            <input type="file" name="service_img"/><br><br>
                            <button type="submit" name="action" value="UpdateServiceImage" style="border: none; padding: 10px 15px; color: white; background: #1565c0; margin-bottom: 80px; cursor: pointer;">Update</button>
                        </form>
                    </div>
                </div>
            </main>
            <!-- MAIN -->
        </section>
        <!-- CONTENT -->


        <script src="script.js"></script>
    </body>
</html>