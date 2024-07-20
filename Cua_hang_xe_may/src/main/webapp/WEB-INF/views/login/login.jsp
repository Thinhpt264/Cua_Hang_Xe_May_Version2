<%@page import="java.util.Locale"%>
<%@page import="java.util.ResourceBundle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <% %>
    <%
    	HttpSession httpSession = request.getSession();
    	String lang = "vi";
    	if(httpSession.getAttribute("language") != null){
    		lang = httpSession.getAttribute("language").toString();
    	}
    	ResourceBundle messages = ResourceBundle.getBundle("messages", new Locale(lang));
    %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Đăng nhập</title>
  <!-- Font Awesome -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
 
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/login/style.css">
</head>
<body>
<a href="${pageContext.request.contextPath}/home" style="text-decoration: none"> <i class="fa-solid fa-backward"></i> <%=messages.getString("trang_chu")%></a>

<div class="wrapper">
      <div class="title-text">
        <div class="title login"><%=messages.getString("dang_nhap")%></div>
        <div class="title signup"><%=messages.getString("dang_ki")%></div>
      </div>
      <div class="form-container">
        <div class="slide-controls">
          <input type="radio" name="slide" id="login" checked>
          <input type="radio" name="slide" id="signup">
          <label for="login" class="slide login"><%=messages.getString("dang_nhap")%></label>
          <label for="signup" class="slide signup"><%=messages.getString("dang_ki")%></label>
          <div class="slider-tab"></div>
        </div>
        <div class="form-inner">
        	<%
        		HttpSession session2 = request.getSession();
        		String msg = (String)session2.getAttribute("msg");
        		String msg1 = msg;
        		session2.removeAttribute("msg");
        	%>
          <form action="${pageContext.request.contextPath}/login?action=login" method="post" class="login">
          <span style="color: red;"><%= msg1==null ? "" : msg1 %></span>
            <pre>
            </pre>
<div class="field">
              <input type="text" name="username" placeholder="<%=messages.getString("ten_dang_nhap")%> " required>
            </div>
            <div class="field ">
              <input id="input" class="form-control p-4 rounded" type="password" name="password" placeholder="<%=messages.getString("mat_khau")%>"  required >
               <span class="showOrHide" onclick="showPass()">
                                        <i class ="fa-solid fa-eye-slash" id="hide" style="display: none"></i>
                                        <i class ="fa-solid fa-eye" id="show"></i>
                                    </span>
            </div>
            
            <div class="field btn">
              <div class="btn-layer"></div>
              <input type="submit" value="<%=messages.getString("bat_dau")%>">
            </div>
             <div class="pass-link ml-5"><a href="${pageContext.request.contextPath}/login?action=forgotpassword"><%=messages.getString("quen_mat_khau")%>?</a></div>
             
             <div class="pass-link ml-5"><a class="btn btn-lg btn-google btn-block text-uppercase btn-outline" href="https://accounts.google.com/o/oauth2/auth?
	scope=email&redirect_uri=http://localhost:8080/Cua_hang_xe_may/login-google&
	response_type=code&client_id=885278340721-us6jlocdo6p1ql45ml84h1f1ikmbmj1v.apps.googleusercontent.com
	&approval_prompt=force"><img src="https://img.icons8.com/color/16/000000/google-logo.png">
	Đăng nhập bằng Google
</a></div>
            <div class="signup-link"><%=messages.getString("ban_chua_co_tai_khoan")%> <a href=""><%=messages.getString("dang_ki_ngay")%>!</a></div>
          </form>
          
          <form action="${pageContext.request.contextPath}/login?action=register" method="post" class="signup" >
          	<span style="color:red " id="message"></span>
            <div class="field">
             
              <input type="text" id="username1" placeholder="<%=messages.getString("ten_dang_nhap")%>" name="username" required>
             	 <script type="text/javascript">
            $('#username1').blur(function(){
            	 var username  = document.getElementById("username1").value;
            	$.ajax({
        			type: 'GET',
        			dataType: 'json',
        			contentType: 'application/json; charset=utf-8',
        			url: '${pageContext.request.contextPath}/login',
        			data: {
        				action: 'checkExitsUserName',
        				username : username
        			},
        			success: function (msg) {
        				var message = msg;
        				$('#message').html(message);
        			}
        		});
            	})
            </script>
            </div>
            <div class="field">
          
              <input type="text" placeholder="Email" id="email" name="email" pattern="[^@\s]+@[^@\s]+\.[^@\s]+" required>
            </div>
            <script type="text/javascript">
            $('#email').blur(function(){
            	 var email = document.getElementById("email").value;
            	$.ajax({
        			type: 'GET',
        			dataType: 'json',
        			contentType: 'application/json; charset=utf-8',
        			url: '${pageContext.request.contextPath}/login',
        			data: {
        				action: 'checkExitsEmail',
        				email : email
        			},
        			success: function (msg) {
        				var message = msg;
        				$('#message').html(message);
        			}
        		});
            	})
            </script>
<div class="field">
              <input type="text" placeholder="<%=messages.getString("so_dien_thoai")%>" name="phone" pattern="[0-9]{10,}" title="<%=messages.getString("content_sdt")%>" required>
            </div>
            <div class="field">
            
              <input id="input1" type="password" placeholder="<%=messages.getString("mat_khau")%>" name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="<%=messages.getString("content_mk")%>" required >
               <span class="showOrHide" onclick="showPass1()">
                                        <i class ="fa-solid fa-eye-slash" id="hide1" style="display: none"></i>
                                        <i class ="fa-solid fa-eye" id="show1"></i>
                                    </span>
            </div>
            <div class="field">
              <input id="input2" type="password" placeholder="<%=messages.getString("xac_nhan_mk")%>" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="<%=messages.getString("content_mk")%>" required>
               <span class="showOrHide" onclick="showPass2()">
                                        <i class ="fa-solid fa-eye-slash" id="hide2" style="display: none"></i>
                                        <i class ="fa-solid fa-eye" id="show2"></i>
                                    </span>
            </div>
            <div class="field btn">
              <div class="btn-layer"></div>
              <input type="submit" value="<%=messages.getString("dang_ki")%>">
            </div>
            <div class="signup-link"><%=messages.getString("ban_co_tai_khoan")%>?  <a href=""><%=messages.getString("dang_nhap_o_day")%></a></div>
          </form>
          
        </div>
      </div>
    </div>
    
  <script  src="${pageContext.request.contextPath}/assets/login/script.js"></script>
<script>
    function showPass() {
        var input = document.getElementById("input");
        var show = document.getElementById("show");
        var hide = document.getElementById("hide");
        if (input.type === "password"   ){
            input.type = "text";
            show.style.display = "none";
            hide.style.display = "inline";
        }else{
            input.type = "password";
            show.style.display = "inline";
            hide.style.display = "none";
        }
    }

</script>
<script>
    function showPass1() {
        var input = document.getElementById("input1");
        var show = document.getElementById("show1");
        var hide = document.getElementById("hide1");
        if (input.type === "password"   ){
            input.type = "text";
            show.style.display = "none";
            hide.style.display = "inline";
        }else{
            input.type = "password";
            show.style.display = "inline";
            hide.style.display = "none";
        }
    }
    
   
</script>

<script>
    function showPass2() {
        var input = document.getElementById("input2");
var show = document.getElementById("show2");
        var hide = document.getElementById("hide2");
        if (input.type === "password"   ){
            input.type = "text";
            show.style.display = "none";
            hide.style.display = "inline";
        }else{
            input.type = "password";
            show.style.display = "inline";
            hide.style.display = "none";
        }
    }

</script>

</body>
</html>