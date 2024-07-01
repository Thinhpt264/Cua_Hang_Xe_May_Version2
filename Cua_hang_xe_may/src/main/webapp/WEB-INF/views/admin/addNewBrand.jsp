<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored = "false"%>
      <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="ml-2">Thương Hiệu Mới</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/admin/home">Trang Chủ</a></li>
                            <li class="breadcrumb-item active">Thêm Thương Hiệu</li>
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
                                <h2 class="m-3 pl-lg-3 w-0">Nhập Thông Tin Hãng Xe</h2>
                            </div>
                            <div class="col-md-8 d-flex justify-content-lg-center">

                            </div>
                            <!-- /.card-header -->
                            <!-- form start -->
                            <form action="${pageContext.request.contextPath}/admin/addNewBrand?action=newBrand" method="post" enctype="multipart/form-data">
                             <div class="card-body p-4" >
                                    <div class="row">
                                        <div class="col-md-6 ml-5">
                                            <div class="form-group">
                                                <label for="exampleNamePrd">Tên Thương Hiệu</label>
                                                <input type="text" class="form-control" id="exampleNamePrd" name="nameBrand" placeholder="" required="required">
                                            </div>
                                        </div>
                                    </div>
                              </div>
                                    <div class="row">
                                        <div class="col-md-6 ml-5">
                                            <div class="form-group">
                                                <label for="inputDescription">Thêm mô tả</label>
                                                <textarea name="description" id="inputDescription" class="form-control" rows="4" style="height: 122px;"></textarea>
                                            </div>
                                        </div>
                                        <div class="col-md-8 ml-5">
                                            <label for="">Nhập ảnh hãng xe</label> <br>
                                            <input type="file" name="photo" id="input">
                                            <div id="div"></div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <!-- /.card-body -->
                                        <div class="card-footer  ml-5">
                                            <button type="submit" class="btn btn-primary">Thêm </button>
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