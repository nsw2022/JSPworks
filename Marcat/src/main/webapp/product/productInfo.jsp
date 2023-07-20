<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 정보</title>

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
	<div class="container my-3">
		<h2 class="text-left mx-4 my-4">상품 목록 페이지</h2>
		<div class="row mx-5" align="center">
			<div class="col-5">
				<img alt="노트북" src="../resource/upload/${product.productImage}" style="width: 100%;">
			</div>
			<!--왼쪽의 이미지 col-6-->
			<div class="col-6">
				<h3>${product.pname}</h3>
				<p>${product.description}
				<p>
					<b>상품 코드:</b> <span class="badge bg-dark">${product.productId}</span>
				<p>
					<b>제조사:</b> ${product.manufacturer}
				<p>
					<b>분류:</b> ${product.category}
				<p>
					<b>재고수:</b> ${product.unitsInStock}
				<p>${product.unitPrice}원
				<p>
					<form action="" method="post" name="addForm">
						<a href="#" onclick="addTocart()" class="btn btn-info">상품주문</a>
						<a href="#">장바구니</a>
						<a href="/productList.do" 
						class="btn btn-secondary">상품 목록 &raquo;</a>
&
					</form>
				</p>
			</div>

		</div>
	</div>
</body>
</html>