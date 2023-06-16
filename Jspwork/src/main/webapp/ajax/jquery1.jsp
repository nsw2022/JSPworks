<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제이 쿼리 에이작스</title>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//alert('히히 제이쿼리 반응하나유?')
		$('h2').css('color','blue')
		$('.info').css('background','yellowgreen')
		$('.info').next('p').css('font-style','italic');
		
		$('button').click(function() {
			alert("안녕하세요~")
		})
	})
	
	
</script>
</head>
<body>
	<h2>환영합니다.</h2>
	<p class="info">와타시와 노승우다</p>	
	<p>나는 서울에 산다</p>
	<button type="button">전송</button>
</body>
</html>