<%@page import="java.text.DecimalFormat"%>
<%@page import="com.demo.models.VersionModel"%>
<%@page import="com.demo.models.ProductModel"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.demo.entities.ProductVersion"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored = "false"%>
<% List<ProductVersion> productVersions  =( List<ProductVersion>) request.getAttribute("productVersions");
if (productVersions == null) productVersions = new ArrayList<>();
DecimalFormat df = new DecimalFormat("#,###.##");
%>
<div class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1 class="m-0">Danh Sách Phiên Bản</h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="#">Trang Chủ</a></li>
                <li class="breadcrumb-item active">Danh Sách Phiên Bản</li>
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
                          <a class="btn btn-block bg-gradient-success" href="${pageContext.request.contextPath }/admin/addNewVersion"> <i class="fa-solid fa-plus"></i> Thêm Phiên Bản</a>
                        </div>
                        <table id="example2" class="table table-bordered table-hover dataTable dtr-inline"
                          aria-describedby="example2_info">
                          <thead>
                            <tr>
                              <th class="sorting sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-sort="ascending" aria-label="Id: activate to sort column descending">#</th>
                              <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="Anh: activate to sort column ascending">Tên Phiên Bản</th>
                              <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="Ten_Nhan_Vien: activate to sort column ascending">Tên Xe</th>
                              <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="Muc_Luong: activate to sort column ascending">Giá Tiền</th>
                              <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="Sua grade: activate to sort column ascending">Sửa</th>
                              <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="Xoa grade: activate to sort column ascending">Xóa</th>
                            </tr>
                          </thead>
                        <tbody>
                        <% for(ProductVersion prV : productVersions){	
                        			
                        %>
                                    <tr>
                                        <td><%=prV.getId() %>.</td>
                                        <td><%=prV.getVersionName() %></td>
                                        <%ProductModel productModel = new ProductModel();
                                       
                                        %>
                                        <td><%=productModel.findProductById(prV.getProductID()).getName() %></td>
                                        <td class="text-center"><%=df.format(prV.getPrice()) %></td>
                                        <td class="text-center"><a href="${pageContext.request.contextPath }/admin/productversion?action=update&id=<%=prV.getId() %>" class="btn btn-info"><i class="fa-solid fa-pen-to-square" style="color: #00040a;"></i></a>
                                        </td>
                                        <td class="text-center"><a onclick="return handleLinkClick(event , <%= prV.getId() %>)" href="${pageContext.request.contextPath }/admin/productversion?action=delete&id=<%=prV.getId()%>" class="btn btn-danger"><i class="fas fa-trash" style="color: #000000;"></i></a></td>
                                    	
                                    </tr>
                                    <%} %>
                    				<script type="text/javascript">
				                            function handleLinkClick(event, id) {
				                                var confirmation = confirm("Bạn có chắc chắn muốn xóa thương hiệu này?");
				                                if (confirmation) {
				                                  var linkHref = "${pageContext.request.contextPath }/admin/productversion?action=delete&id=" + id;
				                                  
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