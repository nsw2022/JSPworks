<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저정보조회</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from user";
	try{
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		out.println("<h2>회원명단</h2>");
		out.println("<table border=1>");
		out.println("<tr><td>아이디</td><td>비밀번호</td><td>이름</td><td>핸드폰</td></tr>");
		while(rs.next()){
			out.println("<tr><td>"+rs.getInt("id") + "</td>");
			out.println("<td>" + rs.getString("pwd") + "</td>");
			out.println("<td>" + rs.getString("name") + "</td>");
			out.println("<td>" + rs.getString("phone") + "</td>");
		}
	}catch(Exception e){
		out.println(e.getMessage());
	
	}
	
%>
</body>
</html>