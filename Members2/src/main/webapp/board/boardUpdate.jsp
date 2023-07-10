<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 수정</title>
<link rel="stylesheet" type="text/css" href="../resources/css/style.css">
</head>
<body>
	<jsp:include page="../hearder.jsp" />
	<section id="board_detail">
		<h2>게시글 수정</h2>
		<form action="/boardUpdateProcess.do" method="post">
			<input type="hidden" name="bnum" value="${board.bnum }">
			<table>
				<tr>
					<td><input type="text" name="title" value="${board.title}"></td>
				</tr>
				<tr>
					<td><textarea rows="7" cols="100" name="content">${board.content }</textarea></td>
				</tr>
				<tr>
					<td><c:out value="글쓴이: ${board.memberId }"/> (수정일: <fmt:formatDate value="${board.regDate}" pattern="yyyy-mm-dd"/>)</td>
				</tr>
				<tr>
					<td>
						<input type="submit" value="수정" style="padding: 10px;"> 
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		
		</form>
		
	
	</section>
	
	<jsp:include page="../footer.jsp" />
</body>
</html>