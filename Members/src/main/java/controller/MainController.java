package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.Board;
import board.BoardDAO;
import member.Member;
import member.MemberDAO;

@WebServlet("*.do") // 경로를 .do로 끝나도록 설정
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 4L;
	
	MemberDAO memberDAO; // DAO 객체 선언
	BoardDAO boardDAO; // BoardDAO 객체 선언


	public void init(ServletConfig config) throws ServletException {
		memberDAO = new MemberDAO(); // DAO 객체 생성
		boardDAO = new BoardDAO();// BoardDAO 객체 생성
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글 인코딩
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		// 출력스트림 객체
		PrintWriter out = response.getWriter();
		

		
		// command 패턴으로 url 설정하기
		String uri = request.getRequestURI();
		String command = uri.substring(uri.lastIndexOf('/'));
		
		System.out.println(uri);
		System.out.println();
		System.out.println(uri.lastIndexOf('/'));
		System.out.println("command: " + command);
		
		String nextPage = null;
		
		// 세션 객체 생성
		HttpSession session = request.getSession();
		
		//회원 목록 조회
		if (command.equals("/memberList.do")) {
			ArrayList<Member> memberList = memberDAO.getMemberList();
			
			// 모델 생성 보내기
			request.setAttribute("memberList", memberList);
			
			nextPage = "member/memberList.jsp";
		}else if (command.equals("/memberForm.do")) {
			nextPage = "member/memberForm.jsp";
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
			
			nextPage = "/index.jsp";
		}else if (command.equals("/memberView.do")) {//회원상세보기
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			//memberId 받기
			String memberId =request.getParameter("memberId");
			
			Member member = memberDAO.getMember(memberId);
			
			request.setAttribute("member", member);
			
			nextPage = "/member/memberView.jsp";
		}else if (command.equals("/loginForm.do")) {//로그인페이지요청
			nextPage = "/member/loginForm.jsp";
			
		}else if (command.equals("/loginProcess.do")) {// 로그인처리
			String memberId=request.getParameter("memberId");
			String passwd = request.getParameter("passwd");
			
			Member memberlogin = new Member();
			memberlogin.setMemberId(memberId);
			memberlogin.setPasswd(passwd);
			
			
			
			// 로그인 체크 처리
			Boolean result = memberDAO.checkLogin(memberlogin);
			if (result) {
				// 세션발급 ( 전역에도 만들어 사용하기 편하게 함 )
				session.setAttribute("sessionId", memberId);
				nextPage = "index.jsp";
				
				
			}else {
				//1. 알람창 - 자바스크립트
				out.println("<script>");
				out.println("alert('아이디와 비밀번호를 확인해주세요')");
				out.print("history.go(-1)");
				out.println("</script>");
			
			}
		
		}// 로그인처리 "/loginProcess.do"
		else if (command.equals("/logout.do")) {
			// 세션 모두삭제
			session.invalidate();
			nextPage="/index.jsp";
		}
		
		// 게시판 관리
		if (command.equals("/boardList.do")) {
			ArrayList<Board> boardList = boardDAO.getBoardList();
			
			// 모델 생성
			request.setAttribute("boardList", boardList);
			
			
			nextPage = "board/boardList.jsp";
			
		}
		
		
		
		// 포워딩
		RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
		
				
		
	}

}
