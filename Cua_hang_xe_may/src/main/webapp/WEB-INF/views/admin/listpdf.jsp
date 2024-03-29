<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored = "false" %>
     
      <!-- Content Header (Page header) -->
      <div class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1 class="ml-2">Nội dung các phiếu mua hàng và sách</h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="#">Trang Chủ</a></li>
                <li class="breadcrumb-item active">Phiếu Dịch Vụ</li>
              </ol>
            </div><!-- /.col -->
          </div><!-- /.row -->
        </div><!-- /.container-fluid -->
      </div>
      <!-- /.content-header -->
      <!-- Main content -->
      <section class="content">
        <div class="row">
          <div class="col-md-4 border-right"> 
            <span>Hóa Đơn Bán Lẻ</span>
            <iframe src="${pageContext.request.contextPath}/assets/user/Image/Hoa-don-ban-hang2.pdf" id="iframew" width="100%" height="470px" scrolling="0" frameBorder="0"></iframe>
            <button class="btn btn-dark" onclick="printPDF()">In</button> 
            <button class="btn btn-dark" onclick="viewAllPDF()">Phóng To</button>
          </div>
          <div class="col-md-4 border-right">
            <span>Sách Hướng Dẫn Hãng Honda</span>
            <iframe src="${pageContext.request.contextPath}/assets/user/Image/19SH300_4FK53L20_0.pdf" id="iframew2" frameborder="0"  width="100%" height="470px" ></iframe>
            <button class="btn btn-dark" onclick="printPDF2()">In</button> 
            <button class="btn btn-dark" onclick="viewAllPDF2()">Phóng To</button>
          </div>
          <div class="col-md-4 border-right">
            <span>Phiếu Hướng Dẫn Sử Dụng My Yamaha Motor</span>
            <iframe src="${pageContext.request.contextPath}/assets/user/Image/20211603_MyYamahamanual-2FA.pdf" id="iframew3" frameborder="0"  width="100%" height="470px" ></iframe>
            <button class="btn btn-dark" onclick="printPDF3()">In</button> 
            <button class="btn btn-dark" onclick="viewAllPDF3()">Phóng To</button>
          </div>
        </div>
        
        <script>
            function printPDF() {
              var iframe = document.getElementById('iframew');
              iframe.contentWindow.focus();
              iframe.contentWindow.print();
            }
            function viewAllPDF() {
              var iframe = document.getElementById('iframew');
              iframe.requestFullscreen();
            }
            function printPDF2() {
              var iframe = document.getElementById('iframew2');
              iframe.contentWindow.focus();
              iframe.contentWindow.print();
            }
            function viewAllPDF2() {
              var iframe = document.getElementById('iframew2');
              iframe.requestFullscreen();
            }
            function printPDF3() {
              var iframe = document.getElementById('iframew3');
              iframe.contentWindow.focus();
              iframe.contentWindow.print();
            }
            function viewAllPDF3() {
              var iframe = document.getElementById('iframew3');
              iframe.requestFullscreen();
            }
        </script>
    </section>
         </div>
      <!-- /.content -->