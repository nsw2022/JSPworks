<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세 보기</title>
<link rel="stylesheet" type="text/css" href="../resources/css/style.css">
<script src="https://kit.fontawesome.com/187dabceeb.js"
	crossorigin="anonymous" type="application/javascript"></script>
<%
pageContext.setAttribute("LF", "\n");
%>
</head>
<body>
	<%-- 
	<c:if test="${empty sessionId }">
		<script type="text/javascript">
			alert('계정생성이 필요합니다.')
			location.href = "memberForm.do"
		</script>
	</c:if> --%>
	<jsp:include page="../hearder.jsp" />
	<div id="container">
		<section id="board_detail">
			<h2>게시글 상세 보기</h2>

			<table>
				<tbody>
					<tr>
						<td><input type="text" name="title" value="${board.title}"
							readonly="readonly"></td>
					</tr>

					<tr>
						<td><textarea rows="8" cols="100" name="content"
								readonly="readonly">${board.content}</textarea></td>

					</tr>

					<tr>
						<td><c:out value="글쓴이: ${board.memberId}" /> <c:choose>
								<c:when test="${not empty board.modifyDate}"> 
           								수정일: <fmt:formatDate value="${board.modifyDate}"
										pattern="yyyy-MM-dd hh:mm a" />
								</c:when>

								<c:otherwise>								 
										작성일: <fmt:formatDate value="${board.regDate}"
										pattern="yyyy-MM-dd" />
								</c:otherwise>

							</c:choose></td>
					</tr>
					<tr>
						<td><c:if test="${board.memberId == sessionId }">
								<a href="/boardUpdate.do?bnum=${board.bnum}">
									<button type="button">수정</button>
								</a>
								<a href="/deleteBoard.do?bnum=${board.bnum }"
									onclick="return confirm('정말로 삭제하시겠습니까?')">
									<button type="button">삭제</button>
								</a>
							</c:if> <a href='/boardList.do'><button type="button">목록</button></a></td>
					</tr>
				</tbody>
			</table>
			<!-- 댓글 영역  -->
			<h3>댓글</h3>
			<c:forEach items="${replyList}" var="reply">
				<div class="reply">
					<p>작성자: ${reply.replyer}</p>
					<p>${reply.recontent}</p>
					<div class="replyer">
						<p>
							(작성일:
							<fmt:formatDate value="${reply.rdate}" pattern="yyyy-MM-dd" />
							)
						</p>
					</div>
				</div>

			</c:forEach>
			<!-- 댓글 등록 -->

			<c:choose>
				<c:when test="${empty sessionId}">
					<a href="/loginForm.do"> 로그인을 하셔야 댓글 등록이 가능합니다. </a>
				</c:when>
				<c:otherwise>
					<form action="/addReply.do" method="post" id="replyForm">
						<p>
							<input type="hidden" name="bnum" value="${board.bnum}">
						</p>
						<p>
							<input type="hidden" name="replyer" value="${sessionId}">
						</p>

						<p>
							<textarea rows="6" cols="73" name="rcontent"
								placeholder="댓글을 남겨주세요."></textarea>
						</p>

						<button type="submit" id="replybutton">등록</button>
					</form>
				</c:otherwise>
			</c:choose>

		</section>
	</div>
	<jsp:include page="../footer.jsp" />

</body>
</html>