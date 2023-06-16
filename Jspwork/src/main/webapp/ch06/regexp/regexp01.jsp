<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript">
	 function checkMember() {
		 let form = document.member;
		
		 let id = form.id.value;
		 let passwd = form.passwd.value;
		 let name = form.uname.value;
		 let phone = form.phone1.value + "-" +
				 form.phone2.value + "-" +
				 form.phone3.value;
	 	
		 // 정규 표현식
		 let regExpID = /^[a-zA-Z가-힣]+$/; // 아이디 문자로 시작
		 let regExpPasswd = /^\d+$/; // 비밀번호 숫자만
		 let regExpName = /^[가-힣]+$/; // 이름 한글만
		 let regExpPhone = /^\d{3}-\d{3,4}-\d{4}$/; // 전화번호
	 	 
		 if (!regExpID.test(id)){
			 alert('아이디는 문자만 입력해야 합니다.');
			 form.id.select();
			 return;
		 }
	 	 
		 if (passwd === "" || !regExpPasswd.test(passwd)){
			 alert('비밀번호는 숫자만 입력해야 합니다.');
			 form.passwd.select();
			 return;
		 }
	 	 
		 if (name === "" || !regExpName.test(name)){
			 alert('이름은 한글만 입력해야 합니다.');
			 form.uname.select();
			 return false;
		 }
	 	 
		 if (!regExpPhone.test(phone)) {
			 alert('올바른 연락처를 입력해주세요.');
			 form.phone1.focus();
			 return;
		 }
	 	 

		 form.submit();
	 } 
</script>
</head>
<body>
	<h3>회원 가입</h3>
	<form action="validation_process.jsp" method="post" name="member">
		<p>
			<label for="userid">아이디 </label> <input type="text" id="id" name="id">
		</p>
		<p>
			<label for="passwd">비밀번호 </label> <input type="password" id="passwd" name="passwd">
		</p>
		<p>
			<label for="uname">이름 </label> <input type="text" id="uname" name="uname">
		</p>
		<p>
			연락처 : <select name="phone1">
				<option>010</option>
				<option>02</option>
				<option>031</option>
				<option>041</option>
			</select> - <input type="tel" id="phone2" name="phone2" maxlength="4" size="4">
			- <input type="tel" id="phone3" name="phone3" maxlength="4" size="4">
		</p>

		<p>
			<button type="button" onclick="checkMember()">가입하기</button>
			<input type="reset" value="다시쓰기">
		</p>
	</form>
</body>
</html>
