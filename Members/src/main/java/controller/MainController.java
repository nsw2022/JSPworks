package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;

@WebServlet("*.do") // 경로를 .do로 끝나도록 설정
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 4L;
	
	MemberDAO memberDAO; // DAO 객체 선언

	public void init(ServletConfig config) throws ServletException {
		memberDAO = new MemberDAO(); // DAO 객체 생성
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		
		// command 패턴으로 url 설정하기
		String uri = request.getRequestURI();
		String command = uri.substring(uri.lastIndexOf('/'));
		
		System.out.println(uri);
		System.out.println();
		System.out.println(uri.lastIndexOf('/'));
		System.out.println("command: " + command);
		
		String nextPage = null;
		
		//회원 목록 조회
		if (command.equals("/memberList.do")) {
			nextPage = "memberList.jsp";
		}
		
		// 포워딩
		RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
		
				
		
	}

}
