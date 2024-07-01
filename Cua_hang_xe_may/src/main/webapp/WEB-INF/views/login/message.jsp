<%@page import="java.util.Locale"%>
<%@page import="java.util.ResourceBundle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%
    	HttpSession httpSession = request.getSession();
    	String lang = "vi";
    	if(httpSession.getAttribute("language") != null){
    		lang = httpSession.getAttribute("language").toString();
    	}
    	ResourceBundle messages = ResourceBundle.getBundle("messages", new Locale(lang));
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		HttpSession session2 = request.getSession();
		String content = (String) session2.getAttribute("error");
		String content1 = content;
		session.removeAttribute("error");
		
	%>
	<c:if test="<%= content1 == null %>">

		<h3><%=messages.getString("content_message")%>!</h3>
		<br>
		<a href="https://mail.google.com/mail/u/1/#inbox"><%=messages.getString("den_email")%></a>
	</c:if>
	
	<c:if test="<%= content1 != null %>">

		<h3><%=messages.getString("xac_thuc_khong_thanh_cong")%>!</h3>
	</c:if>
	

</body>
</html>