<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학점 처리</title>
<script type="text/javascript">
	// 점수를 입력하지 않았거나 문자인 경우 처리
	let checkScore = () => {
		let form = document.form1;
		let score = form.score.value
		score.trim()
	 	parseInt(score); 
		
		console.log(typeof(score) + score);
		
		
		if (score == "" || isNaN(score)) {
			alert('점수를 입력해주세요.');
			form.score.focus();
		} else if (score < 0 || score > 100) {
			alert('0~100 사이의 점수를 입력해주세요.');
			form.score.select();
			return false;
		} else {
			form.submit();
		}
	}
</script>
</head>
<body>
	<h2>점수를 입력해주세요</h2>
	<form action="scoreTest.jsp" method="get" name="form1">
		<p>
			점수 <input type="text" name="score">
			<!-- <input type="submit" name="학점출력"> -->
			<input type="button" onclick="checkScore()" value="전송">
		</p>
	</form>
</body>
</html>
