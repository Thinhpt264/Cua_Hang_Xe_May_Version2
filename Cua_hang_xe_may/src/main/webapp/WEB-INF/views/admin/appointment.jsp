<%@page import="com.demo.models.AppointmentModel"%>
<%@page import="com.demo.entities.Appointment"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.demo.models.ProductModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.demo.entities.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored ="false"%>
   		<%
   		AppointmentModel appointmentModel = new AppointmentModel();
   		List<Appointment> appointments = appointmentModel.findAll(); 
   		if(appointments == null) {
   			appointments = new ArrayList<>();
   		}
   	 DecimalFormat df = new DecimalFormat("#,###.##");
   		%>
      <!-- Content Header (Page header) -->
      <div class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1 class="m-0">Danh Sách Cuộc Hẹn</h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="#">Trang Chủ</a></li>
                <li class="breadcrumb-item active">Danh Sách Cuộc Hẹn</li>
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
                          
                        </div>
                        <table id="example2" class="table table-bordered table-hover dataTable dtr-inline"
                          aria-describedby="example2_info">
                          <thead>
                            <tr>
                              <th class="sorting sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-sort="ascending" aria-label="#: activate to sort column descending">#</th>
                              <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="Anh: activate to sort column ascending">Tên Khách Hàng</th>
                              <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="Ten_Nguoi_Dung: activate to sort column ascending">Email</th>
                              <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="Chuc_Vu: activate to sort column ascending">Điện Thoại</th>
                              <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="Bat_Dau_lam grade: activate to sort column ascending">Ngày Hẹn</th>
                              <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="Lam_Viec_Tai grade: activate to sort column ascending">Trạng Thái</th>
                                 <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="Lam_Viec_Tai grade: activate to sort column ascending">Tiền Cọc</th>
                                 <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="Lam_Viec_Tai grade: activate to sort column ascending">Ngày Cọc</th>
                                <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="Lam_Viec_Tai grade: activate to sort column ascending">Chi Tiết</th>
                              <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="Sua grade: activate to sort column ascending">Sửa</th>
                              <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="Xoa grade: activate to sort column ascending">Xóa</th>
                            </tr>
                          </thead>
                          <tbody>
                          <%for(Appointment a: appointments)  {%>
                            <tr class="odd">
                                <td class="dtr-control sorting_1" tabindex="0"><%=a.getId() %></td>
                                 <td><%=a.getName() %>  </td>
                                  <td><%=a.getEmail() %>  </td>
                                   <td><%=a.getPhone() %>  </td>
                                    <td><%=a.getAppointmentDate() %>  </td>
                                     <td><%=a.getStatus() == 1 ? "Đã Xong" : "Chờ" %>  </td>
                                       <td><%= df.format(a.getDeposit_amount()) %>  </td>
                                       	<td><%=a.getDate_pay() %>  </td>
                               			 <td><textarea class="form-control" rows="3" cols="3" disabled placeholder="Ghi chú ..."> <%= a.getContent() %></textarea></td>
                                 
                                 
                                  
                                 
                                 <td class="text-center"><a href="${pageContext.request.contextPath}/admin/appointment?action=updateAppointment&id=<%=a.getId()%>" class="btn btn-info"><i class="fa-solid fa-pen-to-square" style="color: #00040a;"></i></a>
                                 </td>
                                 <td class="text-center"><a onclick="return handleLinkClick(event , <%= a.getId() %>)" href="${pageContext.request.contextPath }/admin/appointment?action=deleteAppointment&id=<%=a.getId()%>" class="btn btn-danger"><i class="fas fa-trash" style="color: #000000;"></i></a></td>
                                    	
                                    </tr>
                                   <% } %>
                    				<script type="text/javascript">
				                            function handleLinkClick(event, id) {
				                                var confirmation = confirm("Bạn có chắc chắn muốn xóa sản phẩm này?");
				                                if (confirmation) {
				                                  var linkHref = "${pageContext.request.contextPath }/admin/appointment?action=deleteAppointment&id=" + id;
				                                  
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