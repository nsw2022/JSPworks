<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="../resources/css/style.css">
<script type="text/javascript" src="../resources/js/validation.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script type="text/javascript">

function checkId() {
    var memberId = $('#memberId').val(); // memberId 값을 가져옴

    if (memberId === "") {
        alert('아이디를 입력하세요.');
        return false;
    }

    $.ajax({
        type: "get",
        url: "http://localhost:8080/checkid",
        dataType: "text",
        data: { memberId: memberId },
        success: function(data) {
            console.log(data);
            
            if ($.trim(data) == "usable") { // 아이디가 중복되었으면
                $('#btnCheck').val('Y'); // 중복 버튼을 누름
                console.log($('#btnCheck').val());
                $('#check').text("사용 가능한 ID입니다")
                           .css({'color': 'red', 'padding-top': '5px'}); // not_usable
                           
               
            } else {
            	console.log($('#btnCheck').val());
                $('#check').text("이미 가입한 ID입니다")
                           .css({'color': 'red', 'padding-top': '5px'});
            }
            
        },
        error: function() {
            alert('에러 발생!');
        }
    });
}
	
</script>
</head>
<body>
<jsp:include page="../hearder.jsp" />
<div id="container">
	<section id="register">
		<h2>회원 가입</h2>
		<form action="addMember.do" method="post" name="member">
			<input type="hidden" id="good" name="good">
			
			<fieldset>
				<ul>
					<li>	
						<label for="memberId">아이디</label>
							<input type="text" id="memberId" name="memberId"
					 			placeholder="아이디는 4~15자로 입력해야 합니다.">
					 		<button type="button" onclick="checkId()" class="btn_check" id="btnCheck" value="N">ID중복</button>
					 		<p id="check"></p>
					 		
					 </li> 
					 
					<li><label for="passwd1">비밀번호</label> <input type="password" id="passwd1" name="passwd1"
					placeholder="비밀번호는 4~8자의 숫자, 영어 대소문자, 특수문자로 구성되어야 합니다."></li>
					<li><label for="passwd2">비밀번호 확인</label> <input type="password" id="passwd2" name="passwd2"
					  		placeholder="첫번째꺼랑 같게 설정해줘요"></li>
					<li><label for="name">이름</label> <input type="text" id="name" name="name"
							placeholder="이름은 한글만 가능합니다."></li>
					<li><label for="gender">성별</label>
						<label><input type="radio" name="gender" value="남" checked="checked">남</label>
						<label><input type="radio" name="gender" value="여">여</label>
					</li>
				</ul>
			</fieldset>
			<div class="button">
				<button type="button" onclick="checkMember()" style="padding: 10px;">가입</button>
				<button type="reset" style="padding: 10px;">취소</button>
			</div>
		</form>
	</section>
</div>
<jsp:include page="../footer.jsp" />
</body>
</html>
