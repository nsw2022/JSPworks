<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL언어(Expression Launguage)</title>
</head>
<body>
	<h3>데이터 표현</h3>
	<p>${"hello"}</p>
	<p>${"안녕"}</p>
	<p>${12}</p>
	<p>${2.54}</p>
	<p>${10 + 20}</p>
	<p>${10 + "20"}</p>
	
	<h3>산술 연산</h3>
	<!-- \붙히면 그대로 나옴 -->
	<p>\${7 + 3} : ${7 + 3}</p>
	<p>\${7 - 3} : ${7 - 3}</p>
	<p>\${7 * 3} : ${7 * 3}</p>
	<p>\${7 / 3} : ${7 / 3}</p>
	<p>\${7 % 3} : ${7 % 3}</p>
	
	<h3>비교 연산</h3>
	<p>${10 == 10}, ${10 eq 10 }</p>
	<p>${ "face" == "face"}, ${ "face" eq "face"}</p>
	
	<%-- <p>${ 10 != 10}, ${ "face" ne "face"}</p> --%>
	<!-- lt-less than gt-greater than  -->
	<p>${10 < 20}, ${10 lt 20 }</p>
	<p>${10 > 20}, ${10 gt 20 }</p>

	<h3>논리 연산</h3>
	<p>${(10==10)  && (10 > 20 )}, ${(10==10) and (10>20) }</p>
	<p>${(10==10)  || (10 > 20 )}, ${(10==10) or (10>20) }</p>
	<p>${!(10==10)}, ${not(10==10) }</p>

	
	
</body>
</html>