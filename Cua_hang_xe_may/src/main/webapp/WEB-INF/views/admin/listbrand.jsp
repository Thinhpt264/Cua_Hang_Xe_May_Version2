<%@page import="java.util.ArrayList"%>
<%@page import="com.demo.entities.Brand"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored = "false"%>
 <%
 List<Brand> brands = (List<Brand>) request.getAttribute("brands");
	 if(brands == null) brands = new ArrayList<>();
%>
  <!-- Content Header (Page header) -->
      <div class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1 class="m-0">Danh Sách Hãng Xe</h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="#">Trang Chủ</a></li>
                <li class="breadcrumb-item active">Danh Sách Hãng Xe</li>
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
                        <div class="col-3 p-3">
                            <a class="btn btn-block bg-gradient-success" href="${pageContext.request.contextPath }/admin/addNewBrand"> <i class="fa-solid fa-plus"></i> Thêm Hãng Xe Mới</a>
                        </div>
                        <div class="card-header">
                        <h3 class="card-title">Danh sách các hãng xe đã có</h3>
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
                        <div class="card-body">
                        <table class="table table-bordered">
                        <thead>
                        <tr>
                        <th>#</th>
                        <th>Tên Hãng</th>
                        <th class="text-center">Ảnh</th>
                        <th class="text-center">Chi tiết Hãng</th>
                        <th style="justify-content: center;">Sửa</th>
                        <th class="text-center">Xóa</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%for(Brand b: brands ) { %> 
                        <tr>
                        <td><%=b.getId() %>.</td>
                        <td><%=b.getName() %></td>
                        <td class="text-center"><img src="${pageContext.request.contextPath}/assets/user/Image/<%=b.getPhoto() %>" style="width: 50px"></td>
                        <td><%=b.getDescription() %></td>
                        <td class="text-center"><a href="${pageContext.request.contextPath }/admin/listbrand?action=update&id=<%=b.getId()%>" class="btn btn-info"><i class="fa-solid fa-pen-to-square" style="color: #00040a;"></i></a>
                        </td>
                        <td class="text-center"><a onclick="return handleLinkClick(event , <%= b.getId() %>)" href="${pageContext.request.contextPath }/admin/listbrand?action=delete&id=<%=b.getId()%>" class="btn btn-danger"><i class="fas fa-trash" style="color: #000000;"></i></a></td>
                                    	
                                    </tr>
                                    <%} %>
                    				<script type="text/javascript">
				                            function handleLinkClick(event, id) {
				                                var confirmation = confirm("Bạn có chắc chắn muốn xóa thương hiệu này?");
				                                if (confirmation) {
				                                  var linkHref = "${pageContext.request.contextPath }/admin/listbrand?action=delete&id=" + id;
				                                  
				                                  window.location.href = linkHref;
				                                } else {
				                                  
				                                }
				
				                                return false; // Ngăn chặn hành vi mặc định của thẻ <a>
				                              }
										</script>
                       
                        
                        </tbody>
                        </table>
                        </div>

                        <div class="card-footer clearfix">
                        <ul class="pagination pagination-sm m-0 float-right">
                        </ul>
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