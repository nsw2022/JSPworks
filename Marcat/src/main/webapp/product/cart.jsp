<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
	crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/187dabceeb.js"
	crossorigin="anonymous" type="application/javascript"></script>
<link rel="stylesheet" type="text/css" href="../resource/css/style.css">

</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="container my-4">
		<h2 class="text-left mx-4 my-4">장바구니</h2>
		<div class="row">
			<table style="width: 100%">
				<tr>
					<td align="left">
						<a href="/deleteCart.do" class="btn btn-danger">삭제하기</a>
					</td>
					<td align="right">
						<a href="/shippingInfo.do?cartId=${cartId}" class="btn btn-success">주문하기</a>
					</td>
				</tr>
			</table>
		</div><!-- row 닫기 -->
		<div style="padding-top: 50px"> 
			<table class="table table-hover">
				<tr>
					<th>상품</th><th>가격</th><th>수량</th><th>소계</th><th>비고</th>
				</tr>
				<c:forEach items="${cartList}" var="product">
				<tr>
					<td>${product.productId} - ${product.pname}</td>
					<td><fmt:formatNumber value="${product.unitPrice}" pattern="#,###"></fmt:formatNumber></td>
					<td>${product.quantity}</td>
					<td><fmt:formatNumber value="${product.unitPrice * product.quantity}" pattern="#,###"/> </td>
					<td><a href="/removeCart.do?productId=${product.productId}" 
							class="badge bg-dark">삭제</a></td>
				</tr>
				</c:forEach>
				<tr>
					<th></th><th></th><th>총액</th><th><fmt:formatNumber value="${sum}" pattern="#,###" /></th><th></th>
				</tr>
			</table>
			<a href="/productList.do" class="btn btn-secondary">&laquo; 쇼핑 계속하기</a>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>