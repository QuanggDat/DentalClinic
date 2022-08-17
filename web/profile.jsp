<%-- 
Document   : profile
Created on : Jun 4, 2022, 9:46:37 AM
Author     : SE150436 - Hoàng Quang Hòa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Profile</title>
        <!-- Icons -->
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css"
            />
        <!-- Css -->
        <!--<link href="<c:url value="/css/style.css"/>" rel="stylesheet" type="text/css" />-->
        <link href="<c:url value="/css/tempt.css"/>" rel="stylesheet" type="text/css" />
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
                        <a class="dropdown-item d-flex align-items-center text-dark" href="ProfileController?id=${LOGIN_USER.userID}&userName=${LOGIN_USER.userName}&password=${LOGIN_USER.password}">
                            <div class="flex-1 ms-2">
                                <span class="d-block mb-1">${LOGIN_USER.fullName}</span>
                                <small class="text-muted">${LOGIN_USER.address}</small>
                            </div>
                        </a>
                        <form action="MainController" method="POST">
                            <input type="hidden" value="${LOGIN_USER.userID}" name="id"/>    
                            <input type="hidden" value="${LOGIN_USER.userName}" name="userName"/>    
                            <input type="hidden" value="${LOGIN_USER.password}" name="password"/>    
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

        <!-- Start -->
        <section class="bg-dashboard">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-4 col-lg-4 col-md-5 col-12">
                        <div class="rounded shadow overflow-hidden sticky-bar">
                            <div class="card border-0">
                                <img
                                    src="<c:url value="/images/profile-bg.jpg"/>"
                                    class="img-fluid"
                                    alt=""
                                    />
                            </div>

                            <div
                                class="text-center avatar-profile margin-nagative mt-n5 position-relative pb-4 border-bottom"
                                >
                                <img
                                    src="<c:url value="/images/users/${LOGIN_USER.img}"/>"
                                    class="rounded-circle shadow-md avatar avatar-md-md"
                                    alt=""
                                    />
                                <h5 class="mt-3 mb-1">${USER.fullName}</h5>
                                <p class="text-muted mb-0">${USER.address}</p>
                            </div>

                            <ul class="list-unstyled sidebar-nav mb-0">
                                <li class="navbar-item">
                                    <a href="login.jsp" class="navbar-link"
                                       ><i
                                            class="ri-login-circle-line align-middle navbar-icon"
                                            ></i>
                                        Login</a
                                    >
                                </li>
                                <li class="navbar-item">
                                    <a href="resetpassword.jsp" class="navbar-link"
                                       ><i
                                            class="ri-device-recover-line align-middle navbar-icon"
                                            ></i>
                                        Forgot Password</a
                                    >
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!--end col-->

                    <div class="col-xl-8 col-lg-8 col-md-7 mt-4 pt-2 mt-sm-0 pt-sm-0">
                        <div class="rounded shadow mt-4">
                            <div class="p-4 border-bottom">
                                <h5 class="mb-0">Thông tin cá nhân :</h5>
                            </div>

                            <div class="p-4 border-bottom">
                                <div class="row align-items-center">
                                    <div class="col-lg-2 col-md-4">
                                        <img
                                            src="<c:url value="/images/users/${LOGIN_USER.img}"/>"
                                            class="avatar avatar-md-md rounded-pill shadow mx-auto d-block"
                                            alt=""
                                            />
                                    </div>
                                    <!--end col-->

                                    <div
                                        class="col-lg-5 col-md-8 text-center text-md-start mt-4 mt-sm-0"
                                        >
                                        <h5 class="">Thay đổi hình ảnh của bạn</h5>
                                        <p class="text-muted mb-0">
                                            Sử dụng hình ảnh có kiểu là .png hoặc .jpg
                                        </p>
                                    </div>
                                    <!--end col-->

                                    <div
                                        class="col-lg-5 col-md-12 text-lg-end text-center mt-4 mt-lg-0"
                                        >
                                        <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#myUploadImg">Tải ảnh lên</a>
                                        <a href="#" class="btn btn-soft-primary ms-2" data-toggle="modal" data-target="#myDelete">Xóa</a>
                                    </div>
                                    <!--end col-->
                                </div>
                                <!--end row-->
                            </div>
                            <!-- start Modal-->
                            <form action="MainController" method="POST">
                                <!-- The Modal Update-->
                                <div class="modal fade" id="myUploadImg" style="z-index: 1000000000;">
                                    <div class="modal-dialog">
                                        <div class="modal-content">

                                            <!-- Modal Header -->
                                            <div class="modal-header" style="background-color: #0d6efd; color: #ddd;">
                                                <h4 class="modal-title">Thay đổi ảnh</h4>
                                                <!--<button type="button" class="close" data-dismiss="modal">×</button>-->
                                            </div>

                                            <!-- Modal body -->
                                            <div class="modal-body">
                                                <input type="hidden" value="${USER.userID}" name="id"/>
                                                <input type="file" name="img">
                                            </div>

                                            <!-- Modal footer -->
                                            <div class="modal-footer">
                                                <input type="hidden" value="${LOGIN_USER.userName}" name="userName"/>    
                                                <input type="hidden" value="${LOGIN_USER.password}" name="password"/> 
                                                <button type="submit" class="btn btn-primary" name="action" value="SaveImg">Lưu</button>
                                                <button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </form>

                            <!-- The Modal Delete-->
                            <div class="modal fade" id="myDelete" style="z-index: 1000000000;">
                                <div class="modal-dialog">
                                    <div class="modal-content">

                                        <!-- Modal Header -->
                                        <div class="modal-header" style="background-color: #0d6efd; color: #ddd;">
                                            <h4 class="modal-title"> Bạn có muốn xoá ảnh này không ?</h4>
                                        </div>

                                        <!-- Modal body -->
                                        <div class="modal-body">
                                            <a href="#" class="btn btn-primary" name="action" value="Delete">Có</a>
                                            <a href="#" class="btn btn-danger ms-2" data-dismiss="modal">Không</a>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            </form>

                            <div class="p-4">
                                <form action="MainController" method="POST">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Họ và Tên</label>
                                                <input type="hidden" value="${USER.userID}" name="id"/>
                                                <input
                                                    name="fullName"
                                                    id="name"
                                                    type="text"
                                                    class="form-control"
                                                    value="${USER.fullName}"
                                                    placeholder="Họ và Tên :"
                                                    />
                                            </div>
                                        </div>
                                        <!--end col-->

                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Tuổi</label>
                                                <input
                                                    name="age"
                                                    id="age"
                                                    type="text"
                                                    class="form-control"
                                                    value="${USER.age}"
                                                    placeholder="Tuổi :"
                                                    />
                                            </div>
                                        </div>
                                        <!--end col-->

                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Địa chỉ</label>
                                                <input
                                                    name="address"
                                                    id="address"
                                                    type="text"
                                                    class="form-control"
                                                    value="${USER.address}"
                                                    placeholder="Địa chỉ :"
                                                    />
                                            </div>
                                        </div>
                                        <!--end col-->

                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Email</label>
                                                <input
                                                    name="email"
                                                    id="email"
                                                    type="email"
                                                    class="form-control"
                                                    value="${USER.email}"
                                                    placeholder="Email :"
                                                    />
                                            </div>
                                        </div>
                                        <!--end col-->

                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Giới tính</label><br />
                                                <input name="gender" id="Nam" type="radio" value="0" checked/>
                                                <label for="Nam">Nam</label>
                                                <input name="gender" id="Nu" type="radio" value="1" />
                                                <label for="Nu">Nữ</label><br />
                                            </div>
                                        </div>
                                        <!--end col-->

                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Số điện thoại</label>
                                                <input
                                                    name="phoneNumber"
                                                    id="phone"
                                                    type="text"
                                                    class="form-control"
                                                    value="${USER.phoneNumber}"
                                                    placeholder="Số điện thoại :"
                                                    pattern="[0-9]{10}"
                                                    />
                                            </div>
                                        </div>
                                        <!--end col-->

                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label class="form-label">Your Bio Here</label>
                                                <textarea
                                                    name="bio"
                                                    id="comments"
                                                    rows="4"
                                                    class="form-control"
                                                    placeholder="${USER.bio}"
                                                    ></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <!--end row-->

                                    <div class="row">
                                        <div class="col-sm-12">
                                            <input type="hidden" value="${LOGIN_USER.userName}" name="userName"/>    
                                            <input type="hidden" value="${LOGIN_USER.password}" name="password"/> 
                                            <button type="submit" class="btn btn-primary" name="action" value="SaveInfo">Lưu thay đổi</button>
                                        </div>
                                        <!--end col-->
                                    </div>
                                    <br>
                                    <p style="color: green; font-size: 18px;">${MESSAGE}</p>
                                    <!--end row-->
                                </form>
                                <!--end form-->
                            </div>
                        </div>


                        <div class="rounded shadow mt-4">
                            <div class="p-4 border-bottom">
                                <h5 class="mb-0">Thay đổi mật khẩu :</h5>
                            </div>

                            <div class="p-4">
                                <form action="MainController" method="POST">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="mb-3">
                                                <input type="hidden" value="${USER.userID}" name="id"/>
                                                <input type="hidden" value="${USER.password}" name="oldpassword" />
                                                <label class="form-label">Mật khẩu cũ :</label>
                                                <input
                                                    type="password"
                                                    class="form-control"
                                                    placeholder="Mật khẩu cũ"
                                                    required=""
                                                    value=""
                                                    name="oldpassword1"
                                                    />
                                            </div>
                                        </div>
                                        <!--end col-->

                                        <div class="col-lg-12">
                                            <div class="mb-3">
                                                <label class="form-label">Mật khẩu mới :</label>
                                                <input
                                                    type="password"
                                                    class="form-control"
                                                    placeholder="Mật khẩu mới"
                                                    required=""
                                                    name="newpassword"
                                                    />
                                            </div>
                                        </div>
                                        <!--end col-->

                                        <div class="col-lg-12">
                                            <div class="mb-3">
                                                <label class="form-label">Nhập lại mật khẩu :</label>
                                                <input
                                                    type="password"
                                                    class="form-control"
                                                    placeholder="Nhập lại mật khẩu"
                                                    required=""
                                                    name="newpassword1"
                                                    />
                                            </div>
                                        </div>
                                        <!--end col-->

                                        <div class="col-lg-12 mt-2 mb-0">
                                            <input type="hidden" value="${LOGIN_USER.userName}" name="userName"/>    
                                            <input type="hidden" value="${LOGIN_USER.password}" name="password"/> 
                                            <button class="btn btn-primary" name="action" value="UpdateUserPassword">Lưu mật khẩu</button>
                                        </div>
                                        <br>
                                        <p style="color: red;">${ERROR_MESSAGE}</p>
                                        <p style="color: green;">${SUCCESS_MESSAGE}</p>
                                        <p style="color: red;">${FAIL_MESSAGE}</p>
                                        <p style="color: red;">${DUPLICATE_MESSAGE}</p>
                                        <!--end col-->
                                    </div>
                                    <!--end row-->
                                </form>
                            </div>
                        </div>
                    </div>
                    <!--end col-->
                </div>
                <!--end row-->
            </div>
            <!--end container-->
        </section>
        <!--end section-->
        <!-- End -->
    </body>
</html>

