<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션 태그</title>
</head>
<body>
	<h2>액션태그 - param</h2>
	<!-- jsp:forward 안에 주석을 달면 에러!! -->
	<jsp:forward page="param1_data.jsp">
		<jsp:param value="admin" name="id"/>
		<jsp:param value="0000" name="pw"/>
	</jsp:forward>
		
	
</body>
</html>