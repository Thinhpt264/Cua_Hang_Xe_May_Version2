<%@page import="com.demo.entities.Appointment"%>
<%@page import="com.demo.models.AppointmentModel"%>
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
    pageEncoding="UTF-8" isELIgnored = "false"%>
<%	
	AppointmentModel appointmentModel = new AppointmentModel();
	Appointment appointment = (Appointment)request.getAttribute("appointment");
	DecimalFormat df = new DecimalFormat("########");
%>
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="ml-2">Sửa Thông Tin Cuộc Hẹn</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/admin/home">Trang Chủ</a></li>
                            <li class="breadcrumb-item active">Sửa Thông Tin Cuộc Hẹn</li>
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
                                <h2 class="m-3 pl-lg-3 w-0">Nhập Thông tin </h2>
                            </div>
                            <!-- /.card-header -->
                            <!-- form start -->
                            <form action="${pageContext.request.contextPath}/admin/updateAppointment?id=<%= appointment.getId() %>" method="post">
                            
                                <div class="card-body p-4">
                       
                                    <div class="row">
                                       <div class="col-sm-4 ml-5" data-select2-id="129">
                                            <div class="form-group" data-select2-id="128">
                                                <label>Tên Khách Hàng</label>
                                                <input type="text" class="form-control"  name="name" placeholder="" required="required" value="<%= appointment.getName() %>">
                                            </div>
                                        </div>
                                    	    
                            <div class="col-md-4 ml-3" data-select2-id="129">
                              <div class="form-group" data-select2-id="128">
                              <label>Email</label>
                              <input type="text" class="form-control"  name="email" placeholder="" required="required" value="<%= appointment.getEmail() %>">
                              </div>
                    		  </div>    
                              </div>
                                      <div class="row">
                                      <div class="col-md-4 ml-5">
                                            <div class="form-group">
                                                <label>Số điện thoại</label>
                                                <input type="text" style="position: relative; z-index: 999" name="phone" class="form-control"
                                                       placeholder="vd: 10" value = "<%= appointment.getPhone()%>">
                                            </div>
                                         
                                        </div>
                                       
                                         <div class="col-md-4 ml-4">
                                            <div class="form-group">
                                                <label>Ngày Cọc</label>
                                                <input type="text" style="position: relative; z-index: 999" name="date_pay" class="form-control"
                                                       placeholder="dd/MM/YYYY" value = "<%= appointment.getDate_pay()%>">
                                            </div>
                                         
                                        </div>
                                        </div>
                                          <div class="col-md-4 ml-5">
                                            <div class="form-group">
                                                <label>Tiền cọc</label>
                                                <input type="text" style="position: relative; z-index: 999" name="deposit_amount" class="form-control" 
                                                       placeholder="vd: 50000000" value =  "<%= appointment.getDeposit_amount()%>">
                                            </div>
                                         
                                        </div>
                                        <div class="col-md-4 ml-5">
                                            <div class="form-group">
                                                <label>Nội dung</label>
                                                <textarea name="content"  id="inputDescription" class="form-control" rows="4" style="height: 122px;">
                                                	<%= appointment.getContent() %>
                                                </textarea>
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