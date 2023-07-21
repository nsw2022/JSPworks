<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역</title>
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
	<div class="container shadow-lg p-3 mb-5 bg-body-tertiary rounded my-3 bg-dark-subtle text-emphasis-dark">
		<h2 class="text-left mx-4 my-4">주문 완료</h2>
		<h2 class="alert alert-danger text-danger">주문이 취소되었습니다</h2>
		<p><a href="/productList.do" class="btn btn-secondary">상품 목록</a></p>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>