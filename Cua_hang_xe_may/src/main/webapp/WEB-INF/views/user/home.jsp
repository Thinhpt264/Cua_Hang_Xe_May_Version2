<%@page import="java.util.Locale"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.demo.entities.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%
	List<Product> products = (List<Product>) request.getAttribute("products"); 
	if(products == null) {
		products = new ArrayList<>();
	}
	%>
	<%
    	HttpSession httpSession = request.getSession();
    	String lang = "vi";
    	if(httpSession.getAttribute("language") != null){
    		lang = httpSession.getAttribute("language").toString();
    	}
    	ResourceBundle messages = ResourceBundle.getBundle("messages", new Locale(lang));
    %>
	
    <!-- Carousel Start -->
    <div class="container-fluid p-0">
        <div id="header-carousel" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="w-100" src="${pageContext.request.contextPath}/assets/user/Image/Honda/tayga/header_honda_SHmode.jpg" alt="Image">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-end">
                        <div class="p-3" style="max-width: 900px;">

                            <a href="${pageContext.request.contextPath}/motobike" class="btn btn-primary py-md-3 px-md-5 mt-2"><%=messages.getString("mua_ngay")%></a>
                        </div>
                    </div>
                </div>

                <div class="carousel-item">
                    <img class="w-100" src="${pageContext.request.contextPath}/assets/user/Image/Honda/tayga/header_honda_Vario.jpg" alt="Image">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-end">
                        <div class="p-3" style="max-width: 900px;">
                            
                            <a href="${pageContext.request.contextPath}/motobike" class="btn btn-primary py-md-3 px-md-5 mt-2"><%=messages.getString("mua_ngay")%></a>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="w-100" src="${pageContext.request.contextPath}/assets/user/Image/Honda/tayga/header_honda_AB.jpg" alt="Image">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                        <div class="carousel-caption d-flex flex-column align-items-center justify-content-end">
                            <div class="p-3" style="max-width: 900px;">
