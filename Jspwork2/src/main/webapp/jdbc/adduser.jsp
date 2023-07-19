<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user 추가</title>
</head>
<body>

<%@ include file="dbconn.jsp" %>
<%
	PreparedStatement pstmt = null;
	String sql = "insert into user values(103, '!a123456',  '한강', '010-3333-3333')";
	try{
		pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate();
		out.println("회원 추가");
	}catch(Exception e){
		out.println(e.getMessage());
	}
	

%>

</body>
</html>