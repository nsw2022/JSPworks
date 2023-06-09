<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숫자 표기</title>
</head>
<body>
	<!-- 천단위 구분기호  -->
	<p>숫자: <fmt:formatNumber value="3200100"/> </p>
	<p><fmt:formatNumber value="3200100" type="number" /> </p>
	<p><fmt:formatNumber value="150000" pattern="#,##0.00"  /> </p>
	
	<!-- 통화 '\\'-원화 '$' - 달러 -->
	<p><fmt:formatNumber value="3200100" type="currency" currencySymbol="\\"/> </p>
	
	<!-- 퍼센트 -->
	<p><fmt:formatNumber value="0.25" type="percent" /> </p>
</body>
</html>