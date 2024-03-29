<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quên Mật Khẩu</title>
    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/user/Image/logo.jpg">
    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;500;600;700&family=Rubik&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />


    <!-- Libraries Stylesheet -->
    <link href="${pageContext.request.contextPath}/assets/user/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/user/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${pageContext.request.contextPath}/assets/user/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${pageContext.request.contextPath}/assets/user/css/style.css" rel="stylesheet">
    
</head>
<body>
<div id="preloader"></div>

<header id="myHeader">
    <!-- Topbar Start -->
    <div class="container-fluid bg-dark py-1 px-lg-5 d-none d-lg-block">
        <div class="row">
            <div class="col-md-6 text-center text-lg-left mb-2 mb-lg-0">
                <div class="d-inline-flex align-items-center">
                    <a class="text-body pr-3" href=""><i class="fa fa-phone-alt mr-2"></i>+012 345 6789</a>
                    <span class="text-body">|</span>
                    <a class="text-body px-3" href=""><i class="fa fa-envelope mr-2"></i>tmotoshop.service@gmail.com</a>
                </div>
            </div>
            <div class="col-md-6 text-center text-lg-right">
                <div class="d-inline-flex align-items-center">
                    <a class="text-body px-3" href="https://www.facebook.com/">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a class="text-body px-3" href=" https://www.tiktok.com/">
                        <i class="fab fa-tiktok"></i>
                    </a>
                    <a class="text-body px-3" href="https://www.instagram.com/">
                        <i class="fab fa-instagram"></i>
                    </a>
                    <a class="text-body pl-3" href="https://www.youtube.com/">
                        <i class="fab fa-youtube"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <!-- Topbar End -->

	
    <!-- Navbar Start -->
    <div class="container-fluid position-relative nav-bar p-0">
        <div class="position-relative px-lg-5" style="z-index: 9;">
            <nav class="navbar navbar-expand-lg bg-secondary navbar-dark py-3 py-lg-0 pl-3 pl-lg-5 " style="height: 70px" >
                <a href="${pageContext.request.contextPath}/home" class="navbar-brand">
                    <img src="${pageContext.request.contextPath}/assets/user/Image/logo1.jpg" alt="" id="logo" style="height: 70px">
                    <h2 class="text-uppercase text-primary mb-1" style="margin-top: 15px">T-Motoshop</h2>
                </a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-between px-3" id="navbarCollapse">
<!--                    <div class="navbar-nav ml-auto py-0">-->
<!--                        <a href="index.html" class="nav-item nav-link ">Trang Chủ</a>-->
<!--                        <a href="about.html" class="nav-item nav-link active">Giới Thiệu</a>-->
<!--                        <a href="service.html" class="nav-item nav-link">Dịch Vụ</a>-->
<!--                        <a href="contact.html" class="nav-item nav-link">Liên Hệ</a>-->
<!--                        <a href="motobike.html" class="nav-link nav-link">Xe Máy</a>-->
<!--                        <div class="nav-item dropdown">-->
<!--                            <a href="login/index.html"  class="nav-link dropdown-toggle" data-toggle="dropdown"><i class="fa-solid fa-user"></i></a>-->
<!--                            <div class="dropdown-menu rounded-0 m-0">-->
<!--                                <a href="login/index.html" class="dropdown-item">Đăng nhập </a>-->
<!--                                <a href="favorite.html" class="dropdown-item"> Xe Yêu Thích</a>-->
<!--                                <a href="login/index.html" class="dropdown-item"> Đăng Xuất <i class="fa-solid fa-arrow-right-from-bracket" style="margin-left: 5px"></i></a>-->
<!--                            </div>-->
<!--                        </div>-->
<!--                    </div>-->
                </div>
            </nav>
        </div>
    </div>
    <!-- Navbar End -->

</header>
<div class="container-fluid" style="width: 100%;
    height: 155px;">

</div>
<div class="container-fluid py-5">
    <div class="container pb-3">
        <div class="container">
            <h1 class="display-6 text-primary text-center">Quên mật khẩu</h1>
        </div>
        <div class="row">
            <div class="col-lg-12 mb-2 register-container w-100 ">
                <div class="contact-form bg-light mb-6 col-lg-8  ">
                    <img src="${pageContext.request.contextPath}/assets/user/Image/forgot-password.avif" alt="">
                </div>
                <%
                HttpSession session2 = request.getSession();
                String error1 =(String) session2.getAttribute("error1");
                String error2 = error1;
                session2.removeAttribute("error1");
                %>
                <div class="contact-form bg-light mb-6 col-lg-6" style="padding-top: 150px;">
                	<span style="color:red;"><%= error2 == null ? "" : error2   %></span>
                    <form id="forgot_form" action="${pageContext.request.contextPath}/verifyuser" methods="post">
                    
                        <div class="row">
                            <div class="register ml-4">
                                Nhập Email mà bạn đã tạo tài khoản <a href="#"></a>
                            </div>
                            <div class="col-10 form-group">
                                <input id="mailOrPhone" type="text" class="form-control p-4 rounded" placeholder="Email của bạn" required="required" name="email">
                            </div>
<!--                            <div class="col-10 form-group">-->
<!--                                <input  id="input" type="password" class="form-control p-4 rounded " placeholder="Mật khẩu" required="required">-->
<!--                                <span id="showOrHide" onclick="showPass()">-->
<!--                                        <i class ="fa-solid fa-eye-slash" id="hide" style="display: none"></i>-->
<!--                                        <i class ="fa-solid fa-eye" id="show"></i>-->
<!--                                    </span>-->
<!--                            </div>-->

                        </div>
                        <div class="button-register ">
                            <button class="btn btn-primary py-3 my-5 px-4" type="submit">Gửi</button>

                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- footer start -->
