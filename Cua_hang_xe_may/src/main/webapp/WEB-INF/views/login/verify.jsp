<%@page import="java.util.ArrayList"%>
<%@page import="com.demo.entities.Item"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.ResourceBundle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <% 
    List<Item> cart = (List<Item>) request.getSession().getAttribute("cart");
    if(cart == null) cart = new ArrayList<>();
    %>
  <%
    	HttpSession httpSession = request.getSession();
    	String lang = "vi";
    	if(httpSession.getAttribute("language") != null){
    		lang = httpSession.getAttribute("language").toString();
    	}
    	ResourceBundle messages = ResourceBundle.getBundle("messages", new Locale(lang));
    %>
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
    <div class="container-fluid bg-dark py-3 px-lg-5 d-none d-lg-block">
        <div class="row">
            <div class="col-md-6 text-center text-lg-left mb-2 mb-lg-0">
                <div class="d-inline-flex align-items-center">
                    <a class="text-body pr-3" href=""><i class="fa fa-phone-alt mr-2"></i>+012 345 6789</a>
                    <span class="text-body">|</span>
                    <a class="text-body px-3" href=""><i class="fa fa-envelope mr-2"></i>t-motoshop@gmail.com</a>
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
                <a href="" class="navbar-brand">
                    <img src="${pageContext.request.contextPath}/assets/user/Image/logo1-removebg-preview.png" alt="" id="logo" style="height: 70px">
                    <h2 class="text-uppercase text-primary mb-1" style="margin-top: 15px">T-Motoshop</h2>
                </a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="navbar-nav ml-auto py-0 bg-secondary">
                        <a href="${pageContext.request.contextPath }/home" class="nav-item nav-link " id ="nav-first"><%= messages.getString("trang_chu") %></a>
                            <a href="${pageContext.request.contextPath }/about" class="nav-item nav-link"><%= messages.getString("gioi_thieu") %></a>
                            <a href="${pageContext.request.contextPath }/service" class="nav-item nav-link"><%= messages.getString("dich_vu") %></a>
                            <a href="${pageContext.request.contextPath }/contact" class="nav-item nav-link"><%= messages.getString("lien_he") %></a>
                            <a href="${pageContext.request.contextPath }/motobike" class="nav-item nav-link"><%= messages.getString("xe_may") %></a>
                            <div class="nav-item dropdown">
                       
                                <a href="login/index.html"  class="nav-link dropdown-toggle" data-toggle="dropdown"><i class="fa-solid fa-user"></i></a>
                                <div class="dropdown-menu rounded-0 m-0">
                                <c:if test="${sessionScope.account == null }">
<a href="${pageContext.request.contextPath }/login" class="dropdown-item"><%=messages.getString("dang_nhap")%></a>
                        	    </c:if>
                        	    <c:if test="${sessionScope.account != null }">
                        	       <a href="${pageContext.request.contextPath }/cart"  class="dropdown-item"><i style="font-size: 120%" class="fa-solid fa-bag-shopping"></i>( <%=cart.size() %>)</a> 
                        	        <a href="${pageContext.request.contextPath }/information" class="dropdown-item"><%=messages.getString("thong_tin_tai_khoan")%></a>
                                    <a href="${pageContext.request.contextPath }/changePassword" class="dropdown-item"><%=messages.getString("doi_mat_khau")%></a>
                                    
                                  	<a href="${pageContext.request.contextPath }/login?action=logout" class="dropdown-item"> <%=messages.getString("dang_xuat")%><i class="fa-solid fa-arrow-right-from-bracket" style="margin-left: 5px"></i></a>
                        	    </c:if>
                                </div>
                            </div>
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
            <h1 class="display-6 text-primary text-center"><%=messages.getString("content_mk")%><%=messages.getString("xac_nhan_tai_khoan")%></h1>
        </div>
        <div class="row">
            <div class="col-lg-12 mb-0 register-container w-100 ">
                <div class="contact-form bg-light mb-6 col-lg-7  ">
                    <img src="${pageContext.request.contextPath}/assets/user/Image/forgot-password.avif" alt="">
                </div>
                <div class="contact-form bg-light mb-6 col-lg-6" style="padding-top: 150px;">
                    <form id="verify_form" method="post" action="${pageContext.request.contextPath }/processverify" onsubmit="return check_verify()">
                        <div class="row"> 
                        <c:if test="${sessionScope.otp1 != null }">  <div class="register ml-3 col-12">
                              <div class="register ml-3 col-12">
                              <%=messages.getString("content_xacnhan")%> <a href="#"></a>
                            	</div>
                            </div>
                         </c:if>
                          <c:if test="${sessionScope.otp1 == null }"> 
                          
                               <div class="register ml-3 col-12">
                               <%=messages.getString("ma_cung_cap")%> <a href="#"></a>
                            	</div>
                         </c:if>
                 <%
        		HttpSession error = request.getSession();
