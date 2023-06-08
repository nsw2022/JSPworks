<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품결과</title>
<style type="text/css">
#container {
	width: 80%;
	margin: 30px auto;
	text-align: center;
}
</style>
<jsp:useBean id="product" class="product.Product"/>

</head>

<body>
	<div id="container">
		<h2>상품결과</h2>
		<hr>
		<p>1. 선택한 상품은: ${param.select}</p>
		<p>2. num1 + num2 = ${product.num1 + product.num2 }</p>
	</div>
</body>
</html>