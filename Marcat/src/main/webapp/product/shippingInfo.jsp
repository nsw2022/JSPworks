<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송정보</title>

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
		<h2 class="text-left mx-4 my-4">배송 정보</h2>
		<form action="/processShippingInfo.do" method="post">
			<input type="hidden" name="cartId" value="${cartId}">
		
			
			<div class="form-group">
				<label for="name">성명</label> <input type="text" 
				class="form-control" id="name" name="name" required>
			</div>
				
			<div class="form-group">
				<label for="shippingDate">배송일</label>
				<input type="date" id="shippingDate" name="shippingDate" 
				class="form-control" required>
					
			</div>
			<div class="form-group">
				<label for="country">국가명</label>
				<input type="text" id="country" name="country" 
				class="form-control" required>
			</div>
			
			<div class="form-group">
				<label for="zipCode">우편번호</label>
				<input type="text" id="zipCode" name="zipCode" 
				class="form-control" required>
			</div>
			
			<div class="form-group">
				<label for="addressName">주소</label>
				<input type="text" id="addressName" name="addressName" 
				class="form-control" required>
			</div>
			
			
			
			<a href="/cart.do?cartId=${cartId}" 
			   class="btn btn-secondary">이전</a>
			<input type="submit" value="등록" class="btn btn-primary">
			<a href="/checkOutCancelled.do" class="btn btn-secondary">취소</a>
		
		</form>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>