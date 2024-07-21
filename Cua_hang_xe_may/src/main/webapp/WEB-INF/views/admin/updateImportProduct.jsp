<%@page import="com.demo.entities.WarehouseInvoice"%>
<%@page import="java.text.DecimalFormat"%>
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
	WarehouseInvoice warehouseInvoice = (WarehouseInvoice)request.getAttribute("invoice1");
	DecimalFormat df = new DecimalFormat("#.##");
%>
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="ml-2">Sửa Dữ Liệu Nhập Hàng</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/admin/home">Trang Chủ</a></li>
                            <li class="breadcrumb-item active">Sửa Dữ Liệu Nhập Hàng</li>
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
                            <form action="${pageContext.request.contextPath}/admin/updateImport?id=<%= warehouseInvoice.getId() %>" method="post">
                            
                                <div class="card-body p-4">
                       
                                    <div class="row">
                                       <div class="col-sm-4 ml-5" data-select2-id="129">
                                            <div class="form-group" data-select2-id="128">
                                                <label>Tên Xe</label>
                                                <input type="text" class="form-control"  name="nameproduct" placeholder="" required="required" value="<%=warehouseInvoice.getColorId()%>">
                                            </div>
                                        </div>
                                    	    
                            <div class="col-md-4 ml-3" data-select2-id="129">
                              <div class="form-group" data-select2-id="128">
                              <label>Nhân Viên Phụ Trách</label>
                              <input type="text" class="form-control"  name="nameEmployee" placeholder="" required="required" value="<%=warehouseInvoice.getEmployeeId()%>">
                              </div>
                    		  </div>    
                              </div>
                                     <div class="row">
                                      <div class="col-md-4 ml-5">
                                            <div class="form-group">
                                                <label for="valueColor">Số Lượng</label>
                                                <input type="text" style="position: relative; z-index: 999" name="quantity1" class="form-control" id="quantity" 
                                                       placeholder="vd: 10" value = "<%= warehouseInvoice.getQuantity()%>">
                                            </div>
                                         
                                        </div>
                                         <div class="col-md-4 ml-4">
                                            <div class="form-group">
                                                <label for="valueColor">Ngày Nhập</label>
                                                <input type="text" style="position: relative; z-index: 999" name="date1" class="form-control" id="date" 
                                                       placeholder="dd/MM/YYYY" value = "<%= warehouseInvoice.getTradeDate()%>">
                                            </div>
                                         
                                        </div>
                                        </div>
                                          <div class="col-md-4 ml-5">
                                            <div class="form-group">
                                                <label for="valueColor">Đơn giá(/chiếc)</label>
                                                <input type="text" style="position: relative; z-index: 999" name="price1" class="form-control" id="price" 
                                                       placeholder="vd: 50000000" value = "<%= df.format(warehouseInvoice.getPrice())%> ">
                                            </div>
                                         
                                        </div>
                                        <!-- /.card-body -->

                                        <div class="ml-5">
                                            <button type="submit" class="btn btn-primary">Tiến hành sửa</button>
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