<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String id = request.getParameter("id");
	String pw = request.getParameter("passwd");

			
%>
<p>입려된 ID : <%=id %></p>
<p>입려된 PW : <%=pw %></p>