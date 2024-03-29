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
 <!-- Page Header Start -->
    <div class="container-fluid page-header">
        <h1 class="display-3 text-uppercase text-white mb-3">Xe mới 2023</h1>
        <div class="d-inline-flex text-white">
            <h6 class="text-uppercase m-0"><a class="text-white" href="${pageContext.request.contextPath }/home">Trang chủ</a></h6>
            <h6 class="text-body m-0 px-3">/</h6>
            <h6 class="text-uppercase text-body m-0">Xe mới 2023</h6>
        </div>
    </div>
    <!-- Page Header Start -->


    <!-- Rent A Car Start -->
    <div class="container-fluid py-0">
        <div class="container pt-5 pb-3">
            <h1 class="display-4 text-uppercase text-center mb-5">Có thể bạn quan tâm</h1>
            <h5 class="display-6 text-uppercase text-center mb-5">*Giá trên đã bao gồm 10% thuế giá trị gia tăng (VAT)*</h5>
            <!-- Search Start -->
            <div  class="container bg-white pt-3 px-lg-4 ">
            	<form action="${pageContext.request.contextPath}/motobike" method="get">
            		 <div class="row mx-n2">
	                    <div class="col-xl-3 col-lg-4 col-md-6 px-3">
	                        <select class="custom-select px-4 mb-3" style="height: 50px;" name="brandFilter">
	                            <option selected value="0">Nhãn Hiệu</option>
	                            <%for(Brand b: brands)  {%>
	                            <option value="<%=b.getId() %>"><%=b.getName() %></option>
	                            <% } %>
	                        </select>
	                    </div>
	                    <div class="col-xl-3 col-lg-4 col-md-6 px-3">
	                        <select class="custom-select px-4 mb-3" style="height: 50px;" name="motolineFilter">
	                            <option selected  value="0">Loại xe</option>
	                            <%for(Motoline m: motolines) {%>
	                            <option value="<%=m.getId() %>"><%=m.getName() %></option>
	                            <% } %>
	                        </select>
	                    </div>
	                    <div class="col-xl-6 col-lg-4 col-md-6 px-3">
	                        <button class="btn btn-primary btn-block mb-3" type="submit" style="height: 50px;">Tìm kiếm</button>
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
                                Từ
                              	  <fmt:setLocale value = "vi_Vn"/>
                                <fmt:formatNumber type="currency" 
          value ="<%=p.getPrice() %>" currencySymbol="VNĐ"/></span>
                            </div>
                        </div>
                        <a class="btn btn-primary px-3" href="${pageContext.request.contextPath}/details?id=<%=p.getId()%>">Xem chi tiết</a>
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
                                    <h3 class="text-uppercase text-light mb-3 mr-3">Bạn có muốn </h3>
                                    <p class="mb-4 mr-3">Đầy đủ phụ kiện, đảm bảo an toàn khi tham gia giao thông</p>
                                    <a class="btn btn-primary py-2 px-4 mr-3" href="">Thử ngay</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 px-2">
                            <div class="px-9 bg-dark d-flex align-items-center justify-content-between">
                                <div class="text-left">
                                    <h3 class="text-uppercase text-light mb-3 ml-3">lái thử chúng ?</h3>
                                    <p class="mb-4 ml-3">Đầy đủ phụ kiện, đảm bảo an toàn khi tham gia giao thông</p>
                                    <a class="btn btn-primary py-2 px-4 ml-3" href="">Thử ngay</a>
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
            </div>                  </div>
  
<!-- Vendor End -->