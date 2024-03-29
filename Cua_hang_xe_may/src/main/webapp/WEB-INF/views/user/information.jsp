<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored= "false"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</div>
<div class="container-fluid py-5">
    <div class="container pb-3">
        <div class="container">
            <h1 class="display-6 text-primary text-center">Thông tin cá nhân</h1>
        </div>
        <div class="row">
            <div class="col-lg-12 mb-2 register-container w-100 ">
                <div class="contact-form bg-light mb-6 col-lg-8  ">
                    <img src="${pageContext.request.contextPath}/assets/user/Image/information1.png" alt="">
                </div>
                <div class="contact-form bg-light mb-6 col-lg-5" style="padding-top: 70px">
                    <form  action="${pageContext.request.contextPath}/information?action=update" method="post" enctype="multipart/form-data">
                        <div class="row">
                            <div class="register ml-4">
                               Cập nhật thông tin cá nhân của bạn <a href="#"></a>
                            </div>
                            <div class="form-group">
                          <label for="exampleInputFile">Avatar</label>
                          <div class="input-group">
                            <div class="custom-file">
                              <input type="file" class="custom-file-input" id="exampleInputFile" name="avatar" value="${sessionScope.account.avartar }" onchange="document.getElementById('blah').src = window.URL.createObjectURL(this.files[0])">
                              <label class="custom-file-label" for="exampleInputFile">Chọn Ảnh</label>
                            </div>
                            <div class="input-group-append">
                              <span class="input-group-text">Tải Lên</span>
                            </div>
                          </div>
                        	
                          <c:if test="${sessionScope.account.avartar eq 'avtUnknow.png'}">
                          	  <div class="upload__img-wrap">
                          	 	 <img id="blah" src="${pageContext.request.contextPath}/assets/user/Image/avtUnknow.png" width="100" height="100" />
                       		 </div>
                          </c:if>
                          <c:if test="${sessionScope.account.avartar ne 'avtUnknow.png' }">
                          	  <div class="upload__img-wrap">
                          	 	 <img id="blah" src="${pageContext.request.contextPath}/assets/user/Image/${sessionScope.account.avartar}"width="100" height="100" />
                       		 </div>
                          </c:if>
                            
                        </div>
	                        <div class="col-10 form-group">
	                                <span class="text-dark font-weight-lighter " >*Tên của bạn</span>
	                                <input id="input" type="text" name="name" class="form-control p-4 rounded" value="${sessionScope.account.name == null ?  null : sessionScope.account.name}" placeholder="Tên của bạn" >
	                        </div>
                      
                            <div class="col-10 form-group">
                                <span class="text-dark font-weight-lighter " >*Địa chỉ</span>
                                <input id="input1" type="text" name="address" class="form-control p-4 rounded" value="${sessionScope.account.address == null ?  null : sessionScope.account.address}" placeholder="Địa chỉ">
                            </div>
                            <div class="col-10 form-group">
                                <span class="text-dark font-weight-lighter " >*Số điện thoại liên hệ</span>
                                <input id="input2" type="text" name="phone" class="form-control p-4 rounded" value="${sessionScope.account.phone == null ?  null : sessionScope.account.phone}" placeholder="Số điện thoại liên hệ">
                            </div>
                        </div>
                        <div class="button-register ">
                            <button class="btn btn-primary py-3 my-5 px-4" type="submit">Xác nhận thay đổi</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>