<%@page import="java.util.List"%>
<%@page import="com.google.api.Http"%>
<%@page import="com.demo.entities.ProductVersion"%>
<%@page import="com.demo.models.ProductModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored = "false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
   
   <style>
		   	.contact-form {
		  display: block;
		  position: fixed;
		  bottom: 1;
		  
		  border: 3px solid #f1f1f1;
		  z-index: 1;
		  
		}
		   	
   </style>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
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
	                  <button type="button" class="openAppent btn btn-primary" data-id="${i.index}"  data-bs-toggle="modal" data-bs-target="#exampleModal">Xem Ngay</button>
	              		
					 </div>
	             
	                <div class="col-lg-2 d-flex justify-content-start align-items-center">
	                    <a href="${pageContext.request.contextPath}/cart?action=remove&index=${i.index}" class="btn btn-danger">Xóa</a>
	                    <input type="checkbox" style=" transform: scale(1.5);"   name="tick " class="tick ml-3" data-id="${i.index}"> 
	                </div>
	            </div>
           </c:forEach>
           <script>
          	$(document).ready(function() {
          		$(".openAppent").click(function() {
          			var itemId = this.getAttribute('data-id');
          			console.log(itemId);
          			$.ajax({
          				type: 'GET',
          				url: '${pageContext.request.contextPath}/cart',
          				data:  {
          					itemId : itemId,
          					action : 'openappent'
          				},
          				success : function(data) {
          					var item = data.item;
          					var productColor = data.productColor;
          					console.log(productColor);
          					var productVersion = data.productVersion;
          					console.log(productVersion);
          					var price = productColor.price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
          					var product = data.product;
          					var totalPrice = productColor.price * item.quantity;
          					var totalPriceS = totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
          					console.log(product);
          					$('#img_open').attr('src', '${pageContext.request.contextPath}/assets/user/Image/' + productColor.photo);
          					$('.nameProduct').html(product.name + ' - ' + productVersion.versionName + ' - ' + productColor.color );
          					$('.quantity').html(item.quantity);
          					$('.price').html(price + 'Vnđ');
          					
          					$('.totalPrice').html(totalPriceS + 'Vnđ');
          					$('.id_color').attr('value' , productColor.id);
          					$('.quantity_color').attr('value' , item.quantity);
          					$('.total_color').attr('value' , totalPrice);
          					$('.deposit_amount').attr('value',totalPrice*5/100);
          					console.log(productColor.photo);
          				}
          				
          				
          			})
          		});
          	});
           </script>
           <script>
          	$(document).ready(function() {
          		$('.tick').click(function() {
          			if($(this).is(':checked')) {
          			  	var itemId =  this.getAttribute('data-id');
          			  	console.log(itemId);
          			  $.ajax({
          				type : 'GET' ,
url: '${pageContext.request.contextPath}/cart',
          				data : {
          					itemId : itemId,
          					action : 'additem'	
          				},
          				success: function(message) {
          					var message = message;
          				  return confirm(message);
						}
          			  
          			  })
          			} ;
          			if (!$(this).is(':checked')) {
          				var itemId =  this.getAttribute('data-id');
          				$.ajax({
              				type : 'GET' ,
              				url: '${pageContext.request.contextPath}/cart',
              				data : {
              					itemId : itemId,
              					action : 'removeItem'	
              				},
              				success: function(message) {
              					var message = message;
              				  return confirm(message);
    						}
          			})
          		};
          		
          		$('.openAppentTotal').click(function() {
          			var s = '';
          			
          			$.ajax({
          				type : 'GET' ,
          				url: '${pageContext.request.contextPath}/cart',
          				data : {
          					action : 'showTotal'	
          				},
          				success: function(data) {
          					var items = data.items;
          					console.log(items);
          					for (var i = 0; i < items.length; i++) {
          						var productColor = items[i].productcolor ;
          						console.log(productColor);
          						var total = productColor.price *  items[i].quantity ;
          						s+= '<div class="row rent-item ">';
          						s+= '<div class="col-lg-4">';
          						s+= '<a href="${pageContext.request.contextPath}/details?id=">'
          						s+= '<img class="img-fluid w-50" id="img_open"  src="${pageContext.request.contextPath}/assets/user/Image/'+ productColor.photo + '" >';
          						s+= '  <h4 class="text-uppercase nameProduct"> '  + productColor.color + ' </h4>' ;
          						s+= '</a>';
          						s+= '</div>';
          						s+=  '   <div class="col-lg-5 d-flex justify-content-left align-items-center">';
          						s+= '  <div>';
          						s+=  '<p class="m-0">Số Lượng</p>'
          						s+= '  <span class="quantity">' +items[i].quantity  +'</span> ';
          						s+=  ' </div> <div> <p class="m-0">Đơn Giá</p> ';
          						s+= ' <span class="price" style="color: black;">' + productColor.price + '</span>'
          						s+= '  </div>   </div> <div class="col-lg-3 d-flex justify-content-end align-items-center"> <div class="mr-1">  <p class="m-0" >Tổng Cộng</p>';
          						s+= '<span style="color: black;" class="totalPrice">'+ total  +  ' </span>';
          						s+= '<input type="hidden" class="id_color" name="id_color[]"  value="'+ productColor.id +' ">'
          						s+= '<input type="hidden" class="quantity_color" name="quantity_color[]"  value="'+ items[i].quantity +' ">'
          						s+= '<input type="hidden" class="total_color" name="total_color[]"  value="'+ total +' ">'
          						s+= '  </div> </div>   </div>'
          						$('.showlist').html(s);
          					}
          				}
          			})
          		});
          	});
          	});
