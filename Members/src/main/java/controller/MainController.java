package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.Member;
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
			ArrayList<Member> memberList = memberDAO.getMemberList();
			
			// 모델 생성 보내기
			request.setAttribute("memberList", memberList);
			
			nextPage = "member/memberList.jsp";
		}else if (command.equals("/memberform.do")) {
			nextPage = "member/memberform.jsp";
		}else if (command.equals("/addMember.do")) {
			// 폼에 입력된 데이터를 받아오기
			String memberId = request.getParameter("memberId"); 
			String passwd = request.getParameter("passwd1");
			String name = request.getParameter("name");
			String gender = request.getParameter("gender");
			
			Member newMember = new Member();// 회원 객체 생성
			newMember.setMemberId(memberId);
			newMember.setPasswd(passwd);
			newMember.setName(name);
			newMember.setGender(gender);
			
			memberDAO.addMember(newMember); // 외원 매개로 DB에 저장
			
			nextPage = "index.jsp";
		}else if (command.equals("/memberView.do")) {
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			//memberId 받기
			String memberId =request.getParameter("memberId");
			
			Member member = memberDAO.getMember(memberId);
			
			request.setAttribute("member", member);
			
			nextPage = "member/memberView.jsp";
		}
		
		// 포워딩
		RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
		
				
		
	}

}
