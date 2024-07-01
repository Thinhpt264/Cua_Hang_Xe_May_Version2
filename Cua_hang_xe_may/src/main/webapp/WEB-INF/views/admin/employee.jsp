<%@page import="com.demo.entities.Account"%>
<%@page import="com.demo.models.AccountModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.demo.entities.Employee"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored = "false" %>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%
    

    AccountModel accountModel = new AccountModel();
    List<Employee> employees = (List<Employee>) request.getAttribute("employees");
    if(employees == null) new ArrayList<>();
   	System.out.print(employees);
    %>
<div class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1 class="m-0">Danh Sách Nhân Viên</h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="#">Trang Chủ</a></li>
                <li class="breadcrumb-item active">Nhân Viên</li>
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
                          <a class="btn btn-block bg-gradient-success" href="${pageContext.request.contextPath }/admin/addNewEmployeeByAdmin"> <i class="fa-solid fa-plus"></i> Thêm Nhân Viên</a>
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
                        </div>
                        
                        <table id="example2" class="table table-bordered table-hover dataTable dtr-inline"
                          aria-describedby="example2_info">
                          <thead>
                            <tr>
                              <th class="sorting sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-sort="ascending" aria-label="Id: activate to sort column descending">Id</th>
                              <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="Anh: activate to sort column ascending">Ảnh</th>
                              <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="Ten_Nhan_Vien: activate to sort column ascending">Tên Nhân Viên</th>
                              <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="Muc_Luong: activate to sort column ascending">Mức Lương(VNĐ)</th>
                              <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="CCCD grade: activate to sort column ascending">Số Căn Cước Công Dân</th>
                               <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="ChucNang grade: activate to sort column ascending">Chức Vụ</th>
                              <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="Sua grade: activate to sort column ascending">Sửa</th>
                              <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="Xoa grade: activate to sort column ascending">Xóa</th>
                            </tr>
                          </thead>
                          <tbody>
                          <% for(Employee e : employees) { %>
                            <tr class="odd" >
                              <td class="dtr-control sorting_1" tabindex="0"><%=e.getId() %>.</td>
                              <% Account account = accountModel.findAccountById(e.getAccountID());
                              %>
                              <td><img src="${pageContext.request.contextPath}/assets/user/Image/<%=account.getAvartar() %>" alt="" style="width: 50px;"></td>
                              <td><%=account.getName() %></td>
                              <td> <fmt:setLocale value = "vi_Vn"/>
                               <fmt:formatNumber type="currency" 
          value ="<%=e.getSalary() %>" currencySymbol="VNĐ"/>  </td>
                              <td><%=e.getCardID() %></td>
                              <td  class="text-center"><%= account.getRole().equals("0") ? "Quản Lí" : "Nhân Viên"  %>  <br>
									<a href="${pageContext.request.contextPath }/admin/updateemployee?action=upRole&id=<%=e.getId()%>" class="btn btn-info"> Thăng Cấp</a>
									                              
                              </td>
                              <td class="text-center"><a href="${pageContext.request.contextPath }/admin/updateemployee?id=<%=e.getId() %>" class="btn btn-info"><i class="fa-solid fa-pen-to-square" style="color: #00040a;"></i></a>
                              </td>
                          		<td class="text-center"><a onclick=" return handleLinkClick(event , <%= e.getId() %>)" href="${pageContext.request.contextPath }/admin/employee?action=delete&id=<%=e.getId()%>" class="btn btn-danger"><i class="fas fa-trash" style="color: #000000;"></i></a></td>
                                    	
                                    </tr>
                                    <%} %>
                    				<script type="text/javascript">
				                            function handleLinkClick(event, id) {
				                                var confirmation = confirm("Bạn có chắc chắn muốn xóa sản phẩm này?");
				                                if (confirmation) {
				                                  var linkHref = "${pageContext.request.contextPath }/admin/employee?action=delete&id=" + id;
				                                  
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
      