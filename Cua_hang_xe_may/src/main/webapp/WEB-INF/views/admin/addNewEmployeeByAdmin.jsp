<%@page import="java.util.ArrayList"%>
<%@page import="com.demo.entities.Account"%>
<%@page import="java.util.List"%>
<%@page import="com.demo.models.AccountModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored = "false"%>
    <!-- Content Header (Page header) -->
      <div class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1 class="ml-2">Thêm Nhân Viên</h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="#">Trang Chủ</a></li>
                <li class="breadcrumb-item active">Thêm Nhân Viên</li>
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
                        <h2 class="m-3 pl-lg-3 w-0">Nhập Thông Tin Nhân Viên</h2>
                    </div>
                    <!-- /.card-header -->
                    <!-- form start -->
                    <form method="post" action="${pageContext.request.contextPath}/admin/addNewEmployeeByAdmin?action=newEmployee">
                      <div class="card-body p-4" >
                        <div class="row m-0">
                          
                          <div class="col-md-5 ml-5">
                            <!-- <div class="form-group">
                              <label for="exampleIdNV">Mã Nhân Viên</label>
                              <input type="text" class="form-control" id="exampleIdNV">
                          </div> -->
                          </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-3 ml-5">
                              <div class="form-group">
                                <label for="exampleInputName1">Số Căn Cước Định Danh</label>
                                <input type="text" name="card" class="form-control" id="exampleInputName1" placeholder="Số Căn Cước Công Dân Nhân Viên">
                            </div>
                            </div>
                           <div class="col-md-3 ml-5">
                            <div class="form-group">
                                <label for="exampleInputPhoneNumber1">Mức Lương</label>
                                <input type="number" name="salary" class="form-control" id="exampleInputPhoneNumber1" placeholder="Mức Lương Nhân Viên">
                              </div>
                           </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 ml-5" data-select2-id="129">
                              <div class="form-group" data-select2-id="128">
                              <label>Chọn Tài Khoản</label>
                              <select class="form-control select2 select2-danger select2-hidden-accessible" name="accountId" data-dropdown-css-class="select2-danger" style="width: 100%;" data-select2-id="12" tabindex="-1" aria-hidden="true">
                                <option selected="selected" data-select2-id="14">Chọn Tài Khoản</option>
                                <% 
                                AccountModel accountModel = new AccountModel();
                                List<Account> accounts = accountModel.findAll();
                                if(accounts == null) accounts = new ArrayList<>();
                                for(Account a: accounts) {
                                %>
                                <option data-select2-id="<%= 130 + a.getId() %>" value="<%=a.getId() %>"><%= a.getUsername() %></option>
                              	<% } %>
                              </select>
                              </div>
                      </div>
                        </div>
                      <!-- /.card-body -->
                      <div class="ml-5">
                        <button type="submit" class="btn btn-primary">Thêm </button>
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