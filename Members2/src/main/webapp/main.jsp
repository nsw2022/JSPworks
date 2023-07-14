<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>강남 커뮤니티 입니다..</title>
<link rel="stylesheet" type="text/css" href="resources/css/style.css">

</head>
<body>
	<jsp:include page="hearder.jsp" />
	<div id="container">
		<section id="main">
			<h2>안녕하세요~ 강남커뮤니티입니다</h2>
			<div class="main_img">
				<img alt="사진없음ㅠ경로확인" src="resources/images/gangnam.jpg">
			</div>
		</section>
	
		<div id="recent_board">
			<h3>최근 게시글</h3>
			<ul>
				<c:forEach var="board" items="${recentBoards}">
					<li><a href="/boardView.do?bnum=${board.bnum}">${board.title}-<fmt:formatDate value="${board.regDate}"
											pattern="yyyy-MM-dd" /> -글쓴이${board.memberId}</a></li>
											
				</c:forEach>
			</ul>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>