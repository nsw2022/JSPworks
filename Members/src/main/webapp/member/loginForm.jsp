<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="../resources/css/style.css">
</head>
<body>
	<jsp:include page="../hearder.jsp" />
	<div id="container">
		<section id="login">
			<h2 style="margin-top: 5px;">로그인</h2>
			<form action="/loginProcess.do" method="post">
				<fieldset>
					<ul>
						<li><label for="memberId">아이디 </label> <input type="text"
							id="memberId" name="memberId"></li>
							
						<li><label for="passwd">비밀번호 </label> <input type="password"
							id="passwd" name="passwd"></li>
							
					</ul>
				</fieldset>
				<div class="button">
					<input type="submit" value="로그인"> 

				</div>
			</form>
		</section>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>