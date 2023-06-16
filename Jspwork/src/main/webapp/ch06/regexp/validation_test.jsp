<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정규 표현식 예제</title>
<script type="text/javascript">
	function checkMember() {
		//alert('test')
		// 1. 아이디가 비밀번호가 비어있을때 처리
		// 2. 비밀번호에 동일한 아이디가 포함되어있을 때 처리
		// 3. 숫자시작금지
		var id = document.member.id.value;
		var passwd = document.member.passwd.value;
		var name = document.member.uname.value;
		
		// /^(문자열 시작)[조건들]+(연속됨) 
		let regExp = /^[a-zA-Z가-힣]+/; // 문자로 시작해야함
		
		//1. 아이디가 비밀번호가 비어있을때 처리
		if (id.trim() === '' || passwd.trim() === '' || name.trim() ==='' ) {
			alert('절대 input상자를 공백으로 두지마');
			return;
		}
		
		// 2. 비밀번호에 동일한 아이디가 포함되어있을 때 처리
		if (id==passwd) {
			alert('둘이 같으면 지구멸망함 ㅇㅋ? 다시입력하세요');
			return;
		}
		// 3. 숫자시작금지
		if (!regExp.test(name)) {
			alert('이름이 숫자라니 키사마 사람이아니군');
			return;
		}
		
		document.member.submit()
		
	}
</script>
</head>
<body>
	<h3>회원 가입</h3>
	<form action="test_process.jsp" method="post" name="member">
		<p>아이디: <input type="text" name="id"></p>
		<p>비밀번호: <input type="password" name="passwd"></p>
		<p>이름: <input type="text" name="uname"></p>
		<button type="button" onclick="checkMember()">가입하기</button>
	</form>
</body>
</html>