<a href="${pageContext.request.contextPath}/motobike" class="btn btn-primary py-md-3 px-md-5 mt-2"><%=messages.getString("mua_ngay")%></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="w-100" src="${pageContext.request.contextPath}/assets/user/Image/Honda/tayga/header_honda_Lead.jpg" alt="Image">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-end">
                        <div class="p-3" style="max-width: 900px;">
                            
                            <a href="${pageContext.request.contextPath}/motobike" class="btn btn-primary py-md-3 px-md-5 mt-2"><%=messages.getString("mua_ngay")%></a>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="w-100" src="${pageContext.request.contextPath}/assets/user/Image/Honda/tayga/header_honda_SH.jpg" alt="Image">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-end">
                        <div class="p-3" style="max-width: 900px;">
                           
                            <a href="${pageContext.request.contextPath}/motobike" class="btn btn-primary py-md-3 px-md-5 mt-2"><%=messages.getString("mua_ngay")%></a>
                        </div>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#header-carousel" data-slide="prev">
                <div class="btn btn-dark" style="width: 45px; height: 45px;">
                    <span class="carousel-control-prev-icon mb-n2"></span>
                </div>
            </a>
            <a class="carousel-control-next" href="#header-carousel" data-slide="next">
                <div class="btn btn-dark" style="width: 45px; height: 45px;">
                    <span class="carousel-control-next-icon mb-n2"></span>
                </div>
            </a>
        </div>
    </div>
    <!-- Carousel End -->

    <!-- About Start -->
    <div class="container-fluid py-1">
        <div class="container">
            <h1 class="display-1 text-primary text-center">01</h1>
            <h1 class="display-4 text-uppercase text-center mb-5"><%=messages.getString("chao_mung")%> <span
                    class="text-primary">T-Motoshop</span></h1>
            <div class="row justify-content-center">
                <div class="col-lg-10 text-center">
                    <img class="w-75 mb-4" src="${pageContext.request.contextPath}/assets/user/Image/Honda/xeSo/header_honda_CBR.jpg" alt="">
                    <p><%=messages.getString("content")%></p>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-lg-4 mb-2">
                <div class="d-flex align-items-center bg-light p-4 mb-4" style="height: 150px;">
                        <div class="d-flex align-items-center justify-content-center flex-shrink-0 bg-primary ml-n4 mr-4"
                            style="width: 100px; height: 100px;">
                            <i class="fa fa-2x fa-headset text-secondary"></i>
                        </div>
                        <h4 class="text-uppercase m-0"><%=messages.getString("ho_tro")%></h4>
                    </div>
                </div>
                <div class="col-lg-4 mb-2">
                    <div class="d-flex align-items-center bg-secondary p-4 mb-4" style="height: 150px;">
                        <div class="d-flex align-items-center justify-content-center flex-shrink-0 bg-primary ml-n4 mr-4"
                            style="width: 100px; height: 100px;">
                            <i class="fa fa-2x fa-car text-secondary"></i>
                        </div>
                        <h4 class="text-light text-uppercase m-0"><%=messages.getString("xem_xe")%></h4>
                    </div>
                </div>
                <div class="col-lg-4 mb-2">
                    <div class="d-flex align-items-center bg-light p-4 mb-4" style="height: 150px;">
                        <div class="d-flex align-items-center justify-content-center flex-shrink-0 bg-primary ml-n4 mr-4"
                            style="width: 100px; height: 100px;">
                            <i class="fa fa-2x fa-map-marker-alt text-secondary"></i>
                        </div>
                        <h4 class="text-uppercase m-0"><%=messages.getString("chi_nhanh")%></h4>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- About End -->


    <!-- Services Start -->
    <div class="container-fluid  ">
        <div class="container">
            <h1 class="display-1 text-primary text-center">02</h1>
            <h1 class="display-4 text-uppercase text-center mb-5"><%=messages.getString("dich_vu")%></h1>
            <div class="row">
                <div class="col-lg-4 col-md-6 mb-2">
                    <div class="service-item d-flex flex-column justify-content-center px-4 mb-4">
                        <div class="d-flex align-items-center justify-content-between mb-3">
                            <div class="d-flex align-items-center justify-content-center bg-primary ml-n4"
                                style="width: 80px; height: 80px;">
                                <i class="fa fa-2x fa-cycle text-secondary"></i>
                                <i class="fa fa-2x fa-cogs text-secondary"></i>
                            </div>
                            <h1 class="display-2 text-white mt-n2 m-0">01</h1>
                        </div>
                        <h4 class="text-uppercase mb-3"><%=messages.getString("phu_kien")%></h4>
