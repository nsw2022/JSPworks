<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 수정</title>

<link rel="stylesheet" type="text/css" href="../resources/css/style.css">
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script type="text/javascript">

function checkMember(){
		let form = document.member;
		
		let id = form.memberId.value.replaceAll(" ","");
		let pw1 = form.passwd1.value.replaceAll(" ","");
		
		let name = form.name.value.replaceAll(" ","");
		

	
		
	/*	let good = form.good.value
		if (good == "" ){
			alert('중복체크해주세요')
			return;
		}*/
		
		

		// 정규 표현식
		let pw_part1 = /\d+/; // 숫자만
		let pw_part2 = /[a-zA-Z]+/; // 영어 대소문자
		let pw_part3 = /[!@#$%^&*()_+]+/; // 특수문자
		
		let name_part = /^[가-힣]+$/ // 이름 정규식/^[가-힣]+$/;
		
	

		if (id.length < 4 || id.length > 15) {
			alert('아이디는 4~15자로 입력해야 합니다.');
			form.memberId.select();
			return;
		}
		
		//1. 아이디가 비밀번호가 비어있을때 처리
		// padding 땜에 공백이 생김으로 trim을 넣어야함
		if (id.trim() === '' || pw1.trim() === '' || name.trim() ==='' ) {
			alert('절대 input상자를 절대 공백으로 두지마');
			return;
		}

		if (!pw_part1.test(pw1) || !pw_part2.test(pw1) || !pw_part3.test(pw1) || pw1.length < 4 || pw1.length > 8) {
			alert('비밀번호는 4~8자의 숫자, 영어 대소문자, 특수문자로 구성되어야 합니다.');
			form.passwd1.select();
			return;
		}

		
		if (!name_part.test(name)){
			alert('이름에 특수기호가 들어가면 안됐!')
			form.name.select()
			return
		}
		
		
		
	
		form.submit();
					
		
}
</script>
</head>
<body>
<!-- 다국어 Locale 설정 -->
<fmt:setLocale value="${param.Language }"/>
<fmt:bundle basename="bundle.message" >
<jsp:include page="../hearder.jsp" />
<div id="container">
<div class="Language">
				<a href="/updateMemberForm.do?memberId=${member.memberId}&Language=ko">한국어</a> | 
				<a href="/updateMemberForm.do?memberId=${member.memberId}&Language=en">English</a>
			</div>
	<section id="register">
		<h2><fmt:message key="signup.title" /> </h2>
		<form action="/MemberUpdateProcess.do" method="post" name="member">
			<input type="hidden" id="good" name="good">
			
			<fieldset>
				<ul>
					<li>	
						<label for="memberId"><fmt:message key="signup.id" /></label>
							<input type="text" id="memberId" name="memberId"
					 			placeholder="<fmt:message key='signup.idplaceholder' />" value="${member.memberId}" readonly="readonly">
					 	
					 		
					 </li> 
					 
					<li>
						<label for="passwd1">
							<fmt:message key="signup.passwd" />
						</label>
						<input type="password" id="passwd1" name="passwd1"
							placeholder="<fmt:message key='signup.passwdplaceholder' />" value="${member.passwd}">
					</li>
					
					<li>
						<label for="name">
							<fmt:message key="signup.name" /></label>
							<input type="text" id="name" name="name"
								placeholder="<fmt:message key='signup.nameplaceholder' />" value="${member.name}">
					</li>
					
					<li>
						<label for="gender"><fmt:message key="signup.gender" /></label>
						<label><input type="radio" name="gender" value="남" checked="checked" ${member.gender eq '남' ? 'checked' : ''}>
							<fmt:message key='signup.man' />
						</label>
						
						<label>
							<input type="radio" name="gender" value="여" ${member.gender eq '여' ? 'checked' : ''}><fmt:message key='signup.woman' />
						</label>
					</li>
				</ul>
			</fieldset>
			<div class="button">
				<button type="button" onclick="checkMember()" style="padding: 10px;"><fmt:message key="signup.join" /></button>
				<a href="/memberList.do">
					<button type="button">목록</button>
				</a>
			</div>
		</form>
	</section>
</div>
<jsp:include page="../footer.jsp" />
</fmt:bundle>
</body>
</html>
