<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="../resources/css/style.css">
</head>
<body>
	<!-- 다국어 Locale 설정 -->
	<fmt:setLocale value="${param.Language }"/>
	<fmt:bundle basename="bundle.message" >
	
	<jsp:include page="../hearder.jsp" />
	<div id="container">
		<section id="login">
			<div class="Language">
				<a href="?Language=ko">한국어</a> | 
				<a href="?Language=en">English</a>
			</div>
			<h2 style="margin-top: 5px;"><fmt:message key="login.title" /> </h2>
			
			<form action="/loginProcess.do" method="post">
				<fieldset>
					<ul>
						<li><label for="memberId"><fmt:message key="login.id" /> </label> <input type="text"
							id="memberId" name="memberId"></li>
							
						<li><label for="passwd"><fmt:message key="login.passwd" /> </label> <input type="password"
							id="passwd" name="passwd"></li>
							
					</ul>
				</fieldset>
				<div class="button">
					<input type="submit" value='<fmt:message key="login.button"/>'> 

				</div>
			</form>
		</section>
	</div>
	</fmt:bundle>
	<jsp:include page="../footer.jsp" />
</body>
</html>