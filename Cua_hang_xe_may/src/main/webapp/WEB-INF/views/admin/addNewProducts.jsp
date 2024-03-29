<%@page import="com.demo.entities.Motoline"%>
<%@page import="com.demo.models.MotolineModel"%>
<%@page import="com.demo.entities.Brand"%>
<%@page import="java.util.List"%>
<%@page import="com.demo.models.BrandModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored = "false" %>

        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="ml-2">Thêm Sản Phẩm</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/admin/home">Trang Chủ</a></li>
                            <li class="breadcrumb-item active">Thêm Sản Phẩm</li>
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
                            <form action="${pageContext.request.contextPath}/admin/addnewproduct?action=addnew" method="post" enctype="multipart/form-data">
                            
                                <div class="card-body p-4">
                                    <div class="row">
                                        <div class="col-md-4 ml-5">
                                            <div class="form-group">
                                                <label for="exampleNamePrd">Tên Xe</label>
                                                <input type="text" name="name" class="form-control" id="exampleNamePrd"
                                                       placeholder="vd: Ab2020">
                                            </div>
                                        </div>
                                        <div class="col-md-4 ml-4">
                                            <div class="form-group">
                                                <label for="examplePrice">Giá Tiền(VNĐ)</label>
                                                <input type="text" name="price" class="form-control" id="examplePrice"
                                                       placeholder="50.000.000">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4 ml-5" data-select2-id="129">
                                            <div class="form-group" data-select2-id="128">
                                                <label>Hãng Xe</label>
                                                <select class="form-control select2 select2-danger select2-hidden-accessible"
                                                        data-dropdown-css-class="select2-danger" style="width: 100%;"
                                                        data-select2-id="12" tabindex="-1" aria-hidden="true" name="brandId">
                                                    <option selected="selected" data-select2-id="14">Chọn Hãng Xe
                                                    </option>
                                                    <%BrandModel brandModel = new BrandModel();
													List<Brand> brands = brandModel.findAll();
                                                    %>
                                                    <% for(Brand b: brands) { %>
                                                    <option data-select2-id="<%=130 + b.getId() %>" value="<%=b.getId() %>"><%=b.getName() %></option>
                                              		 <% } %>
                                                    
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-5 ml-5 ">
                                            <label>Dòng Xe</label>
                                            <%MotolineModel motolineModel = new MotolineModel();
                                            List<Motoline> motolines = motolineModel.findAll();
                                            %>
                                            <div class="form-group d-flex ">
                                            <%for(int i=0 ; i < motolines.size() ; i++  ) { %>
                                           	<% Motoline m = motolines.get(i); %>
                                                <div class="custom-control custom-radio mr-1">
                                                    <input class="custom-control-input custom-control-input-danger custom-control-input-outline"
                                                           type="radio" id="customRadio4" value="<%=m.getId() %>" name="motolineId"
                                                         <%if(i==0) { %> checked <% } %>  >
                                                    <label for="customRadio4" class="custom-control-label"><%=m.getName() %></label>
                                                </div>
                                                <% } %>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4 ml-5">
                                            <div class="form-group">
                                                <label for="exampledescription">Thông Số Cơ Bản Xe</label>
                                                <input type="text" class="form-control" name="description" id="exampledescription"
                                                placeholder="Mới(0km)">
                                            </div>
                                        </div>
                                        <div class="col-md-4 ml-5">
                                          <div class="form-group">
                                            <label for="exampleInputFile">Thêm Ảnh Đại Diện Của Sản Phẩm</label>
                                            <div class="input-group">
                                              <div class="custom-file">
                                                <input type="file" name="avatar" class="custom-file-input" id="exampleInputFile" onchange="document.getElementById('blah').src = window.URL.createObjectURL(this.files[0])">
                                                <label class="custom-file-label" for="exampleInputFile">Chọn Ảnh</label>
                                              </div>
                                              <div class="input-group-append">
                                                <span class="input-group-text">Tải Lên</span>
                                              </div>
                                            </div>
                                            <div class="upload__img-wrap">
                                              <img id="blah" src="${pageContext.request.contextPath}/assets/admin/dist/img/photo1.png" alt="" width="100" height="100" />
                                          </div>
                                          </div>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-md-4 ml-5">
                                            <div class="form-group">
                                                <label for="khoiluongbanthan">Khối lượng bản thân</label>
                                                <input type="text" class="form-control" name="weight" id="khoiluongbanthan"
                                                       placeholder="vd: 113 kg">
                                            </div>
                                        </div>
                                        <div class="col-md-4 ml-4">
                                            <div class="form-group">
                                                <label for="dodai">Dài x Rộng x Cao</label>
                                                <input type="text" name="size" class="form-control" id="dodai"
                                                       placeholder="1.887 x 687 x 1.092 mm">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4 ml-5">
                                            <div class="form-group">
                                                <label for="saddleHeight">Độ cao yên</label>
                                                <input type="text" class="form-control" name="saddleHeight" id="saddleHeight"
                                                       placeholder="775 mm">
                                            </div>
                                        </div>
                                        <div class="col-md-4 ml-4">
                                            <div class="form-group">
                                                <label for="petrolCapacity">Dung tích bình xăng</label>
                                                <input type="text" class="form-control" name="petrolCapacity" id="petrolCapacity"
                                                       placeholder="4,4 lít">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4 ml-5">
                                            <div class="form-group">
                                                <label for="wheelSize">Kích cỡ lốp trước/sau</label>
                                                <input type="text" name="wheelSize" class="form-control" id="wheelSize"
                                                       placeholder="Trước:90/90/17 Sau:120/90/17">
                                            </div>
                                        </div>
                                        <div class="col-md-4 ml-4">
                                            <div class="form-group">
                                                <label for="beforeFork">Phuộc trước</label>
                                                <input type="text" name="beforeFork" class="form-control" id="beforeFork"
                                                       placeholder="Ống lồng, giảm chấn thủy lực">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4 ml-5">
                                            <div class="form-group">
                                                <label for="afterFork">Phuộc sau</label>
                                                <input type="text" name="afterFork" class="form-control" id="afterFork"
                                                       placeholder="Lò xo trụ, giảm chấn thủy lực">
                                            </div>
                                        </div>
                                        <div class="col-md-4 ml-4">
                                            <div class="form-group">
                                                <label for="maxiumCapacity">Công suất tối đa</label>
                                                <input type="text" name="maxiumCapacity" class="form-control" id="maxiumCapacity"
                                                       placeholder=" 8,75kW/8.500 vòng/phút">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4 ml-5">
                                            <div class="form-group">
                                                <label for="oilCapacity">Dung tích nhớt máy</label>
                                                <input type="text" name="oilCapacity" class="form-control" id="oilCapacity"
                                                       placeholder="0,8 lít">
                                            </div>
                                        </div>
                                        <div class="col-md-4 ml-4">
                                            <div class="form-group">
                                                <label for="fuelConsumption">Mức thụ nhiên liệu</label>
                                                <input type="text" name="fuelConsumption" class="form-control" id="fuelConsumption"
                                                       placeholder="2,26l/100km">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4 ml-5">
                                            <div class="form-group">
                                                <label for="cylinderCapacity">Dung tích xi lanh</label>
                                                <input type="text" name="cylinderCapacity" class="form-control" id="cylinderCapacity"
                                                       placeholder="124,8 cc">
                                            </div>
                                        </div>
                                        <div class="col-md-4 ml-4">
                                            <div class="form-group">
                                                <label for="maxiumMoment">Moment cực đại</label>
                                                <input type="text" name="maxiumMoment" class="form-control" id="maxiumMoment"
                                                       placeholder="11,3Nm/6.500 vòng/phút">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4 ml-5">
                                            <div class="form-group">
                                                <label for="compressionRatio">Tỷ số nén</label>
                                                <input type="text" name="compressionRatio" class="form-control" id="compressionRatio"
                                                       placeholder="11,5:1">
                                            </div>
                                        </div>
                                        <div class="col-md-4 ml-4">
                                            <div class="form-group">
                                                <label for="engieType">Loại động cơ</label>
                                                <input type="text" name="engieType" class="form-control" id="engieType"
                                                       placeholder="Xăng, 4 kỳ, 1 xy-lanh, làm mát bằng dung dịch">
                                            </div>
                                        </div>
                                    </div>
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