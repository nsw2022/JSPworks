<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h3>--세션 유효 시간--</h3>
<%
	int time = session.getMaxInactiveInterval()/60;
	
	out.println("<p>" + session.getMaxInactiveInterval() + "초</p>");
	out.println("<p>세션 유효시간" + time +"분</p>");
%>
<h3>-- 세션 시간 변경 --</h3>
<%
	session.setMaxInactiveInterval(5 * 60);
	
	time = session.getMaxInactiveInterval() / 60; 
	
	out.println("<p>" + session.getMaxInactiveInterval() + "초</p>");
	out.println("<p>세션 유효시간" + time + "분</p>");
%>	