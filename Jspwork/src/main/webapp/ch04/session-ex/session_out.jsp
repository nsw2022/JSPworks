<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	session.invalidate(); // 세션 해제
	
	response.sendRedirect("session01.jsp");
%>