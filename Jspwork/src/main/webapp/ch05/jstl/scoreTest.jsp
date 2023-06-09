<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학점 처리</title>
</head>
<body>
	<c:set var="score" value="${param.score.trim()}" /> 
	<!-- replace를 써야하는게 문자사이공백도 없어줘서 오류를 확실히 잡네요 -->
	<h3>시험 점수: <c:out value="${score}" /></h3>
	
	<c:choose>
		<c:when test="${score >= 90 && score <= 100 }">
			<h3>A학점입니다.</h3>
		</c:when>
		<c:when test="${score >= 80 && score < 90 }">
			<h3>B학점입니다.</h3>
		</c:when>
		<c:when test="${score >= 70 && score < 80 }">
			<h3>C학점입니다.</h3>
		</c:when>
		<c:when test="${score >= 60 && score < 70 }">
			<h3>D학점입니다.</h3>
		</c:when>
		<c:otherwise>
			<h3>이게.. 점수? F임 ㅋ</h3>
		</c:otherwise>
	</c:choose>
</body>
</html>
