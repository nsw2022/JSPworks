<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('button').click(function() {
			//alert('testing...')
			$.ajax({
				type: "get",
				url: 'source/test.txt',
				dataType: 'text',
				success: function(data){
					$('#demo').html("<h2>"+data+"</h2>")
							  .css({'color':'#f00', 'padding-left': '20px'})
				},
				error: function() {
					alert('에러발생')
				}
			})//ajax
			
			
		})// button.click
	})
</script>
</head>
<body>
	<div id="demo">
		<h2>버튼을 클릭하면 내용이 바뀝니다</h2>
		<button type="button">클릭</button>
	</div>
</body>
</html>