<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 정보 사이트</title>
</head>
<body>
   <h2>상품 정보</h2>
    <hr>
    <ul>
        <li><strong>상품명:</strong> ${product.pname}</li>
        <li><strong>제조사:</strong> ${product.maker}</li>
        <li><strong>가격:</strong> ${product.price}</li>
        <li><strong>거래일:</strong> ${product.date}</li>
    </ul>
</body>
</html>