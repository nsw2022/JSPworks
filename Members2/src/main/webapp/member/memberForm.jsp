<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<!-- 다국어 Locale 설정 -->
<fmt:setLocale value="${param.Language }"/>
<fmt:bundle basename="bundle.message" >
<jsp:include page="../hearder.jsp" />
<div id="container">
<div class="Language">
				<a href="?Language=ko">한국어</a> | 
				<a href="?Language=en">English</a>
			</div>
	<section id="register">
		<h2><fmt:message key="signup.title" /> </h2>
		<form action="addMember.do" method="post" name="member">
			<input type="hidden" id="good" name="good">
			
			<fieldset>
				<ul>
					<li>	
						<label for="memberId"><fmt:message key="signup.id" /></label>
							<input type="text" id="memberId" name="memberId"
					 			placeholder="<fmt:message key='signup.idplaceholder' />" readonly="readonly">
					 		<button type="button" onclick="checkId()" class="btn_check" id="btnCheck" value="N"><fmt:message key="signup.idcheck" /></button>
					 		<p id="check"></p>
					 		
					 </li> 
					 
					<li>
						<label for="passwd1">
							<fmt:message key="signup.passwd" />
						</label>
						<input type="password" id="passwd1" name="passwd1"
							placeholder="<fmt:message key='signup.passwdplaceholder' />">
					</li>
					
					<li>
						<label for="passwd2">
							<fmt:message key="signup.passwd2" />
						</label> 
						<input type="password" id="passwd2" name="passwd2"
					  		placeholder="<fmt:message key='signup.passwd2placeholder' />">
			  		</li>
			  		
					<li>
						<label for="name">
							<fmt:message key="signup.name" /></label>
							<input type="text" id="name" name="name"
								placeholder="<fmt:message key='signup.nameplaceholder' />">
					</li>
					
					<li>
						<label for="gender"><fmt:message key="signup.gender" /></label>
						<label><input type="radio" name="gender" value="남" checked="checked">
							<fmt:message key='signup.man' />
						</label>
						
						<label>
							<input type="radio" name="gender" value="여"><fmt:message key='signup.woman' />
						</label>
					</li>
				</ul>
			</fieldset>
			<div class="button">
				<button type="button" onclick="checkMember()" style="padding: 10px;"><fmt:message key="signup.join" /></button>
				<button type="reset" style="padding: 10px;"><fmt:message key="signup.cancel" /></button>
			</div>
		</form>
	</section>
</div>
<jsp:include page="../footer.jsp" />
</fmt:bundle>
</body>
</html>