<p class="m-0"><%=messages.getString("content_phukien")%> .</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-2">
                    <div class="service-item active d-flex flex-column justify-content-center px-4 mb-4">
                        <div class="d-flex align-items-center justify-content-between mb-3">
                            <div class="d-flex align-items-center justify-content-center bg-primary ml-n4"
                                style="width: 80px; height: 80px;">
                                <i class="fa fa-2x fa-money-check-alt text-secondary"></i>
                            </div>
                            <h1 class="display-2 text-white mt-n2 m-0">02</h1>
                        </div>
                        <h4 class="text-uppercase mb-3"><%=messages.getString("bao_hiem")%></h4>
                        <p class="m-0"><%=messages.getString("content_baohiem")%>.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-2">
                    <div class="service-item d-flex flex-column justify-content-center px-4 mb-4">
                        <div class="d-flex align-items-center justify-content-between mb-3">
                            <div class="d-flex align-items-center justify-content-center bg-primary ml-n4"
                                style="width: 80px; height: 80px;">
                                <i class="fa-solid fa-motorcycle text-secondary fa-2x"></i>
                            </div>
                            <h1 class="display-2 text-white mt-n2 m-0">03</h1>
                        </div>
                        <h4 class="text-uppercase mb-3"><%=messages.getString("kiem_tra_dinh_ki")%></h4>
                        <p class="m-0"><%=messages.getString("content_kiemtradinhki")%></p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-2">
                    <div class="service-item d-flex flex-column justify-content-center px-4 mb-4">
                        <div class="d-flex align-items-center justify-content-between mb-3">
                            <div class="d-flex align-items-center justify-content-center bg-primary ml-n4"
                                style="width: 80px; height: 80px;">
                                <i class="fa-solid fa-screwdriver-wrench fa-2x text-secondary"></i>
                            </div>
                            <h1 class="display-2 text-white mt-n2 m-0">04</h1>
                        </div>
                        <h4 class="text-uppercase mb-3"><%=messages.getString("sua_chua_nang_cap")%></h4>
                        <p class="m-0"><%=messages.getString("content_suachuanangcap")%>.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-2">
                    <div class="service-item d-flex flex-column justify-content-center px-4 mb-4">
                    <div class="d-flex align-items-center justify-content-between mb-3">
                            <div class="d-flex align-items-center justify-content-center bg-primary ml-n4"
                                style="width: 80px; height: 80px;">
                                <i class="fa fa-2x fa-spray-can text-secondary"></i>
                            </div>
                            <h1 class="display-2 text-white mt-n2 m-0">05</h1>
                        </div>
                        <h4 class="text-uppercase mb-3"><%=messages.getString("bao_hanh")%></h4>
                        <p class="m-0"><%=messages.getString("content_baohanh")%></p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-2">
                    <div class="service-item d-flex flex-column justify-content-center px-4 mb-4">
                        <div class="d-flex align-items-center justify-content-between mb-3">
                            <div class="d-flex align-items-center justify-content-center bg-primary ml-n4"
                                style="width: 80px; height: 80px;">
                                <i class="fa fa-2x fa-pump-soap text-secondary"></i>
                            </div>
                            <h1 class="display-2 text-white mt-n2 m-0">06</h1>
                        </div>
                        <h4 class="text-uppercase mb-3"><%=messages.getString("rua_xe")%></h4>
                        <p class="m-0"><%=messages.getString("content_ruaxe")%> </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Services End -->


    <!-- Banner Start -->
    <div class="container-fluid py-1">
        <div class="container py-5">
            <div class="bg-banner py-5 px-4 text-center">
                <div class="py-5">
                    <h1 class="display-1 text-uppercase text-primary mb-4"><%=messages.getString("giam")%> </h1>
                    <h1 class="text-uppercase text-light mb-4"><%=messages.getString("uu_dai")%></h1>
                    <p class="mb-4"><%=messages.getString("content_uudai")%></p>
                    <a class="btn btn-primary mt-2 py-3 px-5" href="${pageContext.request.contextPath}/motobike"><%=messages.getString("mua_ngay")%></a>
                </div>
            </div>
        </div>
    </div>
    <!-- Banner End -->


    <!-- Rent A Car Start -->
    <div class="container-fluid py-1">
        <div class="container">
            <h1 class="display-1 text-primary text-center">03</h1>
            <h1 class="display-4 text-uppercase text-center mb-5"><%=messages.getString("xe_moi_nhat")%></h1>
            <div class="row">
            <% int count = 0; 
            for(int i=products.size()-1; i>= 0; i--) { %>
                <div class="col-lg-4 col-md-6 mb-2">
                    <div class="rent-item mb-4">
                    	<% Product p = products.get(i); %>
<img class="img-fluid mb-4" style="width:230px ; height : 170px" src="${pageContext.request.contextPath}/assets/user/Image/<%= p.getAvatar()%>" alt="">
                        <h4 class="text-uppercase mb-4"><%=p.getName()%></h4>
                        <div class="d-flex justify-content-center mb-4">                       
                            <div class="px-6">
                                <i class="fa fa-road text-primary mr-1"></i>
                                <span> <fmt:setLocale value = "vi_Vn"/>
                                <fmt:formatNumber type="currency" 
          value ="<%=p.getPrice() %>" currencySymbol="VNĐ"/></span></span>
                            </div>
                        </div>
                     
                        <a class="btn btn-primary px-3" href="${pageContext.request.contextPath}/details?id=<%=p.getId()%>">Xem Chi Tiết</a>
                    </div>
                </div>
                <% if (++count == 6) {
                    break;
                }  
                %>   
                <% } %>   
            </div>
        </div>
    </div>
    <!-- Rent A Car End -->


    <!-- Team Start -->
    <div class="container-fluid py-0">
        <div class="container py-1">
            <h1 class="display-1 text-primary text-center">04</h1>
            <h1 class="display-4 text-uppercase text-center mb-5"><%=messages.getString("dieu_gi_cho_doi")%> </h1>
            <div class="owl-carousel team-carousel position-relative" style="padding: 0 30px;">
                <div class="team-item">
                    <img class="img-fluid w-100" src="${pageContext.request.contextPath}/assets/user/Image/Honda/tayga/SH350_bac.png" alt="">
                    <div class="position-relative py-4">
                        <h4 class="">SH 350i BẠC CAO CẤP</h4>
                        <p class="m-0">Sắp ra mắt...</p>
                        <div
                            class="team-social position-absolute w-100 h-100 d-flex align-items-center justify-content-center">
                            <a class="btn btn-lg btn-primary btn-lg-square mx-1" href="#"><i
                                    class="fab fa-twitter"></i></a>
                            <a class="btn btn-lg btn-primary btn-lg-square mx-1" href="#"><i
                                    class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-lg btn-primary btn-lg-square mx-1" href="#"><i
                                    class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                </div>
                <div class="team-item">
                    <img class="img-fluid w-100" src="${pageContext.request.contextPath}/assets/user/Image/Honda/tayga/SH350_trang.png" alt="">
                    <div class="position-relative py-4">
                        <h4 class="">SH 350i TRẮNG CAO CẤP</h4>
                        <p class="m-0">Sắp ra mắt...</p>
                        <div
                                class="team-social position-absolute w-100 h-100 d-flex align-items-center justify-content-center">
                            <a class="btn btn-lg btn-primary btn-lg-square mx-1" href="#"><i
                                    class="fab fa-twitter"></i></a>
                            <a class="btn btn-lg btn-primary btn-lg-square mx-1" href="#"><i
                                    class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-lg btn-primary btn-lg-square mx-1" href="#"><i
                                    class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                </div>
                <div class="team-item">
                    <img class="img-fluid w-100" src="${pageContext.request.contextPath}/assets/user/Image/Honda/tayga/SH350_do.png" alt="">
                    <div class="position-relative py-4">
                        <h4 class="">SH 350i ĐỎ TIÊU CHUẨN</h4>
                        <p class="m-0">Sắp ra mắt...</p>
                        <div
                            class="team-social position-absolute w-100 h-100 d-flex align-items-center justify-content-center">
                            <a class="btn btn-lg btn-primary btn-lg-square mx-1" href="#"><i
                                    class="fab fa-twitter"></i></a>
                            <a class="btn btn-lg btn-primary btn-lg-square mx-1" href="#"><i
                                    class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-lg btn-primary btn-lg-square mx-1" href="#"><i
                                    class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                </div>
                <div class="team-item">
                    <img class="img-fluid w-100" src="${pageContext.request.contextPath}/assets/user/Image/Honda/tayga/SH350_den.png" alt="">
                    <div class="position-relative py-4">
                        <h4 class="">SH 350i ĐEN CAO CẤP </h4>
                        <p class="m-0">Sắp ra mắt...</p>
                        <div
                            class="team-social position-absolute w-100 h-100 d-flex align-items-center justify-content-center">
                            <a class="btn btn-lg btn-primary btn-lg-square mx-1" href="#"><i
                                    class="fab fa-twitter"></i></a>
                            <a class="btn btn-lg btn-primary btn-lg-square mx-1" href="#"><i
                                    class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-lg btn-primary btn-lg-square mx-1" href="#"><i
                                    class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                </div>
                <div class="team-item">
