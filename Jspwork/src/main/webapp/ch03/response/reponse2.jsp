<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>respones 객체 예제</title>
</head>
<body>
	<%
		// 서버에서 브라우저쪽으로 응답할때 한글로 응답처리
		response.setCharacterEncoding("utf-8");
	
		// 컨텐츠 유형(타입)을 응답 처리
		response.setContentType("text/html; charset=utf-8");
		
	%>
	<p>문자 인코딩:<%= response.getCharacterEncoding() %> </p>
	<p>컨텐츠 유형:<%= response.getContentType() %></p>
</body>
</html>