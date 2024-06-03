<%@page import="com.demo.entities.Product"%>
<%@page import="com.demo.entities.ProductColor"%>
<%@page import="com.demo.models.ColorModel"%>
<%@page import="com.demo.entities.Employee"%>
<%@page import="com.demo.models.EmployeeModel"%>
<%@page import="com.demo.entities.Account"%>
<%@page import="com.demo.models.AccountModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.demo.models.VersionModel"%>
<%@page import="java.util.List"%>
<%@page import="com.demo.models.ProductModel"%>
<%@page import="com.demo.entities.ProductVersion"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored = "false" %>
<%	
	VersionModel versionModel = new VersionModel();
	
	
%>
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="ml-2">Dữ Liệu Nhập Hàng</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/admin/home">Trang Chủ</a></li>
                            <li class="breadcrumb-item active">Dữ Liệu Nhập Hàng</li>
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
                    <div class="col-md-12">
                        <div class="card card-primary">
                            <div class="col-md-8 d-flex justify-content-center">
                                <h2 class="m-3 pl-lg-3 w-0">Nhập Hàng </h2>
                            </div>
                            <!-- /.card-header -->
                            <!-- form start -->
                            <form action="${pageContext.request.contextPath}/admin/addNewImport?action=import" method="post">
                            
                                <div class="card-body p-4">
                       
                                    <div class="row">
                                       <div class="col-sm-4 ml-5" data-select2-id="129">
                                            <div class="form-group" data-select2-id="128">
                                                <label>Tên Xe</label>
                                                <select class="form-control select2 select2-danger select2-hidden-accessible"
                                                        data-dropdown-css-class="select2-danger" style="width: 100%;"
                                                        data-select2-id="999" tabindex="-1" aria-hidden="true" name="idColorss">
                                                    <option selected="selected" data-select2-id="14">Chọn Xe
                                                    </option>
                                                    <%   
                                                    ColorModel colorModel = new ColorModel();
                                                    List<ProductColor> colors =  colorModel.findAll();
                                                    if(colors == null) colors = new ArrayList<>();
                                                    %>
                                                      <%  ProductModel productModel = new ProductModel(); %>
                                                    <% for(ProductColor c : colors)  {%>
                                                    <option data-select2-id="<%=1900+ c.getId() %>" value="<%=c.getId()%>">
                                                    <%= productModel.findProductById(productModel.findProductVersionById(c.getVersionID()).getProductID()).getName() %> -                                                  
                                                     <%=productModel.findProductVersionById(c.getVersionID()).getVersionName() %> - 
                                                  	<%=c.getColor()%> 
                                                    </option>
                                                    <% } %>
                                                           
                                                </select>
                                            </div>
                                        </div>
                                    	    
                            <div class="col-md-4 ml-3" data-select2-id="129">
                              <div class="form-group" data-select2-id="128">
                              <label>Nhân Viên Phụ Trách</label>
                              <select class="form-control select2 select2-danger select2-hidden-accessible" name="idEmployee" data-dropdown-css-class="select2-danger" style="width: 100%;" data-select2-id="12" tabindex="-1" aria-hidden="true">
                                <option selected="selected" data-select2-id="19">Nhân Viên Nhập Kho</option>
                                <% 
                                EmployeeModel employeeModel = new EmployeeModel();
                               	AccountModel accountModel = new AccountModel();
                       			List<Account> accounts = accountModel.findAll();
                       			List<Employee> employees  = employeeModel.findAll();
                       			if(employees == null) employees = new ArrayList<>();
                       		 %>
                                    <%for(Employee e: employees) { %>
                                    <option data-select2-id="<%= 130 + e.getId() %>" value="<%=e.getId() %>"><%=accountModel.findAccountById(e.getAccountID()).getName() %></option>
                                  	<% }
                                    %>
                                
                                
                              </select>
                              </div>
                    		  </div>    
                              </div>
                                     <div class="row">
                                      <div class="col-md-4 ml-5">
                                            <div class="form-group">
                                                <label for="valueColor">Số Lượng</label>
                                                <input type="text" style="position: relative; z-index: 999" name="quantity" class="form-control" id="quantity" 
                                                       placeholder="vd: 10">
                                            </div>
                                         
                                        </div>
                                         <div class="col-md-4 ml-4">
                                            <div class="form-group">
                                                <label for="valueColor">Ngày Nhập</label>
                                                <input type="text" style="position: relative; z-index: 999" name="date" class="form-control" id="date" 
                                                       placeholder="dd/MM/YYYY">
                                            </div>
                                         
                                        </div>
                                        </div>
                                          <div class="col-md-4 ml-5">
                                            <div class="form-group">
                                                <label for="valueColor">Đơn giá(/chiếc)</label>
                                                <input type="text" style="position: relative; z-index: 999" name="price" class="form-control" id="price" 
                                                       placeholder="vd: 50000000">
                                            </div>
                                         
                                        </div>
                             
                                    <div class="row">
                                    	<div class="col-md-4 ml-5">
                                    
                                  <span>  Tông cộng: </span>
                                   		 </div>
                                    </div>

                                        <!-- /.card-body -->

                                        <div class="ml-5">
                                            <button type="submit" class="btn btn-primary">Tiến hành nhập</button>
                                        </div>
                                   
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- /.card-body -->
                <!-- /.row (main row) -->
            </div>
        </section>
    </div>
</div>
    <!-- /.content -->