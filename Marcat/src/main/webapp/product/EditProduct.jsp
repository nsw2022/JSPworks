<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 편집</title>

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
		<h2 class="text-left mx-4 my-4">상품 편집</h2>
		<div class="row mx-5" align="center">
			<c:forEach items="${productList}" var="product">
				<div class="col-4">
					<img alt="사진" src="../resource/upload/${product.productImage}"
						style="width: 100%; height: 400px">
					<p>${product.pname}</p>
					<p>${product.description}</p>
					<p>${product.unitPrice}원</p>
					<p>
						<!-- edit이 update면 수정 버튼 -->
						<c:if test="${edit eq 'update'}">
							<a href="/updateProductForm.do?productId=${product.productId}"
								class="btn btn-success">수정 &raquo;</a>
						</c:if>

						<!-- edit이 delete면 수정 버튼 -->
						<c:if test="${edit eq 'delete'}">
							<a href="/deleteProduct.do?productId=${product.productId}"
								class="btn btn-danger" onclick="return confirm('정말로 삭제하시겠습니까?')">삭제
								&raquo;</a>

						</c:if>
					</p>
				</div>
			</c:forEach>

		</div>
	</div>
</body>
</html>