<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정수형 계솬귀~~e</title>
<link rel="stylesheet" href="../resources/css/Calcuatorstyle.css">
</head>
<body>
	<div id="container">
		<h2>계산기</h2>
		<hr>
		<form action="/calculator/clac" method="get">
			<input type="text" name="num1">
				<select name="op">
				<option>+</option>
				<option>-</option>
				<option>x</option>
				<option>/</option>
			</select>
			<input type="text" name="num2">
		
			<button type="submit">계산</button>
			<button type="reset">취소</button>
	
		</form>
	</div>
</body>
</html>