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
                <a href="#" class="nav-link">Doctor detail</a>
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
                        <h1>Doctors detail</h1>
                        <ul class="breadcrumb">
                            <li>
                                <a class="active" href="ViewAllDoctorByEmployeeController">Doctors</a>
                            </li>
                            <li><i class='bx bx-chevron-right' ></i></li>
                            <li>
                                <a class="active" href="#">Doctor detail</a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="table-data">
                    <div class="todo">
                        <div class="head">
                            <h3>Doctor Infomation</h3>
                            <i class='bx bx-plus' ></i>
                            <i class='bx bx-filter' ></i>
                        </div>
                        <form action="MainController" method="POST">
                            <input type="hidden" value="${DOCTOR_BY_ID.userID}" name="id"/>
                            <label for="fullName">Tên bác sỹ:</label><br>
                            <input type="text" id="fullName" name="fullName" value="${DOCTOR_BY_ID.fullName}"/><br>
                            <label for="age">Tuổi:</label><br>
                            <input type="text" id="age" name="age" value="${DOCTOR_BY_ID.age}"/><br>
                            <label for="address">Địa chỉ:</label><br>
                            <input type="text" id="address" name="address" value="${DOCTOR_BY_ID.address}"/><br>
                            <label for="email">Email:</label><br>
                            <input type="email" id="email" name="email" value="${DOCTOR_BY_ID.email}"/><br>
                            <label>Giới tính</label><br />
                            <input name="gender" id="Nam" type="radio" value="0" checked/>
                            <label for="Nam">Nam</label>
                            <input name="gender" id="Nu" type="radio" value="1" />
                            <label for="Nu">Nữ</label><br />
                            <label for="phoneNumber">Số điện thoại:</label><br>
                            <input type="text" id="phoneNumber" name="phoneNumber" value="${DOCTOR_BY_ID.phoneNumber}"/><br>
                            <label for="avatar">Ảnh đại diện:</label><br>        
                            <img src="<c:url value="/images/doctors/${DOCTOR_BY_ID.img}"/>" alt="" width="160px" height="160px"><br>
                            <input type="file" name="img"/><br><br>
                            <button type="submit" name="action" value="UpdateDoctorInformation" style="border: none; padding: 10px 15px; color: white; background: #1565c0; margin-bottom: 80px; cursor: pointer;">Update</button>
                            <%
                                String success = (String) request.getAttribute("SUCCESS");
                                if (success == null) {
                                    success = "";
                                }
                            %>
                            <h4 style="color: green;" ><%=success%> </h4>
                        </form>
                        <br>
                        <hr>
                        <div class="head">
                            <h3>Cập nhật khung giờ cho Bác sỹ</h3>
                            <i class='bx bx-plus' ></i>
                            <i class='bx bx-filter' ></i>
                        </div>

                        <form action="MainController" method="POST">
                            <input type="hidden" value="${DOCTOR_BY_ID.id}" name="doctorID"/>
                            <select id="cars" name="wkID" style="border: 2px solid blue; outline: none; border-radius: 7px; padding: 7px; color: blue; margin-left: 15px;">
                                <option value="1">09:00AM - 11:00AM</option>
                                <option value="2">12:00AM - 02:00PM</option>
                                <option value="3">02:00PM - 04:00PM</option>
                                <option value="4">04:00PM - 06:00PM</option>
                                <option value="5">07:00PM - 09:00PM</option>
                            </select>
                            <button type="submit" name="action" value="UpdateWorkingTimeDoctor" style="border: none; padding: 7px 15px; color: white; background: #1565c0; margin-bottom: 80px; cursor: pointer; border-radius: 5px;">Update</button>
                        </form>
                        <h4>Số bệnh nhân đang có: ${DOCTOR_BY_ID.id}</h4>
                        <div style="margin-top: 20px;">
                            <h3>Khung giờ hiện tại của bác sỹ là:</h3>
                            <c:if test="${DOCTOR_BY_ID.wkID == 1}">
                                <p style="color: #e35d6a; font-weight: 600;"><span>Giờ làm </span>: 09:00AM - 11:00AM</p>
                            </c:if>
                            <c:if test="${DOCTOR_BY_ID.wkID == 2}">
                                <p style="color: #e35d6a; font-weight: 600;"><span>Giờ làm </span>: 12:00AM - 02:00PM</p>
                            </c:if>
                            <c:if test="${DOCTOR_BY_ID.wkID == 3}">
                                <p style="color: #e35d6a; font-weight: 600;"><span>Giờ làm </span>: 02:00PM - 04:00PM</p>
                            </c:if>
                            <c:if test="${DOCTOR_BY_ID.wkID == 4}">
                                <p style="color: #e35d6a; font-weight: 600;"><span>Giờ làm </span>: 04:00PM - 06:00PM</p>
                            </c:if>
                            <c:if test="${DOCTOR_BY_ID.wkID == 5}">
                                <p style="color: #e35d6a; font-weight: 600;"><span>Giờ làm </span>: 07:00PM - 09:00PM</p>
                            </c:if>
                        </div>
                    </div>
                </div>
            </main>
            <!-- MAIN -->
        </section>
        <!-- CONTENT -->


        <script src="script.js"></script>
    </body>
</html>