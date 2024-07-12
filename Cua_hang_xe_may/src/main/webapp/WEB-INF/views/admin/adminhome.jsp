<%@page import="com.demo.entities.Contact"%>
<%@page import="com.demo.models.CustomerModel"%>
<%@page import="com.demo.models.AccountModel"%>
<%@page import="com.demo.models.EmployeeModel"%>
<%@page import="com.demo.models.ProductModel"%>
<%@page import="com.demo.models.ColorModel"%>
<%@page import="com.demo.entities.ProductColor"%>
<%@page import="com.demo.entities.Product"%>
<%@page import="com.demo.entities.Invoice"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.demo.entities.Account"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
	<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<script src="https://rawgit.com/evidenceprime/html-docx-js/master/dist/html-docx.js"></script>

	<%	
	List<Account> accounts = (List<Account>) request.getAttribute("accounts");
	if (accounts == null)
		accounts = new ArrayList<>();
	List<Invoice> invoices = (List<Invoice>) request.getAttribute("invoices");
	if (invoices == null)
		invoices = new ArrayList<>();
	List<Contact> contacts = (List<Contact>) request.getAttribute("contacts");
	if (contacts == null)
		contacts = new ArrayList<>();
	
	ColorModel colorModel = new ColorModel();
	List<ProductColor> colors = colorModel.findAll();
	
	%>
