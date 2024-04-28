<%@page import="java.util.Locale"%>
<%@page import="java.util.ResourceBundle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
    <%
    HttpSession httpSession = request.getSession();
	String lang = "vi";
	if(httpSession.getAttribute("language") != null){
		lang = httpSession.getAttribute("language").toString();
	}
	ResourceBundle messages = ResourceBundle.getBundle("messages", new Locale(lang));
    %>
	
 <!-- Page Header Start -->
    <div class="container-fluid page-header mt-3">
        <h1 class="display-3 text-uppercase text-white mb-3"><%= messages.getString("gioi_thieu") %></h1>
        <div class="d-inline-flex text-white">
            <h6 class="text-uppercase m-0"><a class="text-white" href=""><%= messages.getString("trang_chu") %></a></h6>
            <h6 class="text-body m-0 px-3">/</h6>
            <h6 class="text-uppercase text-body m-0"><%= messages.getString("gioi_thieu") %></h6>
        </div>
    </div>
    <!-- Page Header Start -->


    <!-- About Start -->
    <div class="container-fluid py-5">
        <div class="container pt-5 pb-3">
            <h1 class="display-4 text-uppercase text-center mb-5"><%= messages.getString("chao_mung") %> <span class="text-primary">T-Motoshop</span></h1>
            <div class="row justify-content-center">
                <div class="col-lg-10 text-center">
                    <img class="w-75 mb-4" src="${pageContext.request.contextPath}/assets/user/Image/Honda/xeSo/header_honda_Cub.jpg" alt="">
                    <p><%= messages.getString("content") %></p>
            </div>
            <div class="row mt-3">
                <div class="col-lg-4 mb-2">
                    <div class="d-flex align-items-center bg-light p-4 mb-4" style="height: 150px;">
                        <div class="d-flex align-items-center justify-content-center flex-shrink-0 bg-primary ml-n4 mr-4" style="width: 100px; height: 100px;">
                            <i class="fa fa-2x fa-headset text-secondary"></i>
                        </div>
                        <h4 class="text-uppercase m-0"><%= messages.getString("ho_tro") %></h4>
                    </div>
                </div>
                <div class="col-lg-4 mb-2">
                    <div class="d-flex align-items-center bg-secondary p-4 mb-4" style="height: 150px;">
                        <div class="d-flex align-items-center justify-content-center flex-shrink-0 bg-primary ml-n4 mr-4" style="width: 100px; height: 100px;">
                            <i class="fa fa-2x fa-car text-secondary"></i>
                        </div>
                        <h4 class="text-light text-uppercase m-0"><%= messages.getString("xem_xe") %></h4>
                    </div>
                </div>
                <div class="col-lg-4 mb-2">
                    <div class="d-flex align-items-center bg-light p-4 mb-4" style="height: 150px;">
<div class="d-flex align-items-center justify-content-center flex-shrink-0 bg-primary ml-n4 mr-4" style="width: 100px; height: 100px;">
                            <i class="fa fa-2x fa-map-marker-alt text-secondary"></i>
                        </div>
                        <h4 class="text-uppercase m-0"><%= messages.getString("chi_nhanh") %></h4>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </div>
    <!-- About End -->


    <!-- Banner Start -->
    <div class="container-fluid py-5">
        <div class="container py-5">
            <div class="row mx-0">
                <div class="col-lg-6 px-2">
                    <div class="px-9 bg-secondary d-flex align-items-center justify-content-between">
                        <img class="img-fluid flex-shrink-10 ml-n5 w-50 h-60 mr-2" src="${pageContext.request.contextPath}/assets/user/Image/Honda/xeSo/Win_trang.png" alt="">
                        <div class="text-right">
                            <h3 class="text-uppercase text-light mb-3 mr-3"><%= messages.getString("ban_co_muon") %> </h3>
                            <p class="mb-4 mr-3"><%= messages.getString("content_bancomuon") %></p>
                            <a class="btn btn-primary py-2 px-4 mr-3" href=""><%= messages.getString("tham_gia_ngay") %></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 px-2">
                    <div class="px-9 bg-dark d-flex align-items-center justify-content-between">
                        <div class="text-left">
                            <h3 class="text-uppercase text-light mb-3 ml-3"><%= messages.getString("lai_thu") %></h3>
                            <p class="mb-4 ml-3"><%= messages.getString("content_bancomuon") %></p>
                            <a class="btn btn-primary py-2 px-4 ml-3" href=""><%= messages.getString("tham_gia_ngay") %></a>
                        </div>
                        <img class="img-fluid flex-shrink-0 mr-n5 w-50 h-60 ml-2" src="${pageContext.request.contextPath}/assets/user/Image/Honda/tayga/Sh160_special.png" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Banner End -->


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