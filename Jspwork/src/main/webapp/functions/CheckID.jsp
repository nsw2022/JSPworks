<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문자열 분리, 연결</title>
</head>
<body>
	<h2>Java 문자열 분리</h2>
	<p>Hello, Java Server Page</p>
	<!-- fn:split(문자열, 구분기호)  -->
	<p><c:set var="text" value="${fn:split('Hello, Java Server Page', ' ') }"/> </p>
	<p>text[0]=${text[0]}</p>
	<p>text[1]=${text[1]}</p>
	<p>text[2]=${text[2]}</p>
	<p>text[3]=${text[3]}</p>
	<p>문자열 총 개수 : ${fn:length(text) }</p>
	<p>
	 	<c:forEach var="i" begin="0" end="${fn:length(text)-1}">
	 		text[${i}] = ${text[i] }
		</c:forEach>
	</p>
	
	<h2>Java 문자열 연결</h2>
	<p>${fn:join(text, '-') }</p>
	
 	<c:set var="fruit" value="apple banana berry"></c:set>
	<p>${fn:join(fruit.split(' '), '-') }</p>

	
	<h2>문자열 검색(매칭)</h2>
	<p>${fn:contains("Have a nice day!", "have"  }</p>
</body>
</html>