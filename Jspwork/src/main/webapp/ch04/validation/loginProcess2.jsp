<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("userid");
	String pw = request.getParameter("passwd");
%>
 <p>로그인 되었습니다.</p>
 <p>아이디 <%=id %></p>
 <p>비밀번호 <%=pw %></p>
 