<div class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h1 class="m-0">Trang Chủ</h1>
			</div>
			<!-- /.col -->
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item"><a href="admin3.html">Trang
							Chủ</a></li>
				</ol>
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container-fluid -->
</div>
<!-- /.content-header -->
<!-- Main content -->
<section class="content">
	<div class="container-fluid">
		<!-- Small boxes (Stat box) -->
		<div class="row">
			<div class="col-lg-3 col-6">
				<!-- small box -->
				<div class="small-box bg-info">
					<div class="inner">
						<h3><%= colors.size() %></h3>
						<p> Sản Phẩm </p>
					</div>
					<div class="icon">
						<i class="ion ion-bag"></i>
					</div>
					<a href="#" class="small-box-footer">Xem Chi Tiết <i
						class="fas fa-arrow-circle-right"></i></a>
				</div>
			</div>
			<!-- ./col -->
			<div class="col-lg-3 col-6">
				<!-- small box -->
				<div class="small-box bg-success">
					<div class="inner">
						<h3>
							13<sup style="font-size: 20px"></sup>
						</h3>
						<p>Đơn Đặt Cọc Mới</p>
					</div>
					<div class="icon">
						<i class="ion ion-stats-bars"></i>
					</div>
					<a href="#" class="small-box-footer">Xem Chi Tiết <i
						class="fas fa-arrow-circle-right"></i></a>
				</div>
			</div>
			<!-- ./col -->
			<div class="col-lg-3 col-6">
				<!-- small box -->
				<div class="small-box bg-warning">
					<div class="inner">
						<h3>8</h3>
						<p>Người Đăng Ký Mới</p>
					</div>
					<div class="icon">
						<i class="ion ion-person-add"></i>
					</div>
					<a href="accountList.html" class="small-box-footer">Xem Chi
						Tiết <i class="fas fa-arrow-circle-right"></i>
					</a>
				</div>
			</div>
			<!-- ./col -->
			<div class="col-lg-3 col-6">
				<!-- small box -->
				<div class="small-box bg-danger">
					<div class="inner">
						<h3>65</h3>
						<p>Ghé Thăm Trang</p>
					</div>
					<div class="icon">
						<i class="ion ion-pie-graph"></i>
					</div>
					<a href="#" class="small-box-footer">Xem Chi Tiết <i
						class="fas fa-arrow-circle-right"></i></a>
				</div>
			</div>
		</div>
		<div class="row">
			<section class="col-md-12 connectedSortable">
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">Người Đăng Kí Mới Nhất</h3>
						<div class="card-tools">
							<span class="badge badge-danger">8 Khách Hàng Mới</span>
							<button type="button" class="btn btn-tool"
								data-card-widget="collapse">
								<i class="fas fa-minus"></i>
							</button>
							<button type="button" class="btn btn-tool"
								data-card-widget="remove">
								<i class="fas fa-times"></i>
							</button>
						</div>
					</div>
					<div class="card-body p-0">
						<ul class="users-list clearfix">
							<%
							int count = 0;
							for (int i = accounts.size() - 1; i >= 0; i--) {
							%>
							<li>
								<%
								Account a = accounts.get(i);
								%> <img
								src="${pageContext.request.contextPath}/assets/user/Image/<%=a.getAvartar() %>"
								style="width: 128px; height: 128px" alt="User Image"> <a
								class="users-list-name" href="#"><%=a.getName()%></a> <span
								class="users-list-date"> <%=a.getCreated()%></span>
							</li>
							<%
							if (++count == 8) {
								break;
							}
							%>
							<%
							}
							%>
						</ul>
					</div>
					<div class="card-footer text-center">
						<a href="${pageContext.request.contextPath}/admin/accountList">Xem
							tất cả thành viên</a>
					</div>
				</div>
			</section>
		</div>
		<div class="row">
			<section class="col-lg-12 connectedSortable ">
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">Danh Sách Mua Hàng</h3>
					</div>
					<!-- /.card-header -->
					<div class="card-body">
						<div id="example1_wrapper"
							class="dataTables_wrapper dt-bootstrap4">
							
							<div class="row">
								<div class="col-sm-12">
									<div class="col-3 p-3">
										<a class="btn btn-block bg-gradient-success"
											href="${pageContext.request.contextPath}/admin/invoiceDetail">
											<i class="fa-solid fa-plus"></i> Thêm Hóa Đơn Mua Hàng
										</a>
										<%
        									HttpSession session2 = request.getSession();
							        		String msg = (String)session2.getAttribute("messageUpdate");
							        		String msg1 = msg;
							        		
							        		session2.removeAttribute("messageUpdate");
							        	%>
							        <%if(msg1 == null) { %>
				        			<span ></span>
				        		<% }else if(msg1.equalsIgnoreCase("Chỉnh Sửa Không Thành Công")) { %>
				        			<span style='color:red;'> <%=msg1 %></span>
				        		
				        		<% }else { %>
									<span style='color:green;'> <%=msg1 %></span>
									
								 <% } %>
									</div>
									<table id="example1"
										class="table table-bordered table-striped dataTable dtr-inline"
										aria-describedby="example1_info">
										<thead>
											<tr>
												<th class="sorting sorting_asc" tabindex="0"
													aria-controls="example1" rowspan="1" colspan="1"
													aria-sort="ascending"
													aria-label="Rendering engine: activate to sort column descending">#</th>
												<th class="sorting" tabindex="0" aria-controls="example1"
													rowspan="1" colspan="1"
													aria-label="Ten_Xe: activate to sort column ascending">Tên
													Sản Phẩm</th>
												<th class="sorting" tabindex="0" aria-controls="example1"
													rowspan="1" colspan="1"
													aria-label="Ten_Nhan_Vien: activate to sort column ascending">Nhân
													Viên Bán</th>
												<th class="sorting" tabindex="0" aria-controls="example1"
													rowspan="1" colspan="1"
													aria-label="Ten_Nguoi_Mua: activate to sort column ascending">Khách
													Hàng Mua</th>
												<th class="sorting" tabindex="0" aria-controls="example1"
													rowspan="1" colspan="1"
													aria-label="Ngay_Ban: activate to sort column ascending">Ngày
													Bán</th>
												<th class="sorting" tabindex="0" aria-controls="example1"
													rowspan="1" colspan="1"
													aria-label="Gia_Tien: activate to sort column ascending">Giá
													Tiền</th>
												<th class="sorting" tabindex="0" aria-controls="example1"
													rowspan="1" colspan="1"
													aria-label="Sua(s): activate to sort column ascending">Hành Động</th>
												<th class="sorting" tabindex="0" aria-controls="example1"
													rowspan="1" colspan="1"
													aria-label="Xoa(s): activate to sort column ascending">Xuất Hóa Đơn</th>
											</tr>
										</thead>

										<tbody>
											<%
											for (Invoice i : invoices) {
											%>
											<tr class="odd">
												<td class="dtr-control sorting_1" tabindex="0"><%=i.getId()%></td>
												<%
											
												ProductModel productModel = new ProductModel();
												%>
												<td><%=productModel.findProductById(productModel
		.findProductVersionById(productModel.findProductColorById(i.getColorId()).getVersionID()).getProductID())
		.getName()%> - <%=productModel.findProductVersionById(productModel.findProductColorById(i.getColorId()).getVersionID())
		.getVersionName()%> - <%=productModel.findProductColorById(i.getColorId()).getColor()%>
												</td>
												<td>
													<%
													EmployeeModel employeeModel = new EmployeeModel();
													AccountModel accountModel = new AccountModel();
													%> <%=accountModel.findAccountById(employeeModel.findEmployeebyId(i.getEmployeeId()).getAccountID()).getName()%>
												</td>
												<td>
													<%
													CustomerModel customerModel = new CustomerModel();
													%> <%=customerModel.findCustomerById(i.getCustomerId()).getName()%>
												</td>
												<td><%=i.getTradeDate()%></td>
												<td><fmt:setLocale value = "vi_Vn"/>
                                <fmt:formatNumber type="currency" 
          value ="<%=i.getPrice() %>" currencySymbol="VNĐ"/></td>
												<td class="text-center d-flex align-items-center">
												<a href="${pageContext.request.contextPath }/admin/home?action=update&id=<%=i.getId() %>" class="btn btn-info"><i class="fa-solid fa-pen-to-square" style="color: #00040a;"></i></a>
												<a onclick="return handleLinkClick(event)" href="${pageContext.request.contextPath }/admin/home?action=deleteInvoice&id=<%=i.getId() %>"
													class="btn btn-danger "><i class="fas fa-trash"
														style="color: #000000;"></i></a>	
												</td>
												<td class="text-center">

													<button data-id="<%=i.getId()%>" class="details btn btn-outline-primary btn-block"><i class="fa-solid fa-print"></i></button></td>
														
											</tr>
											</tr>
											<script type="text/javascript">
												function handleLinkClick(event) {
													var confirmation = confirm("Bạn có chắc chắn muốn xóa sản phẩm này?");
													if (confirmation) {
														var linkHref = event.target.href;
														window.location.href = linkHref;
													} else {

													}

													return false; // Ngăn chặn hành vi mặc định của thẻ <a>
												}
											</script>
											<%
											}
											%>
										</tbody>

									</table>
								</div>
							</div>
						</div>
						<!-- /.card-body -->
					</div>
			</section>
		</div>
		 <div class="row">
            <section class="col-lg-12 connectedSortable ">
              <div class="col-12">
                <div class="card">
                  <div class="card-header">
                    <h3 class="card-title">Yêu Cầu Liên Hệ</h3>
                    </div>
                  </div>
                  <!-- /.card-header -->
                  <div class="card-body table-responsive p-0" style="height: 300px;">
                    <table class="table table-head-fixed text-nowrap">
                      <thead>
                        <tr>
                          <th>ID</th>
                          <th>Tên Người Dùng</th>
                          <th>Email</th>
                          <th>Phone</th>
                          <th>Nội Dung Yêu Cầu</th>
                        </tr>
                      </thead>
                      <tbody>
                     <% 
						for (int i = contacts.size() - 1; i >= 0; i--) {
						    Contact c = contacts.get(i);
						%>
						    <tr>
						        <td><%= c.getId() %></td>
						        <td><%= c.getName() %></td>
						        <td><%= c.getEmail() %></td>
						        <td><span class="tag tag-success"><%= c.getPhone() %></span></td>
						        <td><%= c.getContent() %></td>
						    </tr>
						<% 
						}
						%>
                      </tbody>
                    </table>
                  </div>
                  <!-- /.card-body -->
                </div>
                <!-- /.card -->
              </div>
            </section>
          </div>
		<script>
		
		function convertToWord() {
			var htmlContent = $('#content').html();
		    var docx = htmlDocx.asBlob(htmlContent);

			var link = document.createElement('a');
			link.href = window.URL.createObjectURL(docx);
			link.download = 'contract.docx';
			document.body.appendChild(link);
			link.click();
			document.body.removeChild(link); 
		}
	
		function printDiv(divName) {
			var printContents = document.getElementById(divName).innerHTML;
			var originalContents = document.body.innerHTML;

			document.body.innerHTML = printContents;

			window.print();

			document.body.innerHTML = originalContents;

		}
		function convertNumberToCurrency(amount) {
			  var units = [
			    "", "nghìn", "triệu", "tỷ", "nghìn tỷ", "triệu tỷ", "tỷ tỷ"
			  ];

			  var words = [
			    "", "một", "hai", "ba", "bốn", "năm", "sáu", "bảy", "tám", "chín", "mười",
			    "mười một", "mười hai", "mười ba", "mười bốn", "mười lăm", "mười sáu",
			    "mười bảy", "mười tám", "mười chín"
			  ];

			  var result = "";

			  if (amount === 0) {
			    result = "không đồng";
			  } else {
			    var groupIndex = 0;

			    while (amount > 0) {
			      var threeDigits = amount % 1000;
			      amount = Math.floor(amount / 1000);

			      if (threeDigits > 0) {
			        var threeDigitsText = convertThreeDigitsToWords(threeDigits);
			        var unit = units[groupIndex];

			        if (result === "") {
			          result = threeDigitsText + " " + unit;
			        } else {
			          result = threeDigitsText + " " + unit + " " + result;
			        }
			      }

			      groupIndex++;
			    }
			  }

			  return result.trim();
			}

			function convertThreeDigitsToWords(number) {
			  var ones = [
			    "", "một", "hai", "ba", "bốn", "năm", "sáu", "bảy", "tám", "chín"
			  ];

			  var tens = [
			    "", "mười", "hai mươi", "ba mươi", "bốn mươi", "năm mươi", "sáu mươi",
			    "bảy mươi", "tám mươi", "chín mươi"
			  ];

			  var hundreds = [
			    "", "một trăm", "hai trăm", "ba trăm", "bốn trăm", "năm trăm", "sáu trăm",
			    "bảy trăm", "tám trăm", "chín trăm"
			  ];

			  var result = "";

			  var hundredsDigit = Math.floor(number / 100);
			  var tensDigit = Math.floor((number % 100) / 10);
			  var onesDigit = number % 10;

			  if (hundredsDigit > 0) {
			    result += hundreds[hundredsDigit] + " ";
			  }

			  if (tensDigit > 0) {
			    result += tens[tensDigit] + " ";
			  }

			  if (onesDigit > 0) {
			    if (tensDigit === 0 && hundredsDigit > 0) {
			      result += "linh " + ones[onesDigit] + " ";
			    } else if (tensDigit === 1) {
			      result += "mười " + ones[onesDigit] + " ";
			    } else {
			      result += ones[onesDigit] + " ";
			    }
			  }

			  return result.trim();
			}

			$(document).ready(function() {
				$('#convertToWord').click(function () {
					$('#test').html('');
					convertToWord();
				});
				

				$('.details').click(function() {
					var invoiceID = this.getAttribute('data-id');
					console.log(invoiceID);
					$.ajax({
						type : 'GET',
						url : '${pageContext.request.contextPath}/admin/home',
						data : {
							invoiceID : invoiceID,
							action : 'invoiceDetails'
						},
						success : function(data) {
							var today = new Date(); // Tạo một đối tượng Date hiện tại

							var day = today.getDate(); // Lấy ngày trong tháng (1-31)
							var month = today.getMonth() + 1; // Lấy tháng (0-11). Cần cộng 1 vì tháng bắt đầu từ 0.
							var year = today.getFullYear(); // Lấy năm (4 chữ số)

							// Định dạng lại ngày tháng để hiển thị dưới dạng "dd/mm/yyyy"
							var formattedDate = "Ngày " + day + " Tháng " + month + " Năm " + year  ;

							console.log(formattedDate); // In ra ngày hôm nay
							var productColor = data.productColor;
							var customer = data.customer;
							var invoice = data.invoice;
							var productVersion = data.productVersion;
							var product = data.product;
							var price = productColor.price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
							var price2 =  invoice.price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
							var priceText = convertNumberToCurrency(invoice.price);
							console.log(productColor.price);
							console.log(priceText);
							console.log(customer.name);
							$('#customerName').html(customer.name);
							$('#customerAddress').html(customer.address);
							$('#customerPhone').html(customer.phone);
							$('#customerCard').html(customer.phone);
							$('#productName').html(product.name + ' - ' + productVersion.versionName + ' - ' + productColor.color )
							$('.productPrice').html(price + " VNĐ");
							$('.productPrice2').html(price2 + " VNĐ");
							$('#priceText').html(priceText + " đồng");
							$('#dateprint').html(formattedDate);
							
						}
					});
					$("#dialog-message").dialog({
						modal : true,
						width: 800,
						buttons : {
							Ok : function() {
								$(this).dialog("close");
							}
						}
					});
				});
			});
		</script>
		<div id="dialog-message" style="display: none; font-family: 'Times New Roman', Times, serif;"
			title="Hóa Đơn Bán Hàng">
			<div class="row">
				
				<div class="col-12">
						<div id="content">
						 <style>
    table {
      width: 100%;
      border-collapse: collapse;
    }
    
    th, td {
      padding: 8px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }
  </style>
							<div>
    <h2>TÊN CỬA HÀNG: T-Motorbike </h2> 
    <p>Địa chỉ: 1228 Quang Trung Phường 08 Gò Vấp </p>
     <p> Thành phố Hồ Chí Minh 700000 Việt Nam</p>
    <p>ĐT: 0326767031</p>
  </div>

  <h3>HÓA ĐƠN BÁN HÀNG</h3>

  <div>
    <p>Xe Máy</p>
  </div>

  <div>
    <p>Tên khách hàng: <span id="customerName"> </span> </p> <p>Số Điện Thoại:<span id="customerPhone"> </span> -  Số căn cước công dân: <span id="customerCard"> </span></p> 
    <p>Địa chỉ: <span id="customerAddress"></span>    </p>
    
  </div>

  <table>
    <thead>
      <tr>
        <th>TT</th>
        <th>TÊN HÀNG</th>
        <th> SỐ LƯỢNG </th>
        <th>ĐƠN GIÁ <br> (Của Xe)</th>
        <th>THÀNH TIỀN <br> (Trên Hóa Đơn đã bao gồm giảm giá)</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>1</td>
        <td><span id="productName"> </span> </td>
        <td> 1 </td>
        <td> <span class="productPrice"> </span>  </td>
        <td> <span class="productPrice2"> </td>
      </tr>
      <!-- Thêm các hàng khác tương tự vào đây -->
    </tbody>
    <tfoot>
      <tr>
        <td colspan="4" style="text-align: right;"><strong>TỔNG CỘNG</strong></td>
        <td><span class="productPrice2"> </span></td>
      </tr>
    </tfoot>
  </table>

  <div>
    <p>Thành tiền (viết bằng chữ): <span id="priceText"> </span></p>
  </div>

  <div>
    <p><span id="dateprint"></span></p>
    <p> Số Khung(Số Sườn):                </p>
    <p>Số Máy:                            </p>
    <p>Chi Phí Cấp Biển:                   </p>
    <p>KHÁCH HÀNG: ...........................................                          NGƯỜI BÁN HÀNG: .....................................</p>
    
  </div>
						
						</div>
						<button id="print" onclick="return printDiv('dialog-message')"><i class="fa-solid fa-file-pdf"></i></button> | 
						<button id="convertToWord" ><i class="fa-solid fa-file-word"></i></button>
						
				</div>
			</div>
		</div>
		<!-- /.card-body -->
		<!-- /.row (main row) -->
	</div>
</section>
<!-- /.content -->
