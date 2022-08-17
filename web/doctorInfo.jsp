<%-- 
    Document   : doctorInfo
    Created on : Jun 4, 2022, 8:27:09 PM
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
        <title>Doctor</title>
        <!-- Icons -->
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css"
            />
        <!-- Css -->
        <link href="<c:url value="/css/doctorInfo.css"/>" rel="stylesheet" type="text/css" />
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
        <div class="container bootstrap snippets bootdey" style="background: #c0f3f0; border-radius: 7px;">
            <div class="row">
                <div class="profile-nav col-md-3" style="margin-top: 100px;">
                    <div class="panel">
                        <div class="user-heading round">
                            <a href="#">
                                <img src="<c:url value="/images/doctors/${DOCTOR.img}"/>" alt="">
                            </a>
                            <h1>${DOCTOR.fullName}</h1>
                            <p>${DOCTOR.email}</p>
                            <p>${DOCTOR.phoneNumber}</p>
                        </div>
                    </div>
                </div>
                <div class="profile-info col-md-9" style="margin-top: 100px;">
                    <div class="panel">
                        <div class="bio-graph-heading">
                            <h2>Thông tin bác sỹ</h2>
                        </div>
                        <div class="panel-body bio-graph-info mt-4">
                            <div class="row" style="padding-left: 150px; margin-bottom: 80px;">
                                <div class="bio-row">
                                    <span>Họ và tên </span>: <span>${DOCTOR.fullName}</span>
                                </div>
                                <div class="bio-row">
                                    <p><span>Tuổi </span>: ${DOCTOR.age}</p>
                                </div>
                                <div class="bio-row">
                                    <p><span>Địa chỉ </span>: ${DOCTOR.address}</p>
                                </div>
                                <div class="bio-row">
                                    <p><span>Email</span>: ${DOCTOR.email}</p>
                                </div>
                                <div class="bio-row">
                                    <c:if test="${DOCTOR.gender == 0}">
                                        <p><span>giới tính </span>: Nam</p>
                                    </c:if>
                                    <c:if test="${DOCTOR.gender == 1}">
                                        <p><span>Giới tính </span>: Nữ</p>
                                    </c:if>
                                </div>
                                <div class="bio-row">
                                    <p><span>SĐT </span>: ${DOCTOR.phoneNumber}</p>
                                </div>
                                <div class="bio-row">
                                    <p><span>Trình độ </span>: ${DOCTOR.level}</p>
                                </div>
                                <div class="bio-row">
                                    <p><span>Số năm kinh nghiệm </span>: ${DOCTOR.experience_year}</p>
                                </div>
                                <div class="bio-row">
                                    <p><span>Bằng cấp </span>: ${DOCTOR.education}</p>
                                </div>
                                <div class="bio-row">
                                    <c:if test="${DOCTOR.specialize == 1}">
                                        <p><span>Chuyên môn </span>: Cấy ghép Implant</p>
                                    </c:if>
                                    <c:if test="${DOCTOR.specialize == 2}">
                                        <p><span>Chuyên môn </span>: Thẩm mỹ răng sứ</p>
                                    </c:if>
                                    <c:if test="${DOCTOR.specialize == 3}">
                                        <p><span>Chuyên môn </span>: Trồng răng sứ</p>
                                    </c:if>
                                    <c:if test="${DOCTOR.specialize == 4}">
                                        <p><span>Chuyên môn </span>: Làm mặt sứ veneer</p>
                                    </c:if>
                                    <c:if test="${DOCTOR.specialize == 5}">
                                        <p><span>Chuyên môn </span>: Niềng răng chỉnh nha</p>
                                    </c:if>
                                    <c:if test="${DOCTOR.specialize == 6}">
                                        <p><span>Chuyên môn </span>: Thẩm mỹ nha khoa</p>
                                    </c:if>
                                    <c:if test="${DOCTOR.specialize == 7}">
                                        <p><span>Chuyên môn </span>: Tẩy trắng răng</p>
                                    </c:if>
                                    <c:if test="${DOCTOR.specialize == 8}">
                                        <p><span>Chuyên môn </span>: Nha tổng quát</p>
                                    </c:if>

                                </div>
                                <div class="bio-row">
                                    <c:if test="${DOCTOR.wkID == 1}">
                                        <p><span>Giờ làm </span>: 09:00AM - 11:00AM</p>
                                    </c:if>
                                    <c:if test="${DOCTOR.wkID == 2}">
                                        <p><span>Giờ làm </span>: 12:00AM - 02:00PM</p>
                                    </c:if>
                                    <c:if test="${DOCTOR.wkID == 3}">
                                        <p><span>Giờ làm </span>: 02:00PM - 04:00PM</p>
                                    </c:if>
                                    <c:if test="${DOCTOR.wkID == 4}">
                                        <p><span>Giờ làm </span>: 04:00PM - 06:00PM</p>
                                    </c:if>
                                    <c:if test="${DOCTOR.wkID == 5}">
                                        <p><span>Giờ làm </span>: 07:00PM - 09:00PM</p>
                                    </c:if>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--Comments-->
        <div class="card mt-5">
            <div class="container">
                <div class="row">

                    <div class="col-2">
                        <c:if test="${LOGIN_USER != null}">
                            <img src="<c:url value="/images/users/${LOGIN_USER.img}"/>" width="70" class="rounded-circle mt-2">
                        </c:if> 
                    </div>

                    <div class="col-10">
                        <div class="comment-box ml-2 mt-5">
                            <h4>Viết bình luận và đánh giá</h4>
                            <form action="MainController" method="POST"> 
                                <input type="hidden" value="${LOGIN_USER.userID}" name="id"/> 
                                <input type="hidden" value="${DOCTOR.id}" name="docID"/> 
                                <input type="hidden" value="${LOGIN_USER.fullName}" name="name"/> 
                                <div class="rating"> 
                                    <input type="radio" name="rating" value="5" id="5"><label for="5">☆</label>
                                    <input type="radio" name="rating" value="4" id="4"><label for="4">☆</label> 
                                    <input type="radio" name="rating" value="3" id="3"><label for="3">☆</label>
                                    <input type="radio" name="rating" value="2" id="2"><label for="2">☆</label>
                                    <input type="radio" name="rating" value="1" id="1"><label for="1">☆</label>
                                </div>
                                <div class="comment-area">
                                    <textarea class="form-control" placeholder="Viết đánh giá tại đây" name="txtCommentCmt" rows="4"></textarea>
                                </div>
                                <div class="comment-btns mt-2">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="">
                                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" style="padding: 7px 30px;">
                                                    Gửi
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- The Modal -->
                                <div class="modal fade" id="myModal" style="z-index: 1000000000;">
                                    <div class="modal-dialog">
                                        <div class="modal-content">

                                            <!-- Modal Header -->
                                            <div class="modal-header">
                                                <h4 class="modal-title">Bạn đồng ý chứ?</h4>
                                                <button type="button" class="close" data-dismiss="modal">×</button>
                                            </div>

                                            <c:if test="${LOGIN_USER != null}">
                                                <!-- Modal body -->
                                                <div class="modal-body">
                                                    <p style="font-weight: 600;">Ý kiến của bạn đã được gửi!!!</p>
                                                    <p style="font-weight: 600;">Nó sẽ được xuất hiện sớm thôi</p>
                                                </div>
                                            </c:if>
                                            <c:if test="${LOGIN_USER == null}">
                                                <div class="modal-body">
                                                    <p style="font-weight: 600;">Yêu cầu bạn đăng nhập mới được gửi ý kiến!!!</p>
                                                    <p style="font-weight: 600;">Hãy đăng ký tài khoản nhé!!!</p>
                                                </div>
                                            </c:if>

                                            <!-- Modal footer -->
                                            <div class="modal-footer">
                                                <!--<button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>-->
                                                <button class="btn btn-primary send btn-sm" style="padding: 7px 30px;" name="action" value="Send">Oke</button> 
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>   
        </div>

        <!--Reply-->
        <div class="container mt-5">

            <div class="row  d-flex justify-content-center">

                <div class="col-md-8">

                    <div class="headings d-flex justify-content-between align-items-center mb-3">
                        <h5>Comments</h5>

                        <div class="buttons">

                            <span class="badge bg-white d-flex flex-row align-items-center">
                                <span class="text-primary">Comments "ON"</span>
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked>

                                </div>
                            </span>

                        </div>

                    </div>



                    <div class="card p-3">
                        <c:forEach var="feedback" items="${FEEDBACK}">
                            <div class="d-flex justify-content-between align-items-center">

                                <div class="user d-flex flex-row align-items-center">
                                    <img src="https://png.pngtree.com/element_our/20190604/ourmid/pngtree-user-avatar-boy-image_1482938.jpg" width="30" class="user-img rounded-circle mr-2">
                                    <span><small class="font-weight-bold text-primary">${feedback.name}</small> <small class="font-weight-bold">${feedback.contentCmt}</small></span>

                                </div>


                            </div>


                            <div class="action d-flex justify-content-between mt-2 align-items-center">

                                <div class="reply px-4">
                                    <small></small>
                                    <span class="dots"></span>
                                    <small></small>
                                    <span class="dots"></span>
                                    <small></small>

                                </div>

                                <div class="icons align-items-center">

                                    <c:if test="${feedback.rate == 1}">                            
                                        <i class="fa fa-star text-warning"></i>
                                    </c:if>
                                    <c:if test="${feedback.rate == 2}">                            
                                        <i class="fa fa-star text-warning"></i>
                                        <i class="fa fa-star text-warning"></i>
                                    </c:if>
                                    <c:if test="${feedback.rate == 3}">                            
                                        <i class="fa fa-star text-warning"></i>
                                        <i class="fa fa-star text-warning"></i>
                                        <i class="fa fa-star text-warning"></i>
                                    </c:if>
                                    <c:if test="${feedback.rate == 4}">                            
                                        <i class="fa fa-star text-warning"></i>
                                        <i class="fa fa-star text-warning"></i>
                                        <i class="fa fa-star text-warning"></i>
                                        <i class="fa fa-star text-warning"></i>
                                    </c:if>
                                    <c:if test="${feedback.rate == 5}">                            
                                        <i class="fa fa-star text-warning"></i>
                                        <i class="fa fa-star text-warning"></i>
                                        <i class="fa fa-star text-warning"></i>
                                        <i class="fa fa-star text-warning"></i>
                                        <i class="fa fa-star text-warning"></i>
                                    </c:if>

                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <!--Footer-->
        <footer class="bg-footer mt-5">
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
                                <h5 class="text-light title-dark footer-head">Phòng nha</h5>
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
                                <h5 class="text-light title-dark footer-head">Liên lạc với chúng tôi</h5>
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