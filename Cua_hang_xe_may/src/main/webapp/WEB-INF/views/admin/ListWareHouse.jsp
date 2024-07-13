<%@page import="com.demo.models.ProductModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.demo.entities.ProductColor"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored = "false"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% List<ProductColor> colors = (List<ProductColor>)request.getAttribute("productColors");
 	if(colors==null){
 		colors = new ArrayList<>();
 	}
%>
<div class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1 class="m-0">Danh Sách Màu Xe</h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="#">Trang Chủ</a></li>
                <li class="breadcrumb-item active">Danh Sách Màu Xe</li>
              </ol>
            </div><!-- /.col -->
          </div><!-- /.row -->
        </div><!-- /.container-fluid -->
      </div>
      <!-- /.content-header -->
      <!-- Main content -->
      <section class="content">
        <div class="container-fluid">
          <!-- Small boxes (Stat box) -->
            <div class="row">
                <div class="col-12">
                  <div class="card">
                    <!-- /.card-header -->

                    <div class="row">
                      <div class="col-sm-12">
                        <div class="col-3 p-3">
                          <a class="btn btn-block bg-gradient-success" href="${pageContext.request.contextPath }/admin/addNewProductColor"> <i class="fa-solid fa-plus"></i> Thêm Mới</a>
                        </div>
                        <%
        									HttpSession session2 = request.getSession();
							        		String msg = (String)session2.getAttribute("message");
							        		String msg1 = msg;
							        		
							        		session2.removeAttribute("message");
							        	%>
							        <%if(msg1 == null) { %>
				        			<span ></span>
				        		<% }else if(msg1.equalsIgnoreCase("Chỉnh Sửa Không Thành Công")) { %>
				        			<span style='color:red;'> <%=msg1 %></span>
				        		
				        		<% }else { %>
									<span style='color:green;'> <%=msg1 %></span>
									
								 <% } %>
                        <table id="example2" class="table table-bordered table-hover dataTable dtr-inline"
                          aria-describedby="example2_info">
                          <thead>
                            <tr>
                              <th class="sorting sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-sort="ascending" aria-label="Id: activate to sort column descending">#</th>
                              <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="Ten_Nhan_Vien: activate to sort column ascending">Tên Xe</th>
                              <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="Anh: activate to sort column ascending">Tên Phiên Bản</th>
                              <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="Ten_Nhan_Vien: activate to sort column ascending">Màu Sắc</th>
                              <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="Ten_Nhan_Vien: activate to sort column ascending">Hình Ảnh</th>
                              <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="Muc_Luong: activate to sort column ascending">Giá Tiền</th>
                              <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="Muc_Luong: activate to sort column ascending">Dữ Liệu Màu Sắc</th>
                              <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="Muc_Luong: activate to sort column ascending">Số Lượng</th>
                              
                            </tr>
                          </thead>
                        <tbody>
                        <%
                        for(ProductColor color : colors){
                        	  %>
                       
                                    <tr>
                                        <td ><%= color.getId() %></td>
                                         <%ProductModel productModel = new ProductModel();
                                        
                                        %>
                                        <td><%= productModel.findProductById(productModel.findProductVersionById(color.getVersionID()).getProductID()).getName() %></td>
                                       
                                        <td><%= productModel.findProductVersionById(color.getVersionID()).getVersionName() %> </td>
                                        <td><%= color.getColor() %></td>
                                        <td class="text-center"><img src="${pageContext.request.contextPath}/assets/user/Image/<%=color.getPhoto() %>" style="width: 50px"></td>
                                        <td class="text-center"><fmt:setLocale value = "vi_Vn"/>
				                         <fmt:formatNumber type="currency" 
				                            value ="<%= color.getPrice() %>" currencySymbol="VNĐ"/> </td>
                                        <td><%= color.getValue() %></td>
                                        <td><%= color.getQuantity() == 0 ? "Hết Hàng" : color.getQuantity() %></td>
                                       	
                                      
                                    	
                                    </tr>
                                    <%} %>
                    				<script type="text/javascript">
				                            function handleLinkClick(event, id) {
				                                var confirmation = confirm("Bạn có chắc chắn muốn xóa thương hiệu này?");
				                                if (confirmation) {
				                                  var linkHref = "${pageContext.request.contextPath }/admin/productcolor?action=delete&id=" + id;
				                                  
				                                  window.location.href = linkHref;
				                                } else {
				                                  
				                                }
				
				                                return false; // Ngăn chặn hành vi mặc định của thẻ <a>
				                              }
										</script>
                           
                                    
                    
                    
                                    </tbody>
                        </table>
                      </div>
                      <!-- /.card-body -->
                    </div>
                  </div>
                </div>
                <!-- /.card-body -->
          <!-- /.row (main row) -->
            </div>
            </div>
          </div>
          </section>
        </div>
      <!-- /.content -->