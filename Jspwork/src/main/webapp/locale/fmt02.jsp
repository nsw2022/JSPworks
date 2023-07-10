<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>히히 다국어 처리</title>
</head>
<body>
	<h2>Java Server Page</h2>
	<fmt:setLocale value="${param.Language}"/>
	<fmt:setBundle basename="bundle.message"/>
	
	<a href="?Language=ko">한국어</a> | <a href="?Language=en">English</a>
	
	<p>제목: <fmt:message key="title"/>   </p>
	<p>이름: <fmt:message key="username"/>   </p> 
</body>
</html>