<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Hello</title>
</head>
<body>
	<h1>처음 만드는 웹 페이지</h1>
	<%-- <h3>현재 날짜와 시간은 <%= LocalDateTime.now() %></h3> --%>
	<%
		LocalDateTime now = LocalDateTime.now();
		
		DateTimeFormatter datetime 
			= DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss a");
		
		String current_time = now.format(datetime);
		
		//5초후 새로 고침
		response.setIntHeader("Refresh", 5);

	%>
	<h3>현재 날짜와 시간은 <%= current_time %></h3>
</body>
</html>