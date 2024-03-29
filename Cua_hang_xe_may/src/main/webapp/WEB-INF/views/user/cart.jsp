<%@page import="com.google.api.Http"%>
<%@page import="com.demo.entities.ProductVersion"%>
<%@page import="com.demo.models.ProductModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored = "false"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
   
 <div class="container-fluid py-3">
        <div class="container pb-3">
            <div class="row">
                <div class="col-12 d-flex justify-content-center">
                    <div class="py-1">
                        <h2> <i class="fa-solid fa-cart-shopping mr-3" style="font-size: 50px;"></i>Dễ Dàng Theo Dõi Điều Bạn Quan Tâm</h2>
                        <p>Hãy thêm sản phẩm vào giỏ hàng.</p>
                    </div>
                </div>
            </div>
            <c:set var="total" value="0"></c:set>
            <c:forEach var="item" items="${sessionScope.cart}" varStatus="i">
            	<c:set var="total" value="${total + item.productcolor.price * item.quantity }"></c:set>
	            <div class="row rent-item m-2">
	                <div class="col-lg-4">
	                    <a href="${pageContext.request.contextPath}/details?id=${item.productcolor.id}">
	                        <img class="img-fluid w-50" src="${pageContext.request.contextPath}/assets/user/Image/${item.productcolor.photo }" alt="">
	                       	
	                        <h4 class="text-uppercase"> ${item.viewNameProduct((item.ProductVersion(item.productcolor.versionID)).productID)} ${item.viewNameProductVersion(item.productcolor.versionID)} Màu ${item.productcolor.color }</h4>
	                    </a>
	                </div>
	                <div class="col-lg-3 d-flex justify-content-left align-items-center">
	                    <div>
	                        <p class="m-0">Số Lượng</p>
	                        <span><a href="${pageContext.request.contextPath}/cart?action=minus&index=${i.index}"><i class="fa-solid fa-minus"></i></a>  ${item.quantity }  <a href="${pageContext.request.contextPath}/cart?action=plus&index=${i.index}"><i class="fa-solid fa-plus"></i></a></span> 
	                    </div>
	                    <div>
	                        <p class="m-0">Đơn Giá</p>
	                         <fmt:setLocale value = "vi_Vn"/>
	                        <span style="color: black;"> <fmt:formatNumber type="currency" 
          value ="${item.productcolor.price }" currencySymbol="VNĐ"/></span>
	                    </div>
	                </div>
	                <div class="col-lg-3 d-flex justify-content-between align-items-center">
	                    <div class="mr-1">
	                        <p class="m-0">Tổng Cộng</p>
	                      
	                        <span style="color: black;"> <fmt:formatNumber type="currency" 
          value ="${item.productcolor.price * item.quantity }"  currencySymbol="VNĐ"/>
          	
           </span>
	                    </div>
	                    <a class="btn btn-primary px-3" href="${pageContext.request.contextPath}/contact">Nhận Báo Giá</a>
	                </div>
	                <div class="col-lg-2 d-flex justify-content-end align-items-center">
	                    <a href="${pageContext.request.contextPath}/cart?action=remove&index=${i.index}" class="btn btn-danger">Xóa</a>
	                </div>
	            </div>
           </c:forEach>
           <div class="row mt-5 m-2">
                    <div class="col-lg-10 d-flex justify-content-end align-items-center" style="color:black">TỔNG CỘNG:</div>
                    <div class="col-lg-2 d-flex justify-content-start align-items-center" style="color:black;"> <fmt:formatNumber type="currency" 
          value ="${total }" currencySymbol="VNĐ" /></div>
            </div>
        </div>
    </div>