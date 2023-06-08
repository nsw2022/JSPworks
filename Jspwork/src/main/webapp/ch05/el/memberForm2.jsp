<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#container {
	width: 80%;
	margin: 30px auto;
	text-align: center;
}

form {
	display: inline-block;
	text-align: left;
}

label {
	width: 100px;
	display: inline-block;
	text-align: right;
	margin-right: 10px;
}

input[type="text"],
input[type="password"] {
	width: 200px;
}

input[type="submit"],
input[type="reset"] {
	margin-left: 100px;
}
</style>
</head>
<body>
	<div id="container">
		<h3>회원 가입</h3>
		<hr>
		<form action="Process02_el.jsp" method="post">
		<fieldset>
			<p>
				<label for="userid">아이디 </label> <input type="text" id="userid"
					name="userid">
			</p>
			<p>
				<label for="passwd">비민번호 </label> <input type="password" id="passwd"
					name="passwd">
			</p>
			<p>
				<label for="uname">이름</label> <input type="text" id="uname"
					name="uname">
			</p>
			<p>
				<input type="submit" value="로그인"> <input type="reset"
					value="다시쓰기">
			</p>
		</fieldset>
		</form>
	</div>
</body>
</html>