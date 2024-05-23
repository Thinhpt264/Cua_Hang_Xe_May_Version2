<%@page import="com.demo.entities.Log"%>
<%@page import="com.demo.entities.Account"%>
<%@page import="com.demo.models.AccountModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.demo.entities.Employee"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored = "false" %>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <% List<Log> logs = (List<Log>) request.getAttribute("logs"); 
    if(logs == null) logs = new ArrayList<>();
    AccountModel accountModel = new AccountModel();
    %>
    <style> 
    	.info {
    		background-color: #17a2b8
    		
    	}
    	.danger {
    		background-color: #dc3545
    		
    	}
    	.warning {
    		background-color: #ffc107
    		
    	}
    </style>
<div class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1 class="m-0"></h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="#">Trang Chủ</a></li>
                <li class="breadcrumb-item active">Bản ghi chép sử dụng</li>
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
                              <th   tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                              aria-label="Id: activate to  column descending">Id</th>
                              <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="time: activate to sort column descending">Thời Gian</th>
                              <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="Level: activate to sort column descending">Level</th>
                              <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="Ip activate to sort column descending">Ip</th>
                              <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="Quoc_Gia grade: activate to sort column descending">Quốc Gia</th>
                               <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="Before_Value grade: activate to sort column descending">Before Value</th>
                              <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="After_Value grade: activate to sort column descending">After Value</th>
                              <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
                                aria-label="Account grade: activate to sort column descending">Account</th>
                            </tr>
                          </thead>
                          <tbody>
                         
                        	<% for(Log l: logs) { %>
                            <tr class="" >
                            	<td> <%= l.getId() %></td>		
                            	<td> <%= l.getTime() %></td>		
                            	<td class="<%= l.getLevel() %>"> <%= l.getLevel() %></td>		
                            	<td> <%= l.getIp() %></td>		
                            	<td > <%= l.getNational() %></td>		
                            	<td> <textarea class="form-control" rows="3" cols="1" disabled placeholder="Enter ..."> <%= l.getBeforeValue() %></textarea>  </td>		
                            	<td><textarea class="form-control" rows="3"  cols="1" disabled placeholder="Enter ..."> <%= l.getAfterValue() %></textarea>   </td>		
                            	<td>  <% if(accountModel.findAccountById(l.getAccountId()) == null) { %>
                            			Người Dùng Ẩn Danh
                            			<% } else { %>
                            	<%= accountModel.findAccountById(l.getAccountId()).getUsername() %>
                            		<% } %>
                            	</td>		
                            </tr>
                    		<% } %>	
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
            	<script>
            	$.noConflict();
            	$(document).ready(function() {
            		$('#myTable').DataTable({
            			paging: true, // Tắt phân trang
                		  searching: true, // Tắt tìm kiếm
                		  ordering: true, // Bật sắp xếp
                		  info: true, // Bật thông tin về bảng
                		  lengthMenu: [[10, 25, 50, -1], [10, 25, 50, "All"]], // Thay đổi các tùy chọn số lượng bản ghi trên mỗi trang
                		  columnDefs: [
                		    { targets: 0, visible: true}, // Ẩn cột đầu tiên
                		    { targets: 1, searchable: true } // Tắt tìm kiếm trên cột thứ hai
                		  ]
          			order: [[0, 'desc']] // Sắp xếp cột thứ nhất từ dưới lên
            		});
            		
            	} );
            	
            	
            	</script>
       
          </div>
          </section>
        </div>
      <!-- /.content -->
      