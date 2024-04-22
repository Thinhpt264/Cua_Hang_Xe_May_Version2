<%@page import="java.util.Locale"%>
<%@page import="java.util.ResourceBundle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"%>
	<%
		HttpSession httpSession = request.getSession();
		String lang = "vi";
		if(httpSession.getAttribute("language")!= null){
			lang = httpSession.getAttribute("language").toString();
		}
		ResourceBundle messages = ResourceBundle.getBundle("messages",new Locale("lang"));
	%> 
	
   <!-- Page Header Start -->
    <div class="container-fluid page-header mt-3">
        <h1 class="display-3 text-uppercase text-white mb-3"><%= messages.getString("dich_vu") %></h1>
        <div class="d-inline-flex text-white">
            <h6 class="text-uppercase m-0"><a class="text-white" href=""><%= messages.getString("trang_chu") %></a></h6>
            <h6 class="text-body m-0 px-3">/</h6>
            <h6 class="text-uppercase text-body m-0"><%= messages.getString("dich_vu") %></h6>
        </div>
    </div>
    <!-- Page Header Start -->
    

    <!-- Services Start -->
    <div class="container-fluid py-1">
        <div class="container pt-1 pb-3">
            <h1 class="display-1 text-primary text-center">02</h1>
            <h1 class="display-4 text-uppercase text-center mb-5"><%= messages.getString("dich_vu") %></h1>
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
                        <h4 class="text-uppercase mb-3"><%= messages.getString("phu_kien") %></h4>
                        <p class="m-0"><%= messages.getString("content_phukien") %>.</p>
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
<h4 class="text-uppercase mb-3"><%= messages.getString("bao_hiem") %></h4>
                        <p class="m-0"><%= messages.getString("content_baohiem") %>.</p>
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
                        <h4 class="text-uppercase mb-3"><%= messages.getString("kiem_tra_dinh_ki") %></h4>
                        <p class="m-0"><%= messages.getString("content_kiemtradinhki") %></p>
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
                        <h4 class="text-uppercase mb-3"><%= messages.getString("sua_chua_nang_cap") %></h4>
                        <p class="m-0"><%= messages.getString("content_suachuanangcap") %>.</p>
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
                        <h4 class="text-uppercase mb-3"><%= messages.getString("bao_hanh") %></h4>
                        <p class="m-0"><%= messages.getString("content_baohanh") %></p>
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
                        <h4 class="text-uppercase mb-3"><%= messages.getString("rua_xe") %></h4>
                        <p class="m-0"><%= messages.getString("content_ruaxe") %> </p>
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
                    <h1 class="display-1 text-uppercase text-primary mb-4"><%= messages.getString("qua_tang_dac_biet") %></h1>
                    <h1 class="text-uppercase text-light mb-4"><%= messages.getString("content_quatangdacbiet") %></h1>
                    <p class="mb-4">*<%= messages.getString("ap_dung") %>*</p>
                    <a class="btn btn-primary mt-2 py-3 px-5" href="#"><%= messages.getString("dang_ki") %></a>
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
                            <img style="width:114px;height:114px" src="${pageContext.request.contextPath}/assets/user/Image/Honda/Kawasaki-Logo.png" alt="">
                        </div>
                    </div>
                </div>
            </div> 
    <!-- Vendor End -->