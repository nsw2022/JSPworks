<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	// 아이디 비밀번호를 받아서 인증 처리 및 세션 발급
	String id = request.getParameter("userid");
	String pw = request.getParameter("passwd");
	
	if (id.equals("admin") && pw.equals("admin1234")){
		// 세션 발급 후 wecome,jsp로 이동(포워딩)
		session.setAttribute("userid", id); // (세션이름, 값)
		
		response.sendRedirect("welcome.jsp");
		
	}else{
		out.println("아이디와 비밀번호가 일치하지 않습니다.");
	}
	
%>