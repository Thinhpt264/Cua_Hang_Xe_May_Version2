<%@page import="java.text.DecimalFormat"%>
<%@page import="com.demo.models.AppointmentDetailModel"%>
<%@page import="com.demo.models.AppointmentModel"%>
<%@page import="com.demo.entities.AppointmentDetail"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.demo.entities.Appointment"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored = "false"%>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <%
    AppointmentModel appointmentModel = new AppointmentModel();
    AppointmentDetailModel appointmentDetailModel = new AppointmentDetailModel();
    List<Appointment> appointments = (List<Appointment> ) request.getAttribute("appointments"); 
    	if(appointments == null) appointments = new ArrayList<>();
    	 DecimalFormat df = new DecimalFormat("#,###.##");
    	
    %>
   <div class="container-fluid py-3">
   	
        <div class="container pb-3">
            <div class="row">
                <div class="col-12 d-flex justify-content-center">
                    <div class="py-1">
                        <h2> <i class="fa-solid fa-cart-shopping mr-3" style="font-size: 50px;"></i>Phiếu Hẹn</h2>
                        <p>Vui Lòng Lưu giữ lại thông tin chuyển khoản để được hỗ trợ tốt hơn</p>
                        
                    </div>
                </div>
            </div>
            <%for(Appointment a: appointments) { %>
            
            <div class="row rent-item m-2">
                <div class="col-lg-3">
                    <div>
                        <img class="img-fluid w-50" src="${pageContext.request.contextPath}/assets/user/Image/Honda/tayga/AB_125_xanhden.png" alt="">
                        <h4 class="text-uppercase">Honda AirBlade 125 </h4>
                     </div>
                </div>
                <div class="col-lg-4 text-left">
                	<p>Mã Đơn Hàng:  APM<%=a.getId() %> </p>
                    <p>Tên Khách Hàng: <%=a.getName() %></p>
                    <p>Email:  <%=a.getEmail() %></p>
                    <p>CCCD: <%= a.getCccd() %></p>
                </div>
                <div class="col-lg-3">
                    <p>Ngày Hẹn: <%= a.getAppointmentDate() %></p>
                </div>
                <div class="col-lg-2">
                	<button data-id="<%=a.getId()%>" class="btn btn-info d-flex justify-content-end align-items-center openAppentTotal" data-bs-toggle="modal" data-bs-target="#exampleModal"> Chi Tiết</button>
                	
                	<a  href="<%= a.getStatus() == 1 ? "http://localhost:8080/Cua_hang_xe_may/payment?deposit_amount=" + a.getDeposit_amount()+"&id=" + a.getId() :  " "%>" class="btn  <%= a.getStatus() == 1 ? "btn-danger" :  "btn-info"%>  d-flex justify-content-end align-items-center openAppentTotal" > <%= a.getStatus() == 0  ? "Đã Thanh Toán Cọc" :  "Bạn Chưa Thanh Toán Cọc"%> </a>
                	
                	
                 </div>
                <div class="col-lg-12 d-flex justify-content-end align-items-end">
                	
                    <p>Tiền Cọc : <%= df.format(a.getDeposit_amount()) %> VNĐ</p>
                </div>
                
            </div>
             <% } %>
        </div>
           <div class="modal fade" id="exampleModal"tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content"  style="width: 800px">
    
        	
      <div class="modal-header">
        <h1 class="modal-title fs-6" id="exampleModalLabel">Hẹn Đến Xem Sản Phẩm</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       
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
	            	
	            	
	            </div>
	          </div>
          </div>
            	
            	</div>
           		
          <div class="modal-footer">
        	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
    	  </div>
    
	       
	      </div>
	      
      </div>
      <script>
  	$(document).ready(function() {
  	  console.log("aaaa");
      $('.openAppentTotal').click(function() {
    	  console.log("aaaa");
			var s = '';
			var itemId = this.getAttribute('data-id');
			
			$.ajax({
				type : 'GET' ,
				url: '${pageContext.request.contextPath}/appointcard',
				data : {
					action : 'showTotal',
					itemId : itemId
				},
				success: function(data) {
					var appointmentDetails = data.appointmentDetails;
					
					var products = data.products;
					var versions = data.versions;
					var colors = data.colors;
					console.log(colors);
					for (var i = 0; i < appointmentDetails.length; i++) {

						
						var total = appointmentDetails[i].total ;
						s+= '<div class="row rent-item ">';
						s+= '<div class="col-lg-4">';
						s+= '<a href="${pageContext.request.contextPath}/details?id=">'
						s+= '<img class="img-fluid w-50" id="img_open"  src="${pageContext.request.contextPath}/assets/user/Image/'+ colors[i].photo + '" >';
						s+= '  <h4 class="text-uppercase nameProduct"> ' + products[i].name + '-' + versions[i].versionName + '-'   +  colors[i].color + ' </h4>' ;
						console.log(colors[i].color);
						s+= '</a>';
						s+= '</div>';
						s+=  '   <div class="col-lg-5 d-flex justify-content-left align-items-center">';
						s+= '  <div>';
						s+=  '<p class="m-0">Số Lượng</p>'
						s+= '  <span class="quantity">' +appointmentDetails[i].quantity  +'</span> ';
						s+=  ' </div> <div> <p class="m-0">Đơn Giá</p> ';
						s+= ' <span class="price" style="color: black;">' + colors[i].price + '</span>'
						s+= '  </div>   </div> <div class="col-lg-3 d-flex justify-content-end align-items-center"> <div class="mr-1">  <p class="m-0" >Tổng Cộng</p>';
						s+= '<span style="color: black;" class="totalPrice">'+ appointmentDetails[i].total  +  ' </span>';
						
						s+= '  </div> </div>   </div>'
						$('.showlist').html(s);
					}
				}
			})
		});
  	});
      </script>
    </div>