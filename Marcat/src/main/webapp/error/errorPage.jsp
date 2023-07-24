<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지 오류 처리</title>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="container shadow-lg p-3 mb-5 bg-body-tertiary rounded my-3 bg-dark-subtle text-emphasis-dark">
		<div>
			<h1 class="alert alert-danger">요청하신 페이지를 찾을 수 없습니다.</h1>
			<h5><%=request.getRequestURL() %></h5>
		</div>
		<p><a href="/productList.do" class="btn btn-primary">&laquo; 목록보기</a></p>
	</div>
	
	<jsp:include page="../footer.jsp" />
</body>
</html>