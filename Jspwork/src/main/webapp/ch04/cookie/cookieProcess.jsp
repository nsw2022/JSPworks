<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 아이디와 비밀번호를 받아서 쿠키를 생성
	String id = request.getParameter("userid");
	String pw = request.getParameter("passwd");
	
	if ( id.equals("admin") && pw.equals("0000")){
		// Cookie(쿠키이름, 쿠키값) 쿠키 객체 생성
		Cookie cookieId = new Cookie("userid",id);
		Cookie cookiePw = new Cookie("userpw",pw);
		
		// 쿠키 생성 후 클라이언트 컵에 보냄
		response.addCookie(cookieId);
		response.addCookie(cookiePw);
		
		out.print("쿠키 생성에 성공했습니다.");
		
	}else{
		out.print("쿠키 생성에 실패했습니다.");
	}
%>
