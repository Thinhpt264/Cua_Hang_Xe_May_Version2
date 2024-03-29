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
    <!-- Carousel Start -->
    <div class="container-fluid p-0">
        <div id="header-carousel" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="w-100" src="${pageContext.request.contextPath}/assets/user/Image/Honda/tayga/header_honda_SHmode.jpg" alt="Image">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-end">
                        <div class="p-3" style="max-width: 900px;">

                            <a href="${pageContext.request.contextPath}/motobike" class="btn btn-primary py-md-3 px-md-5 mt-2">Mua ngay!</a>
                        </div>
                    </div>
                </div>

                <div class="carousel-item">
                    <img class="w-100" src="${pageContext.request.contextPath}/assets/user/Image/Honda/tayga/header_honda_Vario.jpg" alt="Image">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-end">
                        <div class="p-3" style="max-width: 900px;">
                            
                            <a href="${pageContext.request.contextPath}/motobike" class="btn btn-primary py-md-3 px-md-5 mt-2">Mua ngay!</a>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="w-100" src="${pageContext.request.contextPath}/assets/user/Image/Honda/tayga/header_honda_AB.jpg" alt="Image">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                        <div class="carousel-caption d-flex flex-column align-items-center justify-content-end">
                            <div class="p-3" style="max-width: 900px;">
                                <a href="${pageContext.request.contextPath}/motobike" class="btn btn-primary py-md-3 px-md-5 mt-2">Mua ngay!</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="w-100" src="${pageContext.request.contextPath}/assets/user/Image/Honda/tayga/header_honda_Lead.jpg" alt="Image">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-end">
                        <div class="p-3" style="max-width: 900px;">
                            
                            <a href="${pageContext.request.contextPath}/motobike" class="btn btn-primary py-md-3 px-md-5 mt-2">Mua ngay!</a>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="w-100" src="${pageContext.request.contextPath}/assets/user/Image/Honda/tayga/header_honda_SH.jpg" alt="Image">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-end">
                        <div class="p-3" style="max-width: 900px;">
                           
                            <a href="${pageContext.request.contextPath}/motobike" class="btn btn-primary py-md-3 px-md-5 mt-2">Mua ngay!</a>
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
            <h1 class="display-4 text-uppercase text-center mb-5">Chào mừng đến với <span
                    class="text-primary">T-Motoshop</span></h1>
            <div class="row justify-content-center">
                <div class="col-lg-10 text-center">
                    <img class="w-75 mb-4" src="${pageContext.request.contextPath}/assets/user/Image/Honda/xeSo/header_honda_CBR.jpg" alt="">
                    <p>T-Motoshop là một trong những lá cờ đầu của nước Việt Nam trong lĩnh vực kinh doanh các dòng xe
                        máy thuộc nhiều nhãn hàng, thương h khác nhau ,
                        từ các dòng xe số phổ thông và cao cấp, các dòng xe tay ga của các thương hiệu nổi tiếng cả
                        trong và ngoài nước. Bên cạnh đó T-Motoshop còn
                        cung cấp các dòng xe thể thao được sản xuất ở trong và ngoài nước với công nghệ tiên tiến và
                        hiện đại. Đội ngủ nhân viên tư vấn và chăm sóc khách hàng
                        được đào tạo bài bản và chu đáo, nhằm mang đến trải nghiệm tốt nhất cho khách hàng khi mua sẵm
                        cũng như sử dụng dịch vụ của T-Motoshop</p>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-lg-4 mb-2">
                    <div class="d-flex align-items-center bg-light p-4 mb-4" style="height: 150px;">
                        <div class="d-flex align-items-center justify-content-center flex-shrink-0 bg-primary ml-n4 mr-4"
                            style="width: 100px; height: 100px;">
                            <i class="fa fa-2x fa-headset text-secondary"></i>
                        </div>
                        <h4 class="text-uppercase m-0">Hỗ trợ khách hàng 24/7</h4>
                    </div>
                </div>
                <div class="col-lg-4 mb-2">
                    <div class="d-flex align-items-center bg-secondary p-4 mb-4" style="height: 150px;">
                        <div class="d-flex align-items-center justify-content-center flex-shrink-0 bg-primary ml-n4 mr-4"
                            style="width: 100px; height: 100px;">
                            <i class="fa fa-2x fa-car text-secondary"></i>
                        </div>
                        <h4 class="text-light text-uppercase m-0">Xem xe nhanh chóng dễ dàng</h4>
                    </div>
                </div>
                <div class="col-lg-4 mb-2">
                    <div class="d-flex align-items-center bg-light p-4 mb-4" style="height: 150px;">
                        <div class="d-flex align-items-center justify-content-center flex-shrink-0 bg-primary ml-n4 mr-4"
                            style="width: 100px; height: 100px;">
                            <i class="fa fa-2x fa-map-marker-alt text-secondary"></i>
                        </div>
                        <h4 class="text-uppercase m-0">Chi nhánh gần bạn nhất</h4>
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
            <h1 class="display-4 text-uppercase text-center mb-5">Dịch Vụ</h1>
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
                        <h4 class="text-uppercase mb-3">Phụ kiện và phụ tùng</h4>
                        <p class="m-0">Cửa hàng chúng tôi chuyên cung cấp phụ kiện và phụ tùng cho các loại xe thuộc cái thương hiệu khác nhau .</p>
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
                        <h4 class="text-uppercase mb-3">Bảo Hiểm</h4>
                        <p class="m-0">Chính sách bảo hiểm cho phương tiện đạt chuẩn của Bộ Công An và Nhà nước.</p>
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
                        <h4 class="text-uppercase mb-3">Kiểm Tra Định Kỳ</h4>
                        <p class="m-0">Để xe của bạn hoạt động bền bĩ và êm ái, T-Motoshop chúng tôi khuyến cáo nên kiểm
                            tra định kì sau mỗi 3000km</p>
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
                        <h4 class="text-uppercase mb-3">Sữa chữa & nâng cấp</h4>
                        <p class="m-0">Với đội ngũ kỹ thuật viên chuyên nghiệp, T-Motoshop sẽ hỗ trợ bạn tất cả những
                            vấn đề về bảo trì sữa chữa & nâng cấp.</p>
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
                        <h4 class="text-uppercase mb-3">Bảo Hành Sản Phẩm</h4>
                        <p class="m-0">Với mong muốn đưa ngành xe Việt Nam vươn tầm thế giới, T-Motoshop bảo hành xe của
                            tất cả các hãng trên toàn quốc trong vòng 3 năm hoặc 30.000km</p>
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
                        <h4 class="text-uppercase mb-3">Rửa Xe & Chăm Sóc</h4>
                        <p class="m-0">T-Motoshop chúng tôi cung cấp dịch vụ rửa xe & chăm sóc xe hiện đại và chuyên
                            nghiệp bậc nhất Việt Nam </p>
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
                    <h1 class="display-1 text-uppercase text-primary mb-4">GIẢM 50% </h1>
                    <h1 class="text-uppercase text-light mb-4">ƯU ĐÃI ĐẶC BIỆT CHO THÀNH VIÊN MỚI</h1>
                    <p class="mb-4">Chỉ dành cho tháng đầu tiên khi bạn đến mua hàng</p>
                    <a class="btn btn-primary mt-2 py-3 px-5" href="${pageContext.request.contextPath}/motobike">MUA NGAY</a>
                </div>
            </div>
        </div>
    </div>
    <!-- Banner End -->


    <!-- Rent A Car Start -->
    <div class="container-fluid py-1">
        <div class="container">
            <h1 class="display-1 text-primary text-center">03</h1>
            <h1 class="display-4 text-uppercase text-center mb-5">Xe Mới Nhất</h1>
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
            <h1 class="display-4 text-uppercase text-center mb-5">Điều gì chờ đợi bạn vào tháng 11 này </h1>
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
                            <h3 class="text-uppercase text-light mb-3 mr-3">Bạn có muốn </h3>
                            <p class="mb-4 mr-3">Đầy đủ phụ kiện, đảm bảo an toàn khi tham gia giao thông</p>
                            <a class="btn btn-primary py-2 px-4 mr-3" href="">Tham gia ngay</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 px-2">
                    <div class="px-9 bg-dark d-flex align-items-center justify-content-between">
                        <div class="text-left">
                            <h3 class="text-uppercase text-light mb-3 ml-3">lái thử chúng ?</h3>
                            <p class="mb-4 ml-3">Đầy đủ phụ kiện, đảm bảo an toàn khi tham gia giao thông</p>
                            <a class="btn btn-primary py-2 px-4 ml-3" href="">Tham gia ngay</a>
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
            <h1 class="display-4 text-uppercase text-center mb-5">THƯƠNG HIỆU</h1>
            <div class="owl-carousel testimonial-carousel">
                <div class="testimonial-item d-flex flex-column justify-content-center px-4">
                    <div class="d-flex align-items-center justify-content-between mb-3">
                        <img class="img-fluid ml-n6" src="${pageContext.request.contextPath}/assets/user/Image/Honda/Honda_Logo.svg.png" alt="">
                        <h1 class="display-2 text-white m-0 fa fa-quote-right"></h1>
                    </div>
                    <h4 class="text-uppercase mb-2">Honda</h4>
                    <i class="mb-2">Nhãn hiệu hàng đầu</i>
                    <p class="m-0">Tự hào là thương hiệu xe máy gắn bó với người dân Châu Á và Việt Nam từ những năm 1996 đến nay </p>
                </div>
                <div class="testimonial-item d-flex flex-column justify-content-center px-4">
                    <div class="d-flex align-items-center justify-content-between mb-3">
                        <img class="img-fluid ml-n6 " src="${pageContext.request.contextPath}/assets/user/Image/Honda/yamaha.png" alt="">
                        <h1 class="display-2 text-white m-0 fa fa-quote-right"></h1>
                    </div>
                    <h4 class="text-uppercase mb-2">Yamaha</h4>
                    <i class="mb-2">Thương hiệu nổi tiếng</i>
                    <p class="m-0">Yamaha Việt Nam là một dòng sản phẩm được người dân Việt Nam yêu thích với thiết kế đẹp mắt và động cơ mạnh mẽ</p>
                </div>
                <div class="testimonial-item d-flex flex-column justify-content-center px-4">
                    <div class="d-flex align-items-center justify-content-between mb-3">
                        <img class="img-fluid ml-n6" src="${pageContext.request.contextPath}/assets/user/Image/Vinfast/logo-vinfast-1.png">
                        <h1 class="display-2 text-white m-0 fa fa-quote-right"></h1>
                    </div>
                    <h4 class="text-uppercase mb-2">Vinfast</h4>
                    <i class="mb-2">Thương hiệu đến từ Việt Nam</i>
                    <p class="m-0">Vinfast được ra đời vào cuối năm 2017 nhưng nhanh chống tiếp cận được thị hiếu của thị trường Việt Nam với dòng xe máy điện</p>
                </div>
                <div class="testimonial-item d-flex flex-column justify-content-center px-4">
                    <div class="d-flex align-items-center justify-content-between mb-3">
                        <img class="img-fluid ml-n6" src="${pageContext.request.contextPath}/assets/user/Image/Piaggio(Vespa)/logo-Piaggio.png" alt="">
                        <h1 class="display-2 text-white m-0 fa fa-quote-right"></h1>
                    </div>
                    <h4 class="text-uppercase mb-2">Piaggio</h4>
                    <i class="mb-2">Dòng xe cao cấp</i>
                    <p class="m-0">Dòng xe Vespa được người dùng Việt Nam ưa chuộng từ mẫu xe 2 thì đến mẫu xe Vespa 4 thì hiện nay</p>
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
