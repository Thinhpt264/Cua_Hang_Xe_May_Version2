<%@page import="java.util.ArrayList"%>
<%@page import="com.demo.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.demo.models.ProductModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored = "false" %>

        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="ml-2">Thêm Phiên Bản </h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/admin/home">Trang Chủ</a></li>
                            <li class="breadcrumb-item active">Thêm Phiên Bản</li>
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
                            <form action="${pageContext.request.contextPath}/admin/addNewVersion?action=addnewVersion" method="post">
                            
                                <div class="card-body p-4">
                                    <div class="row">
                                        <div class="col-sm-4 ml-5">
                                            <div class="form-group">
                                                <label for="exampleNameVer">Tên Phiên Bản </label>
                                                <input type="text" name="name" class="form-control" id="exampleNameVer"
                                                       placeholder="vd:Phiên Bản Đặc Biệt ">
                                            </div>
                                        </div>
                                        <div class="col-sm-4 ml-5" data-select2-id="129">
                                            <div class="form-group" data-select2-id="128">
                                                <label>Tên Xe</label>
                                                <select class="form-control select2 select2-danger select2-hidden-accessible"
                                                        data-dropdown-css-class="select2-danger" style="width: 100%;"
                                                        data-select2-id="999" tabindex="-1" aria-hidden="true" name="proID">
                                                    <option selected="selected" data-select2-id="14">Chọn Tên Xe
                                                    </option>
                                                    <%
                                                    ProductModel productModel = new ProductModel();
                                                    List<Product> products = productModel.findAll();
                                                    if(products == null) products = new ArrayList<>();
                                                    %>
                                                    <% for(Product p : products)  {%>
                                                    <option data-select2-id="<%=198+ p.getId() %>" value="<%=p.getId()%>"><%=p.getName() %></option>
                                                    <% } %>
                                                           
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-4 ml-5">
                                            <div class="form-group">
                                                <label for="examplePrice1">Giá Tiền(VNĐ)</label>
                                                <input type="text" name="price" class="form-control" id="examplePrice1"
                                                       placeholder="50.000.000">
                                            </div>
                                        </div>
                                        
                                    </div>
                                      </div>
                                        <!-- /.card-body -->

                                        <div class="ml-5">
                                            <button type="submit" class="btn btn-primary">Thêm</button>
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