<div class="container-fluid bg-secondary py-5 px-sm-3 px-md-5" style="margin-top: 90px;">
    <div class="row pt-5">
        <div class="col-lg-3 col-md-6 mb-5">
            <h4 class="text-uppercase text-light mb-4">Địa chỉ</h4>
            <p class="mb-2"><i class="fa fa-map-marker-alt text-white mr-3"></i>123 Lê Trọng Tấn , Chung cư An Bình</p>
            <p class="mb-2"><i class="fa fa-phone-alt text-white mr-3"></i>+012 345 67890</p>
            <p><i class="fa fa-envelope text-white mr-3"></i>info@example.com</p>
            <h6 class="text-uppercase text-white py-2">Gặp chúng tôi qua</h6>
            <div class="d-flex justify-content-start">
                <a class="btn btn-lg btn-dark btn-lg-square mr-2" href="#"><i class="fab fa-youtube"></i></a>
                <a class="btn btn-lg btn-dark btn-lg-square mr-2" href="#"><i class="fab fa-facebook-f"></i></a>
                <a class="btn btn-lg btn-dark btn-lg-square mr-2" href="#"><i class="fab fa-tiktok"></i></a>
                <a class="btn btn-lg btn-dark btn-lg-square" href="#"><i class="fab fa-instagram"></i></a>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 mb-5">
            <h4 class="text-uppercase text-light mb-4">Liên kết</h4>
            <div class="d-flex flex-column justify-content-start">
                <a class="text-body mb-2" href="#"><i class="fa fa-angle-right text-white mr-2"></i>Chính sách riêng tư</a>
                <a class="text-body mb-2" href="#"><i class="fa fa-angle-right text-white mr-2"></i>Điều khoản và điểu kiện</a>
                <a class="text-body mb-2" href="#"><i class="fa fa-angle-right text-white mr-2"></i>Đăng ký thành viên mới</a>
                <a class="text-body mb-2" href="#"><i class="fa fa-angle-right text-white mr-2"></i>Hoàn lại tiền</a>
                <a class="text-body" href="#"><i class="fa fa-angle-right text-white mr-2"></i>Trợ giúp</a>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 mb-5">
            <h4 class="text-uppercase text-light mb-4">Sưu tầm xe</h4>
            <div class="row mx-n1">
                <div class="col-4 px-1 mb-2">
                    <a href=""><img class="w-100" src="${pageContext.request.contextPath}/assets/user/img/gallery-1.jpg" alt=""></a>
                </div>
                <div class="col-4 px-1 mb-2">
                    <a href=""><img class="w-100" src="${pageContext.request.contextPath}/assets/user/img/gallery-2.jpg" alt=""></a>
                </div>
                <div class="col-4 px-1 mb-2">
                    <a href=""><img class="w-100" src="${pageContext.request.contextPath}/assets/user/img/gallery-3.jpg" alt=""></a>
                </div>
                <div class="col-4 px-1 mb-2">
                    <a href=""><img class="w-100" src="${pageContext.request.contextPath}/assets/user/img/gallery-4.jpg" alt=""></a>
                </div>
                <div class="col-4 px-1 mb-2">
                    <a href=""><img class="w-100" src="${pageContext.request.contextPath}/assets/user/img/gallery-5.jpg" alt=""></a>
                </div>
                <div class="col-4 px-1 mb-2">
                    <a href=""><img class="w-100" src="${pageContext.request.contextPath}/assets/user/img/gallery-6.jpg" alt=""></a>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 mb-5">
            <h4 class="text-uppercase text-light mb-4">Bản tin</h4>
            <div class="w-100 mb-3">
                <div class="input-group">
                    <input type="text" class="form-control bg-dark border-dark" style="padding: 25px;" placeholder="Your Email">
                    <div class="input-group-append">
                        <button class="btn btn-primary text-uppercase px-3">Đăng ký</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid bg-dark py-4 px-sm-3 px-md-5">
    <p class="mb-2 text-center text-body">&copy; <a href="#">Your Site Name</a>. All Rights Reserved.</p>
    <p class="m-0 text-center text-body">Designed by <a href="https://htmlcodex.com">HTML Codex</a></p>
</div>
<!-- footer end -->

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/user/lib/easing/easing.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/user/lib/waypoints/waypoints.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/user/lib/owlcarousel/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/user/lib/tempusdominus/js/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/user/lib/tempusdominus/js/moment-timezone.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/user/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

<!-- Template Javascript -->
<script>
    function showPass() {
        var input = document.getElementById("input");
        var show = document.getElementById("show");
        var hide = document.getElementById("hide");
        if (input.type === "password"){
            input.type = "text";
            show.style.display = "none";
            hide.style.display = "inline";
        }else{
            input.type = "password";
            show.style.display = "inline";
            hide.style.display = "none";
        }
    }

</script>
<script>
        document.getElementById("forgot_form").addEventListener("submit", function(event) {
        event.preventDefault(); // Ngăn chặn gửi form mặc định

        var input = document.getElementById("mailOrPhone").value;
        if (validateInput(input)) {
        	document.getElementById('forgot_form').submit();
        } else {
        alert("Vui lòng nhập email hoặc số điện thoại hợp lệ!");
        }
        });

        function validateInput(input) {
            // Kiểm tra email hợp lệ
            var emailRegex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
            if (emailRegex.test(input)) {
                return true;
            }

            // Kiểm tra số điện thoại hợp lệ
            var phoneRegex = /^\d{10}$/;
            if (phoneRegex.test(input)) {
                return true;
            }
            // Không hợp lệ
            return false;
        }
</script>
<script src="${pageContext.request.contextPath}/assets/user/js/main.js"></script>
</body>
</html>