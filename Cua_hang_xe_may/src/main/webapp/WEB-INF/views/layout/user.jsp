<%@page import="java.util.Locale"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.demo.entities.Item"%>
<%@page import="java.util.List"%>
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
    <meta charset="utf-8">
    <title>T-Motoshop</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <!-- Favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/user/Image/logo.jpg">
    <link href="../img/favicon.ico" rel="icon">
    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;500;600;700&family=Rubik&display=swap"
        rel="stylesheet">
   <script src="${pageContext.request.contextPath}/assets/user/js/jquery-3.7.1.min.js"></script>
    <!-- Font Awesome -->
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

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
                    Hello ${sessionScope.account.username }
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
                         <select id="mylanguage" class="form-select form-select-lg ml-2"  aria-label=".form-select-lg example">
	                	<option value="vi" <% if(lang.equalsIgnoreCase("vi")) { %> selected="selected" <% } %>> Việt Nam  </option>
	                	<option value="en" <% if(lang.equalsIgnoreCase("en")) { %> selected="selected" <% } %>> English </option>
            		    </select>
            		     <script> 
               
                $("#mylanguage").change(function() {
                	  var selectedValue = $(this).val();
                	  var url = "${pageContext.request.contextPath}/lang?language=" + selectedValue;
                	  // Chuyển đến URL
                	  window.location.href = url;
                	});
                </script>
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
                        <img src="${pageContext.request.contextPath}/assets/user/Image/logo1-removebg-preview.png" alt="" id="logo" style="height: 70px">
                        <h2 class="text-uppercase text-primary mb-1" style="margin-top: 15px">T-Motoshop</h2>
                    </a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-between px-3" id="navbarCollapse">
                    			
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
                        	       <a href="${pageContext.request.contextPath }/appointcard"  class="dropdown-item"><i style="font-size: 120%" class="fa-solid fa-sheet-plastic"></i> Đơn Hẹn</a> 
                        	        <a href="${pageContext.request.contextPath }/information" class="dropdown-item"><%=messages.getString("thong_tin_tai_khoan")%></a>
                                    <a href="${pageContext.request.contextPath }/changePassword" class="dropdown-item"><%=messages.getString("doi_mat_khau")%></a>
                                    
                                  	<a href="${pageContext.request.contextPath }/login?action=logout" class="dropdown-item"> <%=messages.getString("dang_xuat")%><i class="fa-solid fa-arrow-right-from-bracket" style="margin-left: 5px"></i></a>
                        	    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Navbar End -->
</header>
    <!-- Navbar End -->
    <div class="container-fluid" style="width: 100%;
    height: 115px;">
    </div>

	<jsp:include page="${p }"></jsp:include>
   



    <!-- Footer Start -->
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
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="fa fa-angle-double-up"></i></a>

    <!-- JavaScript Libraries -->
    
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>

        <script src="${pageContext.request.contextPath}/assets/user/lib/easing/easing.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/user/lib/waypoints/waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/user/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/user/lib/tempusdominus/js/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/user/lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/user/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="${pageContext.request.contextPath}/assets/user/js/main.js"></script>
    <script>
        $ (".menu-toggle").click(function () {
    $(".menu-toggle").toggleClass("open");
    $(".menu-line").toggleClass("open");
    $(".menu-round").toggleClass("open"); 
    });
    </script>
    <script>
        $ (".menu-toggle").click(function () {
    $(".menu-toggle").toggleClass("open");
    $(".menu-line").toggleClass("open");
    $(".menu-round").toggleClass("open"); 
    });
    </script>
    <script>
	    const current = window.location.href;
	   	if(current === "http://localhost:8080/Cua_hang_xe_may/" ||current === "http://localhost:8081/Cua_hang_xe_may/home" ) {
	   		document.querySelector("#nav-first").classList.add("active");
	   	} else {
	   	 document.querySelectorAll(".navbar-nav a.nav-item").forEach(function(elem){ 
	   	        if(elem.href.includes(current)){
document.querySelector("#nav-first").classList.remove("active");
	   	          elem.classList.add("active");
	   	        }
	   	    });
	   	}
   	   
    </script>
    
</body>

</html>