<%@page import="java.text.DecimalFormat"%>
<%@page import="com.demo.entities.ProductVersion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.demo.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.demo.models.ProductModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored = "false" %>
	<%
		ProductVersion version =(ProductVersion) request.getAttribute("version");
		ProductModel productModel = new ProductModel();
		DecimalFormat df = new DecimalFormat("#.##");
	%>
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="ml-2">Sửa Phiên Bản </h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/admin/home">Trang Chủ</a></li>
                            <li class="breadcrumb-item active">Sửa Phiên Bản</li>
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
                                <h2 class="m-3 pl-lg-3 w-0">Nhập Dữ Liệu Của Xe</h2>
                            </div>
                            <!-- /.card-header -->
                            <!-- form start -->
                            <form action="${pageContext.request.contextPath}/admin/productversion?action=updateVersion&id=<%= version.getId() %>" method="post">
                            
                                <div class="card-body p-4">
                                    <div class="row">
                                        <div class="col-md-4 ml-5">
                                            <div class="form-group">
                                                <label for="exampleNameVer">Tên Phiên Bản </label>
                                                <input type="text" name="nameVersion" value = "<%= version.getVersionName() %>" class="form-control" id="exampleNameVer"
                                                       placeholder="vd:Phiên Bản Đặc Biệt ">
                                            </div>
                                        </div>
                                        <div class="col-sm-4 ml-5" data-select2-id="129">
                                            <div class="form-group" data-select2-id="128">
                                                <div class="form-group">
                                                <label for="exampleName">Tên Xe</label>
                                                <input type="hidden" name="productId" value= "<%=version.getProductID() %>">
                                                <input disabled="disabled" type="text" name="productId1" value="<%= productModel.findProductById(version.getProductID()).getName() %>" class="form-control" id="examplePr"
                                                       placeholder="AB125">
                                            </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4 ml-5">
                                            <div class="form-group">
                                                <label for="examplePrice1">Giá Tiền(VNĐ)</label>
                                                <input type="text" name="price" value="<%=df.format(version.getPrice())%>" class="form-control" id="examplePrice1"
                                                       placeholder="50.000.000">
                                            </div>
                                        </div>
                                        
                                    </div>
                                      </div>
                                        <!-- /.card-body -->

                                        <div class="ml-5">
                                            <button type="submit" class="btn btn-primary">Sửa</button>
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