<img class="img-fluid w-100" src="${pageContext.request.contextPath}/assets/user/Image/Honda/tayga/SH350_xam.png" alt="">
                    <div class="position-relative py-4">
                        <h4 class="">SH 350i XÁM TIÊU CHUẨN</h4>
                        <p class="m-0">Sắp ra mắt...</p>
                        <div
                            class="team-social position-absolute w-100 h-100 d-flex align-items-center justify-content-center">
                            <a class="btn btn-lg btn-primary btn-lg-square mx-1" href="#"><i
                                    class="fab fa-twitter"></i></a>
                            <a class="btn btn-lg btn-primary btn-lg-square mx-1" href="#"><i
                                    class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-lg btn-primary btn-lg-square mx-1" href="#"><i
                                    class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Team End -->


    <!-- Banner Start -->
    <div class="container-fluid py-1">
        <div class="container py-5">
            <div class="row mx-0">
                <div class="col-lg-6 px-2">
                    <div class="px-9 bg-secondary d-flex align-items-center justify-content-between">
                        <img class="img-fluid flex-shrink-10 ml-n5 w-50 h-60 mr-2"
                            src="${pageContext.request.contextPath}/assets/user/Image/Honda/xeSo/Win_trang.png" alt="">
                        <div class="text-right">
                            <h3 class="text-uppercase text-light mb-3 mr-3"><%=messages.getString("ban_co_muon")%></h3>
                            <p class="mb-4 mr-3"><%=messages.getString("content_bancomuon")%></p>
                            <a class="btn btn-primary py-2 px-4 mr-3" href=""><%=messages.getString("tham_gia_ngay")%></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 px-2">
                    <div class="px-9 bg-dark d-flex align-items-center justify-content-between">
                        <div class="text-left">
                            <h3 class="text-uppercase text-light mb-3 ml-3"><%=messages.getString("lai_thu")%></h3>
                            <p class="mb-4 ml-3"><%=messages.getString("content_bancomuon")%></p>
                            <a class="btn btn-primary py-2 px-4 ml-3" href=""><%=messages.getString("tham_gia_ngay")%></a>
                        </div>
                        <img class="img-fluid flex-shrink-0 mr-n5 w-50 h-60 ml-2"
                            src="${pageContext.request.contextPath}/assets/user/Image/Honda/tayga/Sh160_special.png" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Banner End -->


    <!-- Testimonial Start -->
