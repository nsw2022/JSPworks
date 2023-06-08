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

table {
	margin: 0 auto;
	border: 1px solid black;
	border-collapse: collapse;
	width: 100%;
}

table th {
	background: #ccc;
	padding: 10px;
}

table td {
	padding: 10px;
}

</style>
</head>
<%
// 데이터 name 속성 받아오기
request.setCharacterEncoding("utf-8");

%> 


<body>
	<div id="container">
		<h3>회원 가입</h3>
		<hr>
		<table>
			<thead>
				<tr>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>이름</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<!-- MVC : Model -->
					<td>${param.userid }</td>
					<td>${param.passwd }</td>
					<td>${param.uname }</td>
					
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>