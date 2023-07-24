<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>



</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="container my-3" style="padding-top: 8px;">
		<h2 class="text-left mx-4 my-4">상품 수정</h2>
		<div class="row mx-5" align="center" style="text-align: left;">
			<form action="/updateProduct.do" enctype="multipart/form-data" method="post" 
				name="newProduct" onsubmit="return checkAddProduct()">

				<div class="form-group">
					<label for="productId">상품 아이디</label> <input type="text"
						class="form-control" id="productId" name="productId" 
						required="required" value="${product.productId}">
				</div>
				<div class="form-group">
					<label for="productName">상품명</label> <input type="text"
						class="form-control" id="pname" name="pname" 
						required value="${product.pname}">
				</div>
				<div class="form-group">
					<label for="unitPrice">상품 가격</label> <input type="number"
						class="form-control" id="unitPrice" name="unitPrice" required
						placeholder="숫자만 입력해 주세요." value="${product.unitPrice}">
				</div>
				<div class="form-group">
					<label for="description">상품 설명</label>
					<textarea class="form-control" id="description" name="description"
						rows="3" required >${product.description}</textarea>
				</div>
				<div class="form-group">
					<label for="category">상품 분류</label> <input type="text"
						class="form-control" id="category" name="category" 
						required value="${product.category}">
				</div>
				<div class="form-group">
					<label for="manufacturer">상품 제조사</label> <input type="text"
						class="form-control" id="manufacturer" name="manufacturer"
						required value="${product.manufacturer}">
				</div>
				<div class="form-group">
					<label for="unitsInStock">상품 재고수</label> <input type="number"
						class="form-control" id="unitsInStock" name="unitsInStock"
						required placeholder="숫자만 입력해 주세요." value="${product.unitsInStock}">
				</div>
				<div class="form-group">
					<label for="condition">상품 상태</label>
					<select class="form-control" id="condition" name="condition" required>
					    <option value="신상품" ${product.condition == '신상품' ? 'selected' : ''}>신상품</option>
					    <option value="중고품" ${product.condition == '중고품' ? 'selected' : ''}>중고품</option>
					    <option value="재생품" ${product.condition == '재생품' ? 'selected' : ''}>재생품</option>
					</select>
				</div>
				<div class="form-group">
				    <label for="photo">사진:</label>
				    <input type="file" name="photo" accept="image/*" class="form-control my-2" id="photo">
				    <h3 class="mt-3">전에 선택한 상품 사진</h3>
				    <img src="../resource/upload/${product.productImage}" id="previewImage" style="max-width: 200px; max-height: 200px;" />
				</div>
				<button type="submit" class="btn btn-primary" >수정</button>
				<a href="/editProduct.do?edit=update" class="btn btn-secondary">취소</a>

			</form>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>