<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록 페이지</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/187dabceeb.js" crossorigin="anonymous" type="application/javascript"></script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="container my-3">
		<h2 class="text-left mx-4 my-4">상품 목록 페이지</h2>
		<div class="row" align="center" style="background-color: aqua;">
			<c:forEach items="${productList}" var="product">
			<div class="col-4">
			    <img alt="노트북" src="../resource/img/${product.productImage}">
		    	<p>${product.pname}</p>
			    <p>${product.description}</p>
			    <p>${product.unitPrice}원</p>
			    <p>
			    	<a href="/productInfo.do?productId=${product.productId}" 
			    			class="btn btn-secondary">상세 정보 &raquo</a>
			    </p>
		    </div>
		</c:forEach>
		</div>
	</div>
</body>
</html>