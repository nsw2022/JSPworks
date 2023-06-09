<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/style.css">
</head>
<body>
	<h2>회원 정보</h2>
	<table>
		<tr>
			<td><label>아이디</label></td>
			<td><input type="text" name="memberId" value="${ member.memberId}" readonly="readonly"></td>
		</tr>
		<tr>
			<td><label>비밀번호</label></td>
			<td><input type="password" name="passwd" value="${ member.passwd}" readonly="readonly"></td>
		</tr>
		<tr>
			<td><label>이름</label></td>
			<td><input type="text" name="name" value="${ member.name}" readonly="readonly"></td>
		</tr>
		<tr>
			<td><label>성별</label></td>
			<%-- <td><input type="text" name="memberId" value="${ member.gender}" readonly="readonly"></td> --%>
		</tr>
	</table>
</body>
</html>