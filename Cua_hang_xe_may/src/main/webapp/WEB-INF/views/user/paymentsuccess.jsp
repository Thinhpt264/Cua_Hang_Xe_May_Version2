<%@page import="java.util.Locale"%>
<%@page import="java.util.ResourceBundle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<html>
<head>
	<meta charset="UTF-8">
    <title>Thanh toán</title>
    <!-- Place favicon.png in the root directory -->
    <link rel="shortcut icon"href="${pageContext.request.contextPath}/assets/user/client_assets/shop_assets//client_assets/shop_assets/img/favicon.png" type="image/x-icon"/>
    <!-- Font Icons css -->
    <link rel="stylesheet"href="${pageContext.request.contextPath}/assets/user/client_assets/shop_assets/css/font-icons.css">
    <!-- plugins css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/user/client_assets/shop_assets/css/plugins.css">
    <!-- Main Stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/user/client_assets/shop_assets/css/style.css">
    <!-- Responsive css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/user/client_assets/shop_assets/css/responsive.css">
    <!-- ToaStr   -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/user/client_assets/shop_assets/css/toastr.css">
    <!-- Icons Css -->
  
</head>
<body>
	<div class="vh-100 d-flex justify-content-center align-items-center">
        <div class="col-md-6">
            <div class="border border-3 border-success"></div>
            <div class="card  bg-white shadow p-5">
                <div class="mb-4 text-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="text-success bi bi-check-circle" width="75"
                         height="75"
                         fill="currentColor" viewBox="0 0 16 16">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                        <path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z"/>
                    </svg>
                </div>
                <div class="text-center">
                    <h1>Lịch Hẹn đã được xác nhận</h1>
                    <p>Lịch Hẹn của bạn đã được xác nhận. Bạn sẽ nhận được email/SMS xác nhận Lịch Hẹn trong thời gian sớm nhất,
                        cùng với ngày dự kiến chuẩn bị hàng của sản phẩm
                    </p>
                    <a href="${pageContext.request.contextPath}/home" class="btn btn-outline-success">Trang chủ</a>
                    <a style="color: #fff;background-color: #198754;" href="${pageContext.request.contextPath}/motorbike"
                       class="btn btn-outline-success c-shopping">Tiếp tục mua sắp</a>
                </div>
            </div>
        </div>
    </div>


</body>
	


</html>