String error1 = (String)error.getAttribute("error2");
        		String error2 = error1;
        		error.removeAttribute("error2");
       			%>
       			
       			<%= error2 != null ? error2 : "" %>
       			
                           
                            <div class="col-2 form-group">
                                <input id="input1" type="number" name="input1" class="form-control p-4 rounded" placeholder="#" >
                            </div>
                            <div class="col-2 form-group">
                                <input id="input2" type="number"name="input2" class="form-control p-4 rounded" placeholder="#" >
                            </div>
                            <div class="col-2 form-group">
                                <input id="input3" type="number"name="input3" class="form-control p-4 rounded" placeholder="#" >
                            </div>
                            <div class="col-2 form-group">
                                <input id="input4"  type="number"name="input4" class="form-control p-4 rounded" placeholder="#" >
                            </div>
                            <div class="col-2 form-group">
                                <input id="input5" type="number"name="input5" class="form-control p-4 rounded" placeholder="#">
                            </div>
                            <div class="col-2 form-group">
                                <input id="input6" type="number"name="input6" class="form-control p-4 rounded" placeholder="#" >
                            </div>
                            <div class="register ml-3 col-10">
                               *<%=messages.getString("khong_chia_se_ma")%> <a href="#"></a>
                            </div>
							<script type="text/javascript">
							var input1 = document.getElementById("input1");

							// Lấy đối tượng input2 bằng ID
							var input2 = document.getElementById("input2");
							var input3 = document.getElementById("input3");
							var input4 = document.getElementById("input4");
							var input5 = document.getElementById("input5");
							var input6 = document.getElementById("input6");

							// Bắt sự kiện khi người dùng nhấn phím trong input1
							input1.addEventListener("keyup", function(event) {
							  var value = parseInt(input1.value); // Lấy giá trị số từ input1
							  if (!isNaN(value)) {
							    input2.focus(); // Di chuyển trỏ chuột đến input2 nếu giá trị là số
							  } 
							});
							input2.addEventListener("keyup", function(event) {
								var value1 = parseInt(input2.value);
								if (!isNaN(value1)) {
								    input3.focus(); // Di chuyển trỏ chuột đến input2 nếu giá trị là số
								  } 
							});
							input3.addEventListener("keyup", function(event) {
								 var value2 = parseInt(input3.value);
								 if (!isNaN(value2)) {
									    input4.focus(); // Di chuyển trỏ chuột đến input2 nếu giá trị là số
} 
							});
							input4.addEventListener("keyup", function(event) {
								  var value3 = parseInt(input4.value);
								 if (!isNaN(value3)) {
									    input5.focus(); // Di chuyển trỏ chuột đến input2 nếu giá trị là số
									  } 
							});
							input5.addEventListener("keyup", function(event) {
								  var value4 = parseInt(input5.value);
								  if (!isNaN(value4)) {
									    input6.focus(); // Di chuyển trỏ chuột đến input2 nếu giá trị là số
									  } 
							});
							</script>
                        </div>
                        <div class="button-register" >
                            <button class="btn btn-primary py-3 my-5 mx-4 px-lg-5 rounded-pill" id="submitButton" type="submit"><%=messages.getString("gui")%></button>
                              <a class="btn btn-primary py-3 my-5 mx-4 rounded-pill" href="${pageContext.request.contextPath }/processverify?action=sendagain"><%=messages.getString("gui_lai")%></a>
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
                <h4 class="text-uppercase text-light mb-4"><%=messages.getString("dia_chi")%></h4>
                <p class="mb-2"><i class="fa fa-map-marker-alt text-white mr-3"></i><%=messages.getString("content_diachi")%>
                </p>
                <p class="mb-2"><i class="fa fa-map-marker-alt text-white mr-3"></i>123 Street, New York, USA</p>
                <p class="mb-2"><i class="fa fa-phone-alt text-white mr-3"></i>+012 345 67890</p>
                <p><i class="fa fa-envelope text-white mr-3"></i>info@example.com</p>
                <h6 class="text-uppercase text-white py-2"><%=messages.getString("gap_chung_toi")%></h6>
                <div class="d-flex justify-content-start">
                    <a class="btn btn-lg btn-dark btn-lg-square mr-2" href="#"><i class="fab fa-youtube"></i></a>
                    <a class="btn btn-lg btn-dark btn-lg-square mr-2" href="#"><i class="fab fa-facebook-f"></i></a>
                    <a class="btn btn-lg btn-dark btn-lg-square mr-2" href="#"><i class="fab fa-tiktok"></i></a>
                    <a class="btn btn-lg btn-dark btn-lg-square" href="#"><i class="fab fa-instagram"></i></a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-5">
                <h4 class="text-uppercase text-light mb-4"><%=messages.getString("lien_ket")%></h4>
                <div class="d-flex flex-column justify-content-start">
                    <a class="text-body mb-2" href="#"><i class="fa fa-angle-right text-white mr-2"></i><%=messages.getString("chinh_sach_rieng_tu")%></a>
