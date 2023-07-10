package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.Board;
import board.BoardDAO;
import member.Member;
import member.MemberDAO;
import oracle.net.aso.l;

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
			session.setAttribute("sessionId", memberId);
			nextPage = "/index.jsp";
			
		}else if (command.equals("/memberView.do")) {//회원상세보기
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			//memberId 받기
			String memberId =request.getParameter("memberId");
			
			Member member = memberDAO.getMember(memberId);
			
			request.setAttribute("member", member);
			
			nextPage = "member/memberView.jsp";
		}else if (command.equals("/loginForm.do")) {//로그인페이지요청
			
			
			
			nextPage = "member/loginForm.jsp";
			
		}else if (command.equals("/loginProcess.do")) {// 로그인처리
			String memberId=request.getParameter("memberId");
			String passwd = request.getParameter("passwd");
			
			Member memberlogin = new Member();
			memberlogin.setMemberId(memberId);
			memberlogin.setPasswd(passwd);
			
			
			
			// 로그인 체크 처리
			boolean result = memberDAO.checkLogin(memberlogin);
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
			
			
			// 페이징 처리
			String pageNum = request.getParameter("pageNum");
			if (pageNum==null) { //pageNum이 없으면 기본 1페이지
				pageNum = "1";
			}
			// 각페이지의 첫행 : 1page -> 1번, 2page -> 11번
			int currentPage = Integer.parseInt(pageNum);
			int pageSize = 10;
			int startRaw = (currentPage-1) * pageSize + 1;
			
			// 시작 페이지 : 13번 -> 2페이지 23번 -> 3페이지
			int startPage = startRaw / pageSize + 1;
			
			// 종료 페이지
			int total = boardDAO.getBoardCount(); // 총행수가 나누어 떨어지면 않으면 페이지수에 1을 더함
			int endPage = total / pageSize;
			endPage = (int) Math.ceil((double) total / pageSize);
			
			ArrayList<Board> boardList = boardDAO.getBoardList(currentPage);
			
			// 모델 생성
			request.setAttribute("boardList", boardList);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("endPage", endPage);
			nextPage = "board/boardList.jsp";			
		}else if (command.equals("/boardFrom.do")) {
			nextPage = "board/boardForm.jsp";
			
		}else if (command.equals("/addBoard.do")) {
			
			String realFolder = "E:\\NSW\\green_project\\JSPworks\\Members\\src\\main\\webapp\\resources\\upload";
			
			MultipartRequest multi = new MultipartRequest(request, realFolder, 5*1024*1024,
					"utf-8", new DefaultFileRenamePolicy());
			
			
			//글쓰기 폼에 입력된 데이터 받아오기
			String title =multi.getParameter("title");
			String content = multi.getParameter("content");
			// memberId는 세션으로 가져와야함
			String memberId = (String) session.getAttribute("sessionId");
			
			// fileName 속성 가져오기
			Enumeration<String> files = multi.getFileNames();
			String name = "";
			String fileName = "";
			if (files.hasMoreElements()) {
				name = (String) files.nextElement();
				fileName = multi.getFilesystemName(name);// 실제 서버 저장될 이름
			}
			
			
			
			Board newboard = new Board();
			newboard.setTitle(title);
			newboard.setContent(content);
			newboard.setMemberId(memberId);
			newboard.setFileUpload(fileName);
			
			// 글쓰기 처리 메서드 호출
			boardDAO.addBoard(newboard);
			
			//nextPage = "/boardList.do";
			
		}else if (command.equals("/boardView.do")) {// 상세보기
			int bnum = Integer.parseInt( request.getParameter("bnum") );
			
			Board board = boardDAO.getBoard(bnum); // 글상세보기
			
			
			// 모델생성
			request.setAttribute("board", board);
			
			nextPage = "board/boardView.jsp";
		}
	
		else if (command.equals("/deleteBoard.do")) { // 글삭제
			int bnum = Integer.parseInt( request.getParameter("bnum") );
			boardDAO.deleteBoard(bnum);			
			nextPage="/boardList.do";
		}
		
		else if (command.equals("/deleteMember.do")) { // 회원 삭제 요청
			String memberId = request.getParameter("memberId");
			boardDAO.deleteMember(memberId);
			nextPage = "/memberList.do";			
		}
		else if (command.equals("/boardUpdate.do")) { // 게시글 상세보기 수정전 모델작업
			int bnum = Integer.parseInt(request.getParameter("bnum"));
			
			Board board = new Board();
			
			board = boardDAO.getBoard(bnum);
			
			request.setAttribute("board", board);
			
			nextPage = "/board/boardUpdate.jsp";
		}
		
		else if (command.equals("/boardUpdateProcess.do")) { // 게시글 상세보기 수정
			// 수정 폼에서 입력된 내용 받아오기
			int bnum = Integer.parseInt(request.getParameter("bnum"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			
			Board boardupdate = new Board();
			boardupdate.setTitle(title);
			boardupdate.setContent(content);
			boardupdate.setBnum(bnum);
			
			
			boardDAO.boardUdate(boardupdate);
			nextPage = "/boardList.do";
		}
		else if (command.equals("/memberEvent.do")) {
			nextPage="member/memberEvent.jsp";
		}

		
		
		
		// 포워딩
		if (command.equals("/addBoard.do")) {
			response.sendRedirect("/boardList.do");
		}else {
			RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
			dispatcher.forward(request, response);
			
		}
		
				
		
	}

}
