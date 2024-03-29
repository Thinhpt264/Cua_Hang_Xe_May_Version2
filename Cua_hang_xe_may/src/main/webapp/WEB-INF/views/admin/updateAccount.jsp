<%@page import="com.demo.entities.Account"%>
<%@page import="com.demo.entities.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored = "false"%>
    <% Account account = (Account) request.getAttribute("account");%>
    
    <style>
    input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
    /* display: none; <- Crashes Chrome on hover */
    -webkit-appearance: none;
    margin: 0; /* <-- Apparently some margin are still there even though it's hidden */
}

input[type=number] {
    -moz-appearance:textfield; /* Firefox */
}
  </style>
<!-- Content Header (Page header) -->
      <div class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1 class="ml-2">Sửa Thông Tin Người Dùng</h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="admin3.html">Trang Chủ</a></li>
                <li class="breadcrumb-item"><a href="customerbuyproducts.html">Danh Sách Khách Hàng Mua Xe</a></li>
                <li class="breadcrumb-item active">Sửa Thông Tin Người Dùng</li>
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
                        <h2 class="m-3 pl-lg-3 w-0">Nhập Thông Tin Khách Hàng</h2>
                    </div>
                    <!-- /.card-header -->
                    <!-- form start -->
                    <form action="${pageContext.request.contextPath }/admin/accountList?action=processupdateUser&id=<%=account.getId() %>" method="post">
                      <div class="card-body p-4" >
                        <div class="row">
                          <div class="col-md-4 ml-5">
                            <div class="form-group">
                                <label for="exampleNamePrd1">Tên Khách Hàng</label>
                                <input type="text" name="name" class="form-control" value="<%=account.getName() %>" id="exampleNamePrd1" placeholder="vd: Nguyễn Văn A">
                            </div>
                          </div>
                          <div class="col-md-4 ml-5">
                            <div class="form-group">
                                <label for="examplePrice100">Số Điện Thoại</label>
                                <input type="number" name="phone" value="<%=account.getPhone() %>" class="form-control" id="examplePrice100" placeholder="0123456789">
                            </div>
                          </div>
                        </div>
                        <div class="row">
                           <div class="col-sm-4 ml-5 ">
                            <div class="form-group">
                                <label for="exampleAdress">Địa Chỉ</label>
                                <input type="text" name="address" value="<%=account.getAddress() %>" class="form-control" id="exampleAdress" placeholder="Địa chỉ người dùng">
                            </div>
                        </div>
                        <div class="col-sm-4 ml-5 ">
                          <div class="form-group">
                              <label for="exampleAdress1">Email</label>
                              <input type="text" name="email" class="form-control" value="<%= account.getEmail()%>" id="exampleAddress1" placeholder="Email">

                              
                          </div>
                      </div>
                        </div>
                      <!-- /.card-body -->
                      <div class="card-footer  ml-5">
                        <button type="submit" class="btn btn-primary">Sửa </button>
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
      <!-- /.content -->