<div class="container-fluid py-1">
        <div class="container">
            <h1 class="display-1 text-primary text-center">05</h1>
            <h1 class="display-4 text-uppercase text-center mb-5"><%=messages.getString("thuong_hieu")%></h1>
            <div class="owl-carousel testimonial-carousel">
                <div class="testimonial-item d-flex flex-column justify-content-center px-4">
                    <div class="d-flex align-items-center justify-content-between mb-3">
                        <img class="img-fluid ml-n6" src="${pageContext.request.contextPath}/assets/user/Image/Honda/Honda_Logo.svg.png" alt="">
                        <h1 class="display-2 text-white m-0 fa fa-quote-right"></h1>
                    </div>
                    <h4 class="text-uppercase mb-2">Honda</h4>
                    <i class="mb-2"><%=messages.getString("brand_honda")%></i>
                    <p class="m-0"><%=messages.getString("content_honda")%> </p>
                </div>
                <div class="testimonial-item d-flex flex-column justify-content-center px-4">
                    <div class="d-flex align-items-center justify-content-between mb-3">
                        <img class="img-fluid ml-n6 " src="${pageContext.request.contextPath}/assets/user/Image/Honda/yamaha.png" alt="">
                        <h1 class="display-2 text-white m-0 fa fa-quote-right"></h1>
                    </div>
                    <h4 class="text-uppercase mb-2">Yamaha</h4>
                    <i class="mb-2"><%=messages.getString("brand_yamaha")%></i>
                    <p class="m-0"><%=messages.getString("content_yamaha")%></p>
                </div>
                <div class="testimonial-item d-flex flex-column justify-content-center px-4">
                    <div class="d-flex align-items-center justify-content-between mb-3">
                        <img class="img-fluid ml-n6" src="${pageContext.request.contextPath}/assets/user/Image/Vinfast/logo-vinfast-1.png">
                        <h1 class="display-2 text-white m-0 fa fa-quote-right"></h1>
                    </div>
                    <h4 class="text-uppercase mb-2">Vinfast</h4>
                    <i class="mb-2"><%=messages.getString("brand_vinfast")%></i>
                    <p class="m-0"><%=messages.getString("content_vinfast")%></p>
                </div>
                <div class="testimonial-item d-flex flex-column justify-content-center px-4">
                    <div class="d-flex align-items-center justify-content-between mb-3">
                        <img class="img-fluid ml-n6" src="${pageContext.request.contextPath}/assets/user/Image/Piaggio(Vespa)/logo-Piaggio.png" alt="">
                        <h1 class="display-2 text-white m-0 fa fa-quote-right"></h1>
                    </div>
                    <h4 class="text-uppercase mb-2">Piaggio</h4>
                    <i class="mb-2"><%=messages.getString("brand_piago")%></i>
                    <p class="m-0"><%=messages.getString("content_piago")%></p>
                </div>
            </div>
        </div>
    </div>
    <!-- Testimonial End -->


    <!-- Contact Start -->
    <div class="container-fluid py-1">
        <div class="container pt-3 pb-3">
            
        </div>
    </div>
    <!-- Contact End -->


    <!-- Vendor Start -->
    <div class="container-fluid py-5">
                <div class="container py-5">
                    <div class="owl-carousel vendor-carousel">
                        <div class="bg-light p-4">
                            <img src="${pageContext.request.contextPath}/assets/user/Image/Honda/logo-vinfast.png" alt="">
                        </div>
                        <div class="bg-light p-4">
                            <img src="${pageContext.request.contextPath}/assets/user/Image/Honda/suzuki.png" alt="">
                        </div>
                        <div class="bg-light p-4">
                            <img src="${pageContext.request.contextPath}/assets/user/Image/Honda/logo_ducati.png" alt="">
                        </div>
                        <div class="bg-light p-4">
                            <img src="${pageContext.request.contextPath}/assets/user/Image/Honda/yamaha.png" alt="">
                        </div>
                        <div class="bg-light p-4">
                            <img src="${pageContext.request.contextPath}/assets/user/Image/Honda/piago.png" alt="">
                        </div>
                        <div class="bg-light p-4">
                            <img style="width:114px;height:114px" src="${pageContext.request.contextPath}/assets/user/Image/Honda/logohonda2.png" alt="">
                        </div>
                        <div class="bg-light p-4">
                             <img src="${pageContext.request.contextPath}/assets/user/img/vendor-7.png" alt="">
                        </div>
                    </div>
                </div>
            </div> 
    <!-- Vendor End -->
    <div class="containers">
        <div class="menu-toggle">
            <img src="${pageContext.request.contextPath}/assets/user/Image/mess.png">
        </div>
        
        <div class="menu-line">
            <div class="btn-app">
                <a href="https://bit.ly/3lGliU5">
                    <img src="${pageContext.request.contextPath}/assets/user/Image/zalo-sharecs.png" class="iconf">
                    <span class="tooltip">Lên hệ Zalo</span>
                </a>
            </div>
            <div class="btn-app">
                <a href="https://www.facebook.com/phanthethinh.official26/">
                    <img src="${pageContext.request.contextPath}/assets/user/Image/fanpage-facebook-sharecs.png" class="iconf">
                    <span class="tooltip">Lên hệ Facebook</span>
                </a>
            </div>
            <div class="btn-app">
                <a href="https://maps.app.goo.gl/grxTQXjVAMgBRy2w9">
<img src="${pageContext.request.contextPath}/assets/user/Image/icon-map-sharecs.png" class="iconf">
                    <span class="tooltip">Xem địa chỉ văn phòng</span>
                </a>
            </div>
            <div class="btn-app">
                <a href="mailto:21130548@st.hcmuaf.edu.vn">
                    <img src="${pageContext.request.contextPath}/assets/user/Image/icon-mail-sharecs.png" class="iconf">
                    <span class="tooltip">Email hỗ trợ</span>
                </a>
            </div>
            <div class="btn-app">
                <a href="tel:0326767031">
                    <img src="${pageContext.request.contextPath}/assets/user/Image/icon-phone-sharecs.png" class="iconf">
                    <span class="tooltip">Hotline</span>
                </a>
            </div>
        </div>
    </div>