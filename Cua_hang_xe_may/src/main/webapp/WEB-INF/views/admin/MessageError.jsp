<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		HttpSession session2 = request.getSession();
		String responUrl = (String) session2.getAttribute("responUri");
		String responUrl2 = responUrl;
		session.removeAttribute("responUri");
		
	%>
		<c:if test="<%= responUrl2 != null %>">
		<h3>Điều Bạn Vừa Làm Không Thành Công Vui Lòng Kiểm Tra Lại Mọi Thứ Trước Khi Làm :)!</h3>
		<br>
		<a href="${pageContext.request.contextPath}/admin/<%= responUrl2%>">Quay Trở Lại </a>
		</c:if>
	<c:if test="<%= responUrl2 == null %>">
		<h3><a href="${pageContext.request.contextPath}/admin/home">Quay Trở Lại </a></h3>
	</c:if>
	

</body>
</html>