<%@page import="java.util.Locale"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="com.demo.entities.Motoline"%>
<%@page import="com.demo.entities.Brand"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.demo.entities.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored ="false"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
    <%
    List<Product> products = (List<Product>) request.getAttribute("products");
   	if(products == null) products = new ArrayList<>(); 
    
    List<Brand> brands = (List<Brand>) request.getAttribute("brands");
   	if(brands == null) brands = new ArrayList<>(); 
   	
    List<Motoline> motolines = (List<Motoline>) request.getAttribute("motolines");
   	if(motolines == null) motolines = new ArrayList<>(); 
   	
    %>
    <%
    	HttpSession httpSession = request.getSession();
    	String lang = "vi";
    	if(httpSession.getAttribute("language") != null){
    		lang = httpSession.getAttribute("language").toString();
    	}
    	ResourceBundle messages = ResourceBundle.getBundle("messages", new Locale(lang));
    %>
 <!-- Page Header Start -->
    <div class="container-fluid page-header">
        <h1 class="display-3 text-uppercase text-white mb-3"><%= messages.getString("xe_moi")  %></h1>
        <div class="d-inline-flex text-white">
            <h6 class="text-uppercase m-0"><a class="text-white" href="${pageContext.request.contextPath }/home"><%= messages.getString("trang_chu")  %></a></h6>
            <h6 class="text-body m-0 px-3">/</h6>
            <h6 class="text-uppercase text-body m-0"><%= messages.getString("xe_moi")  %></h6>
        </div>
    </div>
    <!-- Page Header Start -->


    <!-- Rent A Car Start -->
    <div class="container-fluid py-0">
        <div class="container pt-5 pb-3">
            <h1 class="display-4 text-uppercase text-center mb-5"><%= messages.getString("co_the_ban_quan_tam")  %></h1>
            <h5 class="display-6 text-uppercase text-center mb-5">*<%= messages.getString("phi_thue")  %>*</h5>
            <!-- Search Start -->
            <div  class="container bg-white pt-3 px-lg-4 ">
            <!-- Sau Khi Người Dùng Đã Chọn Được Các Chủ Đề mình muốn chọn 
            	Gửi Một Form chứa value của option người dùng chọn
              -->
            	<form action="${pageContext.request.contextPath}/motobike" method="get">
            		 <div class="row mx-n2">
	                    <div class="col-xl-3 col-lg-4 col-md-6 px-3">
	                    <!-- Hiển Thị Tất Cả Các Option Của Hãng Trong Cơ Sở Dữ Liệu  -->
	                        <select class="custom-select px-4 mb-3" style="height: 50px;" name="brandFilter">
	                            <option selected value="0"><%= messages.getString("nhan_hieu")  %></option>
	                            <%for(Brand b: brands)  {%>
	                            <option value="<%=b.getId() %>"><%=b.getName() %></option>
	                            <% } %>
	                        </select>
	                    </div>
<div class="col-xl-3 col-lg-4 col-md-6 px-3">
   <!-- Hiển Thị Tất Cả Các Option Của Dòng Xe Trong Cơ Sở Dữ Liệu  -->
	                        <select class="custom-select px-4 mb-3" style="height: 50px;" name="motolineFilter">
	                            <option selected  value="0"><%= messages.getString("loai_xe")  %></option>
	                            <%for(Motoline m: motolines) {%>
	                            <option value="<%=m.getId() %>"><%=m.getName() %></option>
	                            <% } %>
	                        </select>
	                    </div>
	                    <div class="col-xl-6 col-lg-4 col-md-6 px-3">
	                        <button class="btn btn-primary btn-block mb-3" type="submit" style="height: 50px;"><%= messages.getString("tim_kiem")  %></button>
	                    </div>
                	</div>
            	</form>
            </div>
            <!-- Search End -->
            <div class="row list" style="display: none;">
<!--                sh--> 	
				<%for(Product p: products) { %>
                <div class="col-lg-3 col-md-6 mb-2 item">
                    <div class="rent-item mb-4">
                   
                        <img class="img-fluid mb-4"  style="width:230px ; height : 170px" src="${pageContext.request.contextPath}/assets/user/Image/<%=p.getAvatar() %>">
                        <h4 class="text-uppercase mb-4"><%=p.getName() %></h4>
                        <div class="d-flex justify-content-center mb-4">
                            <div class="px-2">
                                
                              	  <fmt:setLocale value = "vi_Vn"/>
                                <fmt:formatNumber type="currency" 
          value ="<%=p.getPrice() %>" currencySymbol="VNĐ"/></span>
                            </div>
                        </div>
                        <a class="btn btn-primary px-3" href="${pageContext.request.contextPath}/details?id=<%=p.getId()%>"><%= messages.getString("xem_chi_tiet")  %></a>
                    </div>
                </div>
                <% } %>
                    </div>
                </div>
                <!--        <div class="">-->
                <!--            <ul class="listPage "></ul>-->
                <!--        </div>-->
                <div class="col-md-12">
                    <ul class="listPage">
                    </ul>
                </div>

            </div>
            <!-- Rent A Car End -->


            <!-- Banner Start -->
            <div class="container-fluid py-5">
                <div class="container py-5">
                    <div class="row mx-0">
                        <div class="col-lg-6 px-2">
                            <div class="px-9 bg-secondary d-flex align-items-center justify-content-between">
                                <img class="img-fluid flex-shrink-10 ml-n5 w-50 h-60 mr-2" src="${pageContext.request.contextPath}/assets/user/Image/Honda/xeSo/Win_trang.png" alt="">
                                <div class="text-right">
<h3 class="text-uppercase text-light mb-3 mr-3"><%= messages.getString("ban_co_muon")  %> </h3>
                                    <p class="mb-4 mr-3"><%= messages.getString("content_bancomuon")  %></p>
                                    <a class="btn btn-primary py-2 px-4 mr-3" href=""><%= messages.getString("tham_gia_ngay")  %></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 px-2">
                            <div class="px-9 bg-dark d-flex align-items-center justify-content-between">
                                <div class="text-left">
                                    <h3 class="text-uppercase text-light mb-3 ml-3"><%= messages.getString("lai_thu")  %></h3>
                                    <p class="mb-4 ml-3"><%= messages.getString("content_bancomuon")  %></p>
                                    <a class="btn btn-primary py-2 px-4 ml-3" href=""><%= messages.getString("tham_gia_ngay")  %></a>
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
          </div>
  
<!-- Vendor End -->