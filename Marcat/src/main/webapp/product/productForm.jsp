<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록페이지</title>

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
	<div class="container my-3" style="padding-top: 8px;">
		<h2 class="text-left mx-4 my-4">상품 등록</h2>
		<div class="row mx-5" align="center" style="text-align: left;">
			<form action="/addProduct.do" enctype="multipart/form-data" method="post">

				<div class="form-group">
					<label for="productId">상품 아이디</label> <input type="text"
						class="form-control" id="productId" name="productId" required>
				</div>
				<div class="form-group">
					<label for="productName">상품명</label> <input type="text"
						class="form-control" id="pname" name="pname" required>
				</div>
				<div class="form-group">
					<label for="unitPrice">상품 가격</label> <input type="number"
						class="form-control" id="unitPrice" name="unitPrice" required
						placeholder="숫자만 입력해 주세요.">
				</div>
				<div class="form-group">
					<label for="description">상품 설명</label>
					<textarea class="form-control" id="description" name="description"
						rows="3" required></textarea>
				</div>
				<div class="form-group">
					<label for="category">상품 분류</label> <input type="text"
						class="form-control" id="category" name="category" required>
				</div>
				<div class="form-group">
					<label for="manufacturer">상품 제조사</label> <input type="text"
						class="form-control" id="manufacturer" name="manufacturer"
						required>
				</div>
				<div class="form-group">
					<label for="unitsInStock">상품 재고수</label> <input type="number"
						class="form-control" id="unitsInStock" name="unitsInStock"
						required placeholder="숫자만 입력해 주세요.">
				</div>
				<div class="form-group">
					<label for="condition">상품 상태</label> <select class="form-control"
						id="condition" name="condition" required>
						<option value="신상품">신상품</option>
						<option value="중고품">중고품</option>
						<option value="재생품">재생품</option>
					</select>
				</div>
				<div class="form-group">
					<label for="id_photo">사진:</label>
					<input type="file" name="photo"
					accept="image/*" class="form-control my-2" id="id_photo">
				</div>
				<button type="submit" class="btn btn-primary">등록</button>
				<button type="reset" class="btn btn-secondary">취소</button>

			</form>
		</div>
	</div>
</body>
</html>