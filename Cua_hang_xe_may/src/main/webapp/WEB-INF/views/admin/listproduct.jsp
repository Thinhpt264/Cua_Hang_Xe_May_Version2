<%@page import="java.text.DecimalFormat"%>
<%@page import="com.demo.models.ProductModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.demo.entities.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored ="false"%>
   		<%
   		List<Product> products = (List<Product>) request.getAttribute("products");
   		if(products == null) {
   			products = new ArrayList<>();
   		}
   	 DecimalFormat df = new DecimalFormat("#,###.##");
   		%>
      <!-- Content Header (Page header) -->
      <div class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1 class="m-0">Danh Sách Xe</h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="#">Trang Chủ</a></li>
                <li class="breadcrumb-item active">Danh Sách Xe</li>
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
                          <a class="btn btn-block bg-gradient-success" href="${pageContext.request.contextPath }/admin/addnewproduct"> <i class="fa-solid fa-plus"></i> Thêm Sản Phẩm</a>
                        </div>
                        <table id="example2" class="table table-bordered table-hover dataTable dtr-inline"
                          aria-describedby="example2_info">
                          <thead>
                            <tr>
                              <th class="sorting sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-sort="ascending" aria-label="#: activate to sort column descending">#</th>
                              <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="Anh: activate to sort column ascending">Ảnh</th>
                              <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="Ten_Nguoi_Dung: activate to sort column ascending">Tên Xe</th>
                              <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="Chuc_Vu: activate to sort column ascending">Giá Tiền</th>
                              <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="Bat_Dau_lam grade: activate to sort column ascending">Hãng Xe</th>
                              <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="Lam_Viec_Tai grade: activate to sort column ascending">Dòng Xe</th>
                                <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="Lam_Viec_Tai grade: activate to sort column ascending">Chi Tiết</th>
                              <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="Sua grade: activate to sort column ascending">Sửa</th>
                              <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="Xoa grade: activate to sort column ascending">Xóa</th>
                            </tr>
                          </thead>
                          <tbody>
                          <%for(Product p: products)  {%>
                            <tr class="odd">
                                <td class="dtr-control sorting_1" tabindex="0"><%=p.getId() %></td>
                                 <td><img src="${pageContext.request.contextPath}/assets/user/Image/<%=p.getAvatar() %>" style="width: 50px;"></td>
                                  <td><%=p.getName() %></td>
                                  <td><%= df.format(p.getPrice()) %></td>
                                  <%ProductModel productModel = new ProductModel();
                                  	String nameBrand = productModel.viewNameBrand(p.getBrandID());
                                  	String nameMotoline = productModel.viewNameMotoline(p.getMotolineID());
                                  	%>
                                  <td><%=nameBrand%></td>
                                  <td><%=nameMotoline %></td>
                                  <td class="text-center">
                                    <a href="${pageContext.request.contextPath}/details?id=<%=p.getId()%>"><i class="fa-solid fa-plus"></i></a>
                                 </td>
                                 
                                 <td class="text-center"><a href="${pageContext.request.contextPath}/admin/listproduct?action=updateProduct&id=<%=p.getId()%>" class="btn btn-info"><i class="fa-solid fa-pen-to-square" style="color: #00040a;"></i></a>
                                 </td>
                                 <td class="text-center"><a onclick="return handleLinkClick(event , <%= p.getId() %>)" href="${pageContext.request.contextPath }/admin/listproduct?action=delete&id=<%=p.getId()%>" class="btn btn-danger"><i class="fas fa-trash" style="color: #000000;"></i></a></td>
                                    	
                                    </tr>
                                   <% } %>
                    				<script type="text/javascript">
				                            function handleLinkClick(event, id) {
				                                var confirmation = confirm("Bạn có chắc chắn muốn xóa sản phẩm này?");
				                                if (confirmation) {
				                                  var linkHref = "${pageContext.request.contextPath }/admin/listproduct?action=delete&id=" + id;
				                                  
				                                  window.location.href = linkHref;
				                                } else {
				                                  
				                                }
				
				                                return false; // Ngăn chặn hành vi mặc định của thẻ <a>
				                              }
										</script>

                            </tr>
                            
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