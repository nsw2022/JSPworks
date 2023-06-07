<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드</title>
</head>
<body>
	<h2>파일 업로드</h2>
    <!-- 파일 전송 -->
    <!-- form 요소를 이용하여 파일을 전송할때는 반드시 enctype 속성을 지정해야만 함. -->
    <!-- enctype : 형식을 나타내는 것 키='value' 이게 applcatipn/x-ww.. 이게 디폴트값 그때 이걸쓰고 -->
    <!-- 파일보낼땐 mltipart/form-data 로 보냄 http의 통신규약임 -->
	<form action="fileupload01_Process.jsp" method="post" enctype="multipart/form-data">
		<p>이 름(유저): <input type="text" name="name"></p>
		<p>파일 제목: <input type="text" name="title"></p>
		<p>파일 이름: <input type="file" name="filename"></p>
		<p><input type="submit" value="전송"></p>
	</form>
</body>
</html>