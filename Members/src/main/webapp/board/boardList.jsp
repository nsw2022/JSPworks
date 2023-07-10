<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../resources/css/style.css">
<title>회원 목록</title>
</head>

<body>
	<jsp:include page="../hearder.jsp" />

	<div id="container">
		<section id="boardlist">
			<h2>게시판 목록입니다.</h2>
			<table id="brd_table">
				<thead>
					<tr>
						<th>글번호</th>
						<th>글제목</th>
						<th>작성일</th>
						<th>조회수</th>
						<th>글쓴이</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${boardList}" var="board">
						<tr>
							<td><c:out value="${board.bnum}" /></td>
							<td><a href="/boardView.do?bnum=${board.bnum}"><c:out
										value="${board.title}" /> </a></td>
							<td><fmt:formatDate value="${board.regDate}"
									pattern="yyyy-MM-dd" /></td>
							<td><c:out value="${board.hit}" /></td>
							<td><c:out value="${board.memberId}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- 페이지 처리 -->
			<div class="pagetest">
				<!-- 이전페이지  -->
				<c:if test="${startPage > 1}">
					<a href="/boardList.do?pageNum=${startPage - 1}">이전</a>
				</c:if>
				<!-- 페이지 리스트  -->
				<c:forEach var="i" begin="1" end="${endPage}">
					<c:choose>
						<c:when test="${currentPage == i}">
							<a href="/boardList.do?pageNum=${i}"><b>${i}</b></a>
						</c:when>
						<c:otherwise>
							<a href="/boardList.do?pageNum=${i}">${i}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<!-- 다음페이지  -->
				<c:if test="${endPage > startPage}">
					<a href="/boardList.do?pageNum=${endPage}">다음</a>
				</c:if>
			</div>

			<!-- 글쓰기 버튼 -->
			<div class="btnWrite">
				<a href="/boardFrom.do">
					<button type="button">글쓰기</button>
				</a>
			</div>
		</section>
	</div>
	<jsp:include page="../footer.jsp" />

</body>
</html>
