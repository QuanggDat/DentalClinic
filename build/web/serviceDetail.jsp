<%-- 
    Document   : serviceDetail
    Created on : Jun 5, 2022, 1:37:15 PM
    Author     : SE150436 - Hoàng Quang Hòa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
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
        
        <div class="container">
            <div class="row content py-3">
                <div class="col-sm-3"  style="margin-top: 100px;">
                    <form action="MainController" method="POST">
                        <div class="card bg-light mb-5">
                            <div class="card-header bg-dark text-white text-uppercase" style="font-weight: bold; text-align: center;"><i class="fa fa-list"></i> Dịch vụ</div>
                            <c:forEach var="service" items="${LIST_SERVICE}">
                                <ul class="list-group category_block">
                                    <input type="hidden" value="${service.serviceID}" name="id"/>
                                    <button type="submit" class="btn btn-link" name="action" value="Service" style="font-size: 20px; text-decoration: none;">${service.serviceName}</button>
                                </ul>
                            </c:forEach>
                        </div>
                    </form>
                </div>

                <!--Content-->
                <div class="col-sm-9" style="margin-top: 100px;">
                    <h2 class="text-center">Dịch vụ</h2>
                    <div class="p-5">
                        <h4>1. ${SERVICE_DETAIL.title1}</h4>
                        <img src="<c:url value="/images/serviceDetail/${SERVICE_DETAIL.title1_img}"/>" alt="" width="80%" height="400px">
                        <div class="mt-3">
                            <p>${SERVICE_DETAIL.description1}</p>
                        </div>                    
                    </div>
                    <div class="p-5">
                        <h4>2. ${SERVICE_DETAIL.title2}</h4>
                        <img src="<c:url value="/images/serviceDetail/${SERVICE_DETAIL.title2_img}"/>" alt="" width="80%" height="400px">
                        <div class="mt-3">
                            <p>${SERVICE_DETAIL.description2}</p>
                        </div>                    
                    </div>
                    <div class="p-5">
                        <h4>3. ${SERVICE_DETAIL.title3}</h4>
                        <img src="<c:url value="/images/serviceDetail/${SERVICE_DETAIL.title3_img}"/>" alt="" width="80%" height="400px">
                        <div class="mt-3">
                            <p>${SERVICE_DETAIL.description3}</p>
                        </div>                    
                    </div>
                </div>
            </div>
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

    </body>
</html>
