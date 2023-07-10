<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<link rel="stylesheet" type="text/css" href="../resources/css/style.css">
</head>
<body>
	<c:if test="${empty sessionId }">
		<script type="text/javascript">
			alert('계정생성이 필요합니다.')
			location.href = "memberForm.do"
		</script>
	</c:if>
	<jsp:include page="../hearder.jsp" />
	<div id="container">
		<section id="board_reg">
			<h2>글쓰기</h2>
			<form action="/addBoard.do" method="post" enctype="multipart/form-data">
				<table>
					<tbody>
						<tr>
							<td>
								<input type="text" name="title" placeholder="글제목" required="required">
							</td>
						</tr>
						<tr>
							<td>
								<textarea rows="8" cols="100" name="content" placeholder="글내용"></textarea>
							</td>
						</tr>
						<tr>
							<td>
								<input type="submit" value="등록">
								<input type="reset" value="취소">
							</td>
						</tr>
						<tr>
							<td>
								<input type="file" name="fileName">
							</td>
						</tr>
					</tbody>
				</table>
			
			</form>
		</section>
	</div>
	<jsp:include page="../footer.jsp" />
	
</body>
</html>