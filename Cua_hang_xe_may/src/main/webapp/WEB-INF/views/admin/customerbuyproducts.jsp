<%@page import="java.util.ArrayList"%>
<%@page import="com.demo.entities.Customer"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored = "false"%>
    <%List<Customer> customers = (List<Customer>) request.getAttribute("customers");
		if(customers == null) new ArrayList<>();  
    %>
     <!-- Content Header (Page header) -->
      <div class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1 class="m-0">Danh Sách Khách Hàng Trên Hệ Thống</h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="#">Trang Chủ</a></li>
                <li class="breadcrumb-item active">Danh Sách Khách Hàng</li>
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
                          <a class="btn btn-block bg-gradient-success" href="${pageContext.request.contextPath}/admin/addNewCustomer"> <i class="fa-solid fa-plus"></i> Thêm Tài Khoản</a>
                        </div>
                        <table id="example2" class="table table-bordered table-hover dataTable dtr-inline"
                          aria-describedby="example2_info">
                          <thead>
                            <tr>
                              <th class="sorting sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-sort="ascending" aria-label="#: activate to sort column descending">#</th>
                              <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="Ten_Nguoi_Dung: activate to sort column ascending">Tên Người Dùng</th>
                              
                              <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="phone grade: activate to sort column ascending">Số điện thoại</th>
                                <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="Lam_Viec_Tai grade: activate to sort column ascending">Địa Chỉ</th>
                                 <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="Cccd grade: activate to sort column ascending">Mã Số CCCD</th>
                              <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="Sua grade: activate to sort column ascending">Sửa</th>
                              <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="Xoa grade: activate to sort column ascending">Xóa</th>
                            </tr>
                          </thead>
                          <tbody>
                          <% for(Customer c: customers) { %>
                            <tr id="test" class="odd">
                                <td class="dtr-control sorting_1" tabindex="0"><%=c.getId() %></td>
                                  <td><%=c.getName() %></td>
                                  <td><%=c.getPhone() %></td>
                                  <td><%=c.getAddress() %></td>
                                  <td><%=c.getCard() %></td>
                                  
                                 <td class="text-center"><a href="${pageContext.request.contextPath }/admin/customerbuyproducts?action=update&id=<%=c.getId() %>" class="btn btn-info"><i class="fa-solid fa-pen-to-square" style="color: #00040a;"></i></a></td>
                                 <td class="text-center"><a onclick=" return handleLinkClick(event , <%= c.getId() %>)" href="${pageContext.request.contextPath }/admin/customerbuyproducts?action=delete&id=<%=c.getId() %>" class="btn btn-danger"><i class="fas fa-trash" style="color: #000000;"></i></a></td>
                                    	
                                    </tr>
                                    <%} %>
                    				<script type="text/javascript">
				                            function handleLinkClick(event, id) {
				                                var confirmation = confirm("Bạn có chắc chắn muốn xóa người này?");
				                                if (confirmation) {
				                                  var linkHref = "${pageContext.request.contextPath }/admin/customerbuyproducts?action=delete&id=" + id;
				                                  
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