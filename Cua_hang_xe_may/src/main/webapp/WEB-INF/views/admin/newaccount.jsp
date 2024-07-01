<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored = "false"%>
    <div class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1 class="m-0">Thêm Tài Khoản</h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/admin/home">Trang Chủ</a></li>
                <li class="breadcrumb-item active">Thêm Tài Khoản</li>
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
                    <!-- /.card-header -->
                    <!-- form start -->
                    <form id="quickForm" novalidate="novalidate">
                        <div class="card-body">
                        <div class="form-group">
                        <label for="inputUserName">Tên Người Dùng</label>
                        <input type="text" name="username" class="form-control" id="inputUserName" placeholder="Nhập tên tài khoản">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Email</label>
                            <input type="email" name="email" class="form-control" id="exampleInputEmail1" placeholder="Nhập email">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPhone1">Số Điện Thoại</label>
                            <input type="number" name="phoneNumber" class="form-control" id="exampleInputPhone1" placeholder="Nhập email">
                        </div>
                        <div class="form-group">
                        <label for="exampleInputPassword1">Mật Khẩu</label>
                        <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Nhập mật khẩu">
                        </div>
                        <div class="form-group">
                              <label for="exampleInputType">Loại Tài Khoản</label>
                              <select class="form-control">
                                <option value="0" >Admin</option>
                                <option value="1" selected>Nhân Viên</option>
                                <option value="2" >Người Dùng Thường</option>
                            </select>
                        </div>
                        <div class="form-group mb-0">
                        <div class="custom-control custom-checkbox">
                        <input type="checkbox" name="terms" class="custom-control-input" id="exampleCheck1">
                        <label class="custom-control-label" for="exampleCheck1">Bạn đang tạo với quyền Admin <a href="#"></a>.</label>
                        </div>
                        </div>
                        </div>
                        <div class="card-footer">
                        <button type="submit" class="btn btn-primary">Tạo</button>
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