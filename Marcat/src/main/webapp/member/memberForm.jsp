<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<script src="../resource/js/memberValidation.js"></script>

<script type="text/javascript">
function checkID(){
	//ID 중복 확인
	let mid = $("#mid").val();
	if(mid == ""){
		alert("아이디를 입력해주세요");
		return false;
	}
	//ajax 실행
	$.ajax({
		type: "post",
		url: "http://localhost:8080/checkid",
		dataType: "text",
		data: {id: mid},  //서블릿쪽으로 id 보냄
		success: function(data){ //서블릿에서 응답 받음
			console.log(data);
			if($.trim(data)=='usable'){ //$.trim() 공백을 없애줌
				$("#check").text("사용 가능한 ID입니다.");
				$("#check").css({"color": "blue", "padding-top": "5px"});
				$("#btnChk").attr("value", "Y");
			}else{
				$("#check").text("이미 가입된 ID입니다.");
				$("#check").css({"color": "red", "padding-top": "5px"});
			}
		},
		error:function(request, status, error){
			alert('에러 ㅠㅠ')
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

		}
	});
}
</script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="container my-4">
		<h2 class="text-left mx-4 my-4">회원 가입</h2>
		<div class="row mx-5">
			<form action="/addMember.do" method="post" name="newMember">
				<div class="form-group row">
					<label class="col-sm-2">아이디</label>
					<div class="col-sm-3 my-2">
						<input type="text" name="mid" id="mid" class="form-control">
					</div>
			
					<div class="col-sm-3 my-2">
						<button type="button" id="btnChk" value="N" 
								class="btn_check btn btn-warning" onclick="checkID()" >ID 확인</button>
					</div>
					<p id="check"></p>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">비밀번호</label>
					<div class="col-sm-3 my-2">
						<input type="password" name="passwd1" id="passwd1" class="form-control">
					</div>
				</div>
						
				<div class="form-group row">
					<label class="col-sm-2">비밀번호 확인</label>
					<div class="col-sm-3 my-2">
						<input type="password" name="passwd2" id="passwd2" class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">성명</label>
					<div class="col-sm-3 my-2">
						<input type="text" name="mname" id="mname" class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">성별</label>
					<div class="col-sm-5 my-2">
						<label><input type="radio" name="gender" value="male" checked>남</label>
						<label><input type="radio" name="gender" value="female">여</label>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">생일</label>
					<div class="col-sm-3 my-2">
						<input type="text" name="birthyy" placeholder="년(4자)" maxlength="4" size="6">
						<select name="birthmm">
							<option>월</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select>
						<input type="text" name="birthdd" placeholder="일" maxlength="2" size="4">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">전화번호</label>
					<div class="col-sm-3 my-2">
						<input type="text" name="phone" id="phone" class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">이메일</label>
					<div class="col-sm-4 my-2">
						<input type="text" name="email1" maxlength="30">@
						<select name="email2">
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="gmail.com">gmail.com</option>
						</select>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">주소</label>
					<div class="col-sm-3 my-2">
						<input type="text" name="address" id="address" class="form-control">
					</div>
				</div>
				
				<div class="form-group row">
					<div class="col-sm-3 my-2">
						<input type="button" value="가입" 
							class="btn btn-primary" onclick="checkAddMember()">
						<input type="reset" value="취소" class="btn btn-secondary">
					</div>
				</div>
			</form>
		</div>
		 
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>