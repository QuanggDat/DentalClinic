<%-- 
    Document   : index
    Created on : Jun 2, 2022, 8:48:35 PM
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
        <title>Dental Clinic</title>
        <!-- Icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
        <!-- Css -->
        <link href="<c:url value="/css/style.css"/>" rel="stylesheet" type="text/css"/>
        <!-- Font  -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- BootStrap  -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Js  -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>

        <!-- Loader -->
        <!--                 <div id="preloader">
                            <div id="status">
                                <div class="spinner">
                                    <div class="double-bounce1"></div>
                                    <div class="double-bounce2"></div>
                                </div>
                            </div>
                        </div> -->
        <!-- loader-->

        <!-- ============================================== HEADER ============================================== -->
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
                            <input type="hidden" value="${LOGIN_USER.userName}" name="userName"/>
                            <input type="hidden" value="${LOGIN_USER.password}" name="password"/>
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

        <!-- start hero -->
        <div class="background">
            <div class="bg_img" style="width: 100%;
                 height: 100%;
                 background-image: url(<c:url value="/images/bg_2.jpg"/>) ;
                 background-size: cover;
                 background-repeat: no-repeat;">
                <div class="heading-title">
                    <h4 class="display-4 fw-bold text-white title-dark mt-3 mb-4">Hệ Thống Nha Khoa <br> BD Dentistry</h4>
                    <p class="para-desc text-white-50 mb-0">Có một hàm răng trắng sáng và đều đặn <br>
                        bạn sẽ trở nên tự tin hơn.</p>

                    <div class="mt-4 pt-2">
                        <a href="#book_appointment" class="btn btn-primary">Đặt hẹn</a>
                        <p class="text-white-50 mb-0 mt-2">DB clinic. Đọc thêm <a href="#" class="text-white-50">điều khoản và dịch vụ<i class="ri-arrow-right-line align-middle"></i></a></p>
                    </div>
                </div>
            </div>
        </div>

        <!-- start booking appoinment  -->

        <!-- Start -->
        <section class="section">
            <div class="container mt-5">
                <!-- start service  -->
                <div class="container mt-100 mt-60">
                    <div class="row justify-content-center">
                        <div class="col-12" id="service">
                            <div class="section-title mb-4 pb-2 text-center">
                                <span class="badge badge-pill badge-soft-primary mb-3">Departments</span>
                                <h4 class="title mb-4">DỊCH VỤ NHA KHOA UY TÍN TẠI BD DENTISTRY</h4>
                            </div>
                        </div><!--end col-->
                    </div><!--end row-->

                    <div class="row">
                        <c:forEach var="service" items="${LIST_SERVICE}">
                            <div class="col-xl-3 col-md-4 col-12 col-sm-3 mt-5">
                                <form action="MainController" method="POST">
                                    <input type="hidden" value="${LOGIN_USER.userName}" name="userName"/>
                                    <input type="hidden" value="${LOGIN_USER.password}" name="password"/>
                                    <div class="card features feature-primary border-0">
                                        <div class="img-service ms-5">
                                            <img src="<c:url value="/images/service/${service.service_img}"/>" alt="">
                                        </div>
                                        <input type="hidden" value="${service.serviceID}" name="id"/>
                                        <div class="card-body p-0 mt-3">
                                            <a href="departments.html" class="title h5">${service.serviceName}</a>
                                            <p class="text-muted mt-3">${service.demo}</p>
                                            <button type="submit" class="btn btn-link" name="action" value="Service" style="font-size: 20px; text-decoration: none;">Xem thêm <i class="bi bi-arrow-right"></i></button>
                                        </div>
                                    </div>
                                </form>
                            </div><!--end col-->
                        </c:forEach>
                    </div><!--end row-->
                </div><!--end container-->
                <!-- End -->
            </div>
        </section>

        <!-- Start -->
        <section class="section mt-5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-12">
                        <div class="section-title text-center mb-4 pb-2">
                            <h4 class="title mb-4" id="doctor">ĐỘI NGŨ BÁC SĨ GIỎI - BD DENTISTRY</h4>
                            <h6 class="text-center"><em>"Cam kết chất lượng dịch vụ chuẩn quốc tế"</em></h6>
                        </div>
                    </div><!--end col-->
                </div><!--end row-->


                <div class="row align-items-center">
                    <c:forEach var="doctor" items="${LIST_DOCTOR}">
                        <div class="col-xl-3 col-lg-3 col-md-6 mt-4 pt-2">
                            <form action="MainController" method="POST">
                                <div class="card team border-0 rounded shadow overflow-hidden">
                                    <div class="team-img position-relative">
                                        <img src="<c:url value="/images/doctors/${doctor.img}"/>" class="img-fluid" alt="">
                                    </div>
                                    <input type="hidden" value="${LOGIN_USER.userName}" name="userName"/>
                                    <input type="hidden" value="${LOGIN_USER.password}" name="password"/>
                                    <input type="hidden" value="${doctor.userID}" name="id"/>
                                    <input type="hidden" value="${doctor.id}" name="docID"/>
                                    <div class="card-body-doctor content text-center">
        <!--                                <a href="doctor-team-one.html" class="title-doctor h5 d-none mb-0">${doctor.fullName}</a>-->
                                        <button type="submit" class="btn btn-link title-doctor" name="action" value="Doctor" style="font-size: 20px; text-decoration: none;">${doctor.fullName}</i></button>
                                    </div>
                                </div>
                            </form>
                        </div><!--end col-->
                    </c:forEach>  
                </div><!--end row-->
            </div><!--end container-->
        </section><!--end section-->
        <!-- End -->

        <!-- Start -->
        <section class="section bg-light">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-12">
                        <div class="section-title text-center mb-4 pb-2">
                            <h4 class="title mb-4">THỜI GIAN LÀM VIỆC CỦA BÁC SỸ</h4>
                            <h6 class="text-center"><em>Chúng tôi làm việc 7 ngày trong tuần, hãy đến với chúng tôi khi bạn cần.</em></h6>
                        </div>
                    </div><!--end col-->
                </div><!--end row-->
            </div><!--end container-->

            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 mt-4 pt-2">
                        <div class="table-responsive shadow rounded">
                            <table class="table table-center table-bordered bg-white mb-0" id="book_appointment">
                                <thead>
                                    <tr>
                                        <th class="text-center py-4" style="min-width: 120px;">Time Table</th>
                                        <th class="text-center py-4" style="min-width: 200px;"></th>
                                        <th class="text-center py-4" style="min-width: 200px;"></th>
                                        <th class="text-center py-4" style="min-width: 200px;"></th>
                                        <th class="text-center py-4" style="min-width: 200px;"></th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- Start -->
                                    <tr>
                                        <th class="text-center py-5">09:00AM-11:00AM</th>
                                            <c:forEach var="doctor" items="${LIST_DOCTOR}">
                                                <c:if test="${doctor.wkID == 1}">
                                                <td>
                                                    <form action="MainController" method="POST">
                                                        <div class="d-flex mb-3">
                                                            <input type="hidden" value="${LOGIN_USER.userName}" name="userName"/>
                                                            <input type="hidden" value="${LOGIN_USER.password}" name="password"/>
                                                            <input type="hidden" value="${LOGIN_USER.userID}" name="usid"/> 
                                                            <input type="hidden" value="${doctor.userID}" name="id"/>
                                                            <img src="<c:url value="/images/doctors/${doctor.img}"/>" class="avatar rounded-circle border shadow" alt="" width="40px" height="40px">
                                                            <div class="ms-3">
                                                                <h6 class="text-dark mb-0 d-block">${doctor.fullName}</h6>
                                                                <c:if test="${doctor.specialize == 1}">
                                                                    <small class="text-muted">Cấy ghép Implant</small>
                                                                </c:if>
                                                                <c:if test="${doctor.specialize == 2}">
                                                                    <small class="text-muted">Thẩm mỹ răng sứ</small>
                                                                </c:if>
                                                                <c:if test="${doctor.specialize == 3}">
                                                                    <small class="text-muted">Trồng răng sứ</small>
                                                                </c:if>
                                                                <c:if test="${doctor.specialize == 4}">
                                                                    <small class="text-muted">Làm mặt sứ veneer</small>
                                                                </c:if>
                                                                <c:if test="${doctor.specialize == 5}">
                                                                    <small class="text-muted">Niềng răng chỉnh nha</small>
                                                                </c:if>
                                                                <c:if test="${doctor.specialize == 6}">
                                                                    <small class="text-muted">Thẩm mỹ nha khoa</small>
                                                                </c:if>
                                                                <c:if test="${doctor.specialize == 7}">
                                                                    <small class="text-muted">Tẩy trắng răng</small>
                                                                </c:if>
                                                                <c:if test="${doctor.specialize == 8}">
                                                                    <small class="text-muted">Nha tổng quát</small>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                        <c:if test="${LOGIN_USER != null}">

                                                            <!--Booking-->
                                                            <c:if test="${doctor.slot_book == 0}">
                                                                <button type="submit" class="btn btn-link title-doctor" name="action" value="Booking" style="font-size: 14px; text-decoration: none; background: royalblue; padding: 5px; color: white">Book here</button>
                                                            </c:if>
                                                            <c:if test="${doctor.slot_book == 1}">
                                                                <button type="submit" class="btn btn-link title-doctor" name="action" value="Booking" style="font-size: 14px; text-decoration: none; background: royalblue; padding: 5px; color: white">Book here</button>
                                                            </c:if>
                                                            <c:if test="${doctor.slot_book == 2}">
                                                                <button type="submit" class="btn btn-link title-doctor" name="action" value="Booking" style="font-size: 14px; text-decoration: none; background: royalblue; padding: 5px; color: white">Book here</button>
                                                            </c:if>
                                                            <c:if test="${doctor.slot_book == 3}">
                                                                <button type="submit" class="btn btn-link title-doctor" name="action" value="Booking" style="font-size: 14px; text-decoration: none; background: royalblue; padding: 5px; color: white">Book here</button>
                                                            </c:if>
                                                            <c:if test="${doctor.slot_book == 4}">
                                                                <input type="button" value="Book here" class="btn btn-link title-doctor" style="font-size: 14px; text-decoration: none; background: red; padding: 5px; color: white"/>
                                                            </c:if>
                                                            <!--End booking-->
                                                        </c:if>
                                                        <c:if test="${doctor.wkID == 1}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center">09:00AM - 11:00AM</small>
                                                        </c:if>
                                                        <c:if test="${doctor.wkID == 2}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center">12:00AM - 02:00PM</small>
                                                        </c:if>
                                                        <c:if test="${doctor.wkID == 3}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center">02:00PM - 04:00PM</small>
                                                        </c:if>
                                                        <c:if test="${doctor.wkID == 4}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center">04:00PM - 06:00PM</small>
                                                        </c:if>
                                                        <c:if test="${doctor.wkID == 5}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center">07:00PM - 09:00PM</small>
                                                        </c:if>
                                                        <!--Slot-->
                                                        <c:if test="${doctor.slot_book == 0}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center" style="color: green; font-weight: 700;">Còn trống 4 slots</small>
                                                        </c:if>  
                                                        <c:if test="${doctor.slot_book == 1}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center" style="color: green; font-weight: 700;">Còn trống 3 slots</small>
                                                        </c:if>  
                                                        <c:if test="${doctor.slot_book == 2}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center" style="color: green; font-weight: 700;">Còn trống 2 slots</small>
                                                        </c:if>  
                                                        <c:if test="${doctor.slot_book == 3}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center" style="color: green; font-weight: 700;">Còn trống 1 slot</small>
                                                        </c:if>  
                                                        <c:if test="${doctor.slot_book == 4}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center" style="color: red; font-weight: 700;">Đã hết slot</small>
                                                        </c:if>  
                                                    </form>

                                                </td>
                                            </c:if>
                                        </c:forEach>
                                    </tr>
                                    <!--12:00AM-->
                                    <tr>
                                        <th class="text-center py-5">12:00AM-02:00PM</th>
                                            <c:forEach var="doctor" items="${LIST_DOCTOR}">
                                                <c:if test="${doctor.wkID == 2}">
                                                <td>
                                                    <form action="MainController" method="POST">
                                                        <div class="d-flex mb-3">
                                                            <input type="hidden" value="${LOGIN_USER.userID}" name="usid"/> 
                                                            <input type="hidden" value="${doctor.userID}" name="id"/>
                                                            <img src="<c:url value="/images/doctors/${doctor.img}"/>" class="avatar rounded-circle border shadow" alt="" width="40px" height="40px">
                                                            <div class="ms-3">
                                                                <h6 class="text-dark mb-0 d-block">${doctor.fullName}</h6>
                                                                <c:if test="${doctor.specialize == 1}">
                                                                    <small class="text-muted">Cấy ghép Implant</small>
                                                                </c:if>
                                                                <c:if test="${doctor.specialize == 2}">
                                                                    <small class="text-muted">Thẩm mỹ răng sứ</small>
                                                                </c:if>
                                                                <c:if test="${doctor.specialize == 3}">
                                                                    <small class="text-muted">Trồng răng sứ</small>
                                                                </c:if>
                                                                <c:if test="${doctor.specialize == 4}">
                                                                    <small class="text-muted">Làm mặt sứ veneer</small>
                                                                </c:if>
                                                                <c:if test="${doctor.specialize == 5}">
                                                                    <small class="text-muted">Niềng răng chỉnh nha</small>
                                                                </c:if>
                                                                <c:if test="${doctor.specialize == 6}">
                                                                    <small class="text-muted">Thẩm mỹ nha khoa</small>
                                                                </c:if>
                                                                <c:if test="${doctor.specialize == 7}">
                                                                    <small class="text-muted">Tẩy trắng răng</small>
                                                                </c:if>
                                                                <c:if test="${doctor.specialize == 8}">
                                                                    <small class="text-muted">Nha tổng quát</small>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                        <c:if test="${LOGIN_USER != null}">
                                                            <!--Booking-->
                                                            <c:if test="${doctor.slot_book == 0}">
                                                                <button type="submit" class="btn btn-link title-doctor" name="action" value="Booking" style="font-size: 14px; text-decoration: none; background: royalblue; padding: 5px; color: white">Book here</button>
                                                            </c:if>
                                                            <c:if test="${doctor.slot_book == 1}">
                                                                <button type="submit" class="btn btn-link title-doctor" name="action" value="Booking" style="font-size: 14px; text-decoration: none; background: royalblue; padding: 5px; color: white">Book here</button>
                                                            </c:if>
                                                            <c:if test="${doctor.slot_book == 2}">
                                                                <button type="submit" class="btn btn-link title-doctor" name="action" value="Booking" style="font-size: 14px; text-decoration: none; background: royalblue; padding: 5px; color: white">Book here</button>
                                                            </c:if>
                                                            <c:if test="${doctor.slot_book == 3}">
                                                                <button type="submit" class="btn btn-link title-doctor" name="action" value="Booking" style="font-size: 14px; text-decoration: none; background: royalblue; padding: 5px; color: white">Book here</button>
                                                            </c:if>
                                                            <c:if test="${doctor.slot_book == 4}">
                                                                <input type="button" value="Book here" class="btn btn-link title-doctor" style="font-size: 14px; text-decoration: none; background: red; padding: 5px; color: white"/>
                                                            </c:if>
                                                            <!--End booking-->
                                                        </c:if> 
                                                        <c:if test="${doctor.wkID == 1}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center">09:00AM - 11:00AM</small>
                                                        </c:if>
                                                        <c:if test="${doctor.wkID == 2}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center">12:00AM - 02:00PM</small>
                                                        </c:if>
                                                        <c:if test="${doctor.wkID == 3}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center">02:00PM - 04:00PM</small>
                                                        </c:if>
                                                        <c:if test="${doctor.wkID == 4}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center">04:00PM - 06:00PM</small>
                                                        </c:if>
                                                        <c:if test="${doctor.wkID == 5}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center">07:00PM - 09:00PM</small>
                                                        </c:if>
                                                        <!--Slot-->
                                                        <c:if test="${doctor.slot_book == 0}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center" style="color: green; font-weight: 700;">Còn trống 4 slots</small>
                                                        </c:if>  
                                                        <c:if test="${doctor.slot_book == 1}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center" style="color: green; font-weight: 700;">Còn trống 3 slots</small>
                                                        </c:if>  
                                                        <c:if test="${doctor.slot_book == 2}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center" style="color: green; font-weight: 700;">Còn trống 2 slots</small>
                                                        </c:if>  
                                                        <c:if test="${doctor.slot_book == 3}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center" style="color: green; font-weight: 700;">Còn trống 1 slot</small>
                                                        </c:if>  
                                                        <c:if test="${doctor.slot_book == 4}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center" style="color: red; font-weight: 700;">Đã hết slot</small>
                                                        </c:if> 
                                                    </form>
                                                </td>
                                            </c:if>
                                        </c:forEach>
                                    </tr>
                                    <tr>
                                        <th class="text-center py-5">02:00PM-04:00PM</th>
                                            <c:forEach var="doctor" items="${LIST_DOCTOR}">
                                                <c:if test="${doctor.wkID == 3}">
                                                <td>
                                                    <form action="MainController" method="POST">
                                                        <div class="d-flex mb-3">
                                                            <input type="hidden" value="${LOGIN_USER.userID}" name="usid"/> 
                                                            <input type="hidden" value="${doctor.userID}" name="id"/>
                                                            <img src="<c:url value="/images/doctors/${doctor.img}"/>" class="avatar rounded-circle border shadow" alt="" width="40px" height="40px">
                                                            <div class="ms-3">
                                                                <h6 class="text-dark mb-0 d-block">${doctor.fullName}</h6>
                                                                <c:if test="${doctor.specialize == 1}">
                                                                    <small class="text-muted">Cấy ghép Implant</small>
                                                                </c:if>
                                                                <c:if test="${doctor.specialize == 2}">
                                                                    <small class="text-muted">Thẩm mỹ răng sứ</small>
                                                                </c:if>
                                                                <c:if test="${doctor.specialize == 3}">
                                                                    <small class="text-muted">Trồng răng sứ</small>
                                                                </c:if>
                                                                <c:if test="${doctor.specialize == 4}">
                                                                    <small class="text-muted">Làm mặt sứ veneer</small>
                                                                </c:if>
                                                                <c:if test="${doctor.specialize == 5}">
                                                                    <small class="text-muted">Niềng răng chỉnh nha</small>
                                                                </c:if>
                                                                <c:if test="${doctor.specialize == 6}">
                                                                    <small class="text-muted">Thẩm mỹ nha khoa</small>
                                                                </c:if>
                                                                <c:if test="${doctor.specialize == 7}">
                                                                    <small class="text-muted">Tẩy trắng răng</small>
                                                                </c:if>
                                                                <c:if test="${doctor.specialize == 8}">
                                                                    <small class="text-muted">Nha tổng quát</small>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                        <c:if test="${LOGIN_USER != null}">

                                                            <!--Booking-->
                                                            <c:if test="${doctor.slot_book == 0}">
                                                                <button type="submit" class="btn btn-link title-doctor" name="action" value="Booking" style="font-size: 14px; text-decoration: none; background: royalblue; padding: 5px; color: white">Book here</button>
                                                            </c:if>
                                                            <c:if test="${doctor.slot_book == 1}">
                                                                <button type="submit" class="btn btn-link title-doctor" name="action" value="Booking" style="font-size: 14px; text-decoration: none; background: royalblue; padding: 5px; color: white">Book here</button>
                                                            </c:if>
                                                            <c:if test="${doctor.slot_book == 2}">
                                                                <button type="submit" class="btn btn-link title-doctor" name="action" value="Booking" style="font-size: 14px; text-decoration: none; background: royalblue; padding: 5px; color: white">Book here</button>
                                                            </c:if>
                                                            <c:if test="${doctor.slot_book == 3}">
                                                                <button type="submit" class="btn btn-link title-doctor" name="action" value="Booking" style="font-size: 14px; text-decoration: none; background: royalblue; padding: 5px; color: white">Book here</button>
                                                            </c:if>
                                                            <c:if test="${doctor.slot_book == 4}">
                                                                <input type="button" value="Book here" class="btn btn-link title-doctor" style="font-size: 14px; text-decoration: none; background: red; padding: 5px; color: white"/>
                                                            </c:if>
                                                            <!--End booking-->
                                                        </c:if>
                                                        <c:if test="${doctor.wkID == 1}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center">09:00AM - 11:00AM</small>
                                                        </c:if>
                                                        <c:if test="${doctor.wkID == 2}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center">12:00AM - 02:00PM</small>
                                                        </c:if>
                                                        <c:if test="${doctor.wkID == 3}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center">02:00PM - 04:00PM</small>
                                                        </c:if>
                                                        <c:if test="${doctor.wkID == 4}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center">04:00PM - 06:00PM</small>
                                                        </c:if>
                                                        <c:if test="${doctor.wkID == 5}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center">07:00PM - 09:00PM</small>
                                                        </c:if>
                                                        <!--Slot-->
                                                        <c:if test="${doctor.slot_book == 0}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center" style="color: green; font-weight: 700;">Còn trống 4 slots</small>
                                                        </c:if>  
                                                        <c:if test="${doctor.slot_book == 1}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center" style="color: green; font-weight: 700;">Còn trống 3 slots</small>
                                                        </c:if>  
                                                        <c:if test="${doctor.slot_book == 2}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center" style="color: green; font-weight: 700;">Còn trống 2 slots</small>
                                                        </c:if>  
                                                        <c:if test="${doctor.slot_book == 3}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center" style="color: green; font-weight: 700;">Còn dư 1 slot</small>
                                                        </c:if>  
                                                        <c:if test="${doctor.slot_book == 4}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center" style="color: red; font-weight: 700;">Đã hết slot</small>
                                                        </c:if>
                                                    </form>
                                                </td>
                                            </c:if>
                                        </c:forEach>
                                    </tr>
                                    <tr>
                                        <th class="text-center py-5">04:00PM-06:00PM</th>
                                            <c:forEach var="doctor" items="${LIST_DOCTOR}">
                                                <c:if test="${doctor.wkID == 4}">
                                                <td>
                                                    <form action="MainController" method="POST">
                                                        <div class="d-flex mb-3">
                                                            <input type="hidden" value="${LOGIN_USER.userID}" name="usid"/> 
                                                            <input type="hidden" value="${doctor.userID}" name="id"/>
                                                            <img src="<c:url value="/images/doctors/${doctor.img}"/>" class="avatar rounded-circle border shadow" alt="" width="40px" height="40px">
                                                            <div class="ms-3">
                                                                <h6 class="text-dark mb-0 d-block">${doctor.fullName}</h6>
                                                                <c:if test="${doctor.specialize == 1}">
                                                                    <small class="text-muted">Cấy ghép Implant</small>
                                                                </c:if>
                                                                <c:if test="${doctor.specialize == 2}">
                                                                    <small class="text-muted">Thẩm mỹ răng sứ</small>
                                                                </c:if>
                                                                <c:if test="${doctor.specialize == 3}">
                                                                    <small class="text-muted">Trồng răng sứ</small>
                                                                </c:if>
                                                                <c:if test="${doctor.specialize == 4}">
                                                                    <small class="text-muted">Làm mặt sứ veneer</small>
                                                                </c:if>
                                                                <c:if test="${doctor.specialize == 5}">
                                                                    <small class="text-muted">Niềng răng chỉnh nha</small>
                                                                </c:if>
                                                                <c:if test="${doctor.specialize == 6}">
                                                                    <small class="text-muted">Thẩm mỹ nha khoa</small>
                                                                </c:if>
                                                                <c:if test="${doctor.specialize == 7}">
                                                                    <small class="text-muted">Tẩy trắng răng</small>
                                                                </c:if>
                                                                <c:if test="${doctor.specialize == 8}">
                                                                    <small class="text-muted">Nha tổng quát</small>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                        <c:if test="${LOGIN_USER != null}">

                                                            <!--Booking-->
                                                            <c:if test="${doctor.slot_book == 0}">
                                                                <button type="submit" class="btn btn-link title-doctor" name="action" value="Booking" style="font-size: 14px; text-decoration: none; background: royalblue; padding: 5px; color: white">Book here</button>
                                                            </c:if>
                                                            <c:if test="${doctor.slot_book == 1}">
                                                                <button type="submit" class="btn btn-link title-doctor" name="action" value="Booking" style="font-size: 14px; text-decoration: none; background: royalblue; padding: 5px; color: white">Book here</button>
                                                            </c:if>
                                                            <c:if test="${doctor.slot_book == 2}">
                                                                <button type="submit" class="btn btn-link title-doctor" name="action" value="Booking" style="font-size: 14px; text-decoration: none; background: royalblue; padding: 5px; color: white">Book here</button>
                                                            </c:if>
                                                            <c:if test="${doctor.slot_book == 3}">
                                                                <button type="submit" class="btn btn-link title-doctor" name="action" value="Booking" style="font-size: 14px; text-decoration: none; background: royalblue; padding: 5px; color: white">Book here</button>
                                                            </c:if>
                                                            <c:if test="${doctor.slot_book == 4}">
                                                                <input type="button" value="Book here" class="btn btn-link title-doctor" style="font-size: 14px; text-decoration: none; background: red; padding: 5px; color: white"/>
                                                            </c:if>
                                                            <!--End booking-->
                                                        </c:if>
                                                        <c:if test="${doctor.wkID == 1}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center">09:00AM - 11:00AM</small>
                                                        </c:if>
                                                        <c:if test="${doctor.wkID == 2}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center">12:00AM - 02:00PM</small>
                                                        </c:if>
                                                        <c:if test="${doctor.wkID == 3}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center">02:00PM - 04:00PM</small>
                                                        </c:if>
                                                        <c:if test="${doctor.wkID == 4}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center">04:00PM - 06:00PM</small>
                                                        </c:if>
                                                        <c:if test="${doctor.wkID == 5}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center">07:00PM - 09:00PM</small>
                                                        </c:if>
                                                        <!--Slot-->
                                                        <c:if test="${doctor.slot_book == 0}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center" style="color: green; font-weight: 700;">Còn trống 4 slots</small>
                                                        </c:if>  
                                                        <c:if test="${doctor.slot_book == 1}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center" style="color: green; font-weight: 700;">Còn trống 3 slots</small>
                                                        </c:if>  
                                                        <c:if test="${doctor.slot_book == 2}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center" style="color: green; font-weight: 700;">Còn trống 2 slots</small>
                                                        </c:if>  
                                                        <c:if test="${doctor.slot_book == 3}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center" style="color: green; font-weight: 700;">Còn trống 1 slot</small>
                                                        </c:if>  
                                                        <c:if test="${doctor.slot_book == 4}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center" style="color: red; font-weight: 700;">Đã hết slot</small>
                                                        </c:if>
                                                    </form>
                                                </td>
                                            </c:if>
                                        </c:forEach>
                                    </tr>
                                    <tr>
                                        <th class="text-center py-5">07:00PM-09:00PM</th>
                                            <c:forEach var="doctor" items="${LIST_DOCTOR}">
                                                <c:if test="${doctor.wkID == 5}">
                                                <td>
                                                    <form action="MainController" method="POST">
                                                        <div class="d-flex mb-3">
                                                            <input type="hidden" value="${LOGIN_USER.userID}" name="usid"/> 
                                                            <input type="hidden" value="${doctor.userID}" name="id"/>
                                                            <img src="<c:url value="/images/doctors/${doctor.img}"/>" class="avatar rounded-circle border shadow" alt="" width="40px" height="40px">
                                                            <div class="ms-3">
                                                                <h6 class="text-dark mb-0 d-block">${doctor.fullName}</h6>
                                                                <c:if test="${doctor.specialize == 1}">
                                                                    <small class="text-muted">Cấy ghép Implant</small>
                                                                </c:if>
                                                                <c:if test="${doctor.specialize == 2}">
                                                                    <small class="text-muted">Thẩm mỹ răng sứ</small>
                                                                </c:if>
                                                                <c:if test="${doctor.specialize == 3}">
                                                                    <small class="text-muted">Trồng răng sứ</small>
                                                                </c:if>
                                                                <c:if test="${doctor.specialize == 4}">
                                                                    <small class="text-muted">Làm mặt sứ veneer</small>
                                                                </c:if>
                                                                <c:if test="${doctor.specialize == 5}">
                                                                    <small class="text-muted">Niềng răng chỉnh nha</small>
                                                                </c:if>
                                                                <c:if test="${doctor.specialize == 6}">
                                                                    <small class="text-muted">Thẩm mỹ nha khoa</small>
                                                                </c:if>
                                                                <c:if test="${doctor.specialize == 7}">
                                                                    <small class="text-muted">Tẩy trắng răng</small>
                                                                </c:if>
                                                                <c:if test="${doctor.specialize == 8}">
                                                                    <small class="text-muted">Nha tổng quát</small>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                        <c:if test="${LOGIN_USER != null}">

                                                            <!--Booking-->
                                                            <c:if test="${doctor.slot_book == 0}">
                                                                <button type="submit" class="btn btn-link title-doctor" name="action" value="Booking" style="font-size: 14px; text-decoration: none; background: royalblue; padding: 5px; color: white">Book here</button>
                                                            </c:if>
                                                            <c:if test="${doctor.slot_book == 1}">
                                                                <button type="submit" class="btn btn-link title-doctor" name="action" value="Booking" style="font-size: 14px; text-decoration: none; background: royalblue; padding: 5px; color: white">Book here</button>
                                                            </c:if>
                                                            <c:if test="${doctor.slot_book == 2}">
                                                                <button type="submit" class="btn btn-link title-doctor" name="action" value="Booking" style="font-size: 14px; text-decoration: none; background: royalblue; padding: 5px; color: white">Book here</button>
                                                            </c:if>
                                                            <c:if test="${doctor.slot_book == 3}">
                                                                <button type="submit" class="btn btn-link title-doctor" name="action" value="Booking" style="font-size: 14px; text-decoration: none; background: royalblue; padding: 5px; color: white">Book here</button>
                                                            </c:if>
                                                            <c:if test="${doctor.slot_book == 4}">
                                                                <input type="button" value="Book here" class="btn btn-link title-doctor" style="font-size: 14px; text-decoration: none; background: red; padding: 5px; color: white"/>
                                                            </c:if>
                                                            <!--End booking-->
                                                        </c:if>
                                                        <c:if test="${doctor.wkID == 1}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center">09:00AM - 11:00AM</small>
                                                        </c:if>
                                                        <c:if test="${doctor.wkID == 2}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center">12:00AM - 02:00PM</small>
                                                        </c:if>
                                                        <c:if test="${doctor.wkID == 3}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center">02:00PM - 04:00PM</small>
                                                        </c:if>
                                                        <c:if test="${doctor.wkID == 4}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center">04:00PM - 06:00PM</small>
                                                        </c:if>
                                                        <c:if test="${doctor.wkID == 5}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center">07:00PM - 09:00PM</small>
                                                        </c:if>
                                                        <!--Slot-->
                                                        <c:if test="${doctor.slot_book == 0}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center" style="color: green; font-weight: 700;">Còn trống 4 slots</small>
                                                        </c:if>  
                                                        <c:if test="${doctor.slot_book == 1}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center" style="color: green; font-weight: 700;">Còn trống 3 slots</small>
                                                        </c:if>  
                                                        <c:if test="${doctor.slot_book == 2}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center" style="color: green; font-weight: 700;">Còn trống 2 slots</small>
                                                        </c:if>  
                                                        <c:if test="${doctor.slot_book == 3}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center" style="color: green; font-weight: 700;">Còn trống 1 slot</small>
                                                        </c:if>  
                                                        <c:if test="${doctor.slot_book == 4}">
                                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center" style="color: red; font-weight: 700;">Đã hết slot</small>
                                                        </c:if>
                                                    </form>
                                                </td>
                                            </c:if>
                                        </c:forEach>
                                    </tr>
                                    <!-- End -->
                                </tbody>
                            </table>
                        </div>
                    </div><!--end col-->
                </div><!--end row-->
            </div><!--end container-fluid-->
        </section><!--end section-->
        <!-- End -->



        <!-- Start -->
        <section class="section" id="contact">
            <h4 class="text-center mt-4">ĐỊA CHỈ VÀ LIÊN HỆ</h4>
            <h6 class="text-center"><em>(Hãy liên hệ với chúng tôi để được hỗ trợ)</em></h6>
            <div class="container mt-4">
                <div class="row">
                    <div class="col-sm-8">
                        <div class="form_contact">
                            <form action="">
                                <div class="row pb-2 mx-0">
                                    <div class="col-sm-6">
                                        <label for="service">Điền họ và tên :</label> <br>
                                        <input type="text" placeholder="Họ tên (*)" class="form-control" name="fullName" required>
                                    </div>
                                    <div class="col-sm-6">
                                        <label for="service">Điền SĐT :</label> <br>
                                        <input type="text" placeholder="Số điện thoại" class="form-control" name="phoneNumber" required>
                                    </div>
                                    <div class="col-sm-6">
                                        <label for="service">Điền gmail :</label> <br>
                                        <input type="email" placeholder="Email" class="form-control" name="email" required>
                                    </div>
                                    <div class="col-sm-6">
                                        <label for="">Chọn ngày hẹn :</label> <br>
                                        <input type="date" placeholder="Ngày hẹn" class="form-control" name="appoinmentDate" required>
                                    </div>
                                    <div class="col-sm-6">
                                        <label for="service">Chọn dịch vụ để book bác sĩ:</label> <br>
                                        <select name="service" id="service" class="form-control">
                                            <option value="0">Cấy ghép Implant</option>
                                            <option value="1">Thẩm mỹ răng sứ</option>
                                            <option value="2">Trồng răng sứ</option>
                                            <option value="3">Mặt sứ Veneer</option>
                                            <option value="4">Niềng răng chỉnh nha</option>
                                            <option value="5">Thẩm mỹ nha khoa</option>
                                            <option value="6">Tẩy trắng răng</option>
                                            <option value="7">Nha tổng quát</option>
                                        </select>
                                    </div>
                                    <div class="col-sm-6">
                                        <label for="service">Chọn bác sĩ:</label> <br>
                                        <select name="service" id="service" class="form-control">
                                            <option value="0">Toni Kovar</option>
                                            <option value="1">Thẩm mỹ răng sứ</option>
                                            <option value="2">Trồng răng sứ</option>
                                            <option value="3">Mặt sứ Veneer</option>
                                            <option value="4">Niềng răng chỉnh nha</option>
                                            <option value="5">Thẩm mỹ nha khoa</option>
                                            <option value="6">Tẩy trắng răng</option>
                                            <option value="7">Nha tổng quát</option>
                                        </select>
                                    </div>
                                </div>
                                <textarea name="note" id="" cols="100" rows="5" placeholder="Ghi chú ở đây" class="form-control"></textarea> <br>
                                <button type="submit" class="btn btn-primary">Đặt hẹn</button>
                            </form>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <h5 class="mt-2 text-center">Map of our Location</h5>
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4364.254662366012!2d106.8066691765757!3d10.84122349060472!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752731176b07b1%3A0xb752b24b379bae5e!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBGUFQgVFAuIEhDTQ!5e1!3m2!1svi!2s!4v1655132367472!5m2!1svi!2s" width="100%" height="200" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                        <h6 class="mt-2 text-center mt-3">Liên lạc với chúng tôi</h6>
                        <div class="list-group">
                            <a href="#" class="list-group-item list-group-item-action"><i class="bi bi-telephone-fill"></i> <b>Hotline:</b>  0384 510 456</a>
                            <a href="#" class="list-group-item list-group-item-action"><i class="bi bi-facebook"></i> <b>Fanpages:</b> BD Dentist</a>
                            <a href="#" class="list-group-item list-group-item-action"><i class="bi bi-envelope-open-fill"></i> <b>Email:</b> BDDentist@gmail.com</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container mt-100 mt-60" id="blog">
                <div class="row justify-content-center">
                    <div class="col-12">
                        <div class="section-title text-center mb-4 pb-2">
                            <h5 class="title mb-4">3 YẾU TỐ GIÚP BD DENTIST CAM KẾT CHẤT LƯỢNG DỊCH VỤ</h5>
                            <h6>"Cam kết chất lượng dịch vụ chuẩn quốc tế"</h6>
                        </div>
                    </div><!--end col-->
                </div><!--end row-->

                <div class="row">
                    <div class="col-lg-4 col-md-6 col-12 mt-4 pt-2">
                        <div class="card blog blog-primary border-0 shadow rounded overflow-hidden">
                            <img src="<c:url value="/images/blogs/01.png"/>" class="img-fluid" alt="">
                            <div class="card-body p-4">
                                <ul class="list-unstyled mb-2">
                                    <li class="list-inline-item text-muted small me-3"><i class="uil uil-calendar-alt text-dark h6 me-1"></i>20th November, 2020</li>
                                    <li class="list-inline-item text-muted small"><i class="uil uil-clock text-dark h6 me-1"></i>3 min read</li>
                                </ul>
                                <a href="blog-detail.html" class="text-dark title h5">Trang thiết bị và công nghệ nha khoa hiện đại</a>
                                <div class="post-meta d-flex justify-content-between mt-3">
                                    <a href="Blog1.jsp" class="link">Read More <i class="mdi mdi-chevron-right align-middle"></i></a>
                                </div>
                            </div>
                        </div>
                    </div><!--end col-->

                    <div class="col-lg-4 col-md-6 col-12 mt-4 pt-2">
                        <div class="card blog blog-primary border-0 shadow rounded overflow-hidden">
                            <img src="<c:url value="/images/blogs/02.jpg"/>" class="img-fluid" alt="">
                            <div class="card-body p-4">
                                <ul class="list-unstyled mb-2">
                                    <li class="list-inline-item text-muted small me-3"><i class="uil uil-calendar-alt text-dark h6 me-1"></i>20th November, 2020</li>
                                    <li class="list-inline-item text-muted small"><i class="uil uil-clock text-dark h6 me-1"></i>5 min read</li>
                                </ul>
                                <a href="blog-detail.html" class="text-dark title h5">Chuyên môn hóa điều trị với 6 chuyên khoa</a>
                                <div class="post-meta d-flex justify-content-between mt-3">
                                    <a href="blog2.jsp" class="link">Read More <i class="mdi mdi-chevron-right align-middle"></i></a>
                                </div>
                            </div>
                        </div>
                    </div><!--end col-->

                    <div class="col-lg-4 col-md-6 col-12 mt-4 pt-2">
                        <div class="card blog blog-primary border-0 shadow rounded overflow-hidden">
                            <img src="<c:url value="/images/blogs/03.png"/>" class="img-fluid" alt="">
                            <div class="card-body p-4">
                                <ul class="list-unstyled mb-2">
                                    <li class="list-inline-item text-muted small me-3"><i class="uil uil-calendar-alt text-dark h6 me-1"></i>20th November, 2020</li>
                                    <li class="list-inline-item text-muted small"><i class="uil uil-clock text-dark h6 me-1"></i>5 min read</li>
                                </ul>
                                <a href="blog-detail.html" class="text-dark title h5">Vật liệu nha khoa chính hãng - Bảo hành lâu dài</a>
                                <div class="post-meta d-flex justify-content-between mt-3">
                                    <a href="blog-detail.html" class="link">Read More <i class="mdi mdi-chevron-right align-middle"></i></a>
                                </div>
                            </div>
                        </div>
                    </div><!--end col-->
                </div><!--end row-->
            </div><!--end container-->
        </section><!--end section-->
        <!-- End -->
    </div>


    <!--Footer-->
    <footer class="bg-footer">
        <div class="container">
            <div class="row">
                <div class="col-xl-5 col-lg-4 mb-0 mb-md-4 pb-0 pb-md-2">
                    <a hreclass="logo-footer">
                        <img src="../assets/images/logo-light.png" height="22" alt="">
                    </a>
                    <p class="mt-4 me-xl-5">Bài được làm bởi 5 thành viên: Hòa, Duy, Long, Công, Đạt. Hoàn thành trong vòng 10 tuần của các thành viên trong nhóm.</p>
                </div><!--end col-->

                <div class="col-xl-7 col-lg-8 col-md-12">
                    <div class="row">
                        <div class="col-md-4 col-12 mt-4 mt-sm-0 pt-2 pt-sm-0">
                            <h5 class="text-light title-dark footer-head mt-5">Phòng nha</h5>
                            <ul class="list-unstyled footer-list mt-4">
                                <li><a href="aboutus.html" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> About us</a></li>
                                <li><a href="departments.html" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Services</a></li>
                                <li><a href="doctor-team-two.html" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Team</a></li>
                                <li><a href="blog-detail.html" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Project</a></li>
                                <li><a href="blogs.html" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Blog</a></li>
                                <li><a href="login.html" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Login</a></li>
                            </ul>
                        </div><!--end col-->

                        <div class="col-md-4 col-12 mt-4 mt-sm-0 pt-2 pt-sm-0">
                            <h5 class="text-light title-dark footer-head mt-5">Liên lạc với chúng tôi</h5>
                            <ul class="list-unstyled footer-list mt-4">
                                <li class="d-flex align-items-center">
                                    <i data-feather="mail" class="fea icon-sm text-foot align-middle"></i>
                                    <a href="mailto:contact@example.com" class="text-foot ms-2">contact@example.com</a>
                                </li>

                                <li class="d-flex align-items-center">
                                    <i data-feather="phone" class="fea icon-sm text-foot align-middle"></i>
                                    <a href="tel:+152534-468-854" class="text-foot ms-2">+152 534-468-854</a>
                                </li>

                                <li class="d-flex align-items-center">
                                    <i data-feather="map-pin" class="fea icon-sm text-foot align-middle"></i>
                                    <a href="javascript:void(0)" class="video-play-icon text-foot ms-2">View on Google map</a>
                                </li>
                            </ul>

                            <ul class="list-unstyled social-icon footer-social mb-0 mt-4">
                                <li class="list-inline-item"><a href="#" class="rounded-pill"><i data-feather="facebook" class="fea icon-sm fea-social"></i></a></li>
                                <li class="list-inline-item"><a href="#" class="rounded-pill"><i data-feather="instagram" class="fea icon-sm fea-social"></i></a></li>
                                <li class="list-inline-item"><a href="#" class="rounded-pill"><i data-feather="twitter" class="fea icon-sm fea-social"></i></a></li>
                                <li class="list-inline-item"><a href="#" class="rounded-pill"><i data-feather="linkedin" class="fea icon-sm fea-social"></i></a></li>
                            </ul><!--end icon-->
                        </div><!--end col-->
                    </div><!--end row-->
                </div><!--end col-->
            </div><!--end row-->
        </div><!--end container-->

        <div class="container mt-5">
            <div class="pt-4 footer-bar">
                <div class="row align-items-center">
                    <div class="col-sm-6">
                        <div class="text-sm-start text-center">
                            <p class="mb-0"><script>document.write(new Date().getFullYear());</script> © DB. Design with GROUP2.</p>
                        </div>
                    </div><!--end col-->

                    <div class="col-sm-6 mt-4 mt-sm-0">
                        <ul class="list-unstyled footer-list text-sm-end text-center mb-0">
                            <li class="list-inline-item"><a href="terms.html" class="text-foot me-2">Terms</a></li>
                            <li class="list-inline-item"><a href="privacy.html" class="text-foot me-2">Privacy</a></li>
                            <li class="list-inline-item"><a href="aboutus.html" class="text-foot me-2">About</a></li>
                            <li class="list-inline-item"><a href="contact.html" class="text-foot me-2">Contact</a></li>
                        </ul>
                    </div><!--end col-->
                </div><!--end row-->
            </div>
        </div><!--end container-->
    </footer><!--end footer-->


    <div class="d-none d-sm-block" style="right: 0; bottom: 9em; z-index: 999; position: fixed;">
        <a style="color: white; width: 5em;" class="btn btn-primary text-center" href="tel:19002102"><i class="fa fa-phone"></i><br><small>Gọi điện</small></a>
        <br>
        <a style="color: white; width: 5em;" class="my-1 btn btn-primary text-center" data-toggle="modal" href="#book_appointment"><i class="fa fa-calendar-plus-o"></i><br><small>Đặt hẹn</small></a>
        <br>
        <a style="color: white; width: 5em;" class="btn btn-primary text-center" href="https://www.facebook.com/messages/t/100024258944305"><i class="fa fa-facebook-official"></i><br><small>Chat Facebook</small></a>
        <br>
        <a style="color: white; width: 5em;" class="my-1 btn btn-primary text-center" href="bang-gia.jsp"><i class="fa fa-table"></i><br><small>Bảng giá</small></a>
    </div>
</body>
</html>
