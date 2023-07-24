<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역</title>


</head>
<body>
<jsp:include page="../header.jsp" />
	<div class="container shadow-lg p-3 mb-5 bg-body-tertiary rounded my-3 bg-dark-subtle text-emphasis-dark">
		<h2 class="text-left mx-4 my-4">주문 완료</h2>
		<h2 class="alert alert-danger text-danger">주문해 주셔서! 감사합니다.</h2>
		<p>주문은${shipping_shippingDate} 일에 배송될 예정입니다.</p>
		<p>주문 번호: ${shipping_cartId } </p>
		<p><a href="/productList.do" class="btn btn-secondary">상품 목록</a></p>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>