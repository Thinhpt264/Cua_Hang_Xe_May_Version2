<%@page import="java.util.Locale"%>
<%@page import="java.util.ResourceBundle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
     <link href="${pageContext.request.contextPath}/assets/user/css/style.css" rel="stylesheet">
    <% String deposit = (String) request.getParameter("deposit_amount") ;
	    double deposit_amount = Double.parseDouble(deposit);
    	int depo = (int) deposit_amount;
    %>
    
        <div id="preloader"></div>
    
  <form id="myForm" action="${pageContext.request.contextPath}/payment" method="post">
  	Amount: <input type="hidden" name="amount" value="<%= depo %>">
  	<input type="submit" value="submit">
  </form>
  <script>
        function submitForm() {
            document.getElementById("myForm").submit();
        }

        // Gửi biểu mẫu sau khi trang đã tải xong
        window.onload = function() {
            submitForm();
        };
    </script>
  
  