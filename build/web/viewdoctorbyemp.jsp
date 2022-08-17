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
                    <!--                    <li>
                                            <a href="#">
                                                <i class='bx bx-coin-stack' ></i>
                                                <button type="submit" name="action" value="ViewAllService" class="text"><span>Price</span></button>
                                            </a>
                                        </li>-->
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
                <a href="#" class="nav-link">Doctors</a>
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
                        <h1>Doctors</h1>
                        <ul class="breadcrumb">
                            <li>
                                <a href="#">Dashboard</a>
                            </li>
                            <li><i class='bx bx-chevron-right' ></i></li>
                            <li>
                                <a class="active" href="#">Doctors</a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="table-data">
                    <div class="todo">
                        <div class="head">
                            <h3>All Doctors</h3>
                            <form action="MainController" method="POST">
                                <a href="#my-modal" style="border: none; font-size: 18px; color: #002060; cursor: pointer;"><i class='bx bx-plus' ></i></a>
                                <!--Modal-->
                                <div id="my-modal" class="modal">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <a href="#" class="close">&times;</a>
                                            <h2>Thêm Bác sỹ</h2>
                                        </div>
                                        <div class="modal-body">
                                            <input type="hidden" value="${DOCTOR_BY_ID.userID}" name="id"/>
                                            <label for="fullName">Tên bác sỹ:</label><br>
                                            <input type="text" id="fullName" name="fullName"/><br>
                                            <label for="age">Tuổi:</label><br>
                                            <input type="text" id="age" name="age"/><br>
                                            <label for="address">Địa chỉ:</label><br>
                                            <input type="text" id="address" name="address"/><br>
                                            <label for="email">Email:</label><br>
                                            <input type="email" id="email" name="email" /><br>
                                            <label>Giới tính</label><br />
                                            <input name="gender" id="Nam" type="radio" value="0" checked/>
                                            <label for="Nam">Nam</label>
                                            <input name="gender" id="Nu" type="radio" value="1" />
                                            <label for="Nu">Nữ</label><br />
                                            <label for="phoneNumber">Số điện thoại:</label><br>
                                            <input type="text" id="phoneNumber" name="phoneNumber"/><br>
                                            <label for="avatar">Ảnh đại diện:</label><br>
                                            <input type="file" name="img"/><br><br>
                                            <button type="submit" name="action" value="UpdateDoctorInformation" style="border: none; padding: 10px 15px; color: white; background: #1565c0; margin-bottom: 80px; cursor: pointer;">Update</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <i class='bx bx-filter' ></i>
                        </div>
                        <ul class="todo-list">
                            <c:forEach var="doctorByEmp" items="${LIST_DOCTOR_BY_EMP}">
                                <li class="completed">
                                    <c:if test="${doctorByEmp.roleID == 4}">
                                        <a href="ViewDetailDoctorByIDController?id=${doctorByEmp.userID}" style="text-decoration: none; color: #008844">${doctorByEmp.fullName}</a>
                                    </c:if>
                                    <c:if test="${doctorByEmp.roleID == 3}">
                                        <a href="ViewDetailDoctorByIDController?id=${doctorByEmp.userID}" style="text-decoration: none; color: #d62d20">${doctorByEmp.fullName}</a>
                                    </c:if>
                                    <form action="MainController" method="POST">
                                        <input type="hidden" value="${doctorByEmp.userID}" name="id"/>
                                        <button type="submit" name="action" value="UpdateRoleDoctorToUser" style="border: none; font-size: 22px; cursor: pointer; color: red;"><i class='bx bx-repost'></i></button> 
                                        <button type="submit" name="action" value="RestoreRoleDoctor" style="border: none; font-size: 22px; cursor: pointer; color: green;"><i class='bx bx-repost'></i></button> 
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