<a class="text-body mb-2" href="#"><i class="fa fa-angle-right text-white mr-2"></i><%=messages.getString("dieu_khoan")%></a>
                    <a class="text-body mb-2" href="#"><i class="fa fa-angle-right text-white mr-2"></i><%=messages.getString("thanh_vien_moi")%></a>
                    <a class="text-body mb-2" href="#"><i class="fa fa-angle-right text-white mr-2"></i><%=messages.getString("hoan_tien")%></a>
                    <a class="text-body" href="#"><i class="fa fa-angle-right text-white mr-2"></i><%=messages.getString("tro_giup")%></a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-5">
                <h4 class="text-uppercase text-light mb-4"><%=messages.getString("suu_tam_xe")%></h4>
                <div class="row mx-n1">
                    <div class="col-4 px-1 mb-2">
                        <a href=""><img class="w-100 h-100" src="${pageContext.request.contextPath}/assets/user/Image/Honda/winer.jpg" alt=""></a>
                    </div>
                    <div class="col-4 px-1 mb-2">
                        <a href=""><img class="w-100 " src="${pageContext.request.contextPath}/assets/user/Image/Honda/xeGa.PNG" alt=""></a>
                    </div>
                    <div class="col-4 px-1 mb-2">
                        <a href=""><img class="w-100" src="${pageContext.request.contextPath}/assets/user/Image/Honda/red-motorcycle-driving-road.jpg" alt=""></a>
                    </div>
                    <div class="col-4 px-1 mb-2">
                        <a href=""><img class="w-100 " src="${pageContext.request.contextPath}/assets/user/Image/Honda/footer.jpg" alt=""></a>
                    </div>
                    <div class="col-4 px-1 mb-2">
                        <a href=""><img class="w-100" src="${pageContext.request.contextPath}/assets/user/Image/Honda/xeDuongDai.jpg" alt=""></a>
                    </div>
                    <div class="col-4 px-1 mb-2">
                        <a href=""><img class="w-100" src="${pageContext.request.contextPath}/assets/user/Image/Honda/180588.jpg" alt=""></a>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-5">
                <h4 class="text-uppercase text-light mb-4"><%=messages.getString("ban_tin")%></h4>
                <div class="w-100 mb-3">
                    <div class="input-group">
                        <input type="text" class="form-control bg-dark border-dark" style="padding: 25px;"
                            placeholder="Your Email">
                        <div class="input-group-append">
                            <button class="btn btn-primary text-uppercase px-3"><%=messages.getString("dang_ki")%></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid bg-dark py-4 px-sm-3 px-md-5">
<p class="mb-2 text-center text-body">&copy; <a href="#">T Academy </a>. All Rights Reserved.</p>
        <p class="m-0 text-center text-body">Designed by <a href="https://htmlcodex.com">T motobike</a></p>
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
<script >
    function check_verify() {
        var input1 = document.getElementById("input1").value;
        var input2 = document.getElementById("input2").value;
        var input3 = document.getElementById("input3").value;
        var input4 = document.getElementById("input4").value;
        var input5 = document.getElementById("input5").value;
        var input6 = document.getElementById("input6").value;
          
            var inputs = [input1,input2,input3,input4,input5,input6];
            for (var i = 0; i < inputs.length; i++) {
                var value = inputs[i];
                if(value == '' || value < 0 || value >9) {
                    alert("<%=messages.getString("code_khong_hop_le")%>");
                return false;
                }
            }
            if (inputs) {
        
            	document.getElementById('verify_form').submit(); // Chuyển hướng đến trang mới
        } else {
            alert("<%=messages.getString("nhap_day_du_hop_le")%>!");
        }
        return false;
    }
</script>
<script src="${pageContext.request.contextPath}/assets/user/js/main.js"></script>
</body>
</html>