</script>
           <div class="row mt-5 m-2">
                    <div class="col-lg-10 d-flex justify-content-end align-items-center" style="color:black">TỔNG CỘNG:</div>
                    <div class="col-lg-2 d-flex justify-content-start align-items-center" style="color:black;"> <fmt:formatNumber type="currency" 
          value ="${total }" currencySymbol="VNĐ" /></div>
            </div>
             <button type="button" class="openAppentTotal btn btn-primary"  data-bs-toggle="modal" data-bs-target="#exampleModal">Mua Tất Cả</button>
        </div>
        	
        <div class="modal fade" id="exampleModal"tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content"  style="width: 800px">
    <c:if test="${sessionScope.account == null}">
                	<div class="modal-header">
                	 <h4>Bạn Chưa Đăng Nhập Tài Khoản!</h4>  
                	 	<br>
                	 <a href="${pageContext.request.contextPath}/login"> Đăng Nhập ngay để đặt lịch hẹn </a>
                	
                  </div>
     </c:if>
      <c:if test="${sessionScope.account != null}" >         	
      <div class="modal-header">
        <h1 class="modal-title fs-6" id="exampleModalLabel">Hẹn Đến Xem Sản Phẩm</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="${pageContext.request.contextPath }/appoinment?action=oneProduct" method="post">
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Tên Của Bạn:</label>
               <input type="text" id="recipient-name" name="name" class="form-control" placeholder="Nguyễn Văn A" required="required">
          </div>
          <div class="mb-2">
            <label for="email" class="col-form-label">Email:</label>
             <input type="email" id="email" name="email" class="form-control" placeholder="vanA@gmail.com" required="required">
          </div>
          <div class="mb-2">
            <label for="phone" class="col-form-label">Số Điện Thoại:</label>
             <input type="number" id="phone" name="phone" class="form-control" placeholder="0123456789" required="required">
             <input type="hidden" class="accountId" value="${sessionScope.account.id }" name ="accountId"> 
          </div>
          <div class="mb-2">
            <label for="cccd" class="col-form-label">CCCD/CMND:</label>
             <input type="number" id="cccd" name="cccd" class="form-control" placeholder="" required="required">
          </div>
          <div class="mb-5">
            <label for="date" class="col-form-label">Ngày Đến Xem:</label>
             <input type="date" id="date" name="date" class="form-control" placeholder="date" required="required">
          </div>
          <div class="mb-5">
            <label for="date" class="col-form-label">Ghi Chú</label>
             <input type="text" id="content" name="content" class="form-control" placeholder="Gửi lời nhắn tới chúng tôi" required="required">
          </div>
           		<div class="showlist">
            	<div class="row rent-item ">
	                <div class="col-lg-4">
	                    <a href="${pageContext.request.contextPath}/details?id=${item.productcolor.id}">
	                        <img class="img-fluid w-50" id="img_open"  src="${pageContext.request.contextPath}/assets/user/Image/Honda/tayga/AB_125_den.png" alt="">
	                       	
	                        <h4 class="text-uppercase nameProduct"> Ab2020</h4>
	                    </a>
	                </div>
<div class="col-lg-5 d-flex justify-content-left align-items-center">
	                    <div>
	                        <p class="m-0">Số Lượng</p>
	                        <span class="quantity">1</span> 
	                    </div>
	                    <div>
	                        <p class="m-0">Đơn Giá</p>
	                         
	                        <span class="price" style="color: black;"> 111111vvb</span>
	                    </div>
	                </div>
	                <div class="col-lg-3 d-flex justify-content-end align-items-center">
	                    <div class="mr-1">
	                        <p class="m-0" >Tổng Cộng</p>
	                      
	                        <span style="color: black;" class="totalPrice"> 
	                        1234vnđ
          					 </span>	
	            	<input type="hidden" class="id_color" name="id_color[]" >
	            	<input type="hidden" class="quantity_color" name="quantity_color[]">
	            	<input  type="hidden" class="total_color" name="total_color[]">
	            	<input type="hidden" class="deposit_amount" name="deposit_amount">
	            	
	            </div>
	          </div>
          </div>
            	
            	</div>
           		
          <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
        <button type="submit" class="btn btn-primary">Gửi Lịch Hẹn</button>
        </c:if>
      </div>
      </c>
        </form>
      </div>
      
    </div>
  </div>
</div>

        
    </div>