<%-- 
    Document   : booking.jsp
    Created on : Jun 16, 2022, 2:40:00 AM
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
        <title>Booking</title>
        <!-- Icons -->
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css"
            />
        <!-- Css -->
        <link href="<c:url value="/css/style.css"/>" rel="stylesheet" type="text/css" />
        <!-- Font  -->
        <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
            />
        <!-- BootStrap  -->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            />
        <!-- Js  -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <div id="header">
            <div class="container d-flex jc-between">
                <a href="HomeController?userName=${LOGIN_USER.userName}&password=${LOGIN_USER.password}" id="logo">
                    <img src="<c:url value="/images/logo.png"/>" alt="Logo" height="50" width="50"/>
                </a>
                <!-- end logo -->

                <ul id="main-menu" class="d-flex">
                    <li><a href="HomeController?userName=${LOGIN_USER.userName}&password=${LOGIN_USER.password}">TRANG CHỦ</a></li>
                    <li><a href="#doctor">BÁC SỸ</a></li>
                    <li><a href="#service">DỊCH VỤ</a></li>
                    <li><a href="#blog">BLOGS</a></li>
                    <li><a href="#contact">LIÊN HỆ</a></li>
                </ul>
                <!-- end main menu -->

                <form id="search">
                    <input type="text" placeholder="Search" />
                    <button><i class="bi bi-search"></i></button>
                </form>
                <!-- end form -->

                <!-- drop-down  -->
                <div class="dropdown profile">
                    <c:if test="${LOGIN_USER != null}">                            
                        <button type="button" class="btn btn-pills btn-soft-primary dropdown-toggle p-0" data-toggle="dropdown">
                            <img src="<c:url value="/images/users/${LOGIN_USER.img}"/>" class="avatar avatar-ex-small rounded-circle" alt="" height="40" width="40">
                        </button>
                    </c:if>

                    <div class="dropdown-menu">
                        <a class="dropdown-item d-flex align-items-center text-dark" href="ProfileController?id=${LOGIN_USER.userID}">
                            <div class="flex-1 ms-2">
                                <span class="d-block mb-1">${LOGIN_USER.fullName}</span>
                                <small class="text-muted">${LOGIN_USER.address}</small>
                            </div>
                        </a>
                        <form action="MainController" method="POST">
                            <input type="hidden" value="${LOGIN_USER.userID}" name="id"/>    
                            <button class="dropdown-item" type="submit" class="btn btn-link" name="action" value="ViewProfile" style="font-size: 20px; text-decoration: none;"><i class="bi bi-person-lines-fill"></i> Profile</button>
                            <a class="dropdown-item" href="#"><i class="bi bi-gear-fill"></i> Setting</a> 
                            <c:if test="${LOGIN_USER != null}">                            
                                <a class="dropdown-item" href="login.jsp"><i class="bi bi-door-open-fill" type="submit" name="action" value="Logout"></i> Logout</a> 
                            </c:if>

                        </form>
                    </div>
                </div>
                <!-- end drop-down -->
                <div class="ms-4" style="font-size: 21px;">
                    <c:if test="${LOGIN_USER != null}">                            
                        <a class="dropdown-item" href="#"><i class="bi bi-bell-fill"></i></a> 
                        </c:if>
                </div>

                <c:if test="${LOGIN_USER == null}">
                    <form action="MainController" method="POST">
                        <a class="btn" href="login.jsp" style="text-decoration: none; background: #0d6efd; color: white"><i class="bi bi-door-open-fill"></i> Đăng nhập</a>
                        <a href="register.jsp" class="btn btn-light btn-sm" style="color: blue;"><i class="bi bi-person-plus"></i> Đăng ký</a> 
                    </form> 
                </c:if>
            </div>
        </div>
        <!-- End header -->

        <div class="container mt-4">
            <div class="row">
                <div class="col-sm-8">
                    <div class="form_contact" style="margin-top: 200px;">
                        <h1>Điền thông tin </h1>
                        <form action="MainController">
                            <input type="hidden" value="${LOGIN_USER.userName}" name="userName"/>
                            <input type="hidden" value="${LOGIN_USER.password}" name="password"/>
                            <div class="row pb-2 mx-0">
                                <div class="col-sm-6">
                                    <label for="service">Điền họ và tên :</label> <br>
                                    <input type="text" placeholder="Họ tên (*)" class="form-control" name="fullName" value="${USER.fullName}" required>
                                </div>
                                <div class="col-sm-6">
                                    <label for="service">Điền SĐT :</label> <br>
                                    <input type="text" placeholder="Số điện thoại" class="form-control" name="phoneNumber" value="${USER.phoneNumber}" required>
                                </div>
                                <div class="col-sm-6">
                                    <label for="service">Điền gmail :</label> <br>
                                    <input type="email" placeholder="Email" class="form-control" name="email" value="${USER.email}" required>
                                </div>
                                <div class="col-sm-6">
                                    <label for="">Chọn ngày hẹn :</label> <br>
                                    <input type="date" placeholder="Ngày hẹn" class="form-control" name="appoinmentDate" required>
                                    <!--<input type="text" placeholder="Ngày hẹn" class="form-control" name="appoinmentDate" value="2022/06/20" required>-->
                                </div>
                                <div class="col-sm-6">
                                    <label for="">Dịch vụ :</label> <br>
                                    <c:if test="${DOCTOR.specialize == 1}">
                                        <b>Cấy ghép Implant</b>
                                        <input type="hidden" value="${DOCTOR.specialize}" name="serviceID"/> 
                                    </c:if>
                                    <c:if test="${DOCTOR.specialize == 2}">
                                        <b>Thẩm mỹ răng sứ</b>
                                        <input type="hidden" value="${DOCTOR.specialize}" name="serviceID"/> 
                                    </c:if>
                                    <c:if test="${DOCTOR.specialize == 3}">
                                        <b>Trồng răng sứ</b>
                                        <input type="hidden" value="${DOCTOR.specialize}" name="serviceID"/> 
                                    </c:if>
                                    <c:if test="${DOCTOR.specialize == 4}">
                                        <b>Làm mặt sứ veneer</b>
                                        <input type="hidden" value="${DOCTOR.specialize}" name="serviceID"/> 
                                    </c:if>
                                    <c:if test="${DOCTOR.specialize == 5}">
                                        <b>Niềng răng chỉnh nha</b>
                                        <input type="hidden" value="${DOCTOR.specialize}" name="serviceID"/> 
                                    </c:if>
                                    <c:if test="${DOCTOR.specialize == 6}">
                                        <b>Thẩm mỹ nha khoa</b>
                                        <input type="hidden" value="${DOCTOR.specialize}" name="serviceID"/> 
                                    </c:if>
                                    <c:if test="${DOCTOR.specialize == 7}">
                                        <b>Tẩy trắng răng</b>
                                        <input type="hidden" value="${DOCTOR.specialize}" name="serviceID"/> 
                                    </c:if>
                                    <c:if test="${DOCTOR.specialize == 8}">
                                        <b>Nha tổng quát</b>
                                        <input type="hidden" value="${DOCTOR.specialize}" name="serviceID"/> 
                                    </c:if>

                                </div>
                                <div class="col-sm-6">
                                    <label for="">Bác sĩ :</label> <br>
                                    <input type="text" placeholder="Bác sĩ" class="form-control" name="service" value="${DOCTOR.fullName}" required>
                                    <input type="hidden" value="${DOCTOR.id}" name="doctorID"/> 
                                </div>
                                <div class="col-sm-6">
                                    <label for="">Giờ hẹn :</label> <br>
                                    <c:if test="${DOCTOR.wkID == 1}">
                                        <b>09:00AM - 11:00AM</b>
                                        <input type="hidden" value="${DOCTOR.wkID}" name="wkID"/> 
                                    </c:if>
                                    <c:if test="${DOCTOR.wkID == 2}">
                                        <b>12:00AM - 02:00PM</b>
                                        <input type="hidden" value="${DOCTOR.wkID}" name="wkID"/> 
                                    </c:if>
                                    <c:if test="${DOCTOR.wkID == 3}">
                                        <b>02:00PM - 04:00PM</b>
                                        <input type="hidden" value="${DOCTOR.wkID}" name="wkID"/> 
                                    </c:if>
                                    <c:if test="${DOCTOR.wkID == 4}">
                                        <b>04:00PM - 06:00PM</b>
                                        <input type="hidden" value="${DOCTOR.wkID}" name="wkID"/> 
                                    </c:if>
                                    <c:if test="${DOCTOR.wkID == 5}">
                                        <b>07:00PM - 09:00PM</b>
                                        <input type="hidden" value="${DOCTOR.wkID}" name="wkID"/> 
                                    </c:if>

                                </div>
                            </div>
                            <textarea name="note" id="" cols="100" rows="5" placeholder="Ghi chú ở đây" class="form-control"></textarea> <br>
                            <%
                                String error = (String) request.getAttribute("ERROR");
                                if (error == null) {
                                    error = "";
                                }
                                String success = (String) request.getAttribute("SUCCESS");
                                if (success == null) {
                                    success = "";
                                }
                            %>
                            <h6 style="color: red;" ><%= error%></h6>
                            <h6 style="color: green;" ><%= success%></h6>
                            <button type="submit" class="btn btn-primary" name="action" value="Send_Appoinment">Đặt hẹn</button>
                        </form>
                    </div>
                </div>
                <div class="col-sm-4" style="margin-top: 200px;">
                    <h5 class="mt-2 text-center">Map of our Location</h5>
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4364.254662366012!2d106.8066691765757!3d10.84122349060472!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752731176b07b1%3A0xb752b24b379bae5e!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBGUFQgVFAuIEhDTQ!5e1!3m2!1svi!2s!4v1655132367472!5m2!1svi!2s" width="100%" height="200" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                    <h6 class="mt-2 text-center mt-3">Liên lạc với chúng tôi</h6>
                    <div class="list-group">
                        <a href="#" class="list-group-item list-group-item-action"><i class="bi bi-telephone-fill"></i> <b>Hotline:</b>  0384 510 456</a>
                        <a href="#" class="list-group-item list-group-item-action"><i class="bi bi-facebook"></i> <b>Fanpages:</b> DBDentist</a>
                        <a href="#" class="list-group-item list-group-item-action"><i class="bi bi-envelope-open-fill"></i> <b>Email:</b> BDDentist@gmail.com</a>
                    </div>
                </div>
            </div>

        </div>
    